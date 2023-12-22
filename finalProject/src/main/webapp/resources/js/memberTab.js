async function getSellListFromServer(){
    try {
        const resp = await fetch('/hmember/sell');
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}