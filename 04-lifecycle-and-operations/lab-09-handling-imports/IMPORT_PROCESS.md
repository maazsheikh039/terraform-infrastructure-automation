# Terraform Import Process Documentation

## Resources Imported
1. aws_s3_bucket.imported_bucket (`my-existing-bucket`)
2. aws_s3_bucket_versioning.imported_bucket_versioning
3. aws_s3_bucket_server_side_encryption_configuration.imported_bucket_encryption
4. aws_s3_bucket_public_access_block.imported_bucket_pab
5. aws_s3_bucket.second_imported_bucket (`another-existing-bucket`)
6. aws_s3_bucket_policy.second_bucket_policy

## Key Learnings
- Always write matching HCL resource blocks before executing `terraform import`.
- Reconcile configuration drift immediately using `terraform plan`.
- Use `terraform state rm` to safely unbind resources without destroying them in the cloud.
