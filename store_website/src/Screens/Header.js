import React, { Component } from 'react';

import { Cart } from '../DataCenter/Cart'
import NavigatorComponent from '../Components/NavigatorComponent'
class Header extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {}
    }

    render() {
        return (
            <Cart.Consumer>{(context) => {
                let {Cart} = context
                return (
                    <div className="Header" >
                        <NavigatorComponent NumberOfCartItems={Cart.length}/>
                    </div>
                )
            }}

            </Cart.Consumer>
        );
    }
}

export default Header;