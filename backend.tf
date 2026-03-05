terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket" (edit as per requirement)
    key            = "3tier/terraform.tfstate"
    region         = "ap-south-1" (edit as per requirement)
    dynamodb_table = "terraform-lock-table" (edit as per requirement)
    encrypt        = true
  }
}
