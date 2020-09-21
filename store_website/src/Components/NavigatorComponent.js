import React, { Component } from "react";
import { Link } from "react-router-dom";
class NavigatorComponent extends Component {
    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {};
    }

    render() {
        return (
            <div className="NavigatorComponent left hide-on-med-and-down">
                <Link to="/" className="waves-effect nav-btn"> <i class="material-icons" style={{paddingTop:2 , paddingRight:5}}>home</i> <p style={{margin:0}}>Home</p></Link>
                <Link to="/" className="waves-effect nav-btn"> <i class="material-icons" style={{paddingTop:2 , paddingRight:5}}>home</i> <p style={{margin:0}}>Manage product</p></Link>
                <Link to="/" className="waves-effect nav-btn"> <i class="material-icons" style={{paddingTop:2 , paddingRight:5}}>add</i> <p style={{margin:0}}>add product</p></Link>
                <Link to="/" className="waves-effect nav-btn"> <i class="material-icons" style={{paddingTop:2 , paddingRight:5}}>home</i> <p style={{margin:0}}>Home</p></Link>
                <Link to="/" className="waves-effect nav-btn"> <i class="material-icons" style={{paddingTop:2 , paddingRight:5}}>home</i> <p style={{margin:0}}>Home</p></Link>
               
            </div>
        );
    }
}

export default NavigatorComponent;
