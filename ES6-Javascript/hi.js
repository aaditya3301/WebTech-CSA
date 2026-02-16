console.log("Hello, World!");
let hello = 25;
console.log("Marks:", hello);

let x =12;
{
    let x = 33;
    console.log(x);
}
console.log(x);

const arr = [1, 2, 3];
arr.push(4);
arr[3] = 5;
console.log(arr);

// arr = [5, 6, 7]; // This will throw an error

let show1 = function() {
    console.log("Function Expression");
}

let show2 = () => {
    console.log("Arrow Function");
}

let add = (num1, num2) => num1 + num2;

show1();
show2();
console.log("Sum:", add(5, 10));

let sum = (a, b=50) => {
    let result =0;
    result = a + b;
    return result;
}
console.log("Sum with default:", sum(20));

class Student{
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
}

let students = [
    new Student("John", 22),
    new Student("Jane", 24),
    new Student("Doe", 20),
    new Student("Smith", 23),
    new Student("Emily", 21)
];

let marks = students.map(student => student.age);
marks.sort((a,b) => b-a);

const fourthHighest = marks[3];
console.log("Marks:", fourthHighest);


let finder = function(num){
    if(num%2 == 0){
        console.log("Even");
    }
    else{
        console.log("Odd");
    }
}
finder(50);

let greater = (a, b) => {
    if(a > b){
        console.log(a + " is greater");
    }
    else{
        console.log(b + " is greater");
    }
}
greater(10, 20);
let ternary = (a, b) => a > b ? console.log(a + " is greater") : console.log(b + " is greater");
ternary(30, 15);

//WAP for makeing a simple calculator using switch case
let calculator = (num1, num2, operator) => {
    switch(operator){
        case '+':
            console.log("Sum:", num1 + num2);
            break;
        case '-':
            console.log("Difference:", num1 - num2);
            break;
        case '*':
            console.log("Product:", num1 * num2);
            break;
        case '/':
            console.log("Quotient:", num1 / num2);      
            break;
        default:
            console.log("Invalid operator");
    }
}
calculator(20, 10, '+');