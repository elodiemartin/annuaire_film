
console.log("JAVASCRIPT OK");
let grocery = [];
let text = document.querySelector("#autoComplete"); 
 console.log(text);

if (document.querySelector("#autoComplete").value.length > 3) {
 // fetch(`annuaire_films/index.php?autocomplete='${text}'`)
 //     .then((res) => {
 //         return res.text();
 //     })
 //     .then((res) => {

 //    })
 //     .catch((err) => {
 //         if (err) { log(err); };
 //     })
 // }


    fetch(`annuaire_films/index.php?askArray`)
        .then((res) => {
            return res.json();
        })
        .then((res) => {
        	console.log(res);
        	for (let elem of res["films"]) {
        		grocery.push(elem.title);

        	}
        })
        .catch((err) => {
            if (err) { console.log(err); };
        })

}


// The app instance creator
 new autoComplete({
    dataSrc: grocery, // Array data source
    placeHolder: "Try me...", // Place Holder text
    placeHolderLength: 26, // Max placeholder length
    maxResults: 10, // Max number of results
    highlight: true, // Highlight matching results	
     dataAttribute: {
         tag: "set", // Data attribute tag
         value: "value" // Data attribute value
     },
    onSelection: value => { // Action script onClick event
        document.querySelector(".selection").innerHTML = value.id;
    }
 });