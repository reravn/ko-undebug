obj-m += undebug.o

all:
	make -C $(KDIR) CFLAGS="-std=c11" M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean

test: all
	sudo insmod *ko
	sudo dmesg | tail
	sudo rmmod *ko
