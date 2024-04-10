// Task 1

let inputA = document.createElement("input");
let inputB = document.createElement("input");
inputA.type = "number";
inputB.type = "number";
let multiply = document.createElement("button");
multiply.innerText = "multiply";
multiply.addEventListener("click", (e) => {
    e.preventDefault();
    result.innerText = inputA.value * inputB.value;
})
let divide = document.createElement("button");
divide.innerText = "divide";
divide.addEventListener("click", (e) => {
    e.preventDefault();
    result.innerText = inputA.value / inputB.value;
})
let result = document.createElement("span");
let div = document.createElement("div");
div.appendChild(inputA);
div.appendChild(inputB);
div.appendChild(multiply);
div.appendChild(divide);
div.appendChild(result);
document.body.appendChild(div);

// Task 2

function average(marks) {
    let a=marks.reduce((a,c)=>a+c,0) / marks.length;
    return a>50?"ABCDE"[10-a/10]:"F";
}

console.log(average([90, 10, 50, 100, 100]));

// Task 3

let user = {
    name: "Donald Knuth",
    hobbies: {
        indoor: ["dancing", "painting", "knitting"],
        outdoor: [],
    },
    age: 69,
    music_genre: "Bop"
};

console.log(user.name);
console.log(user.hobbies.indoor);
let age = user.age;
console.log(age);
console.log(user.music_genre);

// Task 4

let student = {
    age: 20,
    name: "Giorgi"
};

student.age++;
student.grade = "A-";

// console.log(student);

// Task 5

let i=(a,w)=>a*(9-w)/10;