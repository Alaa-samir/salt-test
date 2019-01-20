#installing mysql:
#  pkg.installed:
#    - name: docker.io
Prerequisites commands:
  cmd.run:
    - name: |
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


installing docker:
  pkg.installed:
    - name: docker-ce={{ pillar['docker-version'] }}