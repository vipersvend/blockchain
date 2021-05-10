"use strict";
const ps = require("prompt-sync");

const message = (type_user) =>{
    switch(type_user){
        case 1:
            return ' for your validation'
            break
        case 2:
            return ' for keeping the network secure'
            break
        case 3:
            return ' for using our portal'
            break
    }
}

const genOutput = (userType, firstName, lastName) =>{

    return"Thank You "+firstName+' '+lastName + message(userType)
}

const prompt = ps();
let userType = prompt("UserType: ");
let firstName = prompt("FirstName: ");
let lastName = prompt("LastName: ");

console.log(genOutput(parseInt(userType), firstName, lastName));
