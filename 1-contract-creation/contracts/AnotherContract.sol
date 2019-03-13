pragma solidity >=0.4.21;

import './MyContract.sol';

contract AnotherContract {
  MyContract public myContract;

  constructor() public {
    myContract = new MyContract();
  }
}
