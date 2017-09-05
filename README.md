# dlab-jhub

Current configuration and bootstrap script for UC Berkeley's D-Lab's JupyterHub for instruction.

In Google Cloud Shell, after enabling the Compute Engine, Container Engine, and Container Registry APIs, clone in the bootstrap repo:

```bash
git clone https://github.com/henchc/dlab-jhub.git
```

Then run the bootstrap script.

```bash
cd dlab-jhub/hub && bash bootstrap.sh
```

The default will use `aculich/rockyter` for a docker image and D-Lab's [Python Fundamentals](https://github.com/dlab-berkeley/programming-fundamentals) GitHub repo. But you can also give the shell script arguments, the first argument is the dockerhub image and the second argument being the GitHub repo.

```bash
bash bootstrap.sh <DOCKER IMAGE> <GITHUB REPO>
```

With large docker images it will timeout and retry a few times. At the very end it will yield the public IP address for the hub.

---

Running `bootstrap.sh` will give you an IP address at the end for your hub. If you somehow lose it, you can print it again by running:

```bash
kubectl --namespace=dlabhub get svc
```

---

To zip up and download any content, all users can open a new terminal and tar the folder:

```bash
tar -czvf my_files.tar <FOLDER TO TAR>
```

Then back in the file browser you can check the box next to the file and click download.

---

To resize the hub at any point:

```bash
gcloud container clusters resize \
             dlabhub \
             --size <NEW-SIZE> \
             --zone us-central1-b
```

This should not disturb users.

---

To delete and restart a pod, first check the pods that are running:

```bash
kubectl get pods --namespace dlabhub
```
Then delete the problematic pod:

```bash
kubectl delete pod <PODNAME> --namespace dlabhub
```