pragma solidity ^0.7.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4-solc-0.7/contracts/math/SafeMath.sol';

contract operations {
    uint256 public immutable num1;
    constructor(uint256 _num){
        num1 = _num;
    }
    function add(uint256 _num2) public view returns(uint256){
        return SafeMath.add(num1,_num2);
    }

    function multiply(uint256 _num2) public view returns(uint256){
        return SafeMath.mul(num1,_num2);
    }

    function divide(uint256 _num2) public view returns(uint256){
        return SafeMath.div(num1,_num2);
    }
    
    function subtract(uint256 _num2) public view returns(uint256){
        return SafeMath.sub(num1,_num2);
    }
    
    function modulo(uint256 _num2) public view returns(uint256){
        return SafeMath.mod(num1,_num2);
    }
    
    function total_sum() public view returns (uint256){
        uint256 start = 0;
        uint256 sum = 0;
        
        while(start<num1){
            sum = SafeMath.add(sum, start);
            start++;
        }
        return sum;
    }
    
    function skip_multiples(uint256 target) public view returns (uint256) {
       uint256 start = 0;
        uint256 sum = 0;
        while(start<num1){
            if(SafeMath.mod(start,target)!=0){
            sum = SafeMath.add(sum, start);
            }
            start++;
        }
        return sum;
    }

}