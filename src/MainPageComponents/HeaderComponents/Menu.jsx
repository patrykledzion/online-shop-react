import { Outlet, Link } from "react-router-dom";

const Menu = () =>{
    return (
        <nav>
           
           <Link to="/add-order" className="header-link-long"> + Sprzedaj</Link>
           <Link to="/cart">C</Link>
           <Link to="/account">A</Link>
           <Outlet />
        </nav>
    )
}

export default Menu;