pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

interface IERC20 {
   
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

  
    function transfer(address to, uint256 amount) external returns (bool);

 
    function allowance(address owner, address spender) external view returns (uint256);

   
    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);


}


contract staking is Ownable {
       
       mapping (address=>uint) timestart;
         mapping (address=>uint) balances;
       IERC20  _IERC20;
      
     function setaddress(address add)public onlyOwner{
        _IERC20= IERC20(add); 
     } 



     function stake(uint amount)public {
         require(_IERC20.balanceOf(msg.sender)> amount * 10**18); 
         timestart[msg.sender]=block.timestamp; 

         balances[msg.sender]+=amount;
        _IERC20.transferFrom(msg.sender,address(this),amount);
     } 

     function checkstaked()public view returns(uint){
         return balances[msg.sender];
     }

     function withdraw()public{
         
     }

}  