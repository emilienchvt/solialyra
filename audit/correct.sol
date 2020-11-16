// SPDX-License-Identifier: MIT
pragma solidity 0.6.11;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Crowdsale {
  using SafeMath for uint256;

  address public owner; 
  address payable public escrow; 
  uint256 public savedBalance; 
  mapping (address => uint256) public balances; 

  // event 
  event PayEther(address _receiver, uint256 _amount, uint256 _date);


  constructor (address payable _escrow) public{
      owner = msg.sender;
      escrow = _escrow;
  }
  
   // function to receive ETH
  receive() payable external {
      balances[msg.sender] = balances[msg.sender].add(msg.value);
      savedBalance = savedBalance.add(msg.value);
      escrow.transfer(msg.value);
      emit PayEther(escrow, msg.value, now);
  }

   // refund investisor
  function withdrawPayments() public{
      address payable payee = msg.sender;
      uint256 payment = balances[payee];
      require(payment != 0);
      require(address(this).balance >= payment);
    
      savedBalance = savedBalance.sub(payment);
      balances[payee] = 0;
    
      payee.transfer(payment);
      emit PayEther(payee, payment, block.timestamp);
  }

    //ceci est la version sans changement de logique du premier contrat
    // on continue de vider ce smart contract quand on refund, sans redemander l'argent à l'escrow

}
