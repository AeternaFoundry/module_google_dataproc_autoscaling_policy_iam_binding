resource "google_dataproc_autoscaling_policy_iam_binding" "dataproc_autoscaling_policy_iam_bindings" {
  for_each = var.dataproc_autoscaling_policy_iam_bindings

  members   = each.value.members
  policy_id = each.value.policy_id
  role      = each.value.role
  location  = each.value.location
  project   = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

