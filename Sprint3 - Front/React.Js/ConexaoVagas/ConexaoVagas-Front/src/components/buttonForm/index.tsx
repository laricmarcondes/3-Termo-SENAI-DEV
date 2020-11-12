import React from 'react';
import './style.css';

function ButtonForm (props: any)  {
    return(
        <div>
            <input {...props} type="submit" className={"ButtonAreaForm focus:outline-none cursor-pointer " + props.className}>
                {props.children}
            </input>
        </div>
    );
}

export default ButtonForm;
