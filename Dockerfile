FROM ubuntu:20.04


# Install python3
RUN apt update 
RUN apt-get -y install python3-dev
RUN apt-get -y install python3-pip


# Install openstack client
RUN pip3 install --upgrade pip setuptools && \
    pip3 install python-openstackclient   && \
    echo "alias openstack='openstack --insecure'" >> /root/.bashrc

# Install auto-complete
RUN apt-get -y install bash-completion && \
    echo 'source /etc/profile.d/bash_completion.sh' >> /root/.bashrc && \
    echo 'source <(openstack complete)' >> /root/.bashrc


# Support echo multiple line in RUN
SHELL ["/bin/bash", "-c"]


# env for openstack client
RUN  echo $'                                                                        \n\
#Clear any old environment that may conflict.                                       \n\
#for key in $( set | awk \'{FS="="}  /^OS_/ {print $1}\' ); do unset $key ; done    \n\
export NOVA_VERSION=1.1                                                             \n\
export COMPUTE_API_VERSION=1.1                                                      \n\
export OS_USERNAME=${OS_USERNAME:=admin}                                            \n\
export OS_PROJECT_NAME=${OS_PROJECT_NAME:=admin}                                    \n\
export OS_USER_DOMAIN_NAME=Default                                                  \n\
export OS_PROJECT_DOMAIN_NAME=Default                                               \n\ 
export OS_NO_CACHE=True                                                             \n\ 
export OS_CLOUDNAME=overcloud                                                       \n\ 
export OS_AUTH_TYPE=password                                                        \n\ 
export OS_PASSWORD=${OS_PASSWORD:=password}                                         \n\
export OS_AUTH_URL=${OS_AUTH_URL:=https://10.10.10.10:5000}                         \n\ 
export OS_IDENTITY_API_VERSION=3                                                    \n\ 
export OS_COMPUTE_API_VERSION=2                                                     \n\ 
export OS_IMAGE_API_VERSION=2                                                       \n\ 
export OS_VOLUME_API_VERSION=3                                                      \n\ 
export OS_REGION_NAME=regionOne                                                     \n\ 
export PS1="[\u \W (U:\e[0;31m\$OS_USERNAME\e[m|P:\e[0;32m\$OS_PROJECT_NAME\e[m) ]$ " ' >> /root/.bashrc


# alias and auto-complete for alias command
RUN echo $'                                 \n\
complete -F _openstack opensk               \n\
alias opensk=\'openstack --insecure\'       \n\ 
' >> /root/.bashrc