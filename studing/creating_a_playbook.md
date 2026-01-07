### Creating a playbook

Playbooks are automation blueprints, in YAML format, that Ansible uses to deploy and configure managed nodes.

* Playbook
    A list of plays that define the order in which Ansible performs operations, from top to bottom, to achieve an overall goal.
* Play
    An ordered list of tasks that maps to managed nodes in an inventory.
* Task
    A reference to a single module that defines the operations that Ansible performs.
* Module
    A unit of code or binary that Ansible runs on managed nodes. Ansible modules are grouped in collections with a Fully Qualified Collection Name (FQCN) for each module.


Create my first playbook and running:

```yaml
- name: My First playbook
  hosts: myhosts
  tasks:
    - name: Ping my hosts
      ansible.builtin.ping:

    - name: Print message
      ansible.builtin.debug:
        msg: Hello World!

```

ansible-playbook -i inventory.ini playbook.yaml

output:
```sh
PLAY [My first play] ****************************************************************************

TASK [Gathering Facts] **************************************************************************
ok: [192.0.2.50]
ok: [192.0.2.51]
ok: [192.0.2.52]

TASK [Ping my hosts] ****************************************************************************
ok: [192.0.2.50]
ok: [192.0.2.51]
ok: [192.0.2.52]

TASK [Print message] ****************************************************************************
ok: [192.0.2.50] => {
    "msg": "Hello world"
}
ok: [192.0.2.51] => {
    "msg": "Hello world"
}
ok: [192.0.2.52] => {
    "msg": "Hello world"
}

PLAY RECAP **************************************************************************************
192.0.2.50: ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
192.0.2.51: ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
192.0.2.52: ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

