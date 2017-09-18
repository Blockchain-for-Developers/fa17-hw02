pragma solidity ^0.4.15;

contract BettingContract {
    address owner;
    address public gamblerA;
    address public gamblerB;
    address public oracle;
    uint[] outcomes;

    struct Bet {
        uint outcome;
        uint amount;
        bool initialized;
    }

    mapping (address => Bet) bets;
    mapping (address => uint) winnings;

    event BetMade(address gambler);
    event BetClosed();

    modifier OwnerOnly() {}

    modifier OracleOnly() {}

    function BettingContract(uint[] _outcomes) {
    }

    function chooseOracle(address _oracle) OwnerOnly() returns (address) {
    }

    function makeBet(uint _outcome) payable returns (bool) {
    }

    function makeDecision(uint _outcome) OracleOnly() {
    }

    function withdraw(uint withdrawAmount) returns (uint remainingBal) {
    }
    
    function checkOutcomes() constant returns (uint[]) {
    }
    
    function checkWinnings() constant returns(uint) {
    }

    function contractReset() private {
    }

    function() {
        revert();
    }
}
