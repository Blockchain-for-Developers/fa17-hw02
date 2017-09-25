var Greeter = artifacts.require("./Greeter.sol");

module.exports = function(deployer) {
	/* Input value to constructor on contract deployment */
	var testGreeting = "Hello, World!";
    deployer.deploy(Greeter, testGreeting);
};
