pragma solidity ^0.4.15;

/** @title Greeter */
contract Greeter {
	/* Global variable that our greeter will output when poked */
	string greeting;

	/** @dev Contract constructor that sets the global `greeting` variable
	  * @param _greeting A STRING value to set the global `greeting` to
	  */
	function Greeter(string _greeting) {
		greeting = _greeting;
	}

	/** Greet function
	  * @return greeting The STRING value stored in the global `greeting` variable
	  */
	function greet() constant returns (string) {
		return greeting;
	}
}
