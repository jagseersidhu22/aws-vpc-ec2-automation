variable "igws" {
    type = map(object({
        vpc_id = string
    }))
}