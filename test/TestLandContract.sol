pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/LandContract.sol";

contract TestLandContract {
  
  LandContract targetContract = LandContract(DeployedAddresses.LandContract());

  function test() public { 
    
    targetContract.addEstate(1, "testland1", "testland1-details");    

    uint256 count = targetContract._landCount();

    uint112 eventFire = 0;
    /*
    targetContract.watch(function(err, result) {
       eventFire = 1;      
    }); */
    log1("testing is a go!", "title");

    //log0(targetContract._landCount);

    uint expectedCount = 1;
    Assert.equal(count, expectedCount, "when a new estate is added, count should increase");
  }

}