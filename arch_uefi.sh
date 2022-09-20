#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:*Anna1999 | chpasswd


pacman -S efibootmgr networkmanager net-tools network-manager-applet base-devel linux-headers 

pacman -S --noconfirm xf86-video-amdgpu
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI #partition at /boot/efi

#grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager


useradd -m dxxm
echo dxxm:*Anna1999 | chpasswd
usermod -aG libvirt dxxm

echo "dxxm ALL=(ALL) ALL" >> /etc/sudoers.d/dxxm


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"