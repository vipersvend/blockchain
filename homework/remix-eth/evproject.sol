pragma solidity ^0.8.0;

contract EV {
    
    struct EVowner{
        address id;
        string name;
    }
    
    struct EVshop{
        string id;
        string name;
        uint shopcost;
        uint cost_per_unit;
    }
    struct Investor{
        address id;
        string name;
    }
    
    mapping(string => EVowner) public _owner_to_shop;
    mapping(string=>Investor) public _investor_to_shop;
    mapping(string => EVshop) public evid_to_evshop;
    
    
    function create_owner( string memory ownername, string memory shopid) public {
        _owner_to_shop[shopid] =  EVowner(msg.sender, ownername);
    }
    function create_investor( string memory name, string memory shopid) public {
        _investor_to_shop[shopid] =   Investor(msg.sender, name);
    }
    
    //function create_EVshop (string memory id, string memory name, uint shopcost, uint cost_per_unit){
                
    //}
    
}