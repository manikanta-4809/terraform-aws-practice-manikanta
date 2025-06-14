# Explanation

## assignment1
In this assignment we need to deploy a static website on s3 using terraform and create a project directory named terraform-aws-practice and within that we create a folder called assignment-01-s3-static-website in this folder i created the necessary files as mentioned in the assignment taking reference from the terraform registry and we need to create an s3 bucket using a variable name the bucket should be made public so i configured the settings accordingly and set the default settings to allow public access policies are associated with the bucket the assignment i set each policy to false and to host the bucket as a static website we need to configure the website settings i set up the aws policy using json and hcl files i also created an aws s3 object to attach the index.html file providing the appropriate key and source.we are required to output the web_endpoint which refers to the s3 website configuration after setting everything up i run using terraform init,terraform plan and terraform apply after getting the output i accessed the website url and it correctly displayed the expected message.

![Screenshot (73)](https://github.com/user-attachments/assets/33dbdced-eeea-4fb1-b1f4-5f4ca162ded9)

![Screenshot (72)](https://github.com/user-attachments/assets/33554ddf-bf66-477f-9ca8-d0790df316fc)

![Screenshot (89)](https://github.com/user-attachments/assets/ab202b9e-a14a-45f6-966e-15ed07570403)



## assignment2
In this second assignment we need to refactoring the web server into a reusable module we create a project directory named assignment-02-reusable-webserver inside this directory we create a modules folder as specified in the assignment within that we create a module for ec2_instance and add the necessary files mentioned in the assignment next i created the root configuration in the assignment-02-reusable-webserver this includes the main.tf,variables.tf and outputs.tf files in the main.tf file, instead of using the old aws_instance block we now new module the assignment provides the module usage code and the output format which we reference from the module outputs we also configure the s3 backend in the terraform provider block the backend cannot be created automatically by terraform so we create the s3 bucket manually or using a separate terraform configuration.once created we define the backend in the configuration so that Terraform can use it. we use the S3 backend because it provides a reliable and scalable way to manage terraform state files.After completing the setup we need to perform terraform init,plan,apply after applied terraform provides the output including the ec2 instance public ip address which we can use to access the website. The correct message or content is displayed upon accessing the ip in a browser.

![Screenshot (91)](https://github.com/user-attachments/assets/369ba1a2-d1bc-46db-be2b-c617fe851391)

![Screenshot (90)](https://github.com/user-attachments/assets/75063d6d-6797-4001-9e03-7a5b2fe630ac)

## basic

In this assignment we deployed a secure public web server on aws step by step we need to create an aws key pair which is required to access the ec2 instance then we built the network foundation by creating a custom vpc a public subnet and attaching an internet gateway for internet access we set up a route table to allow internet traffic and created a security group to allow ssh and http access after that we launched an ec2 instance in the public subnet using the key pair and security group we used a user data script to automatically install Apache and display a  message on a webpage that we have mentioned in the user data script finally we tested the website using the public ip and performed a cleanup by deleting all the created aws resources in reverse order to avoid charges.

![Screenshot (54)](https://github.com/user-attachments/assets/bd6b26d9-2bd0-4760-9655-b7ce2b34a9b0)

![Screenshot (51)](https://github.com/user-attachments/assets/bcf41a99-69a5-49e5-a860-da2510ff941d)



##  best practices

In this assignment we built a two-tier web application infrastructure using aws and we should create a custom vpc called two-tier-vpc with public and private subnets for separating the web and database layers.An Internet Gateway was attached to the VPC and associated with the public subnet via the main route table while the private subnet remained isolated without internet access.Two security groups were created — one for the web server allowing http and ssh from appropriate sources and another for the database that only allows MySQL access from the web server security group.We launched a t2.micro EC2 instance named Web-Server into the public subnet with a web server user data script and another instance named DB-Server into the private subnet without a public IP.We verified connectivity by accessing the web server in a browser and successfully pinging the database server from the web server, ensuring correct tier-to-tier communication while maintaining database isolation from the internet.

![Screenshot (57)](https://github.com/user-attachments/assets/89c19c7d-d181-42f8-a599-14ba8a9f38d2)

![Screenshot (58)](https://github.com/user-attachments/assets/ceb2bd60-d97e-47c7-9fba-30af2a6cab81)

![Screenshot (59)](https://github.com/user-attachments/assets/dc511c58-3567-47a4-9311-f52ad76ae221)








