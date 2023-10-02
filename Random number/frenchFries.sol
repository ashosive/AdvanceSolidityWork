// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract EnumDemo{

    // correnponds to 0,1,2
    enum size {REGULAR,LARGE,SUPERSIZE}
    // state variable
    size choice;

    // argument _choice is of type size 
    // normal function will write to the blockchain
    function setChoice(size _choice) public {
        if(uint(_choice) == 0){
            choice = size.REGULAR;
        } else {
            if (uint(_choice)==1){
                choice = size.LARGE;
            }else {
                choice = size.SUPERSIZE;
            }
        }
    }

    // view means wea re going to read from blockchain
    // no writing 
    function getChoice() public view returns(size){
        return choice;
    } 
}