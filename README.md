### Hexlet tests and linter status:
[![Actions Status](https://github.com/shabelnikilya/devops-for-programmers-project-76/workflows/hexlet-check/badge.svg)](https://github.com/shabelnikilya/devops-for-programmers-project-76/actions)

### Deploy application:
[![Deploy status](https://github.com/shabelnikilya/devops-for-programmers-project-76/actions/workflows/deploy.yml/badge.svg)](https://github.com/shabelnikilya/devops-for-programmers-project-76/actions)



## Deploy docker image using Ansible

Project to automate the deployment of the Redmine application in DigitalOcean using Ansible.
This application is available via DNS: https://shabelnikilya.online/.
The project includes: load balancer, two servers with Redmine, postgresql cluster.

**Preparation:**
- Requires the Make utility;
- At the root of the project, run the `make install-role` command;
- Optional: to add a user to a remote server, run the command `make add-user`(you can pass the username to it, default = ilya)

**Secret Variables:**
- Environment variables for working with the database are encrypted using ansible vault;
- Command at the root of the project:
  - `make encrypt-env` encrypts the file vault.yml
  - `make edit-env` command to change encrypted data
- To work with secret environment variables, a password is required in the .password file.

**Another command:**
- `make prepare-servers` install pip and docker on the servers;
- `make deploy-redmine` deploy redmine image to the DigitalOcean;
- `make run-datadog` start application monitoring;

**Deploy and start application:**
- Run the command in the root of the project `make run-redmine`