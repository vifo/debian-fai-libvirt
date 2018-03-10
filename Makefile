.PHONY: all build vm clean distclean

all: doc build vm

doc: README.md

build: doc
	ttree -f ttreerc 
	cd build && chmod +x ./boot-vm.sh

vm: build
	cd build && ./boot-vm.sh

clean:
	rm -rf build/
	rm -f README.md

distclean: clean
	./bin/cleanup-vms.sh

README.md: README.md.tt2
	tpage $< >$@

