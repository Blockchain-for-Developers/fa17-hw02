var Greeter = artifacts.require("./Greeter.sol");

contract('Greeter', function(accounts) {
	/* In general, it is not good practice to hard-code test values */
	const args = {_greeting: "Hello, World!"};
	it("Should use the Greeter constructor to set a greeting", function() {
		/* Constructor arguement already sent in `migrations/2_deploy_greeter.js` */
		return Greeter.deployed()
		.then(function(instance) {
			/* Call the greet function */
			return instance.greet.call();
		})
		.then(function(result) {
			assert.equal(args._greeting, result, "Greeter constructor " +
			"greeting and test value do not match")
		});
	});
});
