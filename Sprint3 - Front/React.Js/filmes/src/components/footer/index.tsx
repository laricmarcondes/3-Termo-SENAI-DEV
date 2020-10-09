import React from 'react';
import './style.css';
import '../../assets/styles/global.css';
import logonegativo from '../../assets/images/logonegativo.png';

function Footer() {
    return (
        <div>
            <div>
                <footer>
                    <div className="footer-part">

                        <div>
                            <img src={logonegativo} alt="o logo da coletânea" />
                        </div>

                        <div>
                            <hr />
                        </div>

                        <div>
                            <p>Company Inc., 8901 Marmora Road, Glasgow, D04 89GR</p>

                            <p>Call us now toll free: (800)2345-6789</p>

                            <p>Customer support: support@demolink.org</p>

                            <p>Skype: sample-username</p>
                        </div>

                    </div>

                </footer>
            </div>
        </div>
    );
}

export default Footer;