from typing import Iterator, Optional

import click
import serial
import zmq

from . import packet

PRINT_PREFIX = "DF:HEX:"


def parse_packet(line: str) -> bytes:
    """Parse a line into a packet."""
    line = line.strip()
    if line.startswith(PRINT_PREFIX):
        return bytes.fromhex(line[len(PRINT_PREFIX) :])
    else:
        return None


def hex_to_bytes(ctx: click.Context, param: click.Parameter, value: str) -> bytes:
    """Convert a hex string into bytes."""
    return bytes.fromhex(value)


@click.command()
@click.option(
    "-i",
    "--input",
    "_input",
    default=None,
    type=click.File("r"),
    help="Where to read the input stream. If not specified, read from TCP address. You can pass '-' to read from stdin.",
)
@click.option(
    "-o",
    "--output",
    default="-",
    type=click.File("w"),
    help="Where to read the input stream. Default to '-', a.k.a. stdout.",
)
@click.option(
    "--serial-port",
    default=None,
    envvar="SERIAL_PORT",
    show_envvar=True,
    help="If specified, read the packet from the given serial port. E.g., '/dev/tty0'. This takes precedence of `--input` and `--tcp-address` options.",
)
@click.option(
    "--tcp-address",
    default="tcp://127.0.0.1:10000",
    envvar="TCP_ADDRESS",
    show_default=True,
    show_envvar=True,
    help="TCP address to be used to read the input stream.",
)
@click.option(
    "-k",
    "--auth-key",
    default=32 * "0",
    envvar="AUTH_KEY",
    callback=hex_to_bytes,
    show_default=True,
    show_envvar=True,
    help="Authentification key (hex string).",
)
@click.option(
    "-l",
    "--melvec-len",
    default=20,
    envvar="MELVEC_LEN",
    type=click.IntRange(min=0),
    show_default=True,
    show_envvar=True,
    help="Length of one Mel vector.",
)
@click.option(
    "-n",
    "--num-melvecs",
    default=10,
    envvar="NUM_MELVECS",
    type=click.IntRange(min=0),
    show_default=True,
    show_envvar=True,
    help="Number of Mel vectors per packet.",
)
@click.option("-q", "--quiet", is_flag=True, help="Whether output should be quiet.")
def main(
    _input: Optional[click.File],
    output: Optional[click.File],
    serial_port: Optional[str],
    tcp_address: str,
    auth_key: bytes,
    melvec_len: int,
    num_melvecs: int,
    quiet: bool,
) -> None:
    """
    Parse packets from the MCU and perform authentication.
    """
    if not quiet:
        click.echo(
            "Unwrapping packets with auth. key: "
            + click.style(auth_key.hex(), fg="green")
        )

    unwrapper = packet.PacketUnwrapper(
        key=auth_key,
        allowed_senders=[
            0,
        ],
        authenticate=True,
    )

    if serial_port:  # Read from serial port

        def reader() -> Iterator[str]:
            ser = serial.Serial(port=_input, baudrate=115200)
            ser.reset_input_buffer()
            ser.read_until(b"\n")

            if not quiet:
                click.echo(
                    "Reading packets from serial port: "
                    + click.style(serial_port, fg="green")
                )
                click.echo("Use Ctrl-C (or Ctrl-D) to terminate.")

            while True:
                line = ser.read_until(b"\n").decode("ascii").strip()
                output.write(line + "\n")
                packet = parse_packet(line)
                if packet is not None:
                    yield packet

    elif _input:  # Read from file-like

        def reader() -> Iterator[str]:
            if not quiet:
                click.echo(
                    "Reading packets from input: "
                    + click.style(str(_input), fg="green")
                )
                click.echo("Use Ctrl-C (or Ctrl-D) to terminate.")

            for line in _input.readlines():
                line = line.strip()
                output.write(line + "\n")
                packet = parse_packet(line)
                if packet is not None:
                    yield packet

    else:  # Read from zmq GNU Radio interface

        def reader() -> Iterator[str]:
            context = zmq.Context()
            socket = context.socket(zmq.SUB)

            socket.setsockopt(zmq.SUBSCRIBE, b"")
            socket.setsockopt(zmq.CONFLATE, 1)  # last msg only.

            socket.connect(tcp_address)

            if not quiet:
                click.echo(
                    "Reading packets from TCP address: "
                    + click.style(tcp_address, fg="green")
                )
                click.echo("Use Ctrl-C (or Ctrl-D) to terminate.")

            while True:
                msg = socket.recv(2 * melvec_len * num_melvecs)
                output.write(PRINT_PREFIX + msg.hex() + "\n")
                yield msg

    input_stream = reader()
    for msg in input_stream:
        try:
            sender, payload = unwrapper.unwrap_packet(msg)
            click.echo(
                f"From {sender}, received packet: "
                + click.style(payload.hex(), fg="green")
            )
        except packet.InvalidPacket as e:
            click.secho(
                f"Invalid packet error: {e.args[0]}",
                fg="red",
            )
