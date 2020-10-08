import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';

function Home() {
    return (
        <div >
            <Header description="Conheça nossa coletânea"/>
            <div className="centro">
                <div className="home">
                <h1>Home</h1>
                </div>
            </div>
            <Footer/>
        </div>
    );
}

export default Home;