.PHONY: all build vm clean distclean

all: doc build vm

doc: README.md

build: doc
	ttree -f ttreerc 
	cd build && chmod +x ./fai.sh

vm: build
	cd build && ./fai.sh install

clean:
	rm -rf build/
	rm -f README.md

distclean: clean
	./bin/cleanup-vms.sh

README.md: README.md.tt2
	tpage $< >$@

