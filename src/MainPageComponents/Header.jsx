import Logo from "./HeaderComponents/Logo"
import SearchBar from "./HeaderComponents/SearchBar"
import Menu from "./HeaderComponents/Menu"

const Header = () => {

    return (
        <header className="header">
            <Logo />
            <SearchBar />
            <Menu />
        </header>
    )
}

export default Header;