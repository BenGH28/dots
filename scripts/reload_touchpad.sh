#!/usr/bin/env bash
MY_MOD=i2c_hid_acpi

remove_mod() {
    rmmod $MY_MOD
}

add_mod() {
    modprobe $MY_MOD
}

main() {
    local module_present
    module_present="$(lsmod | grep $MY_MOD)"
    # check if the module is present
    if [[ -z $module_present ]]; then
        # we can't remove something that isn't there so just add the module
        add_mod
    else
        remove_mod && add_mod
    fi
}

main
