pragma solidity ^0.8.0;

contract PermissionTable{
    mapping(address => bool) public registered;
}


contract Controller is PermissionTable{
    event NewAdmin(address from, uint256 timestamp);
    
    modifier onlyAdmin() {
        require(registered[msg.sender], "Storage: only admin can invoke");
        _;
    }
    
    function register() public  returns(string memory){
        if(registered[msg.sender]){
            return "You are Already Registered as Admin!";
        }
        else{
            registered[msg.sender]=true;
            emit NewAdmin(msg.sender, block.timestamp);
            return "Registration Success!";
        }
    }
    
    function deploy_storage_contract(string memory name, uint age) onlyAdmin public returns(address){
        Storage entry = new Storage(name, age);

        return address(entry);
    }
    
    function update_storage_contract(address  _addr, string memory newname, uint newage) public returns (address) {
            return Storage(_addr).update_details(newname, newage);
    }
    
}

contract Storage is PermissionTable{
    event NewController(address from, uint256 timestamp);
    //modifier onlyAdmin() {
        //require(Controller(msg.sender).registered[msg.sender], "Storage: only admin can invoke");
    //    _;
    //}
    
    string public name;
    uint age;
    
    constructor(string memory _name, uint _age){
        name = _name;
        age = _age;
        NewController(msg.sender,block.timestamp);
    }
    
    //only people between 10 and 58 can be entered    
    function is_valid_age() public returns (bool){
        if(age>10 && age <58){
            return true;
        }
        else{
            return false;
        }
    }
    
    function update_details(string memory _name, uint _age)  public returns (address){
        name = _name;
        age = _age;
        
        return address(this);
    }
    
    function myaddr() public returns (address){
        return msg.sender;
    }
    function get_name()  public returns(string memory){
        return name;
    }
    function get_age()  public returns (uint) {
        return age;
    }
}


