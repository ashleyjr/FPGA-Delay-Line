import serial
import serial.tools.list_ports
ports = serial.tools.list_ports.comports()

for port, desc, hwid in sorted(ports):
    print("{}: {} [{}]".format(port, desc, hwid))

ser = serial.Serial(
    port='/dev/ttyUSB1',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS
)
ser.flushInput()
ser.flushOutput()

def get():
    rx = int.from_bytes(ser.read(1), byteorder='big')
    return rx

def put(tx):
    ser.write(tx.to_bytes(1, byteorder='big'))

def load(a,b):
    for i in range(0,64,4):
        nibble = a >> (60-i)
        nibble &= 0xF
        put(nibble)
    for i in range(0,64,4):
        nibble = b >> (60-i)
        nibble &= 0xF
        nibble |= 0x10
        put(nibble)
    put(0x20)


load(0x90000000DEADBEEF,0x0)
print(hex(get()))
load(0xB0000000DEADBEEF,0x0)
print(hex(get()))
load(0xD0000000DEADBEEF,0x0)
print(hex(get()))
load(0xF0000000DEADBEEF,0x0)
print(hex(get()))

