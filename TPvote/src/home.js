import React from 'react';
import './App.css';

function Home(){
    return (
        <div className="homepage">
            <h1>Bienvenue dans l'ideabox</h1>
            <div>En cliquant sur ce bouton, vous vous connecterais avec metamask pour pouvoir voter dans la blockchain.</div>
            <a href="/connect"><button>Je veux participer!</button></a>
            <a href="http://google.com"><button>Je suis nul!</button></a>
        </div>
    );
}

export default Home;