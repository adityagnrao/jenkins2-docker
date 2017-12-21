  node {
    //TODO parameterize cluster name 
    stage('install-docker stage 1 - installing src docker') {
          ws('/var/jenkins_home/ATS-pipeline/kube-scripts') {
              script {
                  try {
                      def clientNodes = sh(returnStdout: true, script: 'cat ATS-cluster-1-clients').trim().replaceAll(","," ")
                    //   sh "echo ${clientNodes}"
                      sh "./bin/install-kube preCheck `echo ${clientNodes}`"
                  } catch (err) {
                      //TODO only catch if docker is already installed exit
                  }
              }
          }   
    }
}
