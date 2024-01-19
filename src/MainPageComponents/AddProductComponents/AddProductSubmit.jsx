const AddProductSubmit = ({app, values}) => {

    const submitOrder = () => {
        console.log(values);
        const url = "?name="+       values.productName+
                    "&desc="+       values.productDesc+
                    "&price="+      values.productPrice+
                    "&category="+   values.choosenCategory+
                    "&user="+       values.user;
        fetch(app.api.url+app.api.suburls.products.addProduct+url)
        .then((response) => response.json())
        .then((actualData) => {
            console.log("res",actualData);
        });
    }

    return (
        <input type="button" value="Dodaj przedmiot" onClick={()=>submitOrder()}></input>
    )
};
export default AddProductSubmit;