const AddProductPrice = ({setProductPrice}) => {

    const checkPrice = (e) => {
        const val = e.target.value; 
        const ch = e.nativeEvent.data;
         
        //CHECK INPUT
        setProductPrice(e.target.value)
    }

    return (
        <input type="text" placeholder="Podaj cenę" name="product_price" className="add-order-price" onChange={(e)=>checkPrice(e)}></input>
    )
};
export default AddProductPrice;