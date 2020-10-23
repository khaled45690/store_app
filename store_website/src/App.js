import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import { CookiesProvider } from 'react-cookie';

import CartProvider from './DataCenter/Cart'
import FavoriteProvider from './DataCenter/Favorite'

import Header from "./Screens/Header";
import Main from "./Screens/Main";
import FavoriteScreen from "./Screens/Favorite";
import addProduct from "./Screens/addProduct";
import ManageProduct from "./Screens/ManageProduct";
import Footer from "./Screens/Footer";
import SignIN from "./Screens/Signin";

import "./App.css";
import "./Css/HeaderScreen.css";
import "./Css/Main.css";
import "./Css/addProduct.css";
import "./Css/ManageProduct.css";
import "./materialize.min.css";
function App() {
  return (
    <div className="App">
      <CookiesProvider>
        <BrowserRouter>
          <CartProvider>
            <FavoriteProvider>
              <Header />
              <Route exact path="/" component={Main} />
              <Route exact path="/SignIN" component={SignIN} />
              <Route exact path="/favorite" component={FavoriteScreen} />
              <Route exact path="/addProduct" component={addProduct} />
              <Route exact path="/ManageProduct" component={ManageProduct} />
              <Footer />
            </FavoriteProvider>
          </CartProvider>
        </BrowserRouter>
      </CookiesProvider>
    </div>
  );
}

export default App;
