output "vcn_state" {
  description = "The state of your vcn"
  value       = oci_core_vcn.internal.state
}

output "vcn_cidr" {
  description = "CIDR block for the core vcn"
  value       = oci_core_vcn.internal.cidr_block
}
