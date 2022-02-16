// SPDX-Liciense-Identifier: Unlicense
pragma solidity ^0.8.0;


contract Whitelist {
    uint8 public maxWhiteListedAddresses;

    mapping(address => bool) public whiteListedAddresses;


    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses){
        maxWhiteListedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public{
        //check if address is already whitelisted
        require(!whiteListedAddresses[msg.sender], "Sender has already been whitelisted");

        //check if addresses whitelisted has reached the max
        require(numAddressesWhitelisted < maxWhiteListedAddresses, "More addresses cant be added, limit reached");

        //whitelist the address
        whiteListedAddresses[msg.sender] = true;
        //increase number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}