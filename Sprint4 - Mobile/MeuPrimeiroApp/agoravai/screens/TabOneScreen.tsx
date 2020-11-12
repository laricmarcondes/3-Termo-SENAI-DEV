import * as React from 'react';
import { StyleSheet } from 'react-native';
import './style.css';
import EditScreenInfo from '../components/EditScreenInfo';
import { Text, View } from '../components/Themed';
import favicon from '../assets/images/img.png'

export default function TabOneScreen() {
  return (

    < div className="text">
      <img id="favicon" src={favicon} alt='img' title="img" />
      <div className="centro">
        <h1>App Agora Vai</h1>
      </div>
      <div className="centro-sub">
        <p>Conheça nosso produto</p>
      </div>
    </div >
  );
}
