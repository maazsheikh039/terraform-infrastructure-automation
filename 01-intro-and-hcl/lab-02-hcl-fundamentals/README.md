# Advanced HCL Fundamentals & Enterprise Data Transformation Engine

## Objectives
- Design robust, production-grade HCL configurations incorporating strict input validations, conditional logic, and derived locals.
- Transform complex data structures using cartesian flattening (`flatten`, nested `for` loops) to eliminate hardcoding.
- Implement advanced meta-arguments (`for_each` and `count`) alongside dynamic content renderers (`templatefile` and `jsonencode`) to generate multi-tier file artifacts.

## Tools Used
- **Terraform (v1.5+)**: Declarative HCL parsing and execution engine.
- **Local Provider (`hashicorp/local ~> 2.4`)**: Automated file system artifact generation and state management.

## Key Skills Demonstrated
- **Advanced HCL Data Typing**: Constructing complex object maps, lists, and strict validation conditions.
- **Dynamic Iteration & Scalability**: Automatically propagating microservice and regional additions across entire artifact trees without manual rewrites.
- **Template Rendering & Encoding**: Programmatically assembling JSON manifests and dynamic shell scripts from runtime variables.

## Troubleshooting & Modernization Log
- **Map Key Uniqueness**: Ensured unique compound composite keys (`reg-service`) when flattening service-region maps to prevent `for_each` collision errors.
- **Path Resolution**: Utilized `${path.module}` relative path interpolation to guarantee cross-environment execution stability.
