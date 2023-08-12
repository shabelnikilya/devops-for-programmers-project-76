install-role:
	ansible-galaxy install -r requirements.yml

prepare-servers:
	ansible-playbook playbook.yml -i inventory.ini --skip-tags deploy

deploy-redmine:
	ansible-playbook --vault-password-file .password playbook.yml -i inventory.ini -t deploy

encrypt-env:
	ansible-vault encrypt group_vars/webservers/vault.yml

edit-env:
	ansible-vault edit group_vars/webservers/vault.yml