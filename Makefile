USERNAME ?= ilya

install-role:
	ansible-galaxy install -r requirements.yml

add-user:
	ansible-playbook --vault-password-file .password user.yml -i inventory.ini -e "username=$(USERNAME)"

prepare-servers:
	ansible-playbook --vault-password-file .password prepare-servers.yml -i inventory.ini

deploy-redmine:
	ansible-playbook --vault-password-file .password deploy.yml -i inventory.ini

run-datadog:
	ansible-playbook --vault-password-file .password datadog.yml -i inventory.ini

run-redmine:
	ansible-playbook --vault-password-file .password playbook.yml -i inventory.ini

encrypt-env:
	ansible-vault encrypt group_vars/webservers/vault.yml

edit-env:
	ansible-vault edit group_vars/webservers/vault.yml