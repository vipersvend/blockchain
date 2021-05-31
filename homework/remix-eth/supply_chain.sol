contract SupplyChain{
    enum  role {User, Provider, Admin}
    mapping (address => uint) public addr_to_role;
    enum pstate {Shipped, Transit, Delivered}
    mapping (uint => product) public id_to_product;
    uint product_counter = 1;
    
    struct product{
        uint p_id;
        string pname;
        pstate state;
    }
    
    function changeState(uint pid, uint256 state) public {
        require(addr_to_role[msg.sender] == 2, "You Must be an Admin To Change State!");
        if(state == 0){
            id_to_product[pid].state = pstate.Shipped;
        }
        else if(state == 1){
            id_to_product[pid].state = pstate.Transit;
        }
        else {
            id_to_product[pid].state = pstate.Delivered;
        }
    }
    
    function create_product( string memory pname) public{
        require(addr_to_role[msg.sender] == 2, "You Must be an Admin to Create Product!");
        product memory new_product = product(product_counter, pname, pstate.Shipped);
        id_to_product[product_counter] = new_product;
        product_counter++;
    }
    
    function compareStrings(string memory a, string memory b) public view returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
    function getrole() public view returns ( uint256) {
        return addr_to_role[msg.sender];
         
    }
    function setrole(string memory req_role) public {
        if(compareStrings(req_role,"Admin")){
            addr_to_role[msg.sender] = uint256(role.Admin);
        }
        else if(compareStrings(req_role,"Provider")){
            addr_to_role[msg.sender] = uint256(role.Provider);
        }
        else{
            addr_to_role[msg.sender] = uint256(role.User);
        }
    }
}
