terragrunt = {
  terraform {
    source = "git@github.com:sugarush/terraform-modules.git//base"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
