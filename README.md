# learn

## Goal 1: 
Create a hello world echo gRPC Go Lang application running on a docker container in ECS Cluster. Deployed using a Jenkins job running locally on desktop.... so that I can learn more about Go Lang, gRPC, Docker Containers, ECS/AWS, Jenkins and GitHub.

### Go Lang Application: 
- Supports gRPC
- Echos "Hi, I am John" with "Hello John, I am Go!"
- Supports Health Check

### Docker Container(s):
- Base/Go Lang specific public container
- Container Image stored in AWS
- 

### ECS Cluster
- Support mutliple Docker containers
   - Use host port numbers returned and gave those to ELB
- Support health check and replace non-healthy containers
- 

### Jenkins Job
- On commit to GitHub
    - Build the container image
    - Push that to AWS container service
    - Kill one already running container
        - Should be replaced by new version of the container
    - Slowly kill rest of the containers
    - Run a Python Script to call the gRPC method

### Test Edit 
