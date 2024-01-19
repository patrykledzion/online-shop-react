
import {useEffect, useState} from 'react'
import SearchItem from './SearchItem';
import { handleSearch, loadCategoryList } from '../../functions/SearchFunctions';

const MainSearchContent = (app) => {

    const [productList, setProductList] = useState([]);
    const [categoryList, setCategoryList] = useState([]);
    const [productListIsSet, setProductListIsSet] = useState(0)

    useEffect(()=>{
        const fetchData = async () =>{
            let arr = await handleSearch(app, {list: productList, setList: setProductList, setDone: setProductListIsSet}, 0, null, null);
            let cat_arr = await loadCategoryList(app);
            setProductListIsSet(1); 
            setProductList(arr);       
            setCategoryList(cat_arr);
        }
        fetchData();
        console.log("Products list: ",productList)
    },[productListIsSet])

    return (
        <div className="main-search-content">
            {   
                productList.length > 0 ?
                    productList[0]!="69" ?
                        productList.map(e=>{
                            return (<div key={"shopitem_"+e.id} className='main-search-item'>
                                {e.name+" "} 
                                {
                                categoryList.filter(c=>c.subcat.id==0).length > 0 ?
                                    categoryList.filter(c=>e.category_id==c.subcat.id)[0].subcat.name+" > "
                                :
                                null
                                }

                                {
                                    categoryList.filter(c=>e.category_id==c.cat.id).length > 0?
                                        categoryList.filter(c=>e.category_id==c.cat.id)[0].subcat.name!=null ?
                                            categoryList.filter(c=>e.category_id==c.cat.id)[0].subcat.name + " > "
                                        : null
                                    :null

                                }

                                {
                                categoryList.filter(c=>e.category_id==c.cat.id).length > 0 ?
                                    categoryList.filter(c=>e.category_id==c.cat.id)[0].cat.name+" "
                                :
                                null
                                }
                                {e.price}
                                
                            </div>)  
                        }
                ) : null
                : null
            }
        </div>
    )
}

export default MainSearchContent;