pragma solidity ^0.5.0;

// #LTLVariables: address user
// #LTLFairness: [](!started(Overflow.withdraw))
// #LTLProperty: [](!finished(*, old(this.balances[user]) > this.balances[user]))

contract Overflow {
    mapping(address => uint8) balances;

    function deposit() public payable {
        require(msg.value < 256);
        balances[msg.sender] = balances[msg.sender] + uint8(msg.value);
    }   

    function withdraw() public {
        msg.sender.transfer(balances[msg.sender]);
        balances[msg.sender] = 0;
    }   

    function balanceOf(address user) public view returns (uint) {
        return balances[user];
    }   
}
