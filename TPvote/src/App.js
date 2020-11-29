import React from "react";
import Users from "./user";
import Home from "./home";
import Admin from "./admin";
import Connect from "./connect";
import { BrowserRouter as Router, Switch, Route} from 'react-router-dom';

import "./App.css";

function App () {
  return (
    <Router> 
      <div className="App">
        <Switch>
          <Route path="/" exact component={Home} />
          <Route path="/connect" component={Connect} />
          <Route path="/user" component={Users} />
          <Route path="/admin" component={Admin} />
        </Switch>
      </div>
    </Router>
  );
}

export default App;