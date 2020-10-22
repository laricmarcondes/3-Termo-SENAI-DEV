import React, {InputHTMLAttributes} from 'react';
import '../../components/input/style.css';

interface InputProps extends InputHTMLAttributes<HTMLInputElement>{
    label:string;
    name:string;
}

const Input: React.FC<InputProps> = ({label, name, ...rest}) => {
    return (
        // <div className="w-340 h-47 pl-650 rounded-4 border-3 p-3">
        <div>
            <label htmlFor={name}>{label}</label><br/>
            <input type="text" id={name}{...rest}></input>
        </div>
    );
}

export default Input;