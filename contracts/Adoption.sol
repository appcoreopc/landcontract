pragma solidity ^0.4.17;

contract LandContract { 

    mapping(uint => EstateDetail) public estates;
    
    uint public landCount;
    
    struct EstateDetail {        
        uint id;
        string name;
        uint voteCount;
        string details;   
        address owner;     
    }    
    
    function LandContract() public {

    }

    function addEstate() public {

    }

    function sellEstate() public { 

    }

    function setOwner(uint landId) public { 
        estates[landId] = EstateDetail(0, "", 0, "", 0);
    }

    function getOwner(uint landId) public view returns (uint) {
       EstateDetail a = estates[landId];
       return 0;
    }

    address[16] public adopters;
    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
    
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;

        return petId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[16]) {
        return adopters;
    }
}