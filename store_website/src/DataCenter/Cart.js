

import Cookies from 'universal-cookie';
import React, { Component, createContext } from 'react';
import { createBrowserHistory } from 'history'
export const Cart = createContext();
export const history = createBrowserHistory({
  forceRefresh: true
});
class MainDataProvider extends Component {
  state = {
    Cart: []
  }
  componentDidMount() {
    let cookies = new Cookies();
    let check = cookies.get("Cart", { path: '/' });
    if (check === undefined) {

    } else {
      this.setState({
        Cart: check
      })
    }
  }

  render() {
    return (
      <Cart.Provider value={{
        ...this.state, addRemoveProduct: this.addRemoveProduct
      }}>
        {this.props.children}
      </Cart.Provider>
    );
  }

  addRemoveProduct = (product) => {
    let cookies = new Cookies();
    console.log(this.state.Cart);
    if (this.state.Cart.length === 0) {
      cookies.set("Cart" ,[product], { path: '/' });
      this.setState({
        Cart: [product]
      });
    }else{
      let check = this.state.Cart.some((value => value["_id"] === product["_id"]));
      if(check){
      let filter =  this.state.Cart.filter((value=>value["_id"] !== product["_id"]));
      cookies.set("Cart" ,filter, { path: '/' });
      this.setState({
        Cart : filter
      })
      }else{
        cookies.set("Cart" ,[...this.state.Cart , product], { path: '/' });
        this.setState({
          Cart : [...this.state.Cart , product]
        })
      }
    }

  }
}

export default MainDataProvider;