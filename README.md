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