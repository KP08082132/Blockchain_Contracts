//SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract lendingP2P {
    address payable sender;
    address payable receiver;
    uint totalContractBalance = 0;
    uint totalContractBalanceReceiver = 0;
    
    function getContractBalance(address person) public view returns(uint){
        totalContractBalance = person.balance; 
        return totalContractBalance;

    }
    
    
    mapping(address => uint) balances;
    mapping(address => uint) depositTimestamps;
    
    function sendLoan( address payable receiver) public payable {
        
        if(msg.value < getContractBalance(sender))
        {
            receiver.transfer(msg.value);
            depositTimestamps[msg.sender] = block.timestamp;
        }
        
    }
    
     
    /*function withdraw(uint withdrawAmount) public payable {
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = withdrawAmount*1000000000000000000;
        withdrawTo.transfer(amountToTransfer);
        totalContractBalance = totalContractBalance - amountToTransfer;
        balances[msg.sender] -= amountToTransfer;
    }*/
    
    function returnLoan(address payable sender) public payable {
    uint timeElapsed = block.timestamp - depositTimestamps[receiver]; //seconds
    
     sender.transfer(msg.value + uint((msg.value * 7 * timeElapsed) / (100 * 365 * 24 * 60 * 60)) + 1);
    }
    function deposit() public payable {}

    

    
}
