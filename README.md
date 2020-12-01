# SoliAlyra

Repo des codes pour alyra  

# Defi Vote:  

voting.sol est mon contrat voting. Il a été amélioré au fur et a mesure du temps selon mes besoins.  
Dans src il y a l'ensemble de mes fichiers react pour la dapp. Deux precisions:  
 - la Dapp contient un routing pour differentes pages, /admin ou /user. Une personne ne peut participer au vote uniquement si elle est admin ou dans la liste de voteur  
 - si vous n'en faites pas partie, vous serez redirigé vers des pages expliquant le probleme  
 (pour l'utiliser la dapp, il faut donc commencer par l'admin, puis ajouter des voteurs)  
   
dans test il y a le test qui fonctionne en Js (truffle test, teste les fonctions principales, vote/proposition/nexstep/checkvoter/count...), et un autre que j'ai travaillé avec guillaume sur python pour brownie  
voila :)  

/////

# pull payment:

fichier dos.sol: code de correction du DoS vu en cours, avec ajout de la securité sur la reentrance dans la fonction withdraw

/////////

# mini audit

fichiers dans le dossier audit  
audit.sol affiche les commentaires  
correct.sol affiche le contrat sécurisé  
