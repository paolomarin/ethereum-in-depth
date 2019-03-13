pragma solidity >=0.4.21;

import "./Implementation.sol";

contract Caller {
  event CallerLog(uint256 gas);

  Implementation public implementation;

  constructor() public {
    implementation = new Implementation();
  }

  function () payable external {
    emit CallerLog(gasleft());
    address(implementation).call.gas(gasleft()).value(msg.value)(msg.data);
    emit CallerLog(gasleft());
  }
}
