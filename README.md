# hello jenkins with docker / singularity

Goal: configure Jenkins to build a container

This demo follows [this tutorial](https://tutorials.releaseworksacademy.com/learn/building-your-first-docker-image-with-jenkins-2-guide-for-developers).

To fix the "Permission denied while trying to connect to the Docker daemon 
socket" error when Jenkins is building the image, add Jenkins to the Docker
user group, then restart the Jenkins service:

```
sudo usermod -a -G docker jenkins
```