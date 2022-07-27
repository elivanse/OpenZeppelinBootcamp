// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Voting {
  //variables de estado
  struct Voter{
    bool voted;
    bool canVote;
  }
  mapping(address => Voter) public voters;
  struct Candidate{
    string name;
    uint voteCount;
    
  }
  
  Candidate[2] public candidates;
  
  bool public isActive;
  
  address public admin;
  
  //modificadores
  modifier onlyAdmin {
require(msg.sender == admin, "no admin");
_;
  }
  //constructor
  constructor(string memory _candidate1, string memory _candidate2){
    admin = msg.sender;
    
    candidates[0] = Candidate({
        name: _candidate1,
        voteCount: 0
      });

    candidates[1] = Candidate({
        name: _candidate2,
        voteCount: 0
      });
  }
  //funciones
  function vote(uint _candidateToVote) public{
    //validar si la votacion esta activa
    require(isActive, "la votacion ya cerro");

    // instranciamnos 
    Voter storage sender = voters[msg.sender];
    
    // si tiene derecho a votar y si ya voto
  require(sender.canVote,"no puede votar");
  require(!sender.voted,"no puede votar");
  require(_candidateToVote<2, "Invalid candidate");
  candidates[_candidateToVote].voteCount ++;
  sender.voted=true;
  return true;
  }
  //funcion para otorgar dercho votar
  function giveRightToVote(address _voter) public onlyAdmin{
    require(msg.sender==admin, "no eres el admin");
    require (!voters[_voter].voted, "ya votaste");
    voters[_voter].canVote = true;    
  }
  //
  function() endVoteContract() public onlyAdmin{
  isActive = false;
  }
  function getWinningName () public view{
    require(isActive,"votacion acbbierfta");
    if(candidate[0].voteCount>candidatte[1].voteCount){
      return candidate[0];
    }else
      {candidate[1];}
  }
}
