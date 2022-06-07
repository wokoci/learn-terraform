terraform {
  required_version = ">= 0.15"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "literature" {
  content  = "This means war, and it will all be my doing and I am great any content in the content variable is written to the file anme"
  filename = "art_of_war.txt"


}