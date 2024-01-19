export const AddProduct_GetCategories = (api, id, setData, setHaveData) => {
    let data = [];
    
    //console.log(res);
    const url = id==null ? api.url+api.suburls.categories : api.url+api.suburls.categories+"?subcategory="+id;
    console.log("url:",url);
    fetch(url)
    .then((response) => response.json())
    .then((actualData) => {  
        setData(actualData);
        setHaveData(true);
        return actualData;
    });
}

export const AddProduct_GetCategoriesLocal = (data, id) => {
    
}