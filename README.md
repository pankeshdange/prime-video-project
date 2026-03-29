Project 
🚀 Automated CI/CD Deployment on AWS using Jenkins & Docker
<img width="939" height="625" alt="image" src="https://github.com/user-attachments/assets/b6cc9fda-dfad-4e85-8e10-3e4dfcf960dd" />

🔹 Project Overview
This project demonstrates a complete CI/CD (Continuous Integration & Continuous Deployment) pipeline where an application is automatically built and deployed on a cloud server.
The infrastructure is created using Amazon EC2 with an Amazon Linux machine. The system is configured with essential DevOps tools such as Git, Apache Maven, Java 21, Jenkins, and Apache Tomcat.
The pipeline automates the process of fetching source code from GitHub, building it, and deploying it to a web server without manual intervention.
________________________________________
🔹 Objective
The main objective of this project is to:
•	Automate the build and deployment process
•	Reduce manual errors
•	Achieve faster and reliable application delivery
•	Implement real-world DevOps practices
________________________________________
🔹 Key Workflow
🧭 Step-by-Step Flow:
1.	Infrastructure Setup
o	Create an EC2 instance with Amazon Linux
o	Configure security groups and required ports
2.	Server Configuration
o	Install and configure:
	Git → for source code management
	Maven → for building the project
	Java 21 → runtime environment
	Jenkins → automation tool
	Tomcat → deployment server
3.	Security & Networking
o	Configure ports:
	22 (SSH)
	8080 (Jenkins)
	8080/8081 (Tomcat)
o	Update EC2 security groups accordingly
4.	Jenkins Setup
o	Access Jenkins via browser
o	Configure initial setup
o	Install required plugins
5.	CI/CD Pipeline Execution
o	Create a Freestyle Job in Jenkins
o	Connect Jenkins with GitHub repository
o	Pull project source code
6.	Build & Package
o	Use Maven to build the project
o	Generate .war file
7.	Automated Deployment
o	Deploy .war file to Tomcat server
o	Application becomes live automatically

________________________________________

 
“Step 1”

Create AWS EC2 Instance (Beginner Friendly)

🧭 What we are doing here
We are creating a virtual server (EC2 instance) on AWS where our application will run.
________________________________________
🔐 Step 1.1: Login to AWS Account
•	Go to: https://aws.amazon.com/console/
•	Click Sign In
•	Enter your credentials
👉 After login, you will see the AWS dashboard
________________________________________
🔍 Step 1.2: Go to EC2 Service
•	Search EC2 in the search bar
•	Click on: Amazon EC2
 
🖥️ Step 1.3: Launch Instance
•	Click Launch Instance
1)	Give a name:  DevOps-CICD-Server
2)	Choose AMI (Operating System) Select: Amazon Linux (Free Tier eligible)
3)	Choose Instance Type
	t2.medium ✅ (recommended)
OR
	t2.large (if you want more performance)
 
4)	Create Key Pair (.pem file)
•	Click Create new key pair
•	Name: devops-key
•	Type: RSA
•	Format: .pem
•	Click Create
👉 File will download automatically in (download folder)
⚠️ Keep it safe (very important)
 
5)	: Configure Network Settings
Allow these ports:
•	✅ SSH (22) → for login
•	✅ HTTP (80) → for website
•	✅ HTTPS (443) → for secure website
👉 Select: Allow from Anywhere (0.0.0.0/0) (for learning purpose)

6)	: Configure Storage
•	Set: 20 GB



 
7)	: Launch Instance
•	Click Launch Instance
👉 Wait for few seconds…

8)	: Verify Instance
•	Go to Instances
•	Check:
o	Status = Running ✅
________________________________________






“Step 2”
 Connect to EC2 Instance using MobaXterm
🧭 What we are doing here
In this step, we will connect to our AWS EC2 server using an SSH client called MobaXterm.
This allows us to access the server terminal and install required tools.
________________________________________
🖥️ 🔹 Step 2.1: Required Details
Before connecting, make sure you have:
•	✅ Public IP Address (from EC2 dashboard)
•	✅ .pem key file (downloaded earlier)
•	✅ Username → ec2-user
•	 
________________________________________
🌐 🔹 Step 2.2: Open MobaXterm
•	Open MobaXterm application
•	Click on Session (top left)  
________________________________________
🔐 🔹 Step 2.3: Select SSH Session
•	Click on SSH
•	Now fill the details:

📝 Enter Basic Details:
•	Remote Host: Paste your EC2 Public IP
•	✔ Tick: Specify username
•	Username: ec2-user
________________________________________
🔑 🔹 Step 2.4: Add .pem Key (Important Step)
•	Go to Advanced SSH settings
•	Click Browse
•	Select your .pem file
👉 This is required for secure login
 
________________________________________
🚀 🔹 Step 2.5: Connect to Server
•	Click OK
•	Terminal will open automatically
________________________________________
💻 🔹 Step 2.6: Verify Connection
If connected successfully, you will see:
[ec2-user@ip-xxx-xx-xx-xx ~]$
🎉 Congratulations! You are now inside your EC2 server.





