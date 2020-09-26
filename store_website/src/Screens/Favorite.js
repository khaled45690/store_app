import React, { Component } from 'react';
import Cookies from 'universal-cookie';

import CardComponent from "../Components/CardComponent";
class Favorite extends Component {

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
                    <div className="Favorite" >
                    </div>
                )
            }else{
                return (
                    <div className="Favorite" >
                        {favorite.map(item => (
                            <div key={item._id.toString()}><CardComponent item={item}/></div>     
                        ))}
                       
                    </div>
                )
            }
    }
}

export default Favorite;