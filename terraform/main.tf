data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my-vm" {
  count         = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags = {
    Name = "my-vm-${count.index + 1}"
  }
}

resource "local_file" "tf_ip" {
  content  = "[ALL]\n${aws_instance.my-vm[0].public_ip} ansible_ssh_user=ubuntu"
  filename = "./inventory"
}