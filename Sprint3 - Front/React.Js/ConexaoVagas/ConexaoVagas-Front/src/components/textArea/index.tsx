import React, { InputHTMLAttributes } from 'react'

interface InputProps extends InputHTMLAttributes<HTMLTextAreaElement>{
    label:string;
    name:string;
}

const TextArea: React.FC<InputProps> = ({label, name, ...props}) => {
    return (
        <div className={props.className}>
            <label className="font-bold" htmlFor={name}>{label}</label><br/>
            <div className="rounded-md border-2 border-gray-400 w-64 hover:border-gray-500 w-full">
                <textarea {...props}  className="bg-white focus:bg-gray-100 border-0 
                                                        focus:outline-none w-full py-2 px-2 
                                                        appearance-none"
                                       id={name}>
                </textarea>
            </div>
        </div>
    )
}

export default TextArea;