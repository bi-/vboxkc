#!/usr/bin/env bash
# http://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html

declare -A KEYMAP
KEYMAP=( [-]=0C [ ]=39 [a]=1E [b]=30 [c]=2E [d]=20 [e]=12 [f]=21 [g]=22 [h]=23 [i]=17 [j]=24 \
 [k]=25 [l]=26 [m]=32 [n]=31 [o]=18 [p]=19 [q]=10 [r]=13 [s]=1F [t]=14 [u]=16 [x]=2D [y]=15 \
 [v]=2F [w]=11 [z]=2C [enter]=1C [/]=35 )

declare -A RELEASE
RELEASE=( [-]=8C [ ]=B9 [a]=9E [b]=B0 [c]=AE [d]=A0 [e]=92 [f]=A1 [g]=A2 [h]=A3 [i]=97 \
[j]=A4 [k]=A5 [l]=A6 [m]=B2 [n]=B1 [o]=98 [p]=99 [q]=90 [r]=93 [s]=9F [t]=94 [u]=96 [x]=AD \
[y]=95 [v]=AF [w]=91 [z]=AC [enter]=9C [/]=B5 )

msg() {
  input=$1
  for (( i=0; i<${#input}; i++ )); do
    press_release "${input:$i:1}"
  done
}

press_release() {
  press "${1}"
  echo -n " "
  release "${1}"
  echo -n " "
}

enter() {
  press_release "enter"
}

release() {
  echo -n ${RELEASE[$1]}
}

press() {
  echo -n ${KEYMAP[$1]}
}

msg=$(msg "${2}")$(enter)
echo VBoxManage controlvm ${1} keyboardputscancode ${msg} 
