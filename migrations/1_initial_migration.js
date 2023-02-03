const MyToken = artifacts.require("MyToken");

module.exports = function (deployer) {
  deployer.deploy(MyToken);
  console.log("Depolying My Token...");
  console.log("Depolyed My Token.");
};
