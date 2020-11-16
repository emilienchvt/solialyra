// indiquer la licence
pragma solidity ^0.5.12; // utiliser un bon pragma: pragma solidity 0.6.11;

// on utilise safemath sans l'importer, a ne pas oublier

contract Crowdsale {
   using SafeMath for uint256;

   //aucun event , dommage pour lire les actions du contrat

   // tout est public, ce n'est pas optimisé/sécurisé
   address public owner; // the owner of the contract
   address public escrow; // wallet to collect raised ETH
   uint256 public savedBalance = 0; // Total amount raised in ETH
   mapping (address => uint256) public balances; // Balances in incoming Ether
 
   // Initialization

   //ceci devrait mieux etre un constructor
   function Crowdsale(address _escrow) public{ // _escrow doit etre payable
       owner = tx.origin; // on utilise plutot msg.sender pour l'owner du contrat
       // add address of the specific contract
       escrow = _escrow;
   }
  
   // function to receive ETH
   function() public { // ça doit etre une fonction payable external plutot que ça
       balances[msg.sender] = balances[msg.sender].add(msg.value);
       savedBalance = savedBalance.add(msg.value);
       escrow.send(msg.value); //preferer transfer pour cath l'erreur plutot que revert
   }
  
   // refund investisor
   function withdrawPayments() public{ // doit etre payable
       address payee = msg.sender;
       uint256 payment = balances[payee];
       // verifier que payment non nul 
       // verifier que le smart contract a assez pour payer? normalement c bon
 
        // penser a la réentrance, genre avec un bool d'état ou en mettant sa balance a 0
       payee.send(payment); // transfer, comme ligne 27
 
       savedBalance = savedBalance.sub(payment);
       balances[payee] = 0;

       //tout ceci est bizarre logiquement: si on veut retirer de l'argent, 
       //il n'y en a pas forcement sur le contrat, puisqu'il est encvoyé directement a l'escrow
       // faire un pullpayment en laissant l'argent sur le crowdsale marcherait mieux
       // ou encore faire un retrait de fond vers l'escrow, pour redonner à la personne à refund

   }
}
