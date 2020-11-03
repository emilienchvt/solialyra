# SoliAlyra

Repo des codes pour alyra  

# TP1 Vote:  

le code a été testé, deployé sur remix, fonctionne  
voting.sol suit le workflow et le cahier des charges demandé  
des adaptations (non fonctionnelles) ont étés faites  
- proposal et workflowstatus ont chacun leur getter par defaut, mais deux getters personalisés (showProposals() et getWorkflowStatus()) ont été fait pour plus de clarté, en toutes lettres, pour plus de practicité pour l'utilisateur  
- une fonction nextStep()  permet de directement passer a l'étape suivante pour l'admin, plus pratique qu'avoir a chercher la bonne fonction (les fonctions existent quand meme, elles sont internal pour plus de propreté). nextStep() renvoit getWorkflowStatus() pour indiquer quelle est la nouvelle étape dans laquelle on se trouve  

Il serait interessant de voir plus loin, avec la possibilité de reset les votes pour relancer une serie de proposition (et adapter la  struct proposal pour y integrer le numereo de session de proposition), empecher un utilisateur de voter deux fois, savoir qui a proposé quoi (et par exemple l'empecher de voter pour lui meme), verifier que l'on determine gagnant une proposition avec une majorité de votant et une minorité d'abstention, laisser la possibilité à l'admin de revenir sur les étapes, pour par exemple rajouter un oubli... 

/////


