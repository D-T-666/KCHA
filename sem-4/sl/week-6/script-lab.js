// Task 1

let o = {
    a: 10,
    b: false,
    c: "great"
};

for (let k of Object.keys(o)) {
    if (o.hasOwnProperty(k)) {
        console.log(`${k}: ${o[k]}`);
    }
}

console.log("");
// Task 2

let personInfo = {
    name: "Student#9271",
    age: 21,
    city: "Kutaisi"
};

let jobInfo = {
    experience: 69,
    occupation: "Junior front-end dev"
};

let fullInfo = {
    isRetired: false,
    ...personInfo,
    ...jobInfo,
};

for (let k of Object.keys(fullInfo)) {
    console.log(`${k}: ${fullInfo[k]}`);
}

console.log("");
// Task 3

function logMovieInfo({name, producer, duration, budget}) {
    console.log(`Name: ${name}`);
    console.log(`Producer: ${producer}`);
    console.log(`Duration: ${duration}`);
    console.log(`Budget: ${budget}`);
}

logMovieInfo({
    name: "Cats",
    producer: "Tom Hooper",
    duration: 110,
    budget: "$99 million"
});

console.log("");
// Task 4

const celsiusTemperatures = [0, 25, 100, -5, 15];
const farenheitTemperatures = celsiusTemperatures.map(c => (
    c * 1.8 + 32
));
console.log("Celsius:", celsiusTemperatures);
console.log("Farenheit:", farenheitTemperatures);

console.log("");
// Task 6

const products = [
    { name: "Laptop", price: 1200, featured: false },
    { name: "Headphones", price: 150, featured: true },
    { name: "Smartphone", price: 800, featured: false },
    { name: "Camera", price: 1000, featured: true }
];

let featured = products.find(({featured}) => featured);
if (featured) {
    let {name, price} = featured;
    console.log(`Featured product: ${name}, Price: $${price}`);
}

console.log("");
// Task 5

const students = [
    { name: "Alice", score: 92 },
    { name: "Bob", score: 87 },
    { name: "Charlie", score: 95 },
    { name: "David", score: 78 },
    { name: "Emma", score: 90 }
];
const highScores = students.filter(({score}) => score >= 90);
for (let {name} of highScores) {
    console.log(name);
}

console.log("");
// Task 7

const books_original = [
    {
        title: "Noughts & Crosses",
        author: "Malorie Blackman",
        publicationYear: 2001
    },
    {
        title: "Priestdaddy",
        author: "Patricia Lockwood",
        publicationYear: 2017
    },
    {
        title: "The Cost of Living",
        author: "Deboray Levy",
        publicationYear: 2018
    }
];

let books = [...books_original];

let a = books.sort((a, b) => a.title < b.title);
let b = books.sort((a, b) => a.author > b.author);
let c = books.sort((a, b) => a.year < b.year);

let titles = a.map(({title}) => title);
let authors = b.map(({author}) => author);
let publicationYears = c.map(({publicationYear}) => publicationYear);

console.log(titles);
console.log(authors);
console.log(publicationYears);

console.log(`Original: ${books_original}`)
