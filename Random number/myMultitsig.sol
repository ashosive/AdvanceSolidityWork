// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

contract MultiSigWallet {
    //contract deployer address 

    address private owner;

    // mapping to hold address of authorized signers
    // bool value us used to determine if the address is enabled or disabled.
    // as a wallet owner(signer)

    mapping (address=>bool) private _owner;

    // number of signature required is sign the trancation, so that funds
    // can be transferred from the contract.

    uint constant MIN_SIGNATURE = 3;

    // incremental transaction counter

    uint private _transactionIdx;
    

    // struct to represent a transaction submitted for other to apprive

    // capture how many people isgned the transaction.

    //track teha coounts(addresses) of the signers

    struct Transaction {
        address from;
        address payable to;
        uint amount;
        uint signatureCount;
        mapping(address=>bool) signature;
    }

    // mapping of transaction ID to a transaction

    mapping (uint=>Transaction) private _transactions;
    
    // create a dynamic array contaning pending transactions that need to be processed 

    uint[] private _pendingTransactions;


    // to ubract with the wallet you must be the owner
    modifier isOwner(){
        require(msg.sender == owner);
        _;
    }

    // require that the contract owner or another account that has been added as an owner(signer)

    modifier validOwner(){
        require(msg.sender == owner || _owner[msg.sender] == true);
        _;
    }

    // Events


    event DepositFunds(address form, uint amount);
    event WithdrawFunds(address form, uint amount);
    event TransferFunds(address form, address to, uint amount);
    event TransactionCreated (address by, address to, uint amount, uint transactionId);

    // the creator of the contract is the owner of the multisig wallet

    constructor() public {
        owner = msg.sender;
    }

    // add owners of the wallet. Only the contract owner can add addresses. A value of 'true' means enabled.

    function addOwner(address __owner) isOwner public {
        _owners[_owner] = true;

    }


}