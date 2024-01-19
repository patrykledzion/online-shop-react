const SearchItem = () => {
    let name = 'Kosiarka spalinowa Weibang WB455SC 3W1 z koszem - 8 poziomów koszenia';
    let desc = <><b>Stan: </b>Używany <b>Kategoria: </b>Ogród {'>'} Sprzęt {'>'} Kosiarki</>
    let price = <>1185<sup>99</sup></>;
    let price2 =  <>1299<sup>99</sup></>;
    let bought = 11;
    let rating = 4.5;
    return (
        <div className="search-item">
            <span className="search-item-pic"></span>
            <span className="search-item-title">
                <span className="search-item-row search-item-name">{name}</span>
                <span className="search-item-row search-item-desc">{desc}</span>
                <span className="search-item-row search-item-price">{price}</span>
                <span className="search-item-row search-item-last-row">
                    <span className="search-item-col search-item-price2">Z dostawą {price2}</span>
                    <span className="search-item-col search-item-bought">Kupiło {bought} osób</span>
                    <span className="search-item-col search-item-rating">Ocena: {rating}</span>
                </span>

                
            </span>
            <div className="clr"></div>
        </div>
    )
}

export default SearchItem;