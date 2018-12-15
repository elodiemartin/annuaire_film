window.onload = () => {
    const allCard = document.querySelectorAll("div[data-id]");
 
    // Pour chaque card ayant un ID (id film récupérer en BDD et intégrer en TWIG)
    allCard.forEach((card) => {
      /*  console.log(card)*/
      	let currentCard = card;
        let currentId = card.getAttribute("data-id");
        if (currentId != null && currentId != undefined && currentId != "0") {
            askBackgroundForCard(currentId, currentCard);
        }
    })


    // Demande le bon fond (affiche) pour la cardDiv ayant comme Id, cardId.
    function askBackgroundForCard(cardId, cardDiv) {
        fetch(`http://elodie-martin.com/annuaire_film/index.php?askImg=${cardId}`)
            .then((res) => { return res.json() })
            .then((res) => {
                cardDiv.style.backgroundImage = `url(annuaire_film/${res.path})`;

            })
            .catch((err) => { if (err) throw err; })
    }


    
}

const mycard = document.querySelectorAll('.mycard');
mycard.forEach(function(element) {
    element.addEventListener('click', function (e) {
        e.preventDefault();
        const currentElement = e.target;
        let url = "";
        switch (currentElement.tagName) {
            case 'DIV':
                url = currentElement.dataset.url;
                document.location.href=url;
                break;
            
            case 'P':
                url = currentElement.parentNode.dataset.url;
                document.location.href=url;
                break;

            case 'A':
                url = currentElement.getAttribute('href');
                document.location.href=url;
                break;
        
            default:
                break;
        }
        
    });
});