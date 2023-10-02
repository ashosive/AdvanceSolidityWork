// SPDX-License-Identifier: MIT

pragma solidity 0.6.0;


contract StudentEnrollment{
    // state variables --> stored in blockchain 

    // data type you can make it for yourself

    struct Student {
        string name;
        uint class;
        uint enrolled;
    } 

    address public teacher;

    uint studentNumber;

    // way to print to something has taken place 

    event Added(string name, uint class, uint enrolled);

    //mapping 
    mapping (uint => Student) public stuview;

    // modifier

    modifier isTeacher{
        require(msg.sender == teacher, "Only Teacher can enroll a student");
        _;
    }

    modifier isClassValid (uint _class){
        require(_class> 0 && _class<=10, "Invalid class memeber");
        _;
    }
    // constructor

    constructor() public {
        teacher == msg.sender;
        studentNumber = 101494701;
    }

    // function

    function addStudent(string memory _name, uint _class, uint _year_enroll) public isTeacher isClassValid(_class)  {
    
        Student memory student = Student(_name, _class, _year_enroll);
        studentNumber++;
        
        stuview[studentNumber] = student;
        emit Added(_name, _class, now);
    }
}