pragma solidity ^0.4.0;

contract ICustomToken {
    string public constant name = "Udacity Token"; // No restriction for the length of this name
    string public constant symbol = "UDC"; // Just like a stock symbol
    uint8 public constant decimals = 18; // How divisible a token can be, 18 is the most common decimal division

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function transfer(address to, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    function approve(address sender, uint tokens) public returns (bool success);

    // The following function allows another user to spend tokens
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
}
