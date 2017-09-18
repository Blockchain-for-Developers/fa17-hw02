pragma solidity ^0.4.15;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BettingContract.sol";

contract TestBettingContract {
	BettingContract betting = BettingContract(DeployedAddresses.BettingContract());

	function testChooseOracle() {
		address oracle = betting.chooseOracle(0x14723a09acff6d2a60dcdf7aa4aff308fddc160c);
		address expected = betting.oracle();
		Assert.equal(oracle, expected, "Oracle chosen by Owner should be registered.");
	}

	function testMakeBet() {
		address exampleA = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;
		// betting.getCurrAddress.call({from:exampleA});
		bool boolA = betting.makeBet(1, {value: 50});
		// bool boolB = betting.makeBet({from: 0x583031d1113ad414f02576bd6afabfb302140225, value: 600});
		address gamblerA = betting.gamblerA();
		Assert.equal(boolA, true, "GamblerA should be set correctly.");
		Assert.equal(gamblerA, exampleA, "GamblerA should be set to correct address.");
	}

	// function testCheckOutcomes() {
	// 	uint[] outcomes;
	// 	outcomes.push(1);
	// 	outcomes.push(2);
	// 	outcomes.push(3);
	// 	uint[] storage expected = betting.checkOutcomes();
	// 	Assert.equal(outcomes, expected, "Outcomes should be the array declared in ../migrations/2_deploy_contracts.js.");
	// }

}
