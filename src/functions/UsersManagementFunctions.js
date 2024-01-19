import axios from 'axios'
import {useCookies, Cookies} from "react-cookie"

const SetLoginCookie = (user, app, setLoginError) => {
    if(user[0]===undefined)
    {
        setLoginError({msg: "Błędne dane logowania", color: "red"})
        return 1;
    }
    user = user[0][0];
    app.state.cookies.set("Auth", user)
     
    setLoginError({msg: "Pomyślnie zalogowano!", color: "green"})
    setTimeout(()=>{app.setState({Auth: app.state.cookies.get("Auth")})}, 1500)
    return 0;
}

export const DefaultLoginUser = (email, password, api, app, setLoginError) => {
    let data = new FormData();
    data.append('email', email);
    data.append('password', password);

    axios.post (
        api.url+api.suburls.users.loginUser, data)
        .then(response => SetLoginCookie(response.data, app, setLoginError))
}