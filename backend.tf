
terraform {
  backend "s3" {
    bucket = "murtuterraformstates"
    key    = "tfstates/awstest.tfstate"
    region = "eu-west-2"
  

  }
 
}