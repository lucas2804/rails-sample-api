var votes = [];

function addVote(candidate) {
  votes.push(candidate);
}

function countVotes(votes) {
  var tally = {};
  for (var i = 0; i < votes.length; i++) {
    if (tally[votes[i]]) {
      tally[votes[i]]++;
    } else {
      tally[votes[i]] = 1;
    }
  }
  
  return tally;
}

// Hash solution

var votes = {};

function addVote(candidate) {
  if (votes[candidate]) {
    votes[candidate]++;
  } else {
    votes[candidate] = 1;
  }
}

function countVotes() {
  return votes;
}

