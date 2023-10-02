// SPDX-License-Identifier: MIT

pragma solidity 0.6.0;

contract StudentEnrollment {

    // state variables --> stored to the blockchain
    struct Student {
        string name;
        uint class;
        uint enrolled;
    }

    address public teacher;
    uint studentNumber;

    // Event
    event Added(string name, uint class, uint enrolled);

    // Mapping
    mapping(uint => Student) public stuview;

    // Modifier
    modifier isTeacher {
        require(msg.sender == teacher, "Only the teacher can enroll a student!");
        _;
    }

    // Constructor
    constructor() public {
        teacher = msg.sender;
        studentNumber = 110900700;
    }

    // Function
    function addStudent(string memory _name, uint _class, uint _year_enroll) public isTeacher {
        require(_class > 0 && _class <= 10, "Invalid class number.");
        Student memory student = Student(_name, _class, _year_enroll);
        studentNumber++;
        stuview[studentNumber] = student;
        emit Added(_name,_class, now);
    }
}