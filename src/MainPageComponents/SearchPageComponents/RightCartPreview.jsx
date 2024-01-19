
import {useState} from 'react'

const RightCartPreview = () => {

    const [windowSize, setWindowSize] = useState(0);
    
    window.onresize = ()=>{
        setWindowSize(document.body.clientWidth);
    }
    let title = 'Kosiarka spalinowa Weibang WB455SC 3W1...';
    let price = 1185.99;
    let count = 1;
    return (
        <div className="right-cart-preview">
            <h2>Koszyk</h2>
            <div className="right-cart-preview-item">
                <span className="right-cart-preview-item-pic"></span>
                <span className="right-cart-preview-item-right">
                    <span className="right-cart-preview-item-title">{title}</span>
                    <span className="right-cart-preview-item-price">{price}</span>
                    <span className="right-cart-preview-item-count">x <input type="number" name='cartitem-1'   /></span>
                </span>
             </div>
             <div className="right-cart-preview-item">
                <span className="right-cart-preview-item-pic"></span>
                <span className="right-cart-preview-item-right">
                    <span className="right-cart-preview-item-title">{title}</span>
                    <span className="right-cart-preview-item-price">{price}</span>
                    <span className="right-cart-preview-item-count">x <input type="number" name='cartitem-1'   /></span>
                </span>
             </div>
             <div className="right-cart-preview-item">
                <span className="right-cart-preview-item-pic"></span>
                <span className="right-cart-preview-item-right">
                    <span className="right-cart-preview-item-title">{title}</span>
                    <span className="right-cart-preview-item-price">{price}</span>
                    <span className="right-cart-preview-item-count">x <input type="number" name='cartitem-1'   /></span>
                </span>
             </div>
        </div>
    )
}

export default RightCartPreview;