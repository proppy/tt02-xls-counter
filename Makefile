SIM ?= icarus
TOPLEVEL_LANG ?= verilog
VERILOG_SOURCES += $(PWD)/src/top.v $(PWD)/src/user_module.v
TOPLEVEL = top
MODULE = test

include $(shell cocotb-config --makefiles)/Makefile.sim
