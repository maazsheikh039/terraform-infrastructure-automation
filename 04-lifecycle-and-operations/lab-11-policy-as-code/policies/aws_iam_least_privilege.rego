package terraform.aws.iam

import rego.v1

# Deny IAM policies that grant wildcard permissions on all resources
deny contains msg if {
    some resource in input.planned_values.root_module.resources
    resource.type == "aws_iam_policy"
    
    policy_doc := json.unmarshal(resource.values.policy)
    some statement in policy_doc.Statement
    
    statement.Action == "*"
    statement.Resource == "*"
    
    msg := sprintf("IAM policy '%s' grants wildcard permissions (*:*) which violates least privilege principle", [resource.name])
}

# Deny IAM roles that can be assumed by any AWS account
deny contains msg if {
    some resource in input.planned_values.root_module.resources
    resource.type == "aws_iam_role"
    
    assume_role_doc := json.unmarshal(resource.values.assume_role_policy)
    some statement in assume_role_doc.Statement
    
    statement.Principal.AWS == "*"
    
    msg := sprintf("IAM role '%s' can be assumed by any AWS account (*), which is a security risk", [resource.name])
}
