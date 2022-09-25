import serial
import time
import sys

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
    #print(f">{hex(rx)}")
    return rx

def put(tx):
    ser.write(tx.to_bytes(1, byteorder='big'))
    #print(f"<{hex(tx)}")


for c in range(256):
    line = []
    put(0)
    ctrl = get()

    for i in range(256//8):
        b = get()
        for j in range(8):
            line.append(b & 1)
            b = b >> 1

    rises = []
    for i in range(255):
        if (line[i] == 0) and (line[i+1] == 1):
            rises.append(i)

    print(f"Ctrl {ctrl}, rises {rises}")
