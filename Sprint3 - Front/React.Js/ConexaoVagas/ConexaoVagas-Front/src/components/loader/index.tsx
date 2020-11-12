import React, {InputHTMLAttributes} from 'react';
import '../../components/loader/style.css';

function Loader(props: any) {
    return (
        <div className={"loader ease-linear rounded-full border-8 border-t-8 border-gray-300 h-20 w-20 " + props.className}></div>
    )
}

export default Loader;