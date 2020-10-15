// import React, {ButtonHTMLAttributes} from 'react';
// import '../../components/button/style.css';

// interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement>{
//     value: string;
//     onClick: any;
// }

// const Button: React.FC<ButtonProps> = ({value, onClick}) => {
//     return (
//         <div className="btn">
//             <button onClick={onClick}>
//                 {value}
//             </button>
//         </div>
//     );
// }

// export default Button;

import React from 'react';
import './style.css';

interface ButtonProps {
    value: string;
}
const Button: React.FC<ButtonProps> = ({ value}) => {
    return (

        <input className="button" type="submit" value={value}  />

    );
}

export default Button;