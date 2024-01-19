import {useState} from 'react'
import {DefaultLoginUser} from '../functions/UsersManagementFunctions'
import {withCookies, Cookies} from 'react-cookie'
import AddProductName from './AddProductComponents/AddProductName'
import AddProductPrice from './AddProductComponents/AddProductPrice'
import AddProductImages from './AddProductComponents/AddProductImages'
import AddProductChooseCategory from './AddProductComponents/AddProductChooseCategory'
import AddProductSubmit from './AddProductComponents/AddProductSubmit'
import '../CSS/AddProduct.css'


const AddProduct = ({api, app}) => {

    const [productName, setProductName] = useState("");
    const [productDesc, setProductDesc] = useState("");
    const [productPrice, setProductPrice] = useState("");
    const [choosenCategory, setChoosenCategory] = useState(null); 

    return (
        <div className="add-order">
             <h1>Dodaj produkt</h1>
             <AddProductName setProductName={setProductName} setProductDesc={setProductDesc}/>
             <AddProductImages />
             <AddProductChooseCategory app={app} setCategory={setChoosenCategory}/>
             <AddProductPrice setProductPrice={setProductPrice}/>
             <AddProductSubmit app={app} values={{productName: productName, productDesc: productDesc, productPrice: productPrice, choosenCategory: choosenCategory, user: app.state.Auth.id}}/>
             <br />
             {productName+" "+productDesc+" "+choosenCategory+" "+productPrice}
        </div>
    )
}

const NewAddOrder = withCookies(AddProduct);
NewAddOrder.WrappedComponent === AddProduct;


export default AddProduct;