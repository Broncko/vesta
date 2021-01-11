# vesta
Smarthome setup and configuration

** WORK IN PROGRESS **

## Setup
1. Ansible installieren
2. Benötigte roles und collections aus requirements file installieren:
```bash
ansible-galaxy install -r requirements.yml
```
3. hosts.yml editieren und entsprechenden Host oder IP des smarthome servers (raspberry pi) eintragen
4. Setup playbook ausführen:
```bash
ansible-playbook -i hosts.yml system_setup.yml
```
