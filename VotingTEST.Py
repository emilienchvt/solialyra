from brownie import accounts, Defi
import brownie
import pytest


@pytest.fixture
def contract():
	global owner
	owner = accounts[0]
	global voter1
	voter1 = accounts[1]
	global voter2
	voter2 = accounts[2]
    global voter3
	voter2 = accounts[3]

	contract = Defi.deploy(_initialSupply, {'from':owner})
	return contract

### step 1

def testIsVoter(contract):

"""fonction isVoter en solidity de type 
    function isVoter(address _address) public view onlyOwner returns(bool) {
        return voters[_address].isRegistered;
    }
en gros"""
	assert contract.isVoter(voter1) == False
    assert contract.isVoter(voter2) == False
    contract.registerVoter(voter1)
    contract.registerVoter(voter2)
    assert contract.isVoter(voter1) == True
    assert contract.isVoter(voter2) == True
	assert contract.isVoter(voter3) == False



### steps proposal test 

def testStartProposalSession(contract):
    assert contract.getWorkflowStatus() == RegisteringVoters
    contract.startProposalRegistration({'from': owner})
    assert contract.getWorkflowStatus() == ProposalsRegistrationStarted

    
def testPropose(contract):
    proposal1 = 'test1'
    proposal2 = 'test2'
    contract.offerProposal(proposal1, {'from': voter1})
    contract.offerProposal(proposal2, {'from': voter2})
    assert contract.proposals[0].description=proposal1
    assert contract.proposals[1].description=proposal2



### voting step
def testEndProposalSession(contract):
    assert contract.getWorkflowStatus() == ProposalsRegistrationStarted
    contract.endProposalRegistration({'from': owner})
    assert contract.getWorkflowStatus() == ProposalsRegistrationEnded


def testStartVotingSession(contract):
    assert contract.getWorkflowStatus() == ProposalsRegistrationEnded
    contract.startVotingSession({'from': owner})
    assert contract.getWorkflowStatus() == VotingSessionStarted

def testvote(contract)
    assert voters[voter1].hasVoted == False
    contract.vote(0, from {voter1})
    contract.vote(0, from {voter2})
    contract.vote(0, from {voter3})
    assert voters[voter1].hasVoted == True
    assert voters[voter2].hasVoted == True
    votedProposalId
    assert voters[voter1].hasVoted == True
    assert voters[voter2].hasVoted == True
    assert contract.proposals[0].voteCount=2
    assert contract.proposals[1].voteCount=0

### count votes

def testEndVotingSession(contract):
    assert contract.getWorkflowStatus() == VotingSessionStarted
    contract.endVotingSession({'from': owner})
    assert contract.getWorkflowStatus() == VotingSessionEnded

def testVotingTallied(contract):
    assert contract.getWorkflowStatus() == VotingSessionEnded
    contract.tallyVotes({'from': owner})
    assert contract.getWorkflowStatus() == VotesTallied

def testTally(contract):
    assert winningProposalId==0
    
