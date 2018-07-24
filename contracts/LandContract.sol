pragma solidity ^0.4.17;

contract LandContract { 

    mapping(uint => EstateDetail) public estates;  

    address _owner;

    uint public _landCount;

    // events //
    event soldLandEvent (
        uint indexed _landId,
        address _newOwner
    );

    event updateLandEvent (
        uint indexed _landId
    );

    event addLandEvent (
        uint indexed _landId,
        string title, 
        string details
    );
    
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
        _landCount = 0;
    }
    // requires owner to add estate //
    function addEstate(uint id, string name, string details) public {
        log0("addEstate function initiated.");
        //require (_owner == msg.sender);
        _landCount++;   
        estates[_landCount] = EstateDetail(id, name, details, msg.sender, false);   
        emit addLandEvent(id, name, details);
    }
    
    function sellEstate(uint landId, address owner) public {
        log0("sellEstate function initiated."); 
        require (_owner == msg.sender);
        setOwner(landId, owner);
        emit soldLandEvent(landId, msg.sender);
    }

    function updateEstate(uint landId, string name, string details, bool verified) public {
        log0("updateEstate function initiated."); 
        require (_owner == msg.sender);
        EstateDetail estateInfo = estates[landId];
        estateInfo.name = name;
        estateInfo.details = details;
        estateInfo.verified = verified;        
        emit updateLandEvent(landId);
    }

    function removeEstate(uint landId) public { 
        log0("removeEstate function initiated."); 
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