pragma solidity >=0.4.21;

import "./Greeter.sol";

contract Wallet {
  Greeter internal greeter;

  constructor() public {
    greeter = new Greeter();
  }

  function () payable external{
    bytes4 methodId = bytes4(keccak256("thanks()"));
    (bool success, bytes memory data) = address(greeter).delegatecall(abi.encode(methodId));
    require(success);
  }
}
