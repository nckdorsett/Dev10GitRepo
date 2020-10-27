let value;
console.log(typeof value); // undefined
value = 25;
console.log(typeof value); // number
value = "Hodgepodge";
console.log(typeof value); // string
value = true;
console.log(typeof value); // boolean
value = {};
console.log(typeof value); // object
value = {};
console.log(typeof value); // object
value = null;
console.log(typeof value); // object

value = 2 / 3;
console.log(value);
value = 0.1 + 0.2;
console.log(value);
value = 2 / 0;
console.log(value);

value = 2 + "5";
console.log(value);
console.log(typeof value);

value = 2 * "5";
console.log(value);
console.log(typeof value);

value = "15" - "5";
console.log(value);
console.log(typeof value);

value = 2 / "Hodgepodge";
console.log(value);
console.log(typeof value);

console.log(value == NaN);
console.log(isNaN(value));

console.log("5" == 5);
console.log(5.0 == 5);
console.log(0 == false);
console.log(1 == true);
console.log(null == undefined);

console.log("5" === 5);
console.log(5.0 === 5);
console.log(0 === false);
console.log(1 === true);
console.log(null === undefined);

if (true) {
    console.log("true literal is true");
}

if (false) {
    console.log("false literal is true")
}

if ("Hodgepodge") {
    console.log("string literal is true");
}

if (null) {
    console.log("null literal is true");
}

if (undefined) {
    console.log("Undefined literal is true");
}

if ({}) {
    console.log("object literal is true");
}

if ({}) {
    console.log("array literal is treue");
}

// String literals
let name = "Ziggy Stardust";
name = 'Ziggy Stardust';

let helloWorld = "你好，世界！"

let message = "She doesn't like y'all.";
message = 'He keeps doing those supid "air quotes".';

message = 'she doesn\'t like y\'all.';
message = "He keeps doing those stupid \"air quotes\".";
message = "This message\nspans\nmultiple\nlines and contains\ttabs.";

let codeUnitCount = name.length;
codeUnitCount = "你好，世界！".length;
console.log(codeUnitCount);

let html = `<html lang="en">
<head>
<title>Document</title>
<body>
    <header>
        <h1 class="main-header">Document Header</h1>
    </header>
    <main id="content">
    </main>
</body>
</html>`;
console.log(html);

name = "Nomi";
let petCount = 3;
let petType = "dogs";
let verticalJump = 37.68;

message = `${name} has ${petCount} ${petType} and can jump ${verticalJump} inches vertically.`;
console.log(message);

let a = 2.33;
let b = -1.111;

console.log(`${a} + ${b} = ${a + b}`);

function loop() {

    console.log(i);

    for (var i = 0; i < 3; i++) {
        console.log(i);
    }

    console.log(i);
}

loop();

function loop2() {

    for (let i = 0; i < 3; i++) {
        console.log(i);
    }
}

loop2();

const constantine = "sesame oil";
console.log(constantine);

function repeatPrint(message, n) {
    for (let i = 0; i < n; i++) {
        console.log(message);
    }
}

function executeTwice(func, message) {
    func(message, 2);
}

repeatPrint("Yellow", 2);

const repeatMessage = repeatPrint;
repeatMessage("Blue", 3);

executeTwice(repeatPrint, "Red");
executeTwice(repeatMessage, "Green");

// function getMathFunction(operator) {
//     switch (operator) {
//         case "+":
//             return function (a, b) {
//                 return a + b;
//             };
//         case "-":
//             return function (a, b) {
//                 return a - b;
//             };
//         case "*":
//             return function (a, b) {
//                 return a * b;
//             }
//         case "/":
//             return function (a, b) {
//                 return a / b;
//             };
//         default:
//             // function expression
//             return function () { };
//     }   
// }

// const plus = getMathFunction("+");
// const multiply = getMathFunction("*");
// const unknown = getMathFunction("arrrgh");

// console.log(plus(2, 5));
// console.log(multiply(10.1, -5));
// console.log(unknown(1, 1));

