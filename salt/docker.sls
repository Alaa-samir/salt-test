#installing mysql:
#  pkg.installed:
#    - name: docker.io
{% if grains['os_family'] == 'Debian' %}
Prerequisites commands for debian:
  cmd.run:
    - name: |
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

{% elif grains['os_family'] == 'RedHat' %}

Prerequisites commands for redhat:
  cmd.run:
    - name: |
        sudo yum install -y yum-utils
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        sudo yum makecache fast
{% endif %}

installing docker on debian:
  pkg.installed:
    - name: docker-ce={{ pillar['docker-version'] }}

