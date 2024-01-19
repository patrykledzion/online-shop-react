import { useEffect , useState } from "react";
import {AddProduct_GetCategories} from "../../functions/AddProductFunctions"

const AddProductChooseCategory = ({app,setCategory}) => {
    const [data, setData] = useState([]);
    const [haveData, setHaveData] = useState(false);
    const [subcategory, setSubcategory] = useState(null);
    const [catTree, setCatTree] = useState([null]);
    const [choosenCategory, setChoosenCategory] = useState(null);

    const changeSubcategory = (id) => {
        setSubcategory(id);
        setCatTree([...catTree, id]);
    }

    const backCategory = () => {
        catTree.map((c, key) => console.log(key, c));
        setCatTree(catTree.filter((c, key) => key!=catTree.length - 1));
        setSubcategory(catTree[catTree.length - 2]);
    }

    const chooseCategory = (id, subId) => {
        console.log("ID", subId);
        const subCat = subId!=null ? data.filter(c=>c.id==subId)[0].name + ' > ': ''
        const cat = data.filter(c=>c.id==id)[0].name;
        setChoosenCategory([id, subCat+cat] );
        setCategory(id);
    }

    useEffect(()=>{
        AddProduct_GetCategories(app.api, -1, setData, setHaveData);
        if(data!=null)
        {
            console.log(data.length);
        }
        counter = 0;
    }, [haveData, subcategory])

    let counter = 0;

    return ( 
        <div className="add-product-choose-category">
            <h2>Wybierz kategorię: {choosenCategory!=null?choosenCategory[1] : ''}</h2>
            <ul className="add-prodduct-categories">
                <li key={"Category_back"} onClick={()=>{ backCategory() }}>{catTree.length > 1 ? "< "+data.filter(c=>c.id==catTree[catTree.length - 1])[0].name : null}</li>
                {
                data.filter(c=>c.subcategory==subcategory).length > 0 ?
                    data.map((c)=>{
                        if(c.subcategory==subcategory) 
                        {
                            counter++;
                            return <li key={"Category_"+c.id} onClick={()=>{ changeSubcategory(c.id) }}>{c.name}</li>
                        }    
                    })
                    :
                    <li key={"Category_choose"} onClick={()=>chooseCategory(catTree[catTree.length - 1], catTree[catTree.length - 2])}>Wybierz</li>
                }
            </ul> 
        </div>
    ) 
};
export default AddProductChooseCategory;