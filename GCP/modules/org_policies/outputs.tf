output "applied_constraints" {
  description = "Constraints applied by this module."
  value       = keys(var.policies)
}