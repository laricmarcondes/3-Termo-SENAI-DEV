import React from 'react';
import Input from '../../components/input/index'


function Home() {
    return(
        <div className="body w-full">
            <main>
                <Input type="email" name="email" label="Email" />
                </main>
        </div>
    )
}

export default Home;