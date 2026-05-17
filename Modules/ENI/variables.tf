variable "enis" {
    type = map(object({
        subnet_id = string
        private_ip = string
        security_groups = list(string)
        tags = optional(map(string))
    }))
}
