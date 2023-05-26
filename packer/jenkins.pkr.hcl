source "amazon-ebs" "jenkins" {
  ami_name          = "Jenkins {{timestamp}}"
  instance_type     = var.instance_type
  region            = var.region
  source_ami        = var.source_ami
  ssh_username      = var.ssh_username
  security_group_id = var.security_group_id



  tags = {
    "Name" = "Jenkins-Ansible"
  }
}

build {

  sources = ["source.amazon-ebs.jenkins"]

  provisioner "ansible" {

    playbook_file = "../playbook/jenkins-playbook.yaml"

  }

  post-processor "manifest" {}

}