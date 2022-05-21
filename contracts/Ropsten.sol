// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Ropsten is ERC20{
    constructor() ERC20("Ropsten", "RPSTN") {}

    mapping(address=>uint256) lockedFunds;
    mapping(address=>uint256) unLockedFunds;

function lockFunds() public payable returns(bool) {
transferFrom(msg.sender, address(this) ,msg.value);
lockedFunds[msg.sender] += msg.value;
return(true);
}

 function unlockFunds(address to, uint256 amount) public returns(bool){
     lockedFunds[msg.sender] -= amount;
        transfer(to, amount);
        return(true);
    }



function presentLockedFunds(address _address) public view returns (uint256){
    return lockedFunds[_address];
}



}