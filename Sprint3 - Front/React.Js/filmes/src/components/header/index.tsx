import React from 'react';
import './style.css';
import '../../assets/styles/global.css';
import logo from '../../assets/images/logo.png';

function Header() {
    return (
        <div className="principal">
            <div className="header">
                <nav>
                    <img src={logo} alt="o logo da coletânea"/>
                </nav>
            </div>
        </div>
    );
}

export default Header;