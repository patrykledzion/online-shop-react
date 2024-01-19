const SearchBar = () =>{
    return (
        <form className="search-bar" name="header_search_form"> 
            <input type="text" name="header_search_input" placeholder="Czego szukasz..."/>
            <input type="button" id="header_search_button" value=">" onClick={()=>{Search()}}/>
        </form>
    )
}

export default SearchBar;