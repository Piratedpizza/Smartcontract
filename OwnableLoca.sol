pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OwnableLoca is ERC20 {
    address public owner;
    constructor() ERC20("Loca", "LOC") {
        _mint(msg.sender, 10000*10**18);
        owner = msg.sender;
    }

    function mint(address to, uint amount) external {
        require(msg.sender==owner, 'only admin');
        _mint(to, amount);
    }
    
    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }
    event  OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    modifier onlyOwner() {
    require(msg.sender == owner);
    _;
    }
    function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
    }

        
    
}
