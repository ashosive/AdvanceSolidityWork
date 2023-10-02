// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

contract ArrayDemo {
    uint[] public myArray;
    uint[] public myArray2 = [10,20,30];
    uint[10] public myFixedArray;

    // if type is not defined when a contract inherit it what will happen
    uint[] interArray;
    bool[] boolArray;
    address[] addressArray;

    // push the value to the end of array
    function addElement(uint _value) public {
        myArray.push(_value);
    }

    function getItemInArray(uint _index) public view returns(uint){
        return myArray[_index];
    }

    function updateArray(uint _index, uint _value) public {
        myArray[_index] = _value;
    }

    function resetElement(uint _index) public {
        delete myArray[_index];
    }

    function getLength() public view returns (uint){
        return myArray.length;
    }
}
