// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


//will update this contract using delegratecall

contract UpdateContract {
    uint256 public value;

    function setValue(uint256 _newValue) public {
        value = _newValue;
    }
}


contract ContractChecker {

    // address for targetcontract 	
    address public targetContract;
    //initilizing the value		
    constructor(address _target) {
        targetContract = _target;
    }


    function CheckCode(address _contractAddress) public view returns (bool) {
        uint256 codeSize;
        assembly {
            codeSize := extcodesize(_contractAddress)
        }
        return codeSize > 0;
    }
	// updateValue function in CallerContract uses delegatecall to call the setValue 
    function updateValue(uint256 _newValue) public {
        // Delegate call to the TargetContract's setValue function
        (bool success, ) = targetContract.delegatecall(abi.encodeWithSignature("setValue(uint256)", _newValue));
        require(success, "Delegate call failed");
    }


}

