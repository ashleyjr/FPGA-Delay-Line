# FPGA-Delay-Line

## Install on macOS Big Sur

   - /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   - brew tap twam/openfpga
   - brew install yosys
   - brew install icestorm
   - brew install nextpnr --with-gui --without-arch-ecp5 --without-arch-nexus 
   - pip3 install pyserial
   - pip3 install gevent --pre
   - pip3 install auto-py-to-exe
   - pip3 install --upgrade pip
   - pip3 install matplotlib

## GUI

   - nextpnr-ice40 --hx8k --json x_top_cal_clock_only.json --package ct256 --pcf synth/x_top_cal_clock_only.pcf --asc x_top_cal_clock_only.asc --gui



