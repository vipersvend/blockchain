//document.getElementById('grid').children[0]
//document.getElementById('1').parentElement.nextElementSibling

const rotate = () => {
    var current_grid = []
    for(var i=0; i< 3; i+=1 ) {
        console.log('i is: ', i)
        var row = document.getElementById('grid').children[i]
        console.log('row is : ', row)
        var rowgrid = []
        for (j=0; j< 3; j+=1){
            var button = row.children[j]
            rowgrid.push(button.innerHTML)
        }
        current_grid.push(rowgrid)
    }

    console.log('current gird: ', current_grid)

    document.getElementById("1").innerHTML = current_grid[1][0]
    document.getElementById("2").innerHTML = current_grid[0][0]
    document.getElementById("3").innerHTML = current_grid[0][1]
    document.getElementById("4").innerHTML = current_grid[2][0]
    document.getElementById("6").innerHTML = current_grid[0][2]
    document.getElementById("7").innerHTML = current_grid[2][1]
    document.getElementById("8").innerHTML = current_grid[2][2]
    document.getElementById("9").innerHTML = current_grid[1][2]
}

document.getElementById('5').addEventListener("click", rotate)