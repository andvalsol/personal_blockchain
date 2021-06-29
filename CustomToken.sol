pragma solidity ^0.4.0;

contract CustomToken {
    string public constant name = "Udacity Token";
    string public constant symbol = "UDC";
    uint8 public constant decimals = 18;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowance;

    uint _totalSupply;

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    // Sets the initial supply of this token contract
    // also sends the total supply to the creator of this contract
    constructor(uint initialSupply) public {
        _totalSupply = initialSupply;
        balances[msg.sender] = initialSupply;
    }

    function totalSupply() public constant returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public constant returns (uint) {
        return balances[tokenOwner];
    }

    // Function that:
    // 1) Decreases the balance of the sender
    // 2) Increases the balance of the receiver
    // 3) Emit the transaction
    function transfer(address to, uint tokens) public returns (bool) {
        balances[msg.sender] = balances[msg.sender] - tokens;

        balances[to] = balances[to] + tokens;

        emit Transfer (msg.sender, to, tokens);

        return true;
    }

    // Allow contracts to spend tokens on another users behalf
    function transferFrom(address from, address to, uint tokens) public returns (bool) {
        balances[msg.sender] = balances[msg.sender] - tokens;

        allowance[from][msg.sender] = allowance[from][msg.sender] - tokens;

        balances[to] = balances[to] + tokens;

        emit Transfer(msg.sender, to, tokens);

        return true;
    }

    // Approve the spender to withdraw from your account, multiple times, up to the tokens amount.
    function approve(address spender, uint tokens) public returns (bool) {
        allowance[msg.sender][spender] = tokens;

        emit Approval(msg.sender, spender, tokens);

        return true;
    }
}
