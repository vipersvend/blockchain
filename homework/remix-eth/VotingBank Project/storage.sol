pragma solidity ^0.8.0;

contract Storage{

    address public controller;
    constructor (address _controller) {
        controller = _controller;
    }
    
    mapping(uint => Candidate) public id_to_candidate;
    mapping(uint => Voter) public id_to_voter;
    
    mapping(uint=>GovtProof) public candidate_id_to_govtProof;
    mapping(string => uint256) public candidate_proof_to_proof_id;
    
    mapping(uint=>GovtProof) public voter_id_to_govtProof;
    mapping(string => uint256) public voter_proof_to_proof_id;
    
    
    modifier onlyController() {
        require( msg.sender == controller, "Storage: controller function" );
        _;
    }
    
    modifier candidate_proof_exists(string memory candidate_proof) {
        require((candidate_proof_to_proof_id[candidate_proof]!=0), 
        "Government Proof For the Candidate Already Exists.... No Double registration");
        _;
    }
    
    
    modifier voter_proof_exists(string memory voter_proof) {
        require((voter_proof_to_proof_id[voter_proof]!=0), 
        "Government Proof For the Voter Already Exists.... No Double registration");
        _;
    }
    
    
    struct Group{
        uint id;
        string name;
    }
    
    struct Voter{
        string name;
        uint256 govt_proof;
        uint age;
        uint voter_id;
        string region;
    }
    
    struct GovtProof{
        uint256 proof_id;
        string proof;
    }
    
    struct Candidate{
        string name;
        uint256 govt_proof;
        uint age;
        uint candidate_id;
        string region;
        uint group_id;
    }
    
    uint256 candidate_id_counter = 0;
    uint256 voter_id_counter = 0;
    uint256 group_id_counter = 0;
    uint256 govt_proof_counter = 0;
    
    
    function create_candidate(string memory name, string memory govt_proof, uint age, string memory region, uint group_id)
    
        public payable returns(bool){
            candidate_id_counter++;
            uint256 govt_proof_id;
            
            //require voter candidate 
            
            if (voter_proof_to_proof_id[govt_proof] != 0){
                //proof already exists
                govt_proof_id = voter_proof_to_proof_id[govt_proof];
            }
            else{
                //create new proof
                govt_proof_counter++;
                govt_proof_id = govt_proof_counter;
                GovtProof memory new_proof = GovtProof(govt_proof_counter, govt_proof);
                candidate_id_to_govtProof[govt_proof_counter] = new_proof;
                candidate_proof_to_proof_id[govt_proof] = govt_proof_counter;
            }
            Candidate memory new_candidate = Candidate(name, govt_proof_counter, age, candidate_id_counter, region, group_id);
            id_to_candidate[candidate_id_counter] = new_candidate;
        
            return true;
        }
    
    function create_voter(string memory name, string memory govt_proof, uint age, string memory region)
        voter_proof_exists(govt_proof)
        public payable returns (bool){
            //require
            
            voter_id_counter++;
            govt_proof_counter++;
            Voter memory new_voter = Voter(name, govt_proof_counter, age, voter_id_counter, region);
            
            id_to_voter[voter_id_counter] = new_voter;
            
            return true;
        }
    
}
