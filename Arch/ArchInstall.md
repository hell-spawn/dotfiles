# Arch Linux installation (Windows 10 dual boot)


## Before

1. Install Windows Mode EFI
2. Disable Windows Fast-Startup
3. Disable Secure Boot


## Partitioning
Windows 10 Efi partitioning (My config disk)

### sda (Windows)

| Partition  | Location | Size       | File system |
| ---------- |:--------:|:----------:|:-----------:|
| EFI        | sda1     | 100 MB     | vfat        |
| Reserved   | sda2     | 100 MB     |             |
| Windows 10 | sda3     | 220 GB     | ntfs        |
| Recovery   | sda4     | 518 MB     | ntfs        |


### sdb (Arch Linux)

| Partition  | Location | Size       | File system |
| ---------- |:--------:|:----------:|:-----------:|
| SWAP       | sdb1     | 16 GB      |             |
| Root(/)    | sdb2     | 200 GB     |  ext4       |


### sdc (Data Users for Win And Arch)

| Partition  | Location | Size       | File system |
| ---------- |:--------:|:----------:|:-----------:|
| DATA-WIN   | sdb1     | 500 GB     |  ntfs       |
| Recovery   | sdb2     | 518 GB     |  ntfs       |
| /home      | sdb3     | 500 GB     |  ext4       |

## Run Iso Arch

Boot USB

## Set Key layout for install process

```
# loadkeys es 
```

## Test to the internet

```
# ping  -c 3 www.google.com
```


## Update Time 
```
# timedatectl set-ntp true
```

## Create Partitions


```
# cfdisk /dev/sdb 
```

```
# cfdisk /dev/sdc 
```

## Format and mount disks

```
# mkfs.ext4 /dev/sdb2
# mkfs.ext4 /dev/sdc3
# mkswap /dev/sdb1

# mount /dev/sdb2 /mnt
# mkdir -p /mnt/boot/efi
# mkdir /mnt/home
# mount /dev/sda1 /mnt/boot/efi
# mount /dev/sdc3 /mnt/home
```

## Install

```
# pacstrap /mnt base linux linux-firmware
```


## Generate fstab

```
# genfstab -U /mnt >> /mnt/etc/fstab
```

## Chroot and configure base system

```
# arch-chroot /mnt
```

## Install your favorite editor 

```
# pacman -S vim 
```

### Timezone

```
# ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
```
### Hardware clock

```
# hwclock --systohc
```

### Locale

```
# vim /etc/locale.gen
```

uncomment `en_US.UTF-8`

```
# locale-gen
# echo LANG=en_US.UTF-8 > /etc/locale.conf
# export LANG=en_US.UTF-8
```

### Hostname

```
# echo arch >> /etc/hostname
# vim /etc/hosts
```

/etc/hosts should look like:

```
127.0.0.1   localhost.localdomain   localhost 
::1         localhost.localdomain   localhost
127.0.1.1   arch.localdomain        arch 
```

## Root password

```
# passwd
```


## Regular User 

```
# useradd -G wheel -m myuser 
```

```
# passwd myuser 
```

Uncoment wheel (%wheel ALL=(ALL) ALL)

```
# visudo 
```

## Install Network
```
# pacman -S iw wpa_supplicant dialog networkmanager
```

## Install GRUB
```
pacman -S grub efibootmgr os-prober
```

Edit `/etc/default/grub`, set `DEFAULT_TIMEOUT=30`.

```
# grub-install --target=x86_64-efi --bootloader-id=arch --recheck
# grub-mkconfig -o /boot/grub/grub.cfg
```

## End and restart

```
# exit
# reboot
```

## References


### Installation

