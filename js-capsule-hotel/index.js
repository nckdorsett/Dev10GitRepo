const {readInt, readString} = require("./standard-in");

const standardIn = require("./standard-in.js");
const rooms = [];

function showHeader(message) {
    console.log(message);
    console.log('='.repeat(message.length));
    console.log('');
}

function runHotel() {
    showHeader('Welcome to the Capsule-Corp Hotel');
    const roomsAvailable = readInt('Enter the number of capsules available: ', 1, 1000000);
    console.log(`There are ${roomsAvailable} unoccupied capsules ready to be booked.\n`);
    for (let i = 0; i < roomsAvailable; i++) {
        rooms.push(`unoccupied`);
    };
    runMenu();
}

function runMenu() {
    let option = 0;
    do {
        showHeader('Guest Menu');
        console.log('1. Check In');
        console.log('2. Check Out');
        console.log('3. View Guests');
        console.log('4. Exit');
        option = readInt('Choose an option [1-4]: ');
        switch (option) {
            case 1:
                checkIn();
                break;
            case 2:
                checkOut();
                break;
            case 3:
                viewGuests();
                break;
            case 4:

        };
    } while (option != 4);
}

function checkIn() {
    showHeader('Guest Check In');
    let isCheckedIn = false;
    let capNum;
    const name = readString('Guest Name: ');
    do {
        capNum = readInt(`Capsule #[1-${rooms.length}]: `, 1, rooms.length);
        if (rooms[capNum - 1] != 'unoccupied') {
            console.log(`Error :(\nCapsule ${capNum} is occupied`);
        } else {
            isCheckedIn = true;
            rooms[capNum - 1] = name;
        }
    } while (!isCheckedIn);

    console.log(`Success :)\n${name} checked into capsule ${capNum}`);
}

function checkOut() {
    showHeader('Guest Check Out');
    let isCheckedOut = false;
    let capNum;
    let name;
    do {
        capNum = readInt(`Capsule #[1-${rooms.length}]: `, 1, rooms.length);
        if (rooms[capNum - 1] == 'unoccupied') {
            console.log(`Error :(\nCapsule ${capNum} is unoccupied`);
        } else {
            isCheckedOut = true;
            name = rooms[capNum - 1];
            rooms[capNum - 1] = 'unoccupied';
        }
    } while (!isCheckedOut);

    console.log(`Success :)\n${name} checked out of capsule ${capNum}`);
}

function viewGuests() {
    showHeader('Guest List');
    const roomLookup = readInt(`Capsule #[1-${rooms.length}]: `);

    for (let i = roomLookup - 6; i < roomLookup + 5; i++) {
        if (i >= 0 && i < rooms.length) {
            console.log(`${i + 1}: ${rooms[i]}`);
        }
    };
    console.log('');
}

runHotel();