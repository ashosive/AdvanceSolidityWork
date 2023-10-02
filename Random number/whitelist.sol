//SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract Whitelist {
    address owner;
    mapping(address=>bool) whitelistedAddresses;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender==owner, "Function caller is not the owner of the contract");
        _;
    }

    function addUser(address _addressToWhitelist) public onlyOwner {
        whitelistedAddresses[_addressToWhitelist] = true;
    }

    // *** Write a function that deletes a particular mapping


    function verifyUser(address _whitelistedAddress) public view returns(bool) {
        bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];
        return userIsWhitelisted;
    }


    function deleteUser(address _whitelistedAddressToRemove) public onlyOwner {

        require(whitelistedAddresses[_whitelistedAddressToRemove], "Address to remove is not whitelisted");
        
        whitelistedAddresses[_whitelistedAddressToRemove] = false;
    }

}