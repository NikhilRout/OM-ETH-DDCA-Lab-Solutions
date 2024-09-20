# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]
# LEDs
set_property PACKAGE_PIN U14 [get_ports lc]
set_property PACKAGE_PIN U15 [get_ports lb]
set_property PACKAGE_PIN W18 [get_ports la]
set_property PACKAGE_PIN U19 [get_ports ra]
set_property PACKAGE_PIN E19 [get_ports rb]
set_property PACKAGE_PIN U16 [get_ports rc]
set_property IOSTANDARD LVCMOS33 [get_ports {lc lb la ra rb rc}]
# Buttons
set_property PACKAGE_PIN W19 [get_ports left]
set_property PACKAGE_PIN U18 [get_ports rst]
set_property PACKAGE_PIN T17 [get_ports right]
set_property IOSTANDARD LVCMOS33 [get_ports {left rst right}]
