
import {useState} from 'react'
import '../CSS/SearchPage.css'

import LeftFilterBar from './SearchPageComponents/LeftFilterBar';
import MainSearchContent from './SearchPageComponents/MainSearchContent';
import RightCartPreview
 from './SearchPageComponents/RightCartPreview';
const Search = (app) => {

    const [windowSize, setWindowSize] = useState(0);
    
    window.onresize = ()=>{
        setWindowSize(document.body.clientWidth);
    }


    return (
        <div className="search-content">
             <LeftFilterBar />
             <MainSearchContent app={app.app}/>
             <RightCartPreview />
             <div className="clr"></div>
        </div>
    )
}

export default Search;