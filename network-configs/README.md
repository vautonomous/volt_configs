# Network Configuration Using Netplan

- [This .yaml file](01-network-manager-all.yaml) created with Netplan. 

## Creation of the File

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


- Update the configuration file with [this file](01-network-manager-all.yaml). 

## Testing Configuration

Before applying any changes, you could test the configuration file. Run the following command as sudo to test configurations:

```
$ sudo netplan try
```

If there is no issue, it will return the configuration accepted message. If the configuration file fails the test, it will be reverted to a previous working configuration.

## Apply Configuration

Now apply the new configurations by running the following command as sudo:

```
$ sudo netplan apply
```

## Verify IP Address

Now to verify if the new configurations are successfully applied, run the following command to verify the IP address:

```
$ ifconfig
```

