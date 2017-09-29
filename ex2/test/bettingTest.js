var Betting = artifacts.require("./Betting.sol");

contract('BettingTestGeneric', function(accounts) {
	const args = {_default: accounts[0], _owner: accounts[1]};

	it("The contract can be deployed", function() {
		return Betting.new()
		.then(function(instance) {
			assert.ok(instance.address);
		});
	});

	it("The contract can be deployed by custom addresses (default)", function() {
		return Betting.new()
		.then(function(instance) {
			return instance.owner.call();
		})
		.then(function(result) {
			assert.equal(result, args._default, "contract owned by " +
				"the wrong address");
		});
	});

	it("The contract can be deployed by custom addresses (using 'from')", function() {
		return Betting.new({from: args._owner})
		.then(function(instance) {
			return instance.owner.call();
		})
		.then(function(result) {
			assert.equal(result, args._owner, "contract owned by " +
				"the wrong address");
		});
	});
});

contract('BettingTestOracleSet', function(accounts) {
	const null_address = '0x0000000000000000000000000000000000000000';
	const args = {_owner: accounts[1], _oracle: accounts[2],
		_other: accounts[3], _fail: null_address};

	it("The Owner can set a new Oracle", function() {
		return Betting.new({from: args._owner})
		.then(function(instance) {
			return instance.chooseOracle.call(args._oracle, {from: args._owner});
		})
		.then(function(result) {
			assert.equal(result, args._oracle, "Oracle address and test " +
				"values do not match");
		});
	});

	it("The Oracle cannot be set by non-Owner addresses", function() {
		return Betting.new({from: args._owner})
		.then(function(instance) {
			return instance.chooseOracle.call(args._oracle, {from: args._other});
		})
		.then(function(result) {
			assert.equal(result, args._fail, "Oracle address and test " +
				"values should both be uninitialized addresses");
		});
	});
});
