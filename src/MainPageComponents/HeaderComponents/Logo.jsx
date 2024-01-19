import { Outlet, Link } from "react-router-dom";

const Logo = () =>{
    return (
        <>
        <Link to="main">
            <h1 className="logo">ebazarek.pl</h1>
        </Link>
        <Outlet />
        </>
    )
}

export default Logo;