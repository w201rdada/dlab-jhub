# update repos
cd python-fundamentals && git pull && cd ..
cd R-Fundamentals && git pull && cd ..
cd programming-fundamentals && git pull && cd ..

# zip together
zip -r dlab-courses.zip python-fundamentals R-Fundamentals programming-fundamentals

# build and push
docker build --rm -t henchc/dlab-workshops .
docker push henchc/dlab-workshops