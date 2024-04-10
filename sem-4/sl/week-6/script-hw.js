// Task 1
{
    const obj = {
        age: 19,
        hobby: "not this",
        loves: "not this",
        hates: "this", 
        name: "Dimitri"
    };

    for (let name in obj) {
        console.log(name);
    }
}

// Task 2
{
    const arr = [{age: 16}, {age: 17}, {age: 18}];
    
    arr.sort((a, b) => a.age - b.age); // Ascending
    console.log(arr);
    
    arr.sort((a, b) => b.age - a.age); // Descending
    console.log(arr);
}
    
// Task 3
{
    function swapKeysAndValues(obj) {
        const newObj = { ...obj };
        
        for (const key in newObj) {
            const value = newObj[key];
            delete newObj[key];
            newObj[value] = key;
        }
        
        return newObj;
    }
    
    console.log(swapKeysAndValues(obj));
}

// Task 4
{
    const arr = [4, 2, 3, 5, 1, 6];
    const target = 5;
    
    let res = -1;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] == target) {
            res = i;
            break;
        }
    }

    console.log(res);
}

// Task 5
{
    
}

