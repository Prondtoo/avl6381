# Kbuild file for avl6381/it930x
# This file is read by the Linux Kernel build system

obj-m += avl6381.o
obj-m += it930x.o
obj-m += mxl603.o

mxl603-objs := mxl603_tuner.o mxl603_api.o

# Include paths
# $(src) refers to the directory containing this Kbuild file
ccflags-y += -I$(src)/dvb_headers
ccflags-y += -I$(src)/dvb_headers/dvb-usb
ccflags-y += -I$(src)/dvb_headers/dvb-usb-v2
ccflags-y += -I$(src)/dvb_headers/dvb-frontends
ccflags-y += -I$(src)/dvb_headers/tuners
ccflags-y += -I$(src)/dvb_headers/include

# Define CONFIG_DVB_NET if needed (present in original Makefile)
ccflags-y += -DCONFIG_DVB_NET
