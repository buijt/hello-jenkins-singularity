# hello jenkins with docker / singularity

Goal: configure Jenkins to build a container

This demo follows 
[this Docker tutorial](https://tutorials.releaseworksacademy.com/learn/building-your-first-docker-image-with-jenkins-2-guide-for-developers)
, and these Singularity tutorials:

- [Princeton Research Computing](https://researchcomputing.princeton.edu/support/knowledge-base/singularity#build)
- [Research Computing at University of Colorado Boulder](https://curc.readthedocs.io/en/latest/software/Containerizationon.html)

Also see the white paper [Continuous Integration and Delivery for HPC](https://doi.org/10.1145/3219104.3219147).

### Issues with Docker and Jenkins

To fix the "Permission denied while trying to connect to the Docker daemon 
socket" error when Jenkins is building the image, add Jenkins to the Docker
user group, then restart the Jenkins service:

```
sudo usermod -a -G docker jenkins
```

I thought 
[this StackOverflow post](https://stackoverflow.com/questions/36781372/docker-using-gosu-vs-user)
would be helpful, but it was not the solution.