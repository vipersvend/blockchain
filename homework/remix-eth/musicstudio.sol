pragma solidity 0.8.0;

contract MusicStudio{
    
    enum MusicType {Rock, Pop, Culture, Country}
    
    mapping( address => Artist) public a_to_atrist;
    mapping(address => User) public a_to_user;
    mapping(uint => Artist) public id_to_artist;
    mapping(string => Track) public name_to_track;
    
    uint idcounter = 1;
    struct Artist {
        uint id;
        address payable ArtistAddress;
        string name;
    }
    struct Track {
        MusicType genre;
        string name;
        uint artistid;
        uint cost;
    }
    struct User {
        string name;
        address UserAddress;
    }
    
    //function getArtist() public returns(Artist a){
     //  Artist a = a_to_atrist[msg.sender];
    //}
    function create_artist(string memory name, address payable accAddress) public {
        Artist memory artist = Artist(idcounter, accAddress , name );
        a_to_atrist[accAddress] = artist;
        id_to_artist[idcounter] = artist;
        idcounter++;
    }
    function create_song(MusicType mtype, string memory name, uint artistid, uint cost) public {
        Track memory track = Track(mtype, name, artistid, cost);
        name_to_track[name] = track;
    }
    
    function listen_to_music(string memory trackname ) public payable{
        uint t_cost = name_to_track[trackname].cost;
        Artist memory artist;
        artist = id_to_artist[name_to_track[trackname].artistid];
        address payable _artistaddr = artist.ArtistAddress;
        _artistaddr.transfer(t_cost);
        //(id_to_artist[name_to_track[trackname].artistid].address).transfer(t_cost);
        //return tname;
        //(id_to_artist[(name_to_track[trackname].name).artistid].address).transfer(t_cost);
    }
    //function create_track(MusicType mtype, string memory name, uint cost ) public {
    //    a_to_atristTrack
    //}
    //function listen_to_music(string memory trackname) public {
        
    //}
    
    
}
