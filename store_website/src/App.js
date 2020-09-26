import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import { CookiesProvider } from 'react-cookie';

import Header from "./Screens/Header";
import Main from "./Screens/Main";
import Favorite from "./Screens/Favorite";
import ManageProduct from "./Screens/ManageProduct";
import Footer from "./Screens/Footer";

import "./App.css";
import "./Css/HeaderScreen.css";
import "./Css/Main.css";
import "./Css/ManageProduct.css";
import "./materialize.min.css";
function App() {
  return (
    <div className="App">
      <CookiesProvider>
        <BrowserRouter>
          <Header />
          <Route exact path="/" component={Main} />
          <Route exact path="/favorite" component={Favorite} />
          <Route exact path="/ManageProduct" component={ManageProduct} />
          <Footer />
        </BrowserRouter>
      </CookiesProvider>
    </div>
  );
}

export default App;
