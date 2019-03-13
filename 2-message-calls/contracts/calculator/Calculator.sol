pragma solidity >=0.4.21;

import "./Product.sol";
import "./Addition.sol";
import "./ResultStorage.sol";

contract Calculator is ResultStorage {
  Product public product;
  Addition public addition;

  constructor() public {
    product = new Product();
    addition = new Addition();
  }

  function add(uint256 x) public {
    bytes4 methodId = bytes4(keccak256("calculate(uint256)"));
    (bool success, bytes memory data) = address(addition).delegatecall(abi.encodePacked(methodId, x));
    require(success);
  }

  function mul(uint256 x) public {
    bytes4 methodId = bytes4(keccak256("calculate(uint256)"));
    (bool success, bytes memory data) = address(product).delegatecall(abi.encodePacked(methodId, x));
    require(success);
  }
}
