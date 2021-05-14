
const asyncUsers = async(url) =>{
    let fetched;
    const data = await fetch(url)
    fetched = await data.json();
    console.log(fetched)
}

asyncUsers("https://api.coindesk.com/v1/bpi/currentprice.json")

