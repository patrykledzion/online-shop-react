import axios from 'axios';

export const handleSearch = async (app, list, level, cat_arg, arr) => {
    if(arr==null)arr = [];
    let cat = cat_arg;
    cat_arg==null ? cat =  new URLSearchParams(window.location.search).get('cat') : cat=cat_arg;
    const q =  new URLSearchParams(window.location.search).get('q');
    const page =  new URLSearchParams(window.location.search).get('page');

    let url_params = "?";
    cat!=null   ?   url_params+="&cat="+cat     : null;
    q!=null     ?   url_params+="&q="+q         : null;
    page!=null  ?   url_params+="&page="+page   : null;
    let subcategries;
    subcategries = await axios.get(app.app.api.url + app.app.api.suburls.categories+"?subcategory="+cat)
    const productsFromCategories = await axios.get(app.app.api.url+app.app.api.suburls.products.showProducts+url_params);
    if(productsFromCategories.data.res!=69)arr = arr.concat(productsFromCategories.data.res);
    console.log("arr_aft: ", arr);
    for(let i=0;i<subcategries.data.length;i++)
    {
        arr = await handleSearch(app, list, level+1, subcategries.data[i].id, arr)
    } 
    return arr;
}


export const loadCategoryList = async (app) => {
    const categories = await axios.get(app.app.api.url + app.app.api.suburls.categories+"?all")
    let ret = [];
    console.log("Dupa kat: ",categories.data, app.app.api.url + app.app.api.suburls.categories)
    for(let i=0;i<categories.data.length;i++)
    {
        console.log("CAT URL DUPA", app.app.api.url + app.app.api.suburls.categories+"?id="+categories.data[i].subcategory)
        const sub = await axios.get
            (app.app.api.url + app.app.api.suburls.categories+"?all&id="+categories.data[i].subcategory)
        ret.push({
            cat: {
                id: categories.data[i].id,
                name: categories.data[i].name
            },
            subcat:{
                id: sub.data[0]!=null ? sub.data[0].id : null,
                name: sub.data[0]!=null ? sub.data[0].name : null
            }
        })
    }
    console.log(ret);
    return ret;
}