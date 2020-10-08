import React, { Component } from 'react';
import Cookies from 'universal-cookie';

import { Favorite } from '../DataCenter/Favorite'
import CardComponent from "../Components/CardComponent";

class FavoriteScreen extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {}
    }
    render() {
        let cookies = new Cookies();
        let favorite = cookies.get("favorite", { path: '/' });
        console.log(favorite);
        if (favorite === undefined) {
            return (
                <div className="favorite" >
                </div>
            )
        } else {
            return (
                <Favorite.Consumer>{(context) => { 
                    let {favorite} = context;
                    console.log(favorite);
                    return (
                        <div className="favorite" >
                            {favorite.map(item => (
                                <div key={item._id.toString()}><CardComponent item={item} /></div>
                            ))}
                        </div>
                        )
                }}
                </Favorite.Consumer>

            )
        }
    }
}

export default FavoriteScreen;