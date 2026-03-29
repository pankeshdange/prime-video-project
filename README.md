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
<img width="938" height="605" alt="image" src="https://github.com/user-attachments/assets/1f1cd7a1-08bb-440e-81a2-bf2bc67c2971" />

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
<img width="940" height="668" alt="image" src="https://github.com/user-attachments/assets/9906393d-92c3-4cc9-bb97-da835454fffb" />

 
🖥️ Step 1.3: Launch Instance
•	Click Launch Instance
1)	Give a name:  DevOps-CICD-Server
2)	Choose AMI (Operating System) Select: Amazon Linux (Free Tier eligible)
3)	Choose Instance Type
	t2.medium ✅ (recommended)
OR
	t2.large (if you want more performance)
<img width="940" height="619" alt="image" src="https://github.com/user-attachments/assets/70f1f930-5daa-483e-94a9-59e2a03623b3" />

 
4)	Create Key Pair (.pem file)
•	Click Create new key pair
•	Name: devops-key
•	Type: RSA
•	Format: .pem
•	Click Create
👉 File will download automatically in (download folder)
⚠️ Keep it safe (very important)

 <img width="940" height="690" alt="image" src="https://github.com/user-attachments/assets/8c2f4f14-1cd1-4774-aa0f-2a360d0be7b2" />

5)	: Configure Network Settings
Allow these ports:
•	✅ SSH (22) → for login
•	✅ HTTP (80) → for website
•	✅ HTTPS (443) → for secure website
👉 Select: Allow from Anywhere (0.0.0.0/0) (for learning purpose)

6)	: Configure Storage
•	Set: 20 GB
<img width="940" height="593" alt="image" src="https://github.com/user-attachments/assets/aaf6e1c2-42e4-4f15-8e63-7296350e832c" />



 
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

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/58b73ae6-d3fc-46c3-8007-a6dbe385c55c" />

________________________________________
🌐 🔹 Step 2.2: Open MobaXterm
•	Open MobaXterm application
•	Click on Session (top left)  
<img width="940" height="466" alt="image" src="https://github.com/user-attachments/assets/d4a0d90c-abc3-449b-be60-4f67236be60a" />

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
 <img width="940" height="626" alt="image" src="https://github.com/user-attachments/assets/9d30c610-9dd7-4d04-b3d9-1ed1215239c4" />

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
<img width="940" height="377" alt="image" src="https://github.com/user-attachments/assets/d6d170d0-de2d-4c72-803c-a6d60287d4c9" />

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
 <img width="940" height="130" alt="image" src="https://github.com/user-attachments/assets/876d587a-83c6-4eca-a0bd-08fad3b66878" />

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
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/f00befab-5763-4519-bec4-2852f8fec74f" />

________________________________________

🌐 🔹 Step 3.6: Open Jenkins Port (Important)
Go to AWS → EC2 → Security Groups
Add Rule:
•	Port: 8080 (Jenkins)
 
 <img width="940" height="380" alt="image" src="https://github.com/user-attachments/assets/9be673a8-e792-4905-a801-184f1a4aabc6" />
<img width="940" height="404" alt="image" src="https://github.com/user-attachments/assets/1cb0e0f2-c1ba-4a0e-af38-324a6a2d0325" />

________________________________________
🔑 🔹 Step 3.7: Get Jenkins Initial Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
👉 Copy this password (used in browser login)
 <img width="940" height="257" alt="image" src="https://github.com/user-attachments/assets/0d9279eb-bc5c-4f14-8c5e-a9ffdba1c60b" />

 <img width="940" height="177" alt="image" src="https://github.com/user-attachments/assets/c7157450-324c-4694-90e0-5b88e469b254" />

________________________________________
🐱 🔹 Step 3.9: Install Apache Tomcat
Download Tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz
Extract
tar -xvzf apache-tomcat-9.0.85.tar.gz
1)	Rename Folder
mv apache-tomcat-9.0.85 tomcat
 
<img width="940" height="517" alt="image" src="https://github.com/user-attachments/assets/3c788529-2154-4802-b698-e0b95f31babc" />

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
 <img width="940" height="141" alt="image" src="https://github.com/user-attachments/assets/6eae85ad-5b8f-4bba-a8df-1bd946f225bd" />

3)	Also set the tomcat port
	Goto => tomcat
	Cd conf/
	Vi server.xml
	Find:-  connector port 
