# Betting Contract
Build a simple betting contract that rewards correct guesses of outcomes. This contract utilizes aspects of game theory; you may want to use a paper and pen to make a note of possible game states that may arise.

## Rules
* There can only be one contract owner
* Bets to the contract will be comprised of both: an amount of Ether bet and the gambler's expected outcome
* The contract owner must define all possible outcomes from the start
* The contract owner must be able to assign an oracle; the oracle cannot be a gambler or later place a bet
* The contract owner cannot be a gambler
* Each gambler can only bet once
* If all gamblers bet on the same outcome, reimburse all gamblers their funds
* If no gamblers bet on the correct outcome, the oracle wins the sum of the funds
* The oracle may choose the correct outcome only after all gamblers have placed their bets
* You may add as many auxiliary functions as you want, they are not necessary however

**There are at least two aspects of this scheme that leave it open to malicious attack. Can you find them?**

## Minimum Requirements
* Start with two gamblers
* Start with one oracle
* Start with any amount of outcomes
* Add events (bet made, betting closed, etc.)
* The contract must be able to pass all tests

## Example

1. The contract is deployed, owner and outcomes are set (e.g. [1, 2, 3, 4])
2. Owner chooses their oracle
3. User at address A makes a bet of 50 wei on outcome 1, becomes gamblerA
4. User at address B makes a bet of 210 wei on outcome 2, becomes gamblerB
5. User at address A makes a bet on outcome 3, is not allowed to do so (each gambler can only bet once)
6. User at address G tries to make a bet, is not allowed to do so (only two gamblers in the vanilla contract)
7. Oracle decided on the correct outcome, chooses outcome 2
8. Winnings are dispersed, the game is over and gamblerA and gamblerB are removed from the game
9. User at address B withdraws the winnings they earned (260 wei) when they gambled on outcome 2

## Extra Credit
* (HARD) There can be multiple gamblers
	* The winners receive a propotional share of the total funds at stake if they all bet on the correct outcome
* (HARD) Each gambler can place multiple bets
* (HARD) Set up a multi-payout system where more than one outcome yields rewards
* There can be multiple oracles
	* Need an odd number of oracles to break ties
* The creater of the contract receives a fixed percentage of the winnings
* Cap the number of bets that can be made
* Cap the amount of time that passes after bet placement
