# App Runner Demo

``` add my own banner``` 

## What is AWS App Runner?
[AWS App Runner](https://aws.amazon.com/apprunner/) is a fully managed service that makes it easy for developers to quickly deploy containerized website applications and APIs at scale.

## Resources

Any issues encounterings, please consider contributing to our [list of known issues](https://github.com/aws/apprunner-roadmap/issues).

Check out App Runner's roadmap [here](https://github.com/aws/apprunner-roadmap/projects/1).

## What is this Github Repository?
This is an example web application for AWS App Runner. You can use this repo to deploy the web application two different ways.


## Deploy to App Runner

### Option 1: From Source

1. Fork this Repository:

	* Press the Fork button in the upper right. This will create an exact copy of the repository (and all of its branches) under your own username.

2. Open the AWS Console and browse to the [AWS App Runner service](https://console.aws.amazon.com/apprunner/home?region=us-east-1#/services).
      * Select 	`"Create a service"`
     
     
      	<img width="814" alt="Screen Shot 2021-08-12 at 11 05 31 AM" src="https://user-images.githubusercontent.com/86380762/129246694-c3a8fbd5-4bc3-46e1-becf-b17cd60f27fd.png">
      
      
      * #### Source:
      	* Repository type: `Source code repository`
      
      	* Connect to GitHub:
      			
			```
			Connection name: apprunner-connection
		    Repository: apprunner-demo
		    Branch: main
		<img width="803" alt="Screen Shot 2021-08-18 at 11 18 57 AM" src="https://user-images.githubusercontent.com/86380762/129958550-056b9d9d-4e6d-41cb-aeec-758e558dfdd1.png">
	
	* Deployment settings: `Automatic`
		
		<img width="805" alt="Screen Shot 2021-08-12 at 11 03 11 AM" src="https://user-images.githubusercontent.com/86380762/129246936-5ad5e7a1-486a-4cf5-b9e4-485ff937973b.png">

	 * #### Build settings:
	
		**Option 1:** `Use a configuration file`. App Runner looks for the `apprunner.yaml` in your source repository.
		
		**Option 2:**  Manually type the web application configurations.
		
		    Runtime: Nodejs12
		    Build command: npm install
		    Start command: node node.js	
		    Port: 3000
	
	  	<img width="806" alt="Screen Shot 2021-08-18 at 11 19 29 AM" src="https://user-images.githubusercontent.com/86380762/129959497-57a23b24-9f68-4809-9b4c-0e119d7b30d6.png">
	 
	* Configure settings:
		* Service name: `apprunner-demo`
		* Everything else can be left as default. Select `Next`
		
		
	  	 <img width="802" alt="Screen Shot 2021-08-18 at 11 19 42 AM" src="https://user-images.githubusercontent.com/86380762/129960539-456fe347-d566-4368-9390-4e8c86a5720a.png">

	* Select `"Create & deploy"`

### Option 2: From container
Use Case: Launch a containerized website application if the runtime is other than node or python.

1. Clone this repository to your local machine using the following command:

	`git clone https://github.com/[MY_GITHUB_USERNAME]/apprunner-demo.git`
	
2. Build a  docker image locally and deploy it using an ECR private repo. App Runner currently only supports docker images being hosted in ECR.
3. Open the AWS Console and browse to the [AWS App Runner service](https://console.aws.amazon.com/apprunner/home?region=us-east-1#/services).
	- Select `"Create a service"`
	- Repository Type: `Container Registry`
	- Provider: `Amazon ECR`
	- Container image URI: Click on `Browse` and select your image repository and image tag. 
	- Deployment Settings:
	
	 	    Deployment Trigger: Automatic
		
		ECR Access Role: The IAM Role created grants App Runner read permissions only to Amazon ECR resources.
	
		    Select: Create new service role
		    Service role name example: AppRunnerECRAccessRole
	- Service settings:
	
	 	   Service name: simple-webapp
		   Port: 3000
		   
	- Everything else can be left as default. Select `Next`
	- Select `Create & deploy`
	
		
		
