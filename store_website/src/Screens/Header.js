import React, { Component } from 'react';
import logo from '../images/logoImage.png'
class Header extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = { }
    }

    render() {
        return (
            <div className="Header" >
                <img src={logo} alt = "logo"></img>
            </div>
        );
    }
}

export default Header;