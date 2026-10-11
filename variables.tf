variable "dataproc_autoscaling_policy_iam_bindings" {
  description = <<EOT
Map of dataproc_autoscaling_policy_iam_bindings, attributes below
Required:
    - members
    - policy_id
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members   = set(string)
    policy_id = string
    role      = string
    location  = optional(string)
    project   = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

