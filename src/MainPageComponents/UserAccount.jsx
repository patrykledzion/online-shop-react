import react, { useState, useEffect} from 'react'
import { Navigate } from 'react-router-dom'
import axios from 'axios'

const UserAccount = (app) => {

    const [user, setUser] = useState({});
    const [windowLoaded, setWindowLoaded] = useState({});

    useEffect(()=>{
        let data = new FormData();
        data.append('id', app.app.state.Auth.id);

        axios.post (
            app.app.api.url+app.app.api.suburls.users.getData, data)
            .then(response => {
                setWindowLoaded(document.querySelectorAll('.horizontal-category-list').length);
                setUser(response.data[0][0])
                console.log(user)
            })
  

        console.log("loaded"+windowLoaded)
     
    },[windowLoaded]); 

    const Logout = (app) =>{
        console.log(app.state.cookies.get("Auth"));
        app.state.cookies.set("Auth", null)
        app.setState({Auth: app.state.cookies.get("Auth")})
       return 0;
    }

    return (
        <div className="user-account">
            {app.app.state.Auth===null ? <Navigate replace to="/login"/> : <></>}
            <p style={{color: "#fff"}}>Witaj, <b>{user.name} {user.lastname}</b></p>
            <button onClick={()=>Logout(app.app)}>Log out</button>
        </div>
    )

}

export default UserAccount;