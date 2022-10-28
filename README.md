# vm-deployment-hyperv
Base deployment files for automated deployment of a vm on to a Windows HyperV server

**NOTE** 
The variables given in these above scripts are useable but also examples. Please configure them to the requirements that your virtual machines need. 

Powershell Deploy:
To run this script, please change the variables that reqire specific paths and remove the holding information (the note).

Ansible Deploy
To run this script, please change the variables that reqire specific paths and remove the holding information (the note).

Please change the information required in the inventory file to the information and cresentails required and remove the note.


These scripts are basic methods of automated vm deployment to a Windows server hosting  a HyperV server/service. These scripts can be expanded to deploy multiple servers or replicated to deploy multiple vm's. Further to this, additional yaml and powershell scripts can be added to tasks to build out the vm's deployed (e.g. domain controllers, file servers, clients etc...).
