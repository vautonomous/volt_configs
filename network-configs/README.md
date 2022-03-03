# Network Configuration Using Netplan


- The Netplan default configuration file is under the directory /etc/netplan. You can find that using the following command:

```
$ ls /etc/netplan/
```
- Now you will need to open the configuration file in any editor: 

```
$ sudo nano /etc/netplan/*.yaml
```

- You can find the name of the active network interfaces that you want to configure. To do so run the following command:

```
# You can use one of these.

$ ip a
$ ifconfig
$ nmcli
```
- Note the interface name that you want to configure using Netplan.


- Update the configuration file as per your networking needs. 

- For static IP addressing, add the IP address, Gateway, DNS information while for dynamic IP addressing, there is no need to add this information as it will get this information from DHCP server. Use the following syntax to edit the configuration file.

```
network:
    Version: 2
    Renderer: NetworkManager/ networkd
    ethernets:
       DEVICE_NAME:
          Dhcp4: yes/no   # Yes for dynamic IP and No for Static IP
          Addresses: [IP_ADDRESS/NETMASK]
          Gateway: GATEWAY
          Nameservers:
             Addresses: [NAMESERVER_1, NAMESERVER_2]

```

- Note that Yaml files are rather strict in the indentation. Make use of spaces for indentation, not tabs. Otherwise, you will encounter an error.

## Testing Configuration

Before applying any changes, you could test the configuration file. Run the following command as sudo to test configurations:

```
$ sudo netplan try
```

If there is no issue, it will return the configuration accepted message. If the configuration file fails the test, it will be reverted to a previous working configuration.

## Apply configuration

Now apply the new configurations by running the following command as sudo:

```
$ sudo netplan apply
```

## Restart the network service

Once all the configurations are successfully applied, restart the Network-Manager service by running the following command:

```
$ sudo systemctl restart network-manager
```

## Verify IP address

Now to verify if the new configurations are successfully applied, run the following command to verify the IP address:

```
$ ip a
```

