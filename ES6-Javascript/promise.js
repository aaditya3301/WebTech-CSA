//write a program to check whether we can go to kashmir based on available petrol using promise

function checkPetrol(petrol) {
    return new Promise((resolve, reject) => {
        if (petrol >= 100) {
            resolve("You can go to Kashmir");
        } else {
            reject("You cannot go to Kashmir");
        }
    });}

const availablePetrol = 120;
checkPetrol(availablePetrol)    
    .then(message => console.log(message))
    .catch(error => console.log(error));
