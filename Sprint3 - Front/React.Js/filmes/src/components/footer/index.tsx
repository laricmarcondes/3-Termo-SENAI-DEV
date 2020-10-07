import React from 'react';
import './style.css';
import '../../assets/styles/global.css';
import logonegativo from '../../assets/images/logonegativo.png';

function Footer() {
    return (
        <div className="principal">
            <div className="footer">
                <footer>
                    <img src={logonegativo} alt="o logo da coletânea"/>
                </footer>
            </div>
        </div>
    );
}

export default Footer;