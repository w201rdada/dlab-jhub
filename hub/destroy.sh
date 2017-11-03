# delete namespace
kubectl delete namespace portfolio

# destroy cluster
gcloud container clusters delete portfolio --zone=us-central1-b

# check gone
gcloud container clusters list
