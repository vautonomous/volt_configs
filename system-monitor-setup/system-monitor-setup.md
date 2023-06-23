# Autoware Universe System Monitor Setup Helper Document

* Main installation instructions can be found under "autoware.universe >> system >> system_monitor" ([link](https://github.com/vautonomous/autoware.universe/tree/multi-config/system/system_monitor)). 
* Please follow following installation instructions to set up diagnostic programs.
* To run related packages, we need to create a new user with limited permissions. To create a new user:

``` 
sudo adduser volt_sm 
sudo passwd -d volt_sm
sudo adduser volt_sm volt
```
**User Name:** volt_sm 

**Password:** asd

## CPU Monitor

1. CPU monitor use a specific program called "msr_reader".
2. Load kernel module 'msr' into your target system.
   
    ```
    sudo modprobe msr
    ```

3. Allow user to access MSR with read-only privilege using the Access Control List (ACL).

    ```
    sudo setfacl -m u:volt_sm:r /dev/cpu/*/msr
    ```

4. Assign capability to 'msr_reader' since msr kernel module requires rawio capability.

    ```
    sudo setcap 'cap_sys_rawio=ep cap_sys_admin=ep' build/system_monitor/msr_reader
    ```

## Disk Monitor

1. HDD monitor use a specific program called "hdd_reader".
2. Install smarttools package to read disk diagnostics from S.M.A.R.T system.

    ```
    sudo apt install smartmontools
     ```

3. Check if your device supports S.M.A.R.T system.

    ```
    smartctl --info /dev/sda | grep 'SMART support is:' 
    ```

4. Add user to the disk group.

    ```
    sudo usermod -a -G disk volt_sm 
    ```

5. Assign capabilities to 'hdd_reader' since SCSI kernel module requires rawio capability to send ATA PASS-THROUGH (12) command and NVMe kernel module requires admin capability to send Admin Command.

    ```
    sudo setcap 'cap_sys_rawio=ep cap_sys_admin=ep' install/system_monitor/lib/system_monitor/hdd_reader 
    ```

## Network Traffic Monitor 

1. HDD monitor use a specific program called "traffic_reader".
2. Install nethogs package to read traffic diagnostics.

    ```
    sudo apt install nethogs
     ```

3. Assign capability to 'traffic_reader' kernel module requires rawio capability.

    ```
    sudo setcap 'cap_sys_rawio=ep cap_sys_admin=ep' build/system_monitor/traffic_reader

    sudo setcap "cap_net_admin,cap_net_raw=ep" /usr/sbin/nethogs
     ```


## Usage

* Reader packages should be run from the new user (volt_sm), to get diagnostics data safely.

    ```
    su volt_sm
    install/system_monitor/lib/system_monitor/msr_reader
    install/system_monitor/lib/system_monitor/hdd_reader
    install/system_monitor/lib/system_monitor/traffic_reader
    ```

* After launching packages above, you can read diagnostics data from **volt** user by launching system_monitor package.

    ```
    ros2 launch system_monitor system_monitor.launch.xml
    ```