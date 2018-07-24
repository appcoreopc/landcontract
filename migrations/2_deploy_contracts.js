var landContract = artifacts.require("Landcontract");

module.exports = function(deployer) {
  deployer.deploy(landContract,  "0xc9A5d4f4D2d677dd75055263a02848F6942E96B7");
};