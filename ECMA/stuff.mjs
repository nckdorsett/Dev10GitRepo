export let greeting = "Hey";

// private function
function compliment(name, message) {
    return `${greeting} ${name}, you're ${message}!`;
}

export function getSuperCompliment(name) {
    return compliment(name, "super");
}

export function getNeatoCompliment(name) {
    return compliment(name, "neato");
}

export function Dance(name) {
    this.name = name;
}

export const DAYS_IN_A_WEEK = 7;

export default function() {
    console.log("I'm the default export.");
};

// export {
//     greeting,
//     getSuperCompliment,
//     getNeatoCompliment,
//     Dance
// }