FROM jenkins/jenkins:2.169

ENV CASC_JENKINS_CONFIG=$JENKINS_HOME/jcasc
RUN mkdir $CASC_JENKINS_CONFIG && \
    /usr/local/bin/install-plugins.sh \
      configuration-as-code:1.8 \
      configuration-as-code-support:1.8 \
      kubernetes:1.14.9 \
      kubernetes-ci:1.3

