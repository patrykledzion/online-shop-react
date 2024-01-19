import { useEffect, useState } from "react";
import '../../CSS/MainHorizontalList.css'
const MainHorizontalList = ({w, h, contentType}) => {

    const list = [0,1,2,3,4,5,6,7];
    const [title, setTitle] = useState("");
    const SetContent = () => {
        switch(contentType)
        {
            case 'MayLikeIt': 
                setTitle("Może ci się spodobać");
        }
    }

    useEffect(()=>{
        SetContent();
    })

    return (
        <>
            {
                list.map((el)=>{
                    return <li style={{width: w+"px", height: h+"px"}} className="horizontal-li-element" key={contentType+el}>{w}</li>
                })
            }
        </>
    )
}

export default MainHorizontalList;