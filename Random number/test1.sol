//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Escrow {

    enum State {WAITING_FOR_PAYMENT, WAITING_FOR_DELIVERY, COMPLETE}
    State public currentState;

    address public buyer;
    address payable public seller;

    // ADD CODE HERE so that only the buyer can call a function
    modifier onlyBuyer() {
       require(msg.sender == buyer, "only the buyer and call the function");
        _;
    }

    
     // ADD CODE HERE to initiate the buyer and seller state variables
    constructor(address _buyer, address payable _seller) public {
      buyer = _buyer;
      seller = _seller;
    }

     // ADD CODE HERE so that only the Buyer can call this function to send Ether to the contract
    function deposit() onlyBuyer external payable  {
        require(currentState == State.WAITING_FOR_PAYMENT, "Buyer has already deposited Ether into the contract!");
        // buyer deposited funds into contract, now buyer awaits delivery of goods
         // ADD CODE HERE to change the currentState enum
         currentState = State.WAITING_FOR_DELIVERY;
        
    }


     // ADD CODE HERE so that only the Buyer can call this function
    function confirmDelivery() external {
        require(currentState==State.WAITING_FOR_DELIVERY, "Delivery has not been confirmed yet!");
        // ADD CODE HERE to transfer the Ether balance held by the contract to the seller       
        seller.transfer(address(this).balance);
        
        // ADD CODE HERE to change the currentState enum to show that the
        currentState = State.COMPLETE;
        // buyer received the goods, and the seller received Ether held by the contract
        // i.e. the transaction is finished

        
    }
}