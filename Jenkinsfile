node ('Noeud_Jenkins') {

     def registry = "mounabal/docker_pipeline"
     def registryCredential = "dockerhub"
     def dockerImage = ""

  
    stage ('CloningGit'){
          
          git url: 'https://gitlab.com/RaphaeldeGail/devopsapp.git',
               branch: 'master'
     }
    
    stage ('Build_with_Maven') {
          
         sh 'maven clean package'
         
      
    stage ('Building') {
         
         dockerImage = docker.build registry + ":1.0"
  }
  
   

         
         
         
         
         
         
         
         
         
    stage ('DeployImage') {
     
              docker.withRegistry('',registryCredential){
                  dockerImage.push()           
              }
        
    stage ('PullImage') {
              docker.withRegistry(''){
                  dockerImage.pull()
}
