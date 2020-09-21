import React, { Component } from 'react';
import logo from '../images/logoImage.png'

import NavigatorComponent from '../Components/NavigatorComponent'
class Header extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = { }
    }

    render() {
            return (
                <div className="Header" >
                    <NavigatorComponent />
                    <img className="Header-Logo col s12 m4 l8" src={logo} alt = "logo"></img>
                </div>
            );
    }
}

export default Header;