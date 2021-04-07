resource "kubernetes_namespace" "monitoring" {
  metadata {
    annotations = {
      name = "monitoring"
    }
    name = "monitoring"
  }
}

#helm repo add grafana https://grafana.github.io/helm-charts
resource "helm_release" "loki-stack" {
  name      = "loki-stack"
  chart     = "grafana/loki-stack"
  namespace = "monitoring"
  values = [
    "${file("loki_values.yaml")}",
  ]
}

#helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
resource "helm_release" "prometheus-community" {
  name      = "prometheus-stack"
  chart     = "prometheus-community/kube-prometheus-stack"
  namespace = "monitoring"

  values = [
    "${file("prometheus_values.yaml")}",
  ]
}

#helm repo add bitnami https://charts.bitnami.com/bitnami
# resource "helm_release" "redis-stack" {
#   name      = "website-redis"
#   chart     = "bitnami/redis"
#   namespace = "redis"
#   values = [
#     "${file("redis_values.yaml")}",
#   ]
# }

# resource "helm_release" "mongodb-stack" {
#   name      = "core-mongodb"
#   chart     = "bitnami/mongodb"
#   namespace = "mongodb"
#   values = [
#     "${file("mongo_values.yaml")}",
#   ]
# }