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

put(0)
for i in range(16//8):
    print(get())
