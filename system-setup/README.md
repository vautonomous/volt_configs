# System Setup

## Preparing the Ubuntu Install USB

- Download latest version of Ubuntu 20.04 ISO from
    - https://releases.ubuntu.com/20.04/
        - Right now the latest version
          is https://releases.ubuntu.com/20.04/ubuntu-20.04.3-desktop-amd64.iso
        - Check the latest version and download that.
        - Make sure it ends with `desktop-amd64`

- On a Windows PC, download and install https://rufus.ie/en/

- Launch rufus
    - Device: Pick a USB to be formatted (at least 8GB sized)
    - Select the ISO you've downloaded
    - Partition scheme: GPT
    - Target system: UEFI (non CSM)
    - Start
    - Write in ISO Image Mode (Recommended)
    - Once it is finished, eject the USB safely

## Installing the OS

- In BIOS:
    - Disable secure boot
    - Disable fast boot
- Boot from the USB
- GNU GRUB Screen:
    - Pick Ubuntu
- Wait for check to finish
- Install Ubuntu (English!)
- Keyboard layout: Turkish, Continue
- I don't want to connect to a wi-fi network right now!, Continue
- Normal installation, Check Install third party software, Continue
- Installation type: Something else, Continue
- Setting Up Hard Drives:
    - Dual Boot Ubuntu with Windows:
        - I wont cover this here.
    - Ubuntu Only:
        - Delete all of the partitions with - button.
        - Add partitions:
            - 100MB, Primary, Beginning of this space, EFI System Partition, OK
            - `{Max size - 20GB}`, Primary, Beginning of this space, Ext4 journaling
              file system, Mount point: /, OK
            - 20GB, Primary, Beginning of this space, Swap area, OK
        - Select the ext4 partition, and the device for bootloader installation
          should be the same drive
        - Install Now
        - Continue
- Pick the timezone Istanbul from map
- Who are you?
  - Make name something short please (and all lowercase)
  - Make pc name short too please
  - password: asd
  - login automatically
  - Continue
- Installation Complete, Restart Now
- Remove the USB when it asks and press ENTER

## First Ubuntu Boot
### First "Welcome" Screen

- Livepatch: we don't want this, just press Next
- No, don't sent system info, Next
- Location Services: off, Next
- Done

### Install things

- Press Windows key, type and select Software & Updates
- Download from: Main Server
- Other Software: Check Canonical Partners
- Updates:
  - Subscribed to: **All updates**
  - Automatically check for updates: Never
  - When there are security updates: Display Immediately
  - When there are other updates: Display every 2 weeks
  - Notify me of a new Ubuntu version: Never
- Close, Reload
- Connect to Internet
- Open up a terminal with Ctrl+Alt+T


```bash
sudo apt update
sudo apt dist-upgrade -y
```
- Restart the computer

- Run following commands in a terminal.

```bash
sudo apt install -y git
git clone https://github.com/vautonomous/volt_configs.git
chmod +x ~/volt_configs/system-setup/install_things.sh
sudo ~/volt_configs/system-setup/install_things.sh <user_name>
```
- Log out of computer (Don't power off, we need the login screen!)
- Click on the small gear button (If gear doesn't appear restart your pc)
- Select i3 and login.


## Logins & Appearance

- Open a terminal and type:
```bash
lxappearance
```
- Widget --> Numix
- Icon Theme --> Numix
- Click Apply and logout & login

- For the shortcuts you need to know to use i3, check out: `volt_configs/i3-config/i3-shortcuts`
