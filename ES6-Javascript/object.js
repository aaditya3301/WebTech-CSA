let myObj = {
    name : "Aaditya",
    age : 20,
    key : "value"
}

myObj.name = "Aaditya Kumar";

let {name, age:CurrentAge} = myObj;
console.log(name);
console.log(CurrentAge);

let empoloyee = {
    name : "Aaditya",
    age : 20,
    empID : 12345,
    company : "Google"
}

//copy of this object to myEmployee
let myEmployee = {...empoloyee};
myEmployee.name = "Aaditya Kumar";
console.log(myEmployee);
console.log(empoloyee);