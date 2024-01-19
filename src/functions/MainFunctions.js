export const handleSearchCat = (s)=> {
    alert(c.cat);
}

const LoadCategoriesToTipFromApi = (api, id, list) => {
    let data = [];

    let categoryName = "";
    let res = 0;
    
    //console.log(res);
    fetch(api.url+api.suburls.categories+"?id="+id)
    .then((response) => response.json())
    .then((actualData) => {   
        data = actualData;
        //res = actualData.length;
        categoryName = data[0].name;
        fetch(api.url+api.suburls.categories+"?subcategory="+id)
        .then((response) => response.json())
        .then((actualData) => { 
            data = actualData;
            if(data.length > 0)
                document.querySelector(".category-tip-on-hover-div div").innerHTML = '<h3 class="tip-border-bottom">'+categoryName+'</h3>';
            else
                document.querySelector(".category-tip-on-hover-div div").innerHTML = '<h3>'+categoryName+'</h3>';
            
            let els = [];
            
            let ul = document.createElement('ul');
            //list.setList([]);
             
            for(let i=0;i<data.length;i++)
            {
                let _el = document.createElement('li');
                _el.innerHTML = data[i].name;
                ul.appendChild(_el);
                console.log(data[i].name, list.subCatList);
                //dataToSend.add({name: data[i].name, id: data[i].id});
            } 

            //list.setList(dataToSend);
            document.querySelector(".category-tip-on-hover-div div").appendChild(ul);
            
        });
    });
}

export const ShowTip = async (_el, api, id, setList) => {
    let rect = _el.getBoundingClientRect()
    let t = rect.top;
    let l = rect.left;
    let h = rect.height;
    let w = rect.width;

    document.querySelector(".category-tip-on-hover-div").classList.add("category-tip-on-hover-div-display");
    document.querySelector(".category-tip-on-hover-div").style.left = l+"px";
    document.querySelector (".category-tip-on-hover-div").style.top = (t+h)+"px";
    //console.log(t,l,w, h, id)
    LoadCategoriesToTipFromApi(api, id, setList);
} 
 
export const ShowTipSelf = (api) =>  {
    document.querySelector(".category-tip-on-hover-div").classList.add("category-tip-on-hover-div-display");
}
 
export const CategoryTipListener = (api) => {

    document.querySelector(".category-tip-on-hover-div").addEventListener("mouseover",()=>{
        ShowTipSelf(api);
    })
    
    document.querySelector(".category-tip-on-hover-div").addEventListener("mouseout",()=>{
        HideTip();
    })
    // console.log("dwada")
}

export const HideTip = () => {
    document.querySelector(".category-tip-on-hover-div").classList.remove("category-tip-on-hover-div-display");
}

