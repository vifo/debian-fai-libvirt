#!/bin/sh
# shellcheck disable=SC2039
#
# Wipe libvirt VMs named /^fai-[0-9a-f]{8}$/

#usage() { echo "Usage: $NAME" >&2; exit 254 }

#LIBVIRT_DEFAULT_URI="${LIBVIRT_DEFAULT_URI:-qemu:///system}"
#export LIBVIRT_DEFAULT_URI

main() {
    local vms
    vms="$(virsh list --all | perl -an \
        -E 'say $F[1] if $F[1] =~ m/^fai-[0-9a-f]{8}$/')"

    if [ -n "$vms" ]; then
        echo "Deleting temporary VMS: $vms"

        for vm in $vms; do
            echo "Destroying: $vm"
            virsh destroy "$vm"

            echo "Undefining: $vm"
            virsh undefine --remove-all-storage "$vm"
        done
    else
        # no vms to delete
        true
    fi
}

main "$@"
