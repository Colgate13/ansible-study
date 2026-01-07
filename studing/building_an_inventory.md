```inventory.ini
[myhosts]
172.19.0.2 # VPS Fake container
```

ansible-inventory -i inventory.ini --list # Check inventory structure

ansible myhosts -m ping -i inventory.ini # Ping all hosts in 'myhosts' group
 
Ensure that group names are meaningful and unique. Group names are also case sensitive.

### About Grouping Hosts
What
  Group hosts according to the topology, for example: db, web, leaf, spine.
Where
  Group hosts by geographic location, for example: datacenter, region, floor, building.
When
  Group hosts by stage, for example: development, test, staging, production.


### Use metagroups
  Create a metagroup that organizes multiple groups in your inventory with the following syntax:

```
metagroupname:
  children:
    group1
    group2
```

The following inventory illustrates a basic structure for a data center. This example inventory contains a network metagroup that includes all network devices and a datacenter metagroup that includes the network group and all webservers.

```inventory.ini
leafs:
  hosts:
    leaf01:
      ansible_host: 192.0.2.100
    leaf02:
      ansible_host: 192.0.2.110

spines:
  hosts:
    spine01:
      ansible_host: 192.0.2.120
    spine02:
      ansible_host: 192.0.2.130

network:
  children:
    leafs:
    spines:

webservers:
  hosts:
    webserver01:
      ansible_host: 192.0.2.140
    webserver02:
      ansible_host: 192.0.2.150

datacenter:
  children:
    network:
    webservers:
```

### Create Variables

Variables set values for managed nodes, such as the IP address, FQDN, operating system, and SSH user, so you do not need to pass them when running Ansible commands.

Variables can apply to specific hosts. They can also apply to groups of hosts.

```inventory.ini
webservers:
  hosts:
    webserver01:
      ansible_host: 192.0.2.140
      http_port: 80
    webserver02:
      ansible_host: 192.0.2.150
      http_port: 443
```

Variables can also apply to all hosts in a group.

```inventory.ini
webservers:
  hosts:
    webserver01:
      ansible_host: 192.0.2.140
      http_port: 80
    webserver02:
      ansible_host: 192.0.2.150
      http_port: 443
  vars:
    ansible_user: my_server_user
```