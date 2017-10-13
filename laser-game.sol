pragma solidity ^0.4.0;

// First SmartContract
// Add owner restriction
// Difficulties : 
// - Add Players array to Game structure
// - Return more than one element with get functions
// - Check when properties when add game / player 
contract LaserGame {
    
    address owner;
    
    struct Player {
        string name;
        uint points;
        uint game;
    }
    
    struct Game {
        string name;
    }
    
    Game[] games;
    Player[] players;
    
    function LaserGame() public {
        owner = msg.sender;
    }

    function addNewGame(string _name) public returns(bool success) {
        require(owner == msg.sender);
        games.push(Game(_name));
        
        return true;
    }
    
    function addPlayerToGame(uint gameIndex, string _playerName, uint _points) public {
        require(owner == msg.sender);
        
        players.push(Player(_playerName, _points, gameIndex));
    }

    function getGameDetails(uint gameIndex) constant public returns (string gameName) {
        return games[gameIndex].name;
    }
}