// Task 1

let c = 5;
while (c <= 9) {
    console.log(c);
    c++;
}

// Task 2

for (let i = 0; i < 5; i++) {
    console.log("Tiger");
}

// Task 3

for (let i = 0; i < 69420; i++) {
    if (i % 2 == 0) {
        console.log("Skip")
        continue;
    }

    if (i == 5) {
        console.log("Stop")
        break;
    }
}

// Task 4

function myName(name) {
    console.log(`My name is ${name}`)
}

myName("Giorgi")
myName("Irakli")
myName("Dimitri")

// Task 5

function sum(a, b, c) {
    return a + b + c
}

let sum1 = sum(1, 2, 3);
let sum2 = sum(22, 23, 24);

// Task 6

let informationCard = {
    firstName: "Peter",
    lastName: "Otskheli",
    age: 30,
    contactDetails: {
        homeAddress: "Kutaisi, Chavchavadze st. #39a",
        phoneNumber: "+995 598-765-423"
    }
};

// Task 7

let carDetails = {
    basePrice: 6000,
    options: {
        leatherSeats: 600,
        sunroof: 500,
        navigationSystem: 1000
    },
    calculateTotalPrice: function() {
        console.log(this.basePrice + sum(...Object.values(this.options)))
    }
}

carDetails.calculateTotalPrice()