// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract RecibeEther {
  string public callFunction;
  //solo si el msgdata vacio, info de la transaccion
  receive() external payable{
    callFunction = "receive";
  }

  // msgdata no vacio
  fallback() external payable {
    callFunction = "fallback";
  }

  function getBalance() public view returns(uint){
    return address(this).balance;
  }
}
contract SendEther {
  
  //transfert 2300 gas, emite error en caso de falla
  function sendEtherTransfer (address payable _to)public payable{
  _to.transfer(msg.value);
  }
  function sendEtherSend (address payable _to) public payable returns(bool) {
    bool sent = _to.send(msg.value);
    require(sent, "fallo la transaccion");
    return sent;

  }
  function sendEtherCall (address payable _to) public payable returns(bool){
    bool sent = _to.send(msg.value);
        
    require(sent, "fallo la transaccion");
    return sent;
  } 
}
