
Automate Kubernetes Cluster Using Ansible.

Launch EC2-instances on AWS Cloud for master and slave.

Create roles that will configure master node and slave node separately.

Launch a WordPress and MySQL database connected to it in the respective slaves.

Expose the WordPress pod and client able hit the WordPress IP with its respective port.

Create a dynamic inventory:
- Installing Python3: $ yum install python3 -y
- Installing the boto3 library: $ pip3 install boto
- Creating a inventory directory: 
  mkdir -p /opt/ansible/inventory
  cd /opt/ansible/inventory
  
 Open /etc/ansible/ansible.cfg and find the [inventory] section and add the following line to enable the ec2 plugin:
 [inventory]
 enable_plugins = aws_ec2 
 
 Test the dynamic inventory configuration by listing the EC2 instances:
 ansible-inventory -i /opt/ansible/inventory/aws_ec2.yaml --list 
 # The above command returns the list of EC2 instances with all its parameters in JSON format
 
![image](https://user-images.githubusercontent.com/59709429/126087732-47ebb544-0244-4326-bd75-c30f55ed6503.png)
