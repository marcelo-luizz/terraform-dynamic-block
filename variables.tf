variable "default_ingress_rule" {
  type = map(object({description = string, cidr_blocks = list(string)}))
  default = {
    22 = {description = "Inboud para SSH", cidr_blocks = [ "0.0.0.0/0" ]}
    80 = {description = "Inbound para HTTP", cidr_blocks = [ "127.0.0.1/32" ]}
    443 = {description = "Inbound para HTTPS", cidr_blocks = [ "127.0.0.1/32" ]} 
    }
  }