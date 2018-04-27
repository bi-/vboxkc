#!/usr/bin/env bash
# http://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html

declare -A KEYMAP
KEYMAP[-]=0C
KEYMAP[ ]=39
KEYMAP[a]=1E
KEYMAP[b]=30
KEYMAP[c]=2E
KEYMAP[d]=20
KEYMAP[e]=12
KEYMAP[f]=21
KEYMAP[g]=22
KEYMAP[h]=23
KEYMAP[i]=17
KEYMAP[j]=24
KEYMAP[k]=25
KEYMAP[l]=26
KEYMAP[m]=32
KEYMAP[n]=31
KEYMAP[o]=18
KEYMAP[p]=19
KEYMAP[q]=10
KEYMAP[r]=13
KEYMAP[s]=1F
KEYMAP[t]=14
KEYMAP[u]=16
KEYMAP[x]=2D
KEYMAP[y]=15
KEYMAP[v]=2F
KEYMAP[w]=11
KEYMAP[z]=2C
KEYMAP[enter]=1C
KEYMAP[/]=35

declare -A RELEASE
RELEASE[-]=8C
RELEASE[ ]=B9
RELEASE[a]=9E
RELEASE[b]=B0
RELEASE[c]=AE
RELEASE[d]=A0
RELEASE[e]=92
RELEASE[f]=A1
RELEASE[g]=A2
RELEASE[h]=A3
RELEASE[i]=97
RELEASE[j]=A4
RELEASE[k]=A5
RELEASE[l]=A6
RELEASE[m]=B2
RELEASE[n]=B1
RELEASE[o]=98
RELEASE[p]=99
RELEASE[q]=90
RELEASE[r]=93
RELEASE[s]=9F
RELEASE[t]=94
RELEASE[u]=96
RELEASE[x]=AD
RELEASE[y]=95
RELEASE[v]=AF
RELEASE[w]=91
RELEASE[z]=AC
RELEASE[enter]=9C
RELEASE[/]=B5

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
