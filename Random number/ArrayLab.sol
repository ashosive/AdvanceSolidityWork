// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

library ArrayTweaks {


    function PushToArray(uint[] storage PushArr, uint input) internal  {
        PushArr.push(input);
    }

    function PopFromArray(uint[] storage PopArr) internal returns (uint) {
        require(PopArr.length > 0, "Array is empty");

        uint EndIndex = PopArr.length - 1;
        uint EndValue = PopArr[EndIndex];
        PopArr.pop();

        return EndValue;
    }

    function Sorting(uint[] memory arr) internal pure  {
        uint input = arr.length;

        for (uint i = 0; i < input -1; i++){
            for (uint j = 0; j < input - i; j++){
                if (arr[j] > arr[j + 1]){
                    (arr[j], arr[j + 1]) = (arr[j + 1], arr[j]);
                }
            }
        }
    }


    // function RemoveDuplicate(){

    // }

}
contract ArrayLab {
    uint[] public ManupArray;
    constructor(){
        ManupArray=[11,2,31,42,5,1,7,18];
    } 


    function setData(uint input) public {
        ArrayTweaks.PushToArray(ManupArray,input );
    }

    function getData(uint _index) public view returns (uint){
        require(_index<ManupArray.length, "_index is not there");
        return ManupArray[_index];
    }

    function PopValue() public {
        ArrayTweaks.PopFromArray(ManupArray); 
    }

    function Sort() public {
        ArrayTweaks.Sorting(ManupArray);
    }
}