obj-m += undebug.o

ccflags-y += -std=gnu11

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean

test: all
	sudo insmod *.ko
	sudo dmesg | tail -n 20
	sudo rmmod undebug
