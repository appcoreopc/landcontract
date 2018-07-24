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
    
    // Constructor 
    function LandContract(address owner) public {
        _owner = owner;
    }

    // requires owner to add estate //
    function addEstate(uint id, string name, string details) public {
        require (_owner == msg.sender);
        _landCount++;   
        estates[_landCount] = EstateDetail(id, name, details, msg.sender, false);     
    }
    
    function sellEstate(uint landId, address owner) public { 
        require (_owner == msg.sender);
        setOwner(landId, owner);
    }

    function updateEstate(uint landId, string name, string details, bool verified) public { 
        require (_owner == msg.sender);
        EstateDetail estateInfo = estates[landId];
        estateInfo.name = name;
        estateInfo.details = details;
        estateInfo.verified = verified;        
    }

    function removeEstate(uint landId) public { 
        require (_owner == msg.sender);
        EstateDetail estateInfo = estates[landId];
        estateInfo.id = 0;
        estateInfo.name = "";
        estateInfo.details = "";
        estateInfo.owner = 0;
        estateInfo.verified = false;
    }

    function setOwner(uint landId, address newOwner) private {         
        EstateDetail targetEstate = estates[landId];
        targetEstate.owner = newOwner;
    }

    function getOwner(uint landId) public view returns (address) {
        EstateDetail estateInfo = estates[landId];
        return estateInfo.owner;      
    }
    
}