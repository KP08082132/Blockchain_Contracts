//SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract lendingP2P {
    address payable sender;
    address payable receiver;
    uint senderbalance;
    uint receiverbalance;
    
  
    
    mapping(address => uint) balances;
    mapping(address => uint) depositTimestamps;
    
    function sendLoan(address payable receiver) public payable {
        
        if(msg.value < senderbalance)
        {
            receiver.transfer(msg.value);
            depositTimestamps[msg.sender] = block.timestamp;
        }
        
    }
    
     
     
    function returnLoan(address payable sender) public payable {
    uint timeElapsed = block.timestamp - depositTimestamps[receiver]; //seconds
    
     sender.transfer(msg.value + uint((msg.value * 7 * timeElapsed) / (100 * 365 * 24 * 60 * 60)) + 1);
    }
    function deposit() public payable {}
