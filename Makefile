install-role:
	ansible-galaxy install -r requirements.yml

prepare-servers:
	ansible-playbook playbook.yml -i inventory.ini