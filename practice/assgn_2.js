const prompt_sync = require('prompt-sync')
const input = prompt_sync()

const filter_input = (iterable) =>{     
    for (const [i, value] of iterable.entries()) {
        iterable[i] = parseInt(value.trim());
    }
    return iterable;
}

const multiply = (iterables)=>{
    product = 1
    for (const [i, value] of iterables.entries()){
        product*= value
    }
    return product
}

const add = (iterables)=>{
    sum = 0
    for (const [i, value] of iterables.entries()){
        sum += value
    }
    return sum
}

const divide = (iterables)=>{
    answer = iterables[0]
    for (const [i, value] of iterables.splice(1,iterables.length).entries()){
        answer /= value
    }
    return answer
}

const router = (data, method) =>{
    console.log(method(data))
}
while(true){

    numbers = filter_input(input('numbers(space-separated): ').split(' '));
    action  = input('m/a/d: ')

    switch(action){
        case 'm':
            router(numbers, multiply)
            break
        case 'a':
            router(numbers, add)
            break

        case 'd':
            router(numbers, divide)
            break
    }   

}