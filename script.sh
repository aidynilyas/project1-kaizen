function installterraform() {
    sudo yum install -y yum-utils shadow-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
}

function installansible() {
    sudo yum install ansible -y
}

function applyterraform() {
    cd terraform
    terraform init
    terraform apply -auto-approve
}

function update_ip() {
    terraform output -raw ec2 > ../ansible/hosts
}

function applyansible() { 
    cd ../ansible
    ansible-playbook main.yml
}

installterraform
installansible
applyterraform
update_ip
sleep 10
applyansible