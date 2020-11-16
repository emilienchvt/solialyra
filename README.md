# SoliAlyra

Repo des codes pour alyra  

# TP1 Vote:  

le code a été testé, deployé sur remix, fonctionne  
voting.sol suit le workflow et le cahier des charges demandé  
des adaptations (non fonctionnelles) ont étés faites  
- proposal et workflowstatus ont chacun leur getter par defaut, mais deux getters personalisés (showProposals() et getWorkflowStatus()) ont été fait pour plus de clarté, en toutes lettres, pour plus de practicité pour l'utilisateur  
- une fonction nextStep()  permet de directement passer a l'étape suivante pour l'admin, plus pratique qu'avoir a chercher la bonne fonction (les fonctions existent quand meme, elles sont internal pour plus de propreté). nextStep() renvoit getWorkflowStatus() pour indiquer quelle est la nouvelle étape dans laquelle on se trouve  

/////

# pull payment:

fichier dos.sol: code de correction du DoS vu en cours, avec ajout de la securité sur la reentrance dans la fonction withdraw

/////////

# mini audit
