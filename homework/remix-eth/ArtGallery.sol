pragma solidity 0.8.0;

contract ArtGallery {
    
    mapping( uint => Art) public id_to_art;
    mapping( uint => Artist) public art_id_to_artist;
    mapping( uint => Artist) public id_to_artist;
    mapping( uint => User) public id_to_user;
    mapping(uint => User) public art_id_to_user;
    mapping(address => Artist) public address_to_artist;
    mapping(address => User) public address_to_user;
    struct Artist{
        uint id;
        address payable ArtistAddress;
        string name;
    }
    
    struct Art{
        uint id;
        string name;
        uint cost;
    }
    
    struct User{
        uint id;
        string name;
        address payable UserAddress;
    }
    
    uint public artistcounter = 1;
    uint public artcounter = 1;
    uint public usercounter = 1;
    
    // create an artist account. The current Account Address will be saved
    function create_artist(string memory name) public {
        Artist memory new_artist = Artist(artistcounter, payable(msg.sender), name);
        address_to_artist[msg.sender] = new_artist;
        id_to_artist[artistcounter] = new_artist;
        artistcounter++;
    }
    // create a User(Buyer) account. The current Account Address will be saved
    function create_user(string memory name) public {
        User memory new_user = User(usercounter, name, payable(msg.sender));
        id_to_user[usercounter] = new_user;
        address_to_user[msg.sender] = new_user;
        usercounter++;
    }
    //Create Art. The Current Art creator address must match to the artist in database
    function create_art(string memory name, uint cost) public {
        require(address_to_artist[msg.sender].id!= 0, "Error: You are not an Artist!");
        Art memory new_art = Art(artcounter, name, cost);
        id_to_art[artcounter] = new_art;
        art_id_to_artist[artcounter] = address_to_artist[msg.sender];
        artcounter++;
    }
    
    function buyart(uint artid) public payable {
        uint transferableAmount = msg.value;
        require(id_to_art[artid].cost == transferableAmount, "Error: Invalid Cost");
        address payable recipient = payable(art_id_to_artist[artid].ArtistAddress);
        recipient.transfer(transferableAmount);
        art_id_to_user[artid] = id_to_user[address_to_user[msg.sender].id];
    }
    
}
