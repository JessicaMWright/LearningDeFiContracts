/// SPDX-License-Identifier: minutes

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/access/Ownable.sol";
import "openzeppelin-contracts/token/ERC20/IERC20.sol";

contract TokenFarm is Ownable {
    address[] public s_allowedTokens;
    // tokenaddress -> owner - balance
    mapping()
    //stake tokens

    function stakeTokens(uint256 amount, address token) public {
        require(amount > 0, "cannot be zero");
        require(tokenIsAllowed(token), "Token isn't allowed");
        //transfer token from them to contract
        IERC20(token).transfer_from(msg.sender, address(this), amount);

    }

    function addAllowedTokens(address token) public onlyOwner{
        s_allowedTokens.push(token);

   }

    function tokenIsAllowed(address token) public returns (bool) {
        for (uint256 allowedTokenIndex = 0;
         allowedTokensIndex < s_allowedTokens.length;
         allowedTokenIndex++) {
            if(s_allowedTokens[allowedTokenIndex] == token) {
                return true;
            }
       }
       return false;

    }
    //unstake
    //reward users for staking
}