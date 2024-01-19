import '../CSS/HorizontalScrollList.css'
import React, {useEffect, useState, useCallback} from 'react';
import {showButtons, scrollList} from "../functions/HorizontalListFunctions"

const HorizontalScrollList = ({children, id, size, title}) => {
    const [scrollPos, setScrollPos] = useState(0);
    const [showLeftButton, setShowLeftButton] = useState('none');
    const [showRightButton, setShowRightButton] = useState('none');
    const [displayForUl, setDisplayForUl] = useState('flex');
    const [ulWidth, setUlWidth] = useState('100%');
    const [elHeight, setElHeight] = useState('100%');
    const [elWidth, setElWidth] = useState('0');
    const [elCount, setElCount] = useState('0');
    const [listStyles, setListStyles] = useState({})
    const [screenWidth, setScreenWidth] = useState(0);

    const elMargin = 10;


    useEffect(()=>{
        let retVals = showButtons(id, {elMargin: elMargin, scrollPos: scrollPos});
        setElCount(retVals.elCount);
        setElWidth(retVals.elWidth);
        setElHeight(retVals.elHeight);
        setShowLeftButton(retVals.showLeftButton);
        setShowRightButton(retVals.showRightButton);
        setDisplayForUl(retVals.displayForUl);
        setUlWidth(retVals.ulWidth);
        setListStyles(retVals.liStyles);
        console.log("aa")

    },[scrollPos, size])
 
 

    return ( 
        <div className="horizontal-scroll-list" id={id}>
            <h2 className="horizontal-list-title" style={{width: ((elWidth+elMargin)*elCount)+"px"}}>
                {title}
            </h2>
            <ul style={listStyles}>
            {children}
            </ul>
            <button className="list-button-left" onClick={()=>setScrollPos(scrollList(id, 'left', {elWidth: elWidth, elCount: elCount, elMargin: elMargin, scrollPos: scrollPos}))} style={{display: showLeftButton, height: elHeight+"px"}}>{'<'}</button>
            <button className="list-button-right" onClick={()=>setScrollPos(scrollList(id, 'right', {elWidth: elWidth, elCount: elCount, elMargin: elMargin, scrollPos: scrollPos}))}  style={{display: showRightButton, height: elHeight
            +"px"}}>{'>'}</button>
        </div>
    ) 
}

export default HorizontalScrollList;