# Authentication
export TF_VAR_tenancy_ocid=<tenancy_ocid>
export TF_VAR_user_ocid=<user_ocid>
export TF_VAR_fingerprint=<fingerprint>
export TF_VAR_private_key_path="/root/.oci/oci_api_key.pem"
export TF_VAR_ssh_public_key=$(cat /root/ssh/id_rsa.pub)
export TF_VAR_oci_profile="DEFAULT"
export TF_VAR_region=<region>

# Resources details
export TF_VAR_compartment_name="always-free"
export TF_VAR_vcn_name="always-free-vcn"
export TF_VAR_vcn_dns_label="freedns"
export TF_VAR_load_balancer_name_space="always-free-lb"

# Instance details
export TF_VAR_shape="VM.Standard.A1.Flex"
export TF_VAR_ocpus_per_node="1"
export TF_VAR_memory_in_gbs_per_node="6"
export TF_VAR_image_id=<image_ocid>
# US-ASHBURN-1: ocid1.image.oc1.iad.aaaaaaaao2zpwcb2osmbtliiuzlphc3y2fqaqmcpp5ttlcf573sidkabml7a
# SA-SAOPAULO-1: ocid1.image.oc1.sa-saopaulo-1.aaaaaaaapgzqgavyhfqp2424z6cuuvztfxgqncii3j6hzrpe2vlpb6vbalsq

# Cluster details
export TF_VAR_cluster_name="always-free"
export TF_VAR_k8s_version="v1.28.2"
export TF_VAR_node_size="4"