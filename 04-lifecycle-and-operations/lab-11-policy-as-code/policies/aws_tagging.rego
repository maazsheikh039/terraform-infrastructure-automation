package terraform.aws.tagging

import rego.v1

required_tags := ["Environment", "Owner", "Project", "CostCenter"]
taggable_resources := ["aws_instance", "aws_s3_bucket", "aws_rds_instance", "aws_vpc", "aws_security_group"]

deny contains msg if {
    some resource in input.planned_values.root_module.resources
    resource.type in taggable_resources
    
    some required_tag in required_tags
    not resource.values.tags[required_tag]
    
    msg := sprintf("Resource '%s' of type '%s' is missing required tag '%s'", [resource.name, resource.type, required_tag])
}
