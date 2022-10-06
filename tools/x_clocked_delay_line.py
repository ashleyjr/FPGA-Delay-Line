import serial
import time
import sys
import matplotlib.pyplot as plt

ser = serial.Serial(
    port='/dev/tty.usbserial-14401',
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

rises_x = []
rises_y = []

diffs_rises_x = []
diffs_rises_y = []

falls_x = []
falls_y = []

diffs_falls_x = []
diffs_falls_y = []

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

    falls = []
    for i in range(255):
        if (line[i] == 1) and (line[i+1] == 0):
            falls.append(i)

    print(f"Ctrl {ctrl}, rises {rises}, falls {falls}")

    for r in rises:
        rises_x.append(c)
        rises_y.append(r)

    for f in falls:
        falls_x.append(c)
        falls_y.append(f)

    if len(rises) > 1:
        diffs_rises_x.append(c)
        diffs_rises_y.append(rises[1] - rises[0])
    if len(rises) > 2:
        diffs_rises_x.append(c)
        diffs_rises_y.append(rises[2] - rises[1])

    if len(falls) > 1:
        diffs_falls_x.append(c)
        diffs_falls_y.append(falls[1] - falls[0])
    if len(falls) > 2:
        diffs_falls_x.append(c)
        diffs_falls_y.append(falls[2] - falls[1])


ax = plt.subplot(221)
ax.scatter(rises_x,rises_y)
plt.xticks(range(0,256,32))
plt.xlim(0,256)
plt.grid()

ax = plt.subplot(223)
ax.scatter(diffs_rises_x,diffs_rises_y)
plt.xticks(range(0,256,32))
plt.xlim(0,256)
plt.grid()

ax = plt.subplot(222)
ax.scatter(falls_x,falls_y)
plt.xticks(range(0,256,32))
plt.xlim(0,256)
plt.grid()

ax = plt.subplot(224)
ax.scatter(diffs_falls_x,diffs_falls_y)
plt.xticks(range(0,256,32))
plt.xlim(0,256)
plt.grid()

plt.savefig("graph.png", dpi=150)

# Histogram
freq = 96e6
freq_MHz = freq / 1e6
period_ps = int(1e12 / freq)

plt.figure(2)
r = []
for d in diffs_rises_y:
    r.append(period_ps / d )
f = []
for d in diffs_falls_y:
    f.append(period_ps / d )

plt.title(f"Delay per stage ({freq_MHz}MHz)")
plt.hist(r, label='rises')
plt.hist(f, label='falls')
plt.ylabel("#")
plt.xlabel("Time (ps)")
plt.legend()
plt.savefig("hist.png", dpi=150)