function go(a, b, c) {
    let message = "a: " + a
    + ", b: " + b
    + ", c: " + c;
    console.log(message);
}

go();
go("maple");
go("maple", -314);
go("maple", -314, false);
go("maple", -314, false, "killer squid");
go(1, 2, 3, 4, 5, 6, 7);

function getMathFunction(operator) {
    switch (operator) {
        case "+":
            return (a, b) => a + b;
        case "-":
            return (a, b) => a - b;
        case "*":
            return (a, b) => a * b;
        case "/":
            return (a, b) => a / b;
        default:
            return () => {};
    }
}

const plus = getMathFunction("+");
const multiply = getMathFunction("*");
const unknown = getMathFunction("arrrgh");

console.log(plus(2, 5));
console.log(multiply(10.1, -5));
console.log(unknown(1,1));

let bees = [
    "Hoverfly",
    "Banded white-tailed bumblebean",
    "Bee fly",
    "Orange-tailed mining bee",
];

console.log(bees[3]);

bees[1] = "Banded white-tailed bumblebee";
console.log(bees.join(","));

bees.push("Social wasp");
console.log(bees.join(","));

let wasp = bees.pop();
console.log(wasp);
console.log(bees.join(","));

let hoverfly = bees.shift();
console.log(hoverfly);
console.log(bees.join(","));

bees.unshift("Long-horned bee");
console.log(bees.join(","));

let notBees = bees.splice(2, 1, "Tawny mining bee", "Ashy mining bee");
console.log(notBees.join(","));
console.log(bees.join(","));

for (let i = 0; i < bees.length; i++) {
    console.log(i + ": " + bees[i]);
}

bees.forEach((value, index) => console.log(index + ": " + value));

let noHyphenBees = bees.filter(bee => bee.indexOf("-") === -1);
console.log(noHyphenBees.join(","));

let allCaps = bees.map(bee => bee.toUpperCase());
console.log(allCaps.join(","));

// let planet = {};

// planet.name = "Jupiter";
// planet.moons = ["Io", "Europa", "Ganymede"];
// planet.getDescription = function () {
//     return "Planet: " + this.name + ", Has " + this.moons.length + " moons.";
// };

// console.log(planet.name);
// console.log(planet.moons[2]);
// console.log(planet.moons.length);
// console.log(planet.getDescription());
// console.log(planet.diameter);


let planet = {
    name: "Jupiter",
    moons: ["Io", "Europa", "Ganymede"],
    getDescription: function () {
        return "Planet: " + this.name + ", Has " + this.moons.length + " moons.";
    }
};

// let pintos = {
//     name: "Pinto Beans",
//     unit: "can",
//     quantity: 5,
//     unitPrice: 1.25,
//     getItemTotal: function () {
//         return this.quantity * this.unitPrice;
//     }
// };

// let toiletPaper = {
//     name: "Superior Toilet Paper",
//     qty: 3,
//     price: 9.99,
//     getItemTotal: function () {
//         return this.qty * this.price;
//     }
// };

// let lettuce = {
//     groceryName: "Iceberg Lettuce",
//     unit: "head",
//     quantity: 1,
//     price: 1.97,
//     getTotal: function () {
//         return this.quantity * this.price;
//     }
// };

function GroceryItem(name, unit, quantity, price) {
    this.name = name;
    this.unit = unit;
    this.quantity = quantity;
    this.price = price;
}

GroceryItem.prototype.getItemTotal = function () {
    return this.quantity * this.price;
}

let pintos = new GroceryItem("Pinto Beans", "can", 5, 1.25);
let toiletPaper = new GroceryItem("Superior Toilet Paper", "pack o 6 rolls", 3, 9.99);
let lettuce = new GroceryItem("Iceberg Lettuce", "head", 1, 1.97);

console.log(pintos.getItemTotal());
console.log(toiletPaper.getItemTotal());
console.log(lettuce.getItemTotal());














