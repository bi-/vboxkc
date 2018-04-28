#!/usr/bin/env bats

setup() {
    PATH=${PATH}:${BATS_TEST_DIRNAME}/../
}

@test "should print reboot keycodes" {
    result=$($BATS_TEST_DIRNAME/../vboxkc.sh vm-name "reboot")
    [ "$result" == "VBoxManage controlvm vm-name keyboardputscancode 13 93 12 92 30 B0 18 98 18 98 14 94 1C 9C" ] 
}

@test "should print the English abc keycodes" {
    result=$(vboxkc.sh vm-name "abcdefghijklmnopqrstuvwxyz")
    echo $result > /tmp/alma 
    [ "$result" == "VBoxManage controlvm vm-name keyboardputscancode 1E 9E 30 B0 2E AE 20 A0 12 92 21 A1 22 A2 23 A3 17 97 24 A4 25 A5 26 A6 32 B2 31 B1 18 98 19 99 10 90 13 93 1F 9F 14 94 16 96 2F AF 11 91 2D AD 15 95 2C AC 1C 9C" ]
}

