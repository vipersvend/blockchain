pragma solidity ^0.8.0;

contract BankFunctions{
    
    mapping(uint=>address) public id_to_addr;
    mapping(uint => string) public id_to_name;
    uint account_counter = 0;
    mapping(address => uint) public addr_to_balance;

    uint bankbalance = 0;
    address payable public owner;
    
    constructor(){
        owner = payable(msg.sender);
    }
    
    function transfer(address receiver) public payable{
        payable(receiver).transfer((msg.value));
    }
    
    function deposit() public payable returns(uint){
        //address payable receiver = payable(address(this));
        //receiver.transfer(msg.value);

        addr_to_balance[msg.sender]+=msg.value;
        
        return addr_to_balance[msg.sender];
        //return payable(address(this));
    }
    
    function sender() public view returns(address){
        return address(msg.sender);
    }
    
    function open_account(string memory name) public  returns(uint){
        account_counter++;
        id_to_name[account_counter] = name;
        id_to_addr[account_counter] =msg.sender ;
        
        return account_counter;
    }
    
    function get_bank_balance() public view returns(uint){
        return address(this).balance;
    }
    
    function close_bank() public payable returns(uint){
        require(msg.sender == owner, "You Must be An Owner!");
        uint transferred = 0;
        for(uint i = 1 ; i<=account_counter; i++) {
            address payable address_recv = payable(id_to_addr[i]);
            address_recv.transfer(addr_to_balance[address_recv]);
            transferred +=1;
        }
        return transferred;
    }
}