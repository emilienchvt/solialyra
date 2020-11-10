// Crowdsale.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.6.11;

contract KingOfEther {

    mapping(address=>uint) balances;
    address public king;
    uint public balance;
    bool reEntrancyShield = false;


    function claimThrone() external payable {
        require( msg.value > balance, "Need to pay more to become the king");
        balance = msg.value;
        king = msg.sender;
        balances[msg.sender]=msg.value;
    }

    function withdraw() public payable {
        require(balances[msg.sender]!=0);
        require (!reEntrancyShield, "tu ne peux pas");
        reEntrancyShield=true;
        address to=msg.sender;
        uint amount = balances[msg.sender];
        (bool sent, ) = to.call{value: amount}("");
        require(sent, "Failed to send Ether");
        balances[msg.sender]=0;
        reEntrancyShield=false;
    }
}

contract Attack {
    KingOfEther kingOfEther;
    constructor(KingOfEther _kingOfEther) public {
        kingOfEther = KingOfEther(_kingOfEther);
    }
    
    function attack() public payable {
    kingOfEther.claimThrone{value: msg.value}();
    }
}