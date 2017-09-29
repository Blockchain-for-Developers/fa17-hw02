pragma solidity ^0.4.15;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Betting.sol";

contract BettingTest {
	Betting betting = Betting(DeployedAddresses.Betting());

	function testChooseOracle() {
		address oracle = betting.chooseOracle(0x56a686aa7ce2a9a4210dfe2dc28d24fdd8d83a1e);
		address expected = betting.oracle();
		Assert.equal(oracle, expected, "Oracle chosen by Owner should be registered.");
	}

	/**	************************************************************ */
	/**	The test below does not work in Solidity, see bettingTest.js */
	/**	************************************************************ */

	// function testMakeBet() {
	// 	address exampleA = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;
	//	address exampleB = 0x583031d1113ad414f02576bd6afabfb302140225;
	// 	bool boolA = betting.makeBet(1, {from: exampleA, value: 600});
	// 	bool boolB = betting.makeBet(2, {from: exampleB, value: 600});
	// 	address gamblerA = betting.gamblerA();
	// 	Assert.equal(boolA, true, "GamblerA should be set correctly.");
	// 	Assert.equal(gamblerA, exampleA, "GamblerA should be set to correct address.");
	// }
}
