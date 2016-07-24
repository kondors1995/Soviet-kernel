#!/bin/bash
echo Do you want to clean?
read REPLY1
if [[ $REPLY1 =~ ^[Yy]$ ]]
then
    
    make clean && make mrproper
    git reset --hard
    echo Do you want to compile kernel?
    read REPLY2

        if [[ $REPLY2 =~ ^[Yy]$ ]]
        then
            export ARCH=arm
            export CROSS_COMPILE=~/Android/Kernel/toolchains/UBERTC-arm-eabi-7.0/bin/arm-eabi-
            make g620s_defconfig
            echo "Enter number of threads: "
            read input_variable
            echo "You entered: $input_variable"
            make -j$input_variable
            cp arch/arm/boot/zImage '/home/quagmire/Desktop/2/uber'
            find . -name '*ko' -exec cp '{}' '/home/quagmire/Desktop/2/uber' \;
                
        fi

elif [[ $REPLY1 =~ ^[Nn]$ ]]
then

    echo Do you want to compile kernel now?
    read REPLY3

        if [[ $REPLY3 =~ ^[Yy]$ ]]
        then
                
            export ARCH=arm
            export CROSS_COMPILE=~/Android/Kernel/toolchains/UBERTC-arm-eabi-7.0/bin/arm-eabi-
            make g620s_defconfig
            echo "Enter number of threads: "
            read input_variable
            echo "You entered: $input_variable"
            make -j$input_variable
            cp arch/arm/boot/zImage '/home/quagmire/Desktop/2/uber'
            find . -name '*ko' -exec cp '{}' '/home/quagmire/Desktop/2/uber' \;

        fi
fi
read -rsp $'Press any key to continue...\n' -n 1 key
# echo $key
