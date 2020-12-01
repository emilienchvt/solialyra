import React from 'react';
import './App.css';

function NotAllowed(){
    return (
        <div className="homepage">
            <h1>Bienvenue dans l'ideabox</h1>
            <h2>Vous ne pouvez pas encore voter, veuillez demander a l'admin de vous ajouter aux voteurs éligible</h2>
        </div>
    );
}

export default NotAllowed;