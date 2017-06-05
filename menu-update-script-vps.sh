#!/bin/bash
clear

flag=0

echo

function update_script() {
cd
wget -O updatescript.sh https://raw.githubusercontent.com/juckyvengeanceee/debian.sh/master/updatescript.sh && clear && chmod +x updatescript.sh && ./updatescript.sh
}
echo "SELAMAT DATANG DI MENU UPDATE SCRIPT VPS" 
PS3='Silahkan ketik angka 1 untuk update script lalu ENTER: '
options=("Update Script VPS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Update Script VPS")
        update_script
        break
        ;;
        "Quit")
        exit
        break
        ;;
        	 
        *) echo invalid option;
	esac
done
