import { Link } from "react-router-dom";
import HorizontalScrollList from "../Components/HorizontalScrollList"
import MainCategoryList from "./MainContentComponents/MainCategoryList";
import MainHorizontalList from "./MainContentComponents/MainHorizontalList";
import {useState} from 'react'

const MainContent = ({api}) => {

    const [subCatList, setSubCatList] = useState([]);
    const [windowSize, setWindowSize] = useState(0);
    const [load, SetLoad] = useState(0);

    window.onresize = ()=>{
        setWindowSize(document.body.clientWidth);
    }

    window.onload = () => {
        SetLoad(1);
        console.log("dwadaw");
    }

    return (
        <div className="main-content">
            <HorizontalScrollList id="category-list" size={windowSize}>
                <MainCategoryList api={api} load={load} setList={{subCatList, setSubCatList}}/>
            </HorizontalScrollList>

            <HorizontalScrollList id="may-like-list" size={windowSize} title="Może ci się spodobać">
                <MainHorizontalList w="250" h="250" contentType="MayLikeIt"/>
            </HorizontalScrollList>
 
            <HorizontalScrollList id="last-seen" size={windowSize} title="Zobacz jeszcze raz">
                <MainHorizontalList w="250" h="250" contentType="LastSeen"/>
            </HorizontalScrollList> 

            <HorizontalScrollList id="discount" size={windowSize} title="Promocje">
                <MainHorizontalList w="450" h="450" contentType="Discounts"/>
            </HorizontalScrollList> 
            
            <div className="category-tip-on-hover-div">
                <div className="category-tip-on-hover-div-content">
                     
                </div>
            </div>
        </div>
    )
}

export default MainContent;