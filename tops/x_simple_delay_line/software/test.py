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
    #print(hex(a))
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


def write_seq_cmd(cmd, data, addr):
    i = data;
    i |= (cmd << 32)
    i |= (1 << 37)
    i |= (addr << 38)
    load(i,0)

def seq_scope_start():
    i  = (1 << 36)
    i |= (1 << 47)
    load(i,0)

def unload_scope(addr):
    rx = 0
    for i in range(3,-1,-1):
        rx <<= 8
        d  = (addr << 49)
        d |= (1 << 48)
        d |= (1 << 60)
        d |= (i << 61)
        load(d,0)
        rx |= get()
    return rx



write_seq_cmd(0, 0x00000000, 0)
write_seq_cmd(0, 0x00000001, 1)
write_seq_cmd(0, 0x00000000, 2)
write_seq_cmd(0, 0x00000001, 3)
write_seq_cmd(0, 0x00000000, 4)
write_seq_cmd(0, 0x00000001, 5)
write_seq_cmd(0, 0x00000000, 6)
write_seq_cmd(0, 0x00000001, 7)
write_seq_cmd(2, 0x00000000, 8)

seq_scope_start()

for i in range(32):
    print("Scope "+str(hex(i))+":"+str(hex(unload_scope(i))))

