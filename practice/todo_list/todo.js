remove = document.getElementById("removebtn")
add = document.getElementById("addtask")
tasklist = document.getElementById('taskslist')

const remove_element = (arg) =>{
    console.log(arg.target)
    console.log('trying to remove: ',arg.parentElement )
    arg.parentElement.remove()
}
//div.insertAdjacentHTML( 'beforeend', str );
const add_task = (arg) =>{
    console.log(arg)
    new_task = document.getElementById("task").value
    tasklist.insertAdjacentHTML( 'beforeend', `<li style = 'display: flex;' ><p>${new_task}</p><button id = 'removebtn' onclick="remove_element(this)">X</button></li>` );
    document.getElementById("task").value = ""
}
//remove.addEventListener("click", remove_element)
add.addEventListener("click", add_task)

