export const showButtons = (_id, vars) => {
    const maxWidth = document.getElementById(_id).clientWidth;
    const liElements = document.querySelectorAll("#"+_id+" li");
   
    let elCount = liElements.length;
    let elWidth = liElements[0].offsetWidth;
    let elHeight = liElements[0].offsetHeight;
    let showLeftButton = vars.scrollPos < 0 ? 'block' : 'none';
    let showRightButton = vars.scrollPos > -(elWidth+vars.elMargin)*elCount+ maxWidth ? 'block' : 'none';
    let displayForUl = maxWidth > (elWidth+vars.elMargin)*elCount ? "flex" : "block";
    let ulWidth = maxWidth > (elWidth+vars.elMargin)*elCount? "100%" : (elWidth+vars.elMargin)*elCount+'vw';  
    
    let liStyles = {
        transform: `translateX(${vars.scrollPos}px)`,
        width: ulWidth,
        display: displayForUl
    }

    return {
        elCount: elCount, 
        elWidth: elWidth, 
        showLeftButton: showLeftButton, 
        showRightButton: showRightButton, 
        displayForUl: displayForUl, 
        ulWidth: ulWidth, 
        liStyles: liStyles,
        elHeight: elHeight 
    }
}

export const scrollList =  (id, direction, vars)  =>{
    const mainDiv = document.getElementById(id);

    let maxPos = mainDiv.clientWidth;
    let newScrollPos = vars.scrollPos;
    if(vars.scrollPos < 0 && direction=='left')
    {   
        newScrollPos = vars.scrollPos + (vars.elWidth+vars.elMargin);
        if(newScrollPos > 0)newScrollPos = 0;
    }
    else if (vars.scrollPos > -(vars.elWidth+vars.elMargin) * vars.elCount + maxPos && direction=='right'){
        newScrollPos = vars.scrollPos - vars.elWidth-vars.elMargin
        if(newScrollPos < -(vars.elWidth+vars.elMargin)*vars.elCount + maxPos)newScrollPos = -(vars.elWidth+vars.elMargin)*vars.elCount + maxPos; 
    } 
    
    return newScrollPos;
}  