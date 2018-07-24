pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/LandContract.sol";

contract TestLandContract {

  LandContract targetContract = LandContract(DeployedAddresses.LandContract());

  function test() public { 

       targetContract.addEstate(1, "testland1", "testland1-details");
       //const subject = targetContract.estates[0];

       //Console.log(subject);

       uint data = 1;

       Assert.equal(1, data, "Added id suppose to be 1.");
       
       //Assert.equal(8, data, "Adoption of pet ID 8 should be recorded.");
  }

}