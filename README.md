# hello-world

This is a project to work on Terraform, CI/CD, and automation. The goal is to create a DigitalOcean droplet that runs a GO hello-world program.

[Link](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-go-web-application-with-docker-and-nginx-on-ubuntu-22-04) to example project at DigitalOcean.

## Terraform
For the Terraform side of things, I'm using Terraform Cloud to store my tfstate file and run plan/apply/destroy.

#### Terraform Cloud
1. Setup an account with Terraform Cloud.
1. Create an organization and then create a workspace. In my case, it's "jknsware-hello-world" and "hello-world-do".
1. I have two sensitive variables for my Terraform that need to be saved. Within the workspace, click on Variables and add them. 
   1. `do_token` - The DigitalOcean PAT needed to connect to the API.
   1. `pvt_key` - The SSH private key needed to login and run any remote-exec commands.

#### Terraform Code
The code itself to create the Droplet is broken down into several files. I'm not going to break them down as they should be pretty self-explanatory if you have experience with Terraform.

#### Terraform Init, Plan, Apply, Destroy
All Terraform actions are initialized locally but run in Terraform Cloud. Well, `init` isn't but you get the idea.

You can see all the Runs and their resulting State changes in the UI. 