output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

# output "kubeconfig_filename" {
#   value = module.eks.kubeconfig_filename
# }
