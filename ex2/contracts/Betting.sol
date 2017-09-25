pragma solidity ^0.4.15;

contract Betting {
	/* Standard state variables */
	address owner;
	address public gamblerA;
	address public gamblerB;
	address public oracle;
	uint[] outcomes;	// Feel free to replace with a mapping

	/* Structs are custom data structures with self-defined parameters */
	struct Bet {
		uint outcome;
		uint amount;
		bool initialized;
	}

	/* Keep track of every gambler's bet */
	mapping (address => Bet) bets;
	/* Keep track of every player's winnings (if any) */
	mapping (address => uint) winnings;

	/* Add any events you think are necessary */
	event BetMade(address gambler);
	event BetClosed();

	/* Uh Oh, what are these? */
	modifier OwnerOnly() {
		if (msg.sender == owner) {
			_;
		}
	}

	modifier OracleOnly() {
		if (msg.sender == owner) {
			_;
		}
	}

	/* Constructor function, where owner and outcomes are set */
	function BettingContract(uint[] _outcomes) {
		owner = msg.sender;
		outcomes = _outcomes;
	}

	/* Owner chooses their trusted Oracle */
	function chooseOracle(address _oracle) OwnerOnly() returns (address) {
		if (_oracle != gamblerA && _oracle != gamblerB) {
			oracle = _oracle;            
		}
		return oracle;
	}

	/* Gamblers place their bets, preferably after calling checkOutcomes */
	function makeBet(uint _outcome) payable returns (bool) {
		if (!bets[msg.sender].initialized && msg.sender != oracle) {
			BetMade(msg.sender);
			if (gamblerA == 0) {
				gamblerA = msg.sender;
				return true;
			} else if (gamblerB == 0 && msg.sender != gamblerA) {
				gamblerB == msg.sender;
				BetClosed();
				bets[msg.sender] = Bet({
				outcome: _outcome,
				amount: msg.value,
				initialized: true
				});
				return true;
			}
		}
		return false;
	}

	/* The oracle chooses which outcome wins */
	function makeDecision(uint _outcome) OracleOnly() {
		Bet storage gA = bets[gamblerA];
		Bet storage gB = bets[gamblerB];
		if (gA.outcome == gB.outcome) {
			winnings[gamblerA] = gA.amount;
			winnings[gamblerB] = gB.amount;
		} else if (gA.outcome == _outcome && gB.outcome != _outcome) {
			winnings[gamblerA] = gA.amount + gB.amount;
		} else if (gA.outcome != _outcome && gB.outcome == _outcome) {
			winnings[gamblerB] = gA.amount + gB.amount;
		} else {
			winnings[oracle] = gA.amount + gB.amount;
		}
		contractReset();
	}

	/* Allow anyone to withdraw their winnings safely (if they have enough) */
	function withdraw(uint withdrawAmount) returns (uint remainingBal) {
		if(winnings[msg.sender] >= withdrawAmount) {
			winnings[msg.sender] -= withdrawAmount;
			if (!msg.sender.send(withdrawAmount)) {
				winnings[msg.sender] += withdrawAmount;
			}
		}
		return winnings[msg.sender];
	}

	/* Allow anyone to check the outcomes they can bet on */
	function checkOutcomes() constant returns (uint[]) {
		return outcomes;
	}

	/* Allow anyone to check if they won any bets */
	function checkWinnings() constant returns(uint) {
		return winnings[msg.sender];
	}

	/* Call delete() to reset certain state variables. Which ones? That's upto you to decide */
	function contractReset() private {
		delete(bets[gamblerA]);
		delete(bets[gamblerB]);
		delete(gamblerA);
		delete(gamblerB);
	}

	/* Fallback function */
	function() payable {
		revert();
	}
}
