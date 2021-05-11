const prompt_sync = require('prompt-sync')
const input = prompt_sync()

var Users = []
const createuser = (name, city, dob, codinglang, softSkills, languages) => {
    return {
        name: name,
        city: city,
        dob: dob,
        skills: {
            codinglang: codinglang,
            softSkills: softSkills,
            languages: languages,
        }
    }
}
const filter_input = (iterable) =>{     
    for (const [i, value] of iterable.entries()) {
        iterable[i] =value.trim();
    }
    return iterable;
}

const get_date = (Dlist) =>{
    for (const [i, value] of Dlist.reverse().entries()) {
        
        Dlist[i] =parseInt(value.trim());
    }

    
    return new Date(Dlist[0], Dlist[1]-1, Dlist[2]+1)
}
const addUser = () =>{
    const name = input("Enter User's Name:")
    const city = input("Enter User's City")
    const dob = get_date(input("Enter User's dob DD/MM/YYYY: ").split('/'))
    const codinglang = filter_input(input("Enter Coding Languages (comma separated): ").split(','))
    const softSkills = filter_input(input("Enter Soft Skills (comma separated): ").split(','))
    const spokenLanguages = filter_input(input("Enter Spoken Langs (comma separated): ").split(','))
    Users.push(createuser(name, city, dob, codinglang, softSkills, spokenLanguages ));
    console.log('User added successfully')
    console.log(Users)
}


const UpdateUser = () =>{
    userName = input('Enter userName: ')
    key = input(' Enter key: ')
    value = input(' Enter Value: ')
    for(const [index, userObj] of Users.entries()) {
       if(userObj.name == userName){
        userObj[key] = value
        Users[index] = userObj
        return "Update Successful"
       }
    }
    return "User Not Found"
}

const GetUser = () =>{
    userName = input('Enter userName: ')

    for(const [index, userObj] of Users.entries()) {
        if(userObj.name == userName){
         return userObj
        }
     }
     return "User Not Found"
}

const GetFirstLanguage = () =>{
    userName = input('Enter userName: ')
    for(const [index, userObj] of Users.entries()) {
        if(userObj.name == userName){
         return userObj.skills.codinglang[0]
        }
     }
     return "User Not Found"
}

const RemoveUser = () =>{
    userName = input('Enter userName: ')
    for(const [index, userObj] of Users.entries()) {
        if(userObj.name == userName){
         Users.splice(index,1)
         return "Removed!"
        }
     }
     return "User Not Found"
}

while(true){

    user_input = input(' 1. Add User\n 2. Update User \n 3. Get User \n 4. GetFirstLanguage \n 5. Remove User \n 6. Quit :')
    switch(parseInt(user_input)){
        case 1:
            addUser()
            break
        case 2:
            console.log(UpdateUser())
            break
        case 3:
            console.log(GetUser())
            break
        case 4:
            console.log(GetFirstLanguage())
            break
        case 5:
            console.log(RemoveUser())
            break
        case 6:
            break;
        
        default:
            console.log('Wrong Input')
    }
    if(user_input =='5'){
        break
    }
}
addUser()
