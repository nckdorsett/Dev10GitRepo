const standardIn = require("./standard-in.js");
const Game = require("./Game.js");
const players = require("./players.js");

function getPlayer() {

    console.log("Do you want to play as:");
    console.log("1. Human");
    console.log("2. Computer");

    const playerType = standardIn.readInt("Choose [1-2]: ", 1, 2);
    if (playerType === 1) {
        return new players.HumanPlayer();
    }
    const switchDoor = standardIn.readString("Always switch doors [y/n]?: ").toLowerCase() === "y";
    return new players.ComputerPlayer(switchDoor);
}

// actions start here
console.log("Welcome to the Monty Hall Problem Simulator.");

const rounds = standardIn.readInt("How many rounds do you want to play? ", 1, 100000);
const player = getPlayer();
let wins = 0;

for (let r = 0; r < rounds; r++) {
    console.log(`Round #${r + 1}`);
    let game = new Game(player);
    if (game.play()) {
        wins++;
    }
}

console.log("Summary ===============");
console.log(`Total Games: ${rounds}`);
console.log(`Wins:        ${wins}`);
console.log(`Losses:      ${rounds - wins}`);