Change this 8080 to 1001
	Save and exit 
:wq => enter
   
<img width="445" height="161" alt="image" src="https://github.com/user-attachments/assets/e5d1ace9-6693-4dec-afd8-7782200707dd" />
<img width="466" height="162" alt="image" src="https://github.com/user-attachments/assets/83b3a018-7509-4522-bf23-32e8d83147de" />

Open Jenkins Port (Important)
Go to AWS → EC2 → Security Groups
Add Rule:
•	Port: 8080 (Jenkins)
 <img width="940" height="350" alt="image" src="https://github.com/user-attachments/assets/7728982e-932b-40f6-99b8-14cecaf2ef97" />

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
   <img width="342" height="338" alt="image" src="https://github.com/user-attachments/assets/9f6abc65-3a8f-4406-9b49-e06f8f1fd2ef" />
<img width="631" height="336" alt="image" src="https://github.com/user-attachments/assets/710d6662-8ea8-4471-9577-7f7dacbcd15c" />

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
<img width="429" height="254" alt="image" src="https://github.com/user-attachments/assets/31080b8c-0044-460a-a72b-6fc8aee8ec82" />
<img width="488" height="254" alt="image" src="https://github.com/user-attachments/assets/f9bafd39-0a42-4df8-8478-b827d8e40c82" />
<img width="940" height="442" alt="image" src="https://github.com/user-attachments/assets/55a30d0e-bf88-4d40-946f-7c1e80414276" />
<img width="940" height="428" alt="image" src="https://github.com/user-attachments/assets/ad47b271-7aa8-4773-a758-f88d4e1a99b6" />

 
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
 <img width="940" height="245" alt="image" src="https://github.com/user-attachments/assets/bfc7e4e5-fee9-4c9f-a27d-f58e3f12bbd3" />

________________________________________
☕ 🔹 Step 4.3: Configure Java (JDK)
Steps:
1.	Go to Manage Jenkins
2.	Click Tools
3.	Scroll to JDK Section
4.	Click Add JDK
Enter Details:
•	Name: java-jdk
👉 To find path:
readlink -f $(which java)

•	JAVA_HOME Path:
/usr/lib/jvm/java-21-amazon-corretto.x86_64
 <img width="940" height="500" alt="image" src="https://github.com/user-attachments/assets/29cb9d48-aab1-4162-bf16-6a96c022239f" />

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
   
 <img width="413" height="328" alt="image" src="https://github.com/user-attachments/assets/196bf749-4f67-4c9d-8c95-fee3879af720" />
<img width="518" height="327" alt="image" src="https://github.com/user-attachments/assets/0abae057-7586-4665-b507-b90f17cd39e2" />

________________________________________
🛠️ 🔹 Step 4.5: Create New CI/CD Job
Steps:
1.	Go to Jenkins Dashboard
2.	Click New Item
3.	Enter Name:	my-cicd-project
4.	Select: Freestyle Project
5.	Click OK
   <img width="940" height="726" alt="image" src="https://github.com/user-attachments/assets/85ad27d9-39f3-4f3d-b215-285d855fb039" />
<img width="366" height="352" alt="image" src="https://github.com/user-attachments/assets/c6f7803a-04fe-4aca-90aa-8e1711c5564b" />
<img width="484" height="354" alt="image" src="https://github.com/user-attachments/assets/442bf911-09b8-4d79-8a53-e9c2166106ae" />

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
 <img width="940" height="400" alt="image" src="https://github.com/user-attachments/assets/60416151-9ca9-4158-9f1c-faa967ff280b" />

________________________________________
3️⃣ Build Step (Maven Build)
•	Click Add Build Step
•	Select: Invoke top-level Maven targets
Goals:
clean package
👉 This generates .war file
 <img width="940" height="395" alt="image" src="https://github.com/user-attachments/assets/8e64cecb-0727-4145-a88c-124a4d03398c" />

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
 <img width="940" height="436" alt="image" src="https://github.com/user-attachments/assets/7711caba-6a9c-49d6-8395-942f00db47ae" />

________________________________________
💾 🔹 Step 4.7: Save Job
•	Click Apply
•	Click Save
________________________________________
🚀 🔹 Step 4.8: Run the Job
•	Click Build Now
 
 <img width="940" height="450" alt="image" src="https://github.com/user-attachments/assets/9809999a-bc2e-41ad-a200-46026c9d2783" />
