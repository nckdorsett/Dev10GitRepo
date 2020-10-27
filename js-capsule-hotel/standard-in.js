const createPrompt = require("prompt-sync");

const prompt = createPrompt();

function readString(message) {
    return prompt(message);
}

function readInt(message, min, max) {

    let valid = false;
    let result;

    do {
        let input = readString(message);
        result = parseInt(input, 10);
        if (isNaN(result)) {
            console.log(`'${input}' is not a number.`);
        } else if (result < min || result > max) {
            console.log(`Value must be between ${min} and ${max}.`);
        } else {
            valid = true;
        }
    } while (!valid);

    return result;
}

module.exports.readString = readString;
module.exports.readInt = readInt;