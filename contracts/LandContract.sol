pragma solidity ^0.4.17;

contract LandContract { 

    mapping(uint => EstateDetail) public estates;
    
    address _owner;

    uint public _landCount;
    
    struct EstateDetail {        
        uint id;
        string name;   
        string details;   
        address owner;  
        bool verified;   
    }    
    
    function LandContract(address owner) public {
        _owner = owner;
    }

    // requires owner to add estate //
    function addEstate(uint id, string name, string details) public {
        require (_owner == msg.sender);
        _landCount++;   
        estates[_landCount] = EstateDetail(id, name, details, msg.sender, false);     
    }

    function sellEstate() public { 

    }

    function setOwner(uint landId) public { 
        estates[landId] = EstateDetail(_landCount, "", "", msg.sender, true);
    }

    function getOwner(uint landId) public view returns (address) {
        EstateDetail a = estates[landId];
        return a.owner;      
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