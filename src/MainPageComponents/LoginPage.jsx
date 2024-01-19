import {useState} from 'react'
import {DefaultLoginUser} from '../functions/UsersManagementFunctions'
import {withCookies, Cookies} from 'react-cookie'
import '../CSS/LoginPage.css'


const LoginPage = ({api, app}) => {

    const [loginError, setLoginError] = useState({msg: "", color: "red"});
    const SubmitLoginForm = () => {
        const email = document.login_form.email.value;
        const password = document.login_form.password.value;

        if(email.trim()=="" || password.trim()=="")
        {
            setLoginError("Wprowadź dane logowania");
            return;
        }
        console.log(app.state.AuthID)
        DefaultLoginUser(email, password, api, app, setLoginError);

    }

    return (
        <div className="login-page">
            {app.state.Auth!==null ? <Navigate replace to="/account" /> : <></>}

            <form action="#" name="login_form" className='login-page-form'>
                <h2>Zaloguj się </h2>
                <input type="email" name="email" className="login-page-email" />
                <input type="password" name="password" className="login-page-password" />
                <input type="button" className="login-page-button" value="Zaloguj sie" onClick={()=>{SubmitLoginForm()}}/>
                <p style={{color: loginError.color}}>{loginError.msg}</p>
            </form>
        </div>
    )
}

const NewLoginPage = withCookies(LoginPage);
NewLoginPage.WrappedComponent === LoginPage;


export default LoginPage;