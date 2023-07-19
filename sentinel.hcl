import "module" "infracost" {
  source = "./imports/modules/infracost.sentinel"
}

policy "manage_project_costs" {
  source = "./policies/manage_project_costs/manage_project_costs.sentinel"
  enforcement_level = "hard-mandatory"
}
