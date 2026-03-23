// let a=10;
// console.log(typeof a);


// let obj={
//     age:10,
//     "name":"harsh",
//     greet:function(a,b){
//         return a+b;
//     }
// }
// obj.rollno=1; //create
// console.log(obj);
// console.log(obj.greet(10,20));
// console.log(obj.age); //read
// obj.age=11;
// console.log(obj);
// delete obj.age;
// console.log(obj);


// let x1=Boolean(0);
// let x2=Boolean(-0);
// let x3=Boolean(undefined);
// let x4=Boolean(null);
// let x5=Boolean(NaN);
// let x6=Boolean("");
// let x7=Boolean(false);
// let x8=Boolean(1);
// let x9=Boolean(2);
// let x10=Boolean("");

// console.log(x1,x2,x3,x4,x5,x6,x7);
// console.log(x8,x9,x10);


// let arr=[1,2,3,4];
// let arr1=[1,true,"harsh"];
// console.log(arr[0]);
// console.log(arr1[1]);
// console.log(arr);
// arr[1]=4;
// console.log(arr);
// console.log(arr[4]);


// let arr=[1,4,3,2,4,4,1,2];
// console.log(arr.indexOf(4));
// console.log(arr.indexOf(4,4));
// console.log(arr.includes(4));
// console.log(arr.includes(4,6));
// console.log(arr.lastIndexOf(4));


// let arr=[1,2,3,2,4,4,1,2];

// let ele1=arr.find((element,index,arr)=>element%2==0);
// let ele2=arr.find((element,index,arr)=>element>2);
// let ele3=arr.find((element,index,arr)=>element>=3);
// console.log(ele1);
// console.log(ele2);
// console.log(ele3);

// let idx1=arr.findIndex((element,index,arr)=>index%2==0);
// let idx2=arr.findIndex((element,index,arr)=>element>2);
// let idx3=arr.findIndex((element,index,arr)=>element>=3);
// console.log(idx1);
// console.log(idx2);
// console.log(idx3);


// let arr=[1,2,3,2];
// let arr1=[[1,2],[3,4]];

// let ele=arr.reduce((accumulator,element,index,arr)=>accumulator+element);
// let ele1=arr.reduce((accumulator,element,index,arr)=>accumulator-element);
// let newArr2=arr1.reduce((accumulator,element,index,arr)=>accumulator.concat(element));

// console.log(ele);
// console.log(ele1);
// console.log(newArr2);

// let arr=[1,2,3,4,1,2];

// arr.splice(3,2,5,6,7);
// console.log(arr);

// // To insert element at position 3
// arr.splice(3,0,9);
// console.log(arr);

// // To delete element at position 3
// arr.splice(3,1);
// console.log(arr);

// // To replace element at position 3
// arr.splice(3,1,9);
// console.log(arr);


// let arr=[1,2,3];

// arr.forEach((element,index,arr)=>{
//     console.log(element+" "+index);
// });



// let arr=[1,0,11,10,20,22,32,4];

// arr.sort();
// console.log(arr);

// arr.sort((a,b)=>a-b);
// console.log(arr);

// arr.sort((a,b)=>b-a);
// console.log(arr);


setTimeout(()=>{console.log("Helllo");},2000);