# delete namespace
kubectl delete namespace dlabhub

# destroy cluster
gcloud container clusters delete dlabhub --zone=us-central1-b

# check gone
gcloud container clusters list