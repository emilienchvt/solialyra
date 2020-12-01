import React from 'react';
import './App.css';

function NotAllowed(){
    return (
        <div className="homepage">
            <h1>Bienvenue dans l'ideabox</h1>
            <h2>Vous n'etes pas administrateur petit malin. </h2>
        </div>
    );
}

export default NotAllowed;