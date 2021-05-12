method = (num) =>{
    try{
        return num.xyz;
    }
    catch(error){
        console.log("Wrong Input")
        return -1;
    }
}

fetchApi = () =>{
    try{
        console.log(fetch('https://jsonplaceholder.typicode.com/users'));
    }
    catch(error){

    }
}

fetchApi()