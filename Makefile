SIM ?= icarus
TOPLEVEL_LANG ?= verilog
VERILOG_SOURCES += $(PWD)/src/top.v $(PWD)/src/user_module.v
TOPLEVEL = github_com_proppy_tt02_xls_counter
MODULE = test

include $(shell cocotb-config --makefiles)/Makefile.sim
