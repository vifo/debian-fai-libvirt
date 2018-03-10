# debian-fai-libvirt

Fully automated *Debian* installation on *libvirt/QEMU/KVM*.

* create KVM virtual machine using [virt-manager](https://virt-manager.org/)'s
  `virt-install(1)`
* minimal, preseeded *Debian* installation
* initrd based, all required files injected into initrd
* no ISOs required, no additional HTTP server required
* adjustable build configuration in [src/config.tt2](src/config.tt2)

## Supported Debian versions

* [Debian 8.10 "jessie"](https://www.debian.org/releases/jessie)

## Usage

### Requirements

* *git* and HTTPS access to https://github.com/vifo/debian-fai-libvirt
* *QEMU/KVM* up-and-running

### Installation

Clone this repository with *git*:

```sh
git clone https://github.com/vifo/debian-fai-libvirt
cd "debian-fai-libvirt"
```

Check/adjust settings in [src/config.tt2](src/config.tt2) and run virtual
machine installation with:

```sh
make install
```

### make targets

* `build`

  Create build directory `build/` and parse templates in `src/`

* `vm`

  Run virtual machine installation with `build/vm-boot.sh`

* `clean`
  
  Remove build directory `build/`

* `distclean`
  
  In addition to `clean` wipe any generated VMs with `virsh destroy/undefine`

## Links

* [Installing Debian 8.10](https://www.debian.org/releases/jessie/debian-installer/index.html)
* [Libvirt FAQ](https://wiki.libvirt.org/page/FAQ)
* [virt-manager](https://virt-manager.org/)

## License

This project is licensed under the MIT License, see [LICENSE](LICENSE) for
details.

