L/ SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myErc20 is ERC20 {
  constructor(address_owner) ERC20("blockdemy community token", "BCT") {
    _mint(address(this), 1000 * 1e18);
    _mint(_owner,1000 *10**decimals());
    _mint(ms.sender,1000 *10**18);
  }
  function transferFromContract(address _to, uint _amount) public {
    transferFrom(address(this), _to, _amount);
  } 
}
