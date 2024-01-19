const AddProductName = ({setProductName, setProductDesc}) => {

    return (
        <>
        <h3>Co sprzedajesz?</h3>
        <input type="text" placeholder="Podaj nazwę przedmiotu" name="product_name" className="add-order-name" onChange={(e)=>setProductName(e.target.value)}></input><br />
        <h3>Opisz swój produkt</h3>
        <textarea name="product_desc" id="add-product_product-desc" cols="50" rows="10" onChange={(e)=>setProductDesc(e.target.value)}></textarea>
        </>
    )
};
export default AddProductName;