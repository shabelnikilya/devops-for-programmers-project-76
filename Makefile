USERNAME ?= ilya
PASSWORD_FILE ?= .password

install-role:
	ansible-galaxy install -r requirements.yml

add-user:
	ansible-playbook --vault-password-file $(PASSWORD_FILE) user.yml -i inventory.ini -e "username=$(USERNAME)"

prepare-servers:
	ansible-playbook --vault-password-file $(PASSWORD_FILE) prepare-servers.yml -i inventory.ini -u $(USERNAME)

deploy-redmine:
	ansible-playbook --vault-password-file $(PASSWORD_FILE) deploy.yml -i inventory.ini

run-datadog:
	ansible-playbook --vault-password-file $(PASSWORD_FILE) datadog.yml -i inventory.ini

run-redmine:
	ansible-playbook --vault-password-file $(PASSWORD_FILE) playbook.yml -i inventory.ini

encrypt-env:
	ansible-vault encrypt group_vars/webservers/vault.yml

edit-env:
	ansible-vault edit group_vars/webservers/vault.yml