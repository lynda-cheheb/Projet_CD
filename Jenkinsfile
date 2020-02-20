node ('Noeud_Jenkins') {

     def registry = " aaugrain/Projet_CD "
     def registryCredential = "dockerhub"
     def dockerImage = ""

  
    stage ('CloningGit'){
          
          git url: 'https://gitlab.com/RaphaeldeGail/devopsapp.git',
               branch: 'master',
      }
      
    stage ('Building') {
         
              dockerImage = docker.build registry + ":1.0"
  
      }
  
    stage ('DeployImage') {
     
              docker.withRegistry('',registryCredential){
                  dockerImage.push()
              
              }
         
    }
    stage ('PullImage') {
     
          
              docker.withRegistry(''){
                  dockerImage.pull()
      
                }
      }

}