<img width="940" height="463" alt="image" src="https://github.com/user-attachments/assets/683ef005-e551-4a13-999a-986442896bd0" />


“Bingoooooo”

 <img width="940" height="451" alt="image" src="https://github.com/user-attachments/assets/3694553c-b0e3-43fa-aa4a-e788d2e0e598" />


Now we need to store the .war file automatically on S3 bucket 
1️⃣ Install S3 Publisher Plugin in Jenkins
1.	Open Jenkins dashboard 
2.	Go to: Manage Jenkins → Plugins → Available Plugins 
3.	Search for: S3 Publisher 
4.	Install and restart Jenkins 
👉 Plugin: S3 Publisher Plugin
  <img width="940" height="317" alt="image" src="https://github.com/user-attachments/assets/8a49daef-27e8-4c22-bdfd-14bffa094c92" />


2️⃣ Create an S3 Bucket
1.	Go to Amazon S3 console 
2.	Click Create bucket 
3.	Provide: 
o	Unique bucket name (e.g., my-jenkins-artifacts-bucket) 
o	Region (same as EC2 preferred) 
4.	Keep defaults → Create bucket

<img width="940" height="554" alt="image" src="https://github.com/user-attachments/assets/63c88dbd-6b6a-425c-8b5b-8e77e9f494b5" />
<img width="940" height="415" alt="image" src="https://github.com/user-attachments/assets/5321a656-175f-4f7b-a732-2ff1c4ccf4c4" />

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
<img width="940" height="554" alt="image" src="https://github.com/user-attachments/assets/32958108-8d66-4116-8356-a425b85a478f" />
<img width="272" height="298" alt="image" src="https://github.com/user-attachments/assets/471bef01-397e-4ac7-a22f-98c16197c530" />
<img width="382" height="342" alt="image" src="https://github.com/user-attachments/assets/7ee7e285-b243-4f44-ad72-469a195c1ffd" />
<img width="940" height="505" alt="image" src="https://github.com/user-attachments/assets/8d86d292-b7b1-4393-8e4e-bc65783f7a2f" />
<img width="940" height="541" alt="image" src="https://github.com/user-attachments/assets/5c42c2ea-7664-4172-ad20-a0eee5385951" />
<img width="940" height="512" alt="image" src="https://github.com/user-attachments/assets/11616ed6-e6dd-4b7d-a3df-bbba94f66659" />
 
4️⃣ Attach IAM Role to EC2 Instance
1.	Go to Amazon EC2 
2.	Select your Jenkins instance 
3.	Click: 
o	Actions → Security → Modify IAM role 
4.	Attach: 
o	Jenkins-S3-Access-Role 
5.	Save 
 
 <img width="940" height="436" alt="image" src="https://github.com/user-attachments/assets/0a446cbf-3f78-49f6-a49e-236a698056f8" />
<img width="940" height="380" alt="image" src="https://github.com/user-attachments/assets/6a72d9ee-cd24-48ab-94f0-eca5981a4ae4" />

5️⃣ Configure S3 in Jenkins (Using IAM Role)
Since IAM role is attached, no access keys needed ✅
1.	Go to: 
o	Manage Jenkins → Configure System 
2.	Scroll to Amazon S3 profiles 
3.	Add new profile: 
o	Name: aws-s3-profile 
o	Credentials: leave blank (IAM role will be used) 
o	Region: same as bucket
<img width="842" height="411" alt="image" src="https://github.com/user-attachments/assets/4938744b-c459-4124-93e6-d8de487c6b28" />
<img width="940" height="429" alt="image" src="https://github.com/user-attachments/assets/86354946-deda-4c31-ba72-d9235050c7a7" />
<img width="940" height="256" alt="image" src="https://github.com/user-attachments/assets/d0a0f248-1a0b-47fe-b1bb-67649bf48dfd" />
<img width="722" height="675" alt="image" src="https://github.com/user-attachments/assets/27d8077f-5184-48e5-95fe-e17fd01ededb" />

 <img width="722" height="675" alt="image" src="https://github.com/user-attachments/assets/33a4e781-6c2c-4550-9fa2-9d13065545c6" />


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

 <img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/0a18f67e-0d3d-436d-8464-c490a74608ad" />


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

