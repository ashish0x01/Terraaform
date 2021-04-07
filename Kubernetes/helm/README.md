##  Terraform warapper for helm deployment

Terraform  version : v0.14.3
hashicorp/helm v2.0.3
hashicorp/kubernetes v2.0.3
hashicorp/aws v3.35.0

please modify below detailss on providers.tf file
1. name_of_kube_comtext 
2. bucket_name
3. bucket_key
4. bucket_region
5. access_key
6. secret_key


## run book:

1. terraform init -> for init backend
2. add helm repo on your cluster by ussing below cmd:
    helm repo add grafana https://grafana.github.io/helm-charts
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
3. terraform plan -> for check terraform plan
4. terraform apply  -> it will add **loki-stack** and **prometheus-stack** by  usisng helm chart 


