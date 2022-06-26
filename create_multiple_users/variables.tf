variable "def-users-group" {
  description = "Developers in the project"
  type        = list(string)
  default     = ["mary", "jack", "jill", "mack", "buzz", "mater"]
}