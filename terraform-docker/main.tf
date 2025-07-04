module "image" {
  source   = "./image"
  for_each = local.deployment
  image_in = each.value.image
}

module "container" {
  source            = "./container"
  count_in          = each.value.container_count
  for_each          = local.deployment
  name_in           = each.key
  image_in          = module.image[each.key].image_out
  int_port_in       = each.value.internal
  ext_port_in       = each.value.external
  container_path_in = each.value.container_path
}
