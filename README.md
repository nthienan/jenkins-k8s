```bash
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)
kubectl create configmap jenkins-config --from-file=./config/ -o yaml --dry-run | kubectl replace -f -
kubectl apply -f .
```
