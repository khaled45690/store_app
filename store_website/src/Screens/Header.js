import React, { Component } from 'react';


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
                </div>
            );
    }
}

export default Header;