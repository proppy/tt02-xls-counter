SIM ?= icarus
TOPLEVEL_LANG ?= verilog
VERILOG_SOURCES += $(PWD)/src/top.v $(PWD)/src/counter.v
TOPLEVEL = top
MODULE = test

include $(shell cocotb-config --makefiles)/Makefile.sim
