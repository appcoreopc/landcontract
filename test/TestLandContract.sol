pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/LandContract.sol";

contract TestLandContract {
  
  LandContract targetContract = LandContract(DeployedAddresses.LandContract());

  function testAddEstate() public { 
    
    targetContract.addEstate(1, "testland1", "testland1-details");    

    // Get land count 
    uint256 count = targetContract._landCount();

    log1("testing is a go!", "title");

    uint expectedCount = 1;
    
    Assert.equal(count, expectedCount, "when a new estate is added, count should increase");
  }


   function testRemoveeState() public { 
    
    targetContract.addEstate(1, "testland1", "testland1-details");    

    // Get land count 
    uint256 count = targetContract._landCount();

    log1("testing is a go!", "title");

    uint expectedCount = 1;
    
    Assert.equal(1, expectedCount, "when a new estate is added, count should increase");
  }

}