import * as compliments from "./stuff.mjs"

console.log(compliments);

import { greeting, getNeatoCompliment } from "./stuff.mjs";

import {
    greeting as message,
    getSuperCompliment as makeSuperCompliment
} from "./stuff.mjs";

console.log(message);
console.log(makeSuperCompliment);

import example from "./stuff.mjs";

console.log(example);

import theDefault, {DAYS_IN_A_WEEK} from "./stuff.mjs";
// import { a } from "./module-a";
// import { b } from "./module-b";
// import { c } from "./module-c";

console.log(theDefault);
console.log(DAYS_IN_A_WEEK);

import {a, b, c} from "./bundle.js";
a();
b();
c();
