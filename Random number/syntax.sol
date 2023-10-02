//SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract syntax {
    string public  value;
    
    constructor() public {
        value = 'Okay';
    }

    // function get() public view returns(string) {
    //     return value;
    // }

    function set(string memory _value) public  {
        value =_value;
    }
}