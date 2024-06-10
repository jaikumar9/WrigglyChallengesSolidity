// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payroll {
    address public employer;
    mapping(address => uint) public employeeSalaries;
    uint public totalFunds;

    constructor() {
        employer = msg.sender;
    }

    function addFunds() public payable {
        require(msg.sender == employer, "Only the employer can add funds");
        totalFunds += msg.value;
    }

    function getTotalFunds() public view returns (uint) {
        return totalFunds;
    }

    function payEmployee(address payable employee) public {
        require(msg.sender == employer, "Only the employer can pay employees");
        uint salaryToPay = employeeSalaries[employee];
        require(salaryToPay > 0, "Employee must be registered with a salary greater than 0");
        require(totalFunds >= salaryToPay, "Not enough funds to pay employee.");

        totalFunds -= salaryToPay;
        // employee.transfer(salaryToPay);
       (bool success,) = employee.call{value:salaryToPay}("");
      require(success, "Payment to employee failed");
    }

    function setEmployeeSalary(address employee, uint salary) public {
        require(msg.sender == employer, "Only the employer can set employee salaries");
        employeeSalaries[employee] = salary;
    }
}
