// function sum(a,b){
//     return a+b;
// }

// let add = function(a,b){
//     return a+b;
// }

function add(){
   let ttotal=0;
   console.log(arguments);
    for(let i=0;i<arguments.length;i++){
        ttotal+=arguments[i];
    }
    console.log(ttotal);
}

console.log(add(1,2));

const sum = (a,b) => a+b;

let a = 10;
let b = 20;

console.log(`The sum of ${a} and ${b} is ${sum(a,b)}`);