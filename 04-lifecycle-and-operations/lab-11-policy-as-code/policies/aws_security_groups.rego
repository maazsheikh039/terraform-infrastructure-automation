package terraform.aws.security_groups

import rego.v1

# Deny security groups that allow unrestricted inbound access (all ports)
deny contains msg if {
    some resource in input.planned_values.root_module.resources
    resource.type == "aws_security_group"
    
    some rule in resource.values.ingress
    rule.cidr_blocks[_] == "0.0.0.0/0"
    rule.from_port == 0
    rule.to_port == 65535
    
    msg := sprintf("Security group '%s' allows unrestricted inbound access (0.0.0.0/0 on all ports)", [resource.name])
}

# Deny SSH access (port 22) from anywhere
deny contains msg if {
    some resource in input.planned_values.root_module.resources
    resource.type == "aws_security_group"
    
    some rule in resource.values.ingress
    rule.cidr_blocks[_] == "0.0.0.0/0"
    rule.from_port <= 22
    rule.to_port >= 22
    
    msg := sprintf("Security group '%s' allows SSH access (port 22) from anywhere (0.0.0.0/0)", [resource.name])
}
