# ARGOCD EXAMPLES

INSTALL TOOLS MINIKUBE, KUBECTL, ARGOCDCLI, TERRAFORM

## INIT K8S CLUSTER

```BASH
minikube start --driver=docker --memory=6g --cpus=2
```

## INSTALL ARGOCD IN K8S WITH TERRAFORM

```BASH
cd terraform
terraform init
terraform apply --auto-approve
terraform destroy --auto-approve
```

## EXPOSE ARGOCD UI

```BASH
kubectl port-forward svc/argocd-server -n argocd 8080:80
argocd admin initial-password -n argocd
```

## UPDATE SCRIPT

Run this script and update the version of the image deployed in the k8s cluster and update the git repo with que new version of the image.

```BASH
./update.sh ${TAG_NEW_VERSION_IMAGE}
```

## EXAMPLE 1

```BASH
cd ../argo
kubectl apply -f application.yaml
kubectl delete -f applicarion.yaml
```

## EXAMPLE 2

Deploy 2 apps in cluster with argo cd

```BASH
cd ../2-example
k apply -f application.yaml
k delete -f applicarion.yaml
```

## EXAMPLE 3

Deploy 1 app in private git repo

```BASH
cd ../3-example
k apply -f git-repo-secret.yaml
k apply -f application.yaml
k delete -f applicarion.yaml
k delete -f git-repo-secret.yaml
```

## EXAMPLE 4

Deploy metrics pods with helm

```BASH
cd ../4-example
k apply -f application.yaml
k delete -f applicarion.yaml
```

## EXAMPLE 5

Deploy 1 app in private git repo using kustomize

```BASH
cd ../3-example
k apply -f git-repo-secret.yaml
k apply -f application.yaml
k delete -f applicarion.yaml
k delete -f git-repo-secret.yaml
```

END FILE
