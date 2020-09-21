import React from "react";
import { BrowserRouter, Route } from "react-router-dom";

import Main from "./Screens/Main";
import Header from "./Screens/Header";
import Footer from "./Screens/Footer";

import "./Css/HeaderScreen.css";
import "./materialize.min.css";
function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Header />
        <Route exact path="/" component={Main} />
        <Footer />
      </BrowserRouter>
    </div>
  );
}

export default App;
