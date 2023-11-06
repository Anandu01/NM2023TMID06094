pragma solidity 0.8.22;
contract Bank {
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    // @dev mapping to store accout and balance
    mapping(address => uint256) internal  User;
    // function to deposite
    function Deposite() public payable {
        require(msg.value > 0,"Require Greater Than Zero");
        User[msg.sender] += msg.value;
    }
    // function to check balance
    function Balance() public view returns(uint256){
        return User[msg.sender];
    }
    // fucntion to transfer amount
    function Transfer(uint _amount,address _to) public {
        require(_to != address(0),"Invalid Address");
        require(User[msg.sender] >= _amount, "Not Enough Money for Transfer");
        User[msg.sender] -= _amount;
        User[_to] += _amount;
    }
}