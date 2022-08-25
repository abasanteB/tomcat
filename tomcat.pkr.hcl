source "amazon-ebs" "red_hat" {
  region        = var.region                                
  ami_name      = "${var.ami_prefix}-${local.timestamp}"    
  source_ami    = var.source_ami                            
  instance_type = var.instance_type                         
  subnet_id     = var.subnet_id
  ssh_username  = var.ssh_username

  tags = var.tags
}

build {
 sources = [
    "source.amazon-ebs.red_hat"
  ]

 provisioner "shell" {
    script = "launch.sh"
 }

 
 provisioner "file" {
    source = "./playbooks"
    destination = "/tmp"
}


provisioner "shell" {
    inline = ["cd /tmp/playbooks/tasks && ansible-playbook main.yml -vvv"]
}

}

