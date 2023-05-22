# hello jenkins with docker / apptainer

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

### Apptainer vs. SingularityCE

The original Singularity project was adopted and rebranded by the Linux Foundatation as
[Apptainer](https://github.com/apptainer/apptainer)
, at which point the developers forked Singularity into 
[SingularityCE](https://github.com/sylabs/singularity)
at their company
[Sylabs](https://sylabs.io/singularity/)
(in addition to providing cloud-based add-on services).

I am not sure if SingularityCE- and Apptainer- definitions are cross-compatible.

The HPC I can access has Apptainer v1.1.8 (latest as of 5/15/2023) installed,
so I will use the 
[Apptainer specification](https://apptainer.org/docs/user/latest/definition_files.html)
.

### Getting Jenkins to read private repos

Setting up a
[personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
is needed to access private repositories. Jenkins will save this token and use it to
authenticate itself to pull from those private repos. Since Jenkins is a CI tool for
building software, I have granted Jenkins a read-only access token.
