pragma solidity ^0.5.11;  
contract Election {
	//Modelling of candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;

	}
	event votedEvent(uint indexed _candidateId);
	//initialize variables
	constructor () public {
addCandidate(" Candidate1");
addCandidate(" Candidate2");
	}
	//Save or storage and fetch of candidates
	// getter fn is created autmatically since public
		mapping(address=>bool) public voters;
	mapping(uint=>Candidate) public candidates;
//keeps track of no. of candidates
	uint public candidatesCount; 
//adds the candidates with private access
	function addCandidate(string memory _name) private{
candidatesCount++;
candidates[candidatesCount]=Candidate(candidatesCount,_name,0);
	}

function vote(uint _candidateId) public {
	require(!voters[msg.sender]);
	require(_candidateId>0&&_candidateId<=candidatesCount);
voters[msg.sender]=true;
candidates[_candidateId].voteCount++;
emit votedEvent(_candidateId);
}
	
}
