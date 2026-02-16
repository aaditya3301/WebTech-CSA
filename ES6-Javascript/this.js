//this object

const user = {
    name: "Aaditya",
    age: 20,
    welcome : function(){
        console.log(`${this.name},welcome to EC6`);
        console.log(this);
    }
}

user.welcome()

//outer function

// function outer(){
//     let x = 10;
//     console.log("outer :", x);

//     function inner(){
//         console.log("inner :", x);
//     }
//     inner();
// }

// outer()

let a =5;

function outer(){
    let b =10;
    function inner(){
        let c = 10;
        console.log(a,b,c);
    }
    inner();
}

outer();