“ Step 3”

Install & Configure Required Tools on EC2
🧭 What we are doing here
In this step, we will prepare our EC2 server by installing all required DevOps tools:
•	Git
•	Apache Maven
•	Java 21 (Runtime Environment)
•	Jenkins
•	Apache Tomcat
________________________________________
 
⚙️ 🔹 Step 3.1: Update System (Recommended First Step)
Before we can start
Sudo su :-  it is basically use to switch into the root user  

sudo yum update -y
👉 This ensures all packages are up to date
________________________________________
☕ 🔹 Step 3.2: Install Java 21
Install Java
sudo yum install java-21-amazon-corretto-devel -y
Verify Installation
java - -version
👉 Output should show Java 21 installed
 
________________________________________
🌿 🔹 Step 3.3: Install Git
Install Git
sudo yum install git -y
Verify Git
git - -version or git -v
________________________________________
📦 🔹 Step 3.4: Install Maven
Install Maven
sudo yum install maven -y
Verify Maven
mvn -version
________________________________________
🤖 🔹 Step 3.5: Install Jenkins
		Goto :- Jenkins.io => documentation  
Or
https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos

Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo yum upgrade
# Add required dependencies for the jenkins package
#sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload

Start Jenkins
sudo systemctl start jenkins
Enable Jenkins on Boot
sudo systemctl enable jenkins
Check Status
sudo systemctl status jenkin 
________________________________________

🌐 🔹 Step 3.6: Open Jenkins Port (Important)
Go to AWS → EC2 → Security Groups
Add Rule:
•	Port: 8080 (Jenkins)
 
 
________________________________________
🔑 🔹 Step 3.7: Get Jenkins Initial Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
👉 Copy this password (used in browser login)
 
 
________________________________________
🐱 🔹 Step 3.9: Install Apache Tomcat
Download Tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz
Extract
tar -xvzf apache-tomcat-9.0.85.tar.gz
1)	Rename Folder
mv apache-tomcat-9.0.85 tomcat
 

2)	 Configure Tomcat User (for deployment)
	Cd tomcat
	Cd conf/
	Vi tomcat-server.xml
Add this user credential end of the file 
 
<role rolename="manager-gui"/>
  <role rolename="admin-gui"/>
  <role rolename="manager-script"/>
  <user username="tomcat" password="tomcat" roles="manager-gui"/>
  <user username="admin" password="admin" roles="manager-gui,admin-gui,manager-script"/>
 
3)	Also set the tomcat port
	Goto => tomcat
	Cd conf/
	Vi server.xml
	Find:-  connector port 
Change this 8080 to 1001
	Save and exit 
:wq => enter
   

Open Jenkins Port (Important)
Go to AWS → EC2 → Security Groups
Add Rule:
•	Port: 8080 (Jenkins)
 
4)	Start the web server 	
	Cd tomcat
	Cd bin/
	Sh startup.sh
🌐 🔹 Step 3.10: Open Tomcat Port
In Security Group:
•	Add role Port :- 1001
________________________________________
🌍 🔹 Step 3.11: Access Tomcat
<your-ec2-public-ip>:1001
User name :- admin
Passwd        :- admin
👉 Tomcat homepage should open 🎉
   
________________________________________

“Step 4”
Configure Jenkins & Create CI/CD Pipeline
🧭 What we are doing here
In this step, we will:
•	Login to Jenkins
•	Install required plugins
•	Configure Java (JDK)
•	Add Tomcat credentials
•	Create a Freestyle CI/CD Job
•	Build and deploy .war file automatically on tomcate
________________________________________
🔐 🔹 Step 4.1: Login to Jenkins
Open browser:
http://<your-ec2-public-ip>:8080
First-Time Setup:
•	Paste initial admin password
•	Click Install Suggested Plugins
•	Create new admin user (username & password as per your choice)
👉 After setup, Jenkins dashboard will open 🎉
   
 
________________________________________



 
🔌 🔹 Step 4.2: Install Required Plugin (Deploy to Container)
This plugin is required to deploy .war file to Tomcat.
Steps:
1.	Go to Manage Jenkins
2.	Click Plugins
3.	Go to Available Plugins
4.	Search: Deploy to container and pipeline: stage view
5.	Select plugin
6.	Click Install
7.	Restart Jenkins
 
________________________________________
☕ 🔹 Step 4.3: Configure Java (JDK)
Steps:
1.	Go to Manage Jenkins
2.	Click Tools
3.	Scroll to JDK Section
4.	Click Add JDK
Enter Details:
•	Name: java-jdk
•	JAVA_HOME Path:
/usr/lib/jvm/java-21-amazon-corretto.x86_64
 
________________________________________
🔐 🔹 Step 4.4: Add Tomcat Credentials
We need credentials so Jenkins can deploy to Apache Tomcat.
Steps:
1.	Go to Manage Jenkins
2.	Click Credentials
3.	Select Global
4.	Click Add Credentials
Enter Details:
•	Kind: Username with password
•	Username: admin
•	Password: admin
•	ID: tomcat-cred-id
•	Description: tomcat-cred-id
✔ Click Create
   
 
________________________________________
🛠️ 🔹 Step 4.5: Create New CI/CD Job
Steps:
1.	Go to Jenkins Dashboard
2.	Click New Item
3.	Enter Name:	my-cicd-project
4.	Select: Freestyle Project
5.	Click OK
   
________________________________________
📝 🔹 Step 4.6: Configure Job
1️⃣ IN General => Description
Add project description:
CI/CD pipeline for automatic build and deployment using Jenkins, Maven, and Tomcat
________________________________________
2️⃣ Source Code Management
•	Select: Git
•	Repository URL: (your GitHub repo) 
      Path:- https://github.com/pankeshdange/prime-video-project.git
👉 GitHub
•	Credentials: None
 
________________________________________
3️⃣ Build Step (Maven Build)
•	Click Add Build Step
•	Select: Invoke top-level Maven targets
Goals:
clean package
👉 This generates .war file
 
________________________________________
4️⃣ Post-Build Action (Deployment)
•	Click Add Post-build Action
•	Select: Deploy WAR/EAR to a container
Configuration:
•	WAR/EAR files:
**/*.war
•	Context Path:
my-prime-app
•	Container:
Tomcat 9.x Remote
•	Credentials:
tomcat-cred-id
•	Tomcat URL:
http://<your-ec2-public-ip>:2026
 
________________________________________
💾 🔹 Step 4.7: Save Job
•	Click Apply
•	Click Save
________________________________________
🚀 🔹 Step 4.8: Run the Job
•	Click Build Now
 
 

“Bingoooooo”

 















Now we need to store the .war file automatically on S3 bucket 
1️⃣ Install S3 Publisher Plugin in Jenkins
1.	Open Jenkins dashboard 
2.	Go to: Manage Jenkins → Plugins → Available Plugins 
3.	Search for: S3 Publisher 
4.	Install and restart Jenkins 
👉 Plugin: S3 Publisher Plugin
  

2️⃣ Create an S3 Bucket
1.	Go to Amazon S3 console 
2.	Click Create bucket 
3.	Provide: 
o	Unique bucket name (e.g., my-jenkins-artifacts-bucket) 
o	Region (same as EC2 preferred) 
4.	Keep defaults → Create bucket

 
  

3️⃣ Create IAM Role with S3 Access
1.	Open AWS IAM 
2.	Click Roles → Create Role 
3.	Select: 
o	Trusted entity: AWS Service 
o	Use case: EC2 
4.	Attach policy: 
o	AmazonS3FullAccess (or better: custom limited policy) 
5.	Name role: Jenkins-S3-Access-Role 
6.	Create role

 

  
 
 

 
4️⃣ Attach IAM Role to EC2 Instance
1.	Go to Amazon EC2 
2.	Select your Jenkins instance 
3.	Click: 
o	Actions → Security → Modify IAM role 
4.	Attach: 
o	Jenkins-S3-Access-Role 
5.	Save 
 
 
5️⃣ Configure S3 in Jenkins (Using IAM Role)
Since IAM role is attached, no access keys needed ✅
1.	Go to: 
o	Manage Jenkins → Configure System 
2.	Scroll to Amazon S3 profiles 
3.	Add new profile: 
o	Name: aws-s3-profile 
o	Credentials: leave blank (IAM role will be used) 
o	Region: same as bucket

 
 

 

 
 

6️⃣ Configure Job to Upload Artifact
For Freestyle Job:
1.	Open your job 
2.	Go to Post-build Actions 
3.	Select: Publish artifacts to S3 bucket 
4.	Configure: 
o	Profile: aws-s3-profile 
o	Bucket: your bucket name 
o	Source files:
**/*.war
o	Destination: optional folder (e.g., builds/)

 

7️⃣ Build & Verify
1.	Trigger Build Now 
2.	After success: 
o	Go to S3 bucket 
o	You should see your .war file uploaded automatically 🎉 
=======================================================
👉 Jenkins will:
1.	Pull code from GitHub
2.	Build using Maven
3.	Generate .war file
4.	Deploy to Tomcat automatically 🎉
5.	You should see your .war file uploaded automatically
________________________________________
🌍 🔹 Step 4.9: Access Your Application
Open browser:
http://<your-ec2-public-ip>:2026/my-prime-app
👉 Your application should be live 🚀

==========================///////=========================

🧾 What You Have Achieved
✔ Installed and configured Jenkins
✔ Added required plugin
✔ Configured Java (JDK)
✔ Added Tomcat credentials
✔ Created CI/CD pipeline
✔ Automated build + deployment
________________________________________
⚠️ Important Notes
•	Make sure port 2026 is open in EC2 Security Group
•	Tomcat must be running
•	Correct .war file path
________________________________________
🎯 Final Result
👉 You have successfully built a complete CI/CD pipeline:
GitHub → Jenkins → Maven → Tomcat → Live Application

