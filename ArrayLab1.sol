// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ArrayUtils {
    event ArraySorted(uint[] sortedArray);
    event DuplicatesRemoved(uint[] uniqueArray);

    function sort(uint[] storage data) internal {
        uint length = data.length;
        for (uint i = 0; i < length - 1; i++) {
            for (uint j = 0; j < length - i - 1; j++) {
                if (data[j] > data[j + 1]) {
                    (data[j], data[j + 1]) = (data[j + 1], data[j]);
                }
            }
        }

        emit ArraySorted(data);
    }

    function removeDuplicates(uint[] storage data) internal {
        uint length = data.length;
        if (length <= 1) {
            return;
        }

        uint tail = 1;
        for (uint i = 1; i < length; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j < tail; j++) {
                if (data[i] == data[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                data[tail] = data[i];
                tail++;
            }
        }

        while (data.length > tail) {
            data.pop();
        }

        emit DuplicatesRemoved(data);
    }
}

contract SortingAndDuplicates {
    using ArrayUtils for uint[];

    uint[] public myArray;

    constructor(){
        myArray=[10,2,34,24,5,664,6,46,35,6];
    }

    function addValue(uint _value) public {
        myArray.push(_value);
    }

    function sortAndRemoveDuplicates() public {
        myArray.sort();
        myArray.removeDuplicates();
    }
}

