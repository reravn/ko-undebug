obj-m += undebug.o
KDIR := $(KDIR)
MDIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
$(info -- KDIR: $(KDIR))
$(info -- MDIR: $(MDIR))
CFLAGS += -fno-optimize-sibling-calls
all:
	make -C $(KDIR) M=$(MDIR) modules

clean:
	make -C $(KDIR) M=$(MDIR) clean
