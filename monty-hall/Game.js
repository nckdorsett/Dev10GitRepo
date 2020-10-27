function randomInt(maxExclusive) {
    return Math.floor(Math.random() * maxExclusive);
}

function getRevealedDoor(prizeDoor, playerDoor) {
    let result;
    if (prizeDoor === playerDoor) {
        result = (prizeDoor + 1 + randomInt(2)) % 3;
    } else {
        result = 3 - prizeDoor - playerDoor;
    }
    return result;
}

function playGame() {

    let prizeDoor = randomInt(3);

    console.log("let's Solve the Monty Hall Problem!");
    console.log("There are three doors labeled 1-3.");


    let playerDoor = this.player.pickDoor();

    console.log(`You chose door #${playerDoor + 1}.`);

    let revealedDoor = getRevealedDoor(prizeDoor, playerDoor);

    console.log(`There's a goat behind door #${revealedDoor + 1}.`);
    
    let change = this.player.shouldSwitch();
    if (change) {
        playerDoor = 3 - playerDoor - revealedDoor;
        console.log(`You switched to door #${playerDoor + 1}`);
    }

    if (playerDoor === prizeDoor) {
        console.log("You win!");
    } else {
        console.log("You lose.");
    }

    return playerDoor === prizeDoor;
}

function Game(player) {
    this.player = player;
}

Game.prototype.play = playGame;

module.exports = Game;