variable "region" {
  description = "The name of the selected region."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCh4Jps9HZSCHQ01HxS3ppvgQn6lBUFxWyxWwJA06mhqU9isSqiS0J4huc9V/9aiB9hjoNTkW0TgaxaTEhAOqYe3Po3S+xGpTbP3pVu2x7hyKJ1E6GOWyVdP21cfK5zLPZJZKZs8GWC6LuvoeLIx8uHSvcBqwdEWj6ok1ttLsORvPoe8kMz/jKMHWeQGJXwXyDfzIUZa+vtQOeo9cfeB2ScWZUt/+u7/SmcYL12D4QkPM3pMLvCjND/RiZ3b5Npls/vS0p39Ud/c1q5+Zkx2JqF9lKkdI5sTBlQRQvhfIVLLMAgEqqFhLRfRx2lIsocBmJKMgmVMepGbssyq7cMh5rT+PA8hTQfs/VeNUN97OB1u+nTMWmd2nQzOcEzcWd+myLa/IRPUhdKnnZie7GFgdJNeSIx5+ANC9ikF3mApeFYPeIqi30D1Jof2Y/cLQsmhPVuWC9qWUfVmlH2/1RfKIBXLGgn5cNW+6lSPUeKLYvlOPb54ODbyE/Ui3DflMd792U= fernando@fernando-IdeaPad-3-15IML05"
}