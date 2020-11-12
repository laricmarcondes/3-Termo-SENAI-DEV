import React from 'react';
import './style.css';

function Button (props: any)  {
    return(
        <div>
            <button {...props} type="button"
                                className={"ButtonArea focus:outline-none " + props.className}>
                {props.children}
            </button>
        </div>
    );
}

export default Button;
