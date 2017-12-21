pipeline {

  // agent defines where the pipeline will run.
  agent any
  environment {
    SECURE = &quot;TRUE&quot;
  }
  stages {
    //TODO parameterize cluster name
    stage(&apos;install-docker stage 1 - installing src docker&apos;) {
      steps {
          ws(&apos;/var/jenkins_home/stress-pipeline/kube-scripts&apos;) {
              script {
                  try {
                        sh &apos;./bin/install-kube preCheck `cat cluster-1-clients`&apos;
                  } catch (err) {

                  }
              }
          }
      }
    }
    stage(&apos;install-docker stage 2 - installing replica docker&apos;) {
      steps {
        ws(&apos;/var/jenkins_home/stress-pipeline/kube-scripts&apos;) {
            script {
                  try {
                        sh &apos;./bin/install-kube preCheck `cat cluster-2-clients`&apos;
                  } catch (err) {

                  }
              }
          }
      }
    }
  }
}
