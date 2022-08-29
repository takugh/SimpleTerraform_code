# securing statefile: store in S3 bucket and lock with dynamodb table

terraform {
  backend "s3" {
    bucket = "Taku-terraform-state-files"
    key = "Taku.tfstate"
    region = "us-eest-1"
    profile = "default"
    dynamodb_table = "Takufstatetable"
  }
}