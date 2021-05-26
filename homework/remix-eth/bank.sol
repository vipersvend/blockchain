pragma solidity 0.8.1;

contract Bank{
    bool public isActive;
    string public bankName;
    //uint256 public bankBalance;
    uint public totalTransactions = 0;
    address public owner;
    address private bankAddress = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
    uint public twopercent = 0;
    function getBalance() public returns(uint){
        return payable(bankAddress).balance;
    }
    function bankShare(uint twopercent) public {
        payable(bankAddress).transfer(twopercent);
    }
    function transfer(address receiver) public payable{
        twopercent = ((msg.value)/100)*2;
        bankShare(twopercent);
        
        payable(receiver).transfer((msg.value-twopercent));
    }
    
    function incrTransaction() public returns(uint){
        totalTransactions+=1;
        return totalTransactions;
        
    }
}