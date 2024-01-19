
import {useState} from 'react'

const LeftFilterBar = () => {

    const [windowSize, setWindowSize] = useState(0);
    
    window.onresize = ()=>{
        setWindowSize(document.body.clientWidth);
    }

    return (
        <div className="left-filter-bar">
            <h2>Filtry</h2>
            <form className="left-filter-section">
                <span className="left-filter-section-header">Kategoria</span>
                <ul className='left-filter-section-list'>
                    {/* <li><input type="checkbox" name='type_filtertype' value='kat_filterid' id='fil-type-id'/>Kategoria 1</li> */}
                    <li><input type="checkbox" name='type_1' value='fil_1' id='fil-1-1'/><label for='fil-1-1'>Kategoria 1</label></li>
                    <li><input type="checkbox" name='type_1' value='fil_2' id='fil-1-2'/><label for='fil-1-2'>Kategoria 2</label></li>
                    <li><input type="checkbox" name='type_1' value='fil_3' id='fil-1-3'/><label for='fil-1-3'>Kategoria 3</label></li>
                </ul>
            </form>
            <form className="left-filter-section">
                <span className="left-filter-section-header">Marka</span>
                <ul className='left-filter-section-list'>
                    {/* <li><input type="checkbox" name='type_filtertype' value='kat_filterid' id='fil-type-id'/>Kategoria 1</li> */}
                    <li><input type="checkbox" name='type_2' value='fil_1' id='fil-2-1'/><label for='fil-2-1'>Marka 1</label></li>
                    <li><input type="checkbox" name='type_2' value='fil_2' id='fil-2-2'/><label for='fil-2-2'>Marka 2</label></li>
                    <li><input type="checkbox" name='type_2' value='fil_3' id='fil-2-3'/><label for='fil-2-3'>Marka 3</label></li>
                </ul>
            </form>
            <form className="left-filter-section">
                <span className="left-filter-section-header">Model</span>
                <ul className='left-filter-section-list'>
                    {/* <li><input type="checkbox" name='type_filtertype' value='kat_filterid' id='fil-type-id'/>Kategoria 1</li> */}
                    <li><input type="checkbox" name='type_3' value='fil_1' id='fil-3-1'/><label for='fil-3-1'>Model 1</label></li>
                    <li><input type="checkbox" name='type_3' value='fil_2' id='fil-3-2'/><label for='fil-3-2'>Model 2</label></li>
                    <li><input type="checkbox" name='type_3' value='fil_3' id='fil-3-3'/><label for='fil-3-3'>Model 3</label></li>
                </ul>
            </form>
        </div>
    )
}

export default LeftFilterBar;