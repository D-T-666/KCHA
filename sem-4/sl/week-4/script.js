let a = 33;
let b = 26;
let c = "26";

console.log("a == b", a == b);
console.log("b === c", b === c);
console.log("a >= c", a >= c);
console.log("b < c", b < c);
console.log("a > b && b == c", a > b && b == c);
console.log("a == b || c < a", a == b || c < a);

multiply.addEventListener("click", (e) => {
    
    e.preventDefault();
    result.innerText = first.value * second.value;
})

divide.addEventListener("click", (e) => {
    e.preventDefault();
    result.innerText = first.value / second.value;
})


function task3(a, b) {
    return a === 60 || b === 60 || a + b === 60;
}