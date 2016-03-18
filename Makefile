obj-m += test_module.o

all: build

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

check: 
	insmod test_module.ko
	rmmod test_module
	dmesg | grep -E 'Hello world|Goodbye world'
    
