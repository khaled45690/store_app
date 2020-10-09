

import Cookies from 'universal-cookie';
import React, { Component, createContext } from 'react';
import { createBrowserHistory } from 'history'
export const Favorite = createContext();
export const history = createBrowserHistory({
  forceRefresh: true
});
class FavoriteProvider extends Component {
  state = {
    favorite: []
  }
  componentDidMount() {
    let cookies = new Cookies();
    let check = cookies.get("favorite", { path: '/' });
    if (check === undefined) {

    } else {
      this.setState({
        favorite: check
      })
    }

  }

  render() {
    return (
      <Favorite.Provider value={{
        ...this.state, addRemoveFavorite: this.addRemoveFavorite
      }}>
        {this.props.children}
      </Favorite.Provider>
    );
  }
initialaizer =()=>{
  let cookies = new Cookies();
  let check = cookies.get("favorite", { path: '/' });
  if (check === undefined) {

  } else {
    this.setState({
      favorite: check
    })
  }
}
  addRemoveFavorite = (product) => {
    let cookies = new Cookies();
    if (this.state.favorite.length === 0) {
      cookies.set("favorite" ,[product], { path: '/' });
      this.setState({
        favorite: [product]
      });
    }else{
      let check = this.state.favorite.some((value => value["_id"] === product["_id"]));
      if(check){
      let filter =  this.state.favorite.filter((value=>value["_id"] !== product["_id"]));
      cookies.set("favorite" ,filter, { path: '/' });
      this.setState({
        favorite : filter
      })
      }else{
        cookies.set("favorite" ,[...this.state.favorite , product], { path: '/' });
        console.log([...this.state.favorite , product]);
        this.setState({
          favorite : [...this.state.favorite , product]
        })  
      }
    }

  }
}

export default FavoriteProvider;