import { useEffect , useState} from "react";
import axios from 'axios'
import {ShowTip, HideTip, CategoryTipListener} from '../../functions/MainFunctions';
import { Outlet, Link } from "react-router-dom";

const MainCategoryList = ({elClass, api, setList}) => {

    const [categoriesFromApi, setCategoriesFromApi] = useState([0]);
    const [windowLoaded, setWindowLoaded] = useState(0);

    const list = [0,1,2,3,4,5,6];
    const img_path = "src/assets/img/"

    useEffect(()=>{
        fetch(api.url+api.suburls.categories)
        .then((response) => response.json())
        .then((actualData) => {
            setWindowLoaded(document.querySelectorAll('.horizontal-category-list').length);
            setCategoriesFromApi(actualData)
        });
   
        const horizontal_li_els = document.querySelectorAll('.horizontal-category-list');
        for(let i=0;i<horizontal_li_els.length;i++)
        {
            horizontal_li_els[i].addEventListener("mouseover",()=>{
                ShowTip(horizontal_li_els[i], api, horizontal_li_els[i].id, setList); 
            })  
        
            horizontal_li_els[i].addEventListener("mouseout",()=>{
                HideTip();
            }) 
        }
  
        CategoryTipListener();
        console.log("loaded"+windowLoaded)
     
    },[windowLoaded]); 
    
    return (
        <>
            {
                
                categoriesFromApi.map((cat)=>{
                    return (
                    <Link to={"/search?cat="+cat.id}>
                    <li id={cat.id} 
                    style={{width: "100px", height: "118px", backgroundImage: "url("+img_path+cat.image+")", backgroundSize: "cover"}} 
                    className="horizontal-li-element horizontal-category-list" 
                    key={"cat"+cat.id}></li>
                    </Link>
                    )
                })
                    
            }
        </>
    )
    
    
    
}

export default MainCategoryList;