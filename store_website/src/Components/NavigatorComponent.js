import React, { Component } from "react";
import { Link } from "react-router-dom";

import logo from '../images/logoImage.png'
class NavigatorComponent extends Component {
    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {};
    }
    hideShowFunc = (value) => {
        if (value === "hide") {
            this.Drawer.style.display = "none"
        }else if (value === "show") {
            this.Drawer.style.display = "block"
        }
    }

    render() {
        return (
            <div className="NavigatorComponent">
                <img className="Header-Logo col s12 m4 l8 hide-logo" src={logo} alt="logo"></img>
                    <div className="center-nav-items">
                        <div className="center">
                            <Link to="/" className="waves-effect waves-purple nav-btn"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>home</i> <p style={{ margin: 0 }}>Home</p></Link>
                            <Link to="/ManageProduct" className="waves-effect waves-purple nav-btn"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>mode_edit</i> <p style={{ margin: 0 }}>Manage product</p></Link>
                            <Link to="/addProduct" className="waves-effect waves-purple nav-btn"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>add</i> <p style={{ margin: 0 }}>add product</p></Link>
                            <Link to="/favorite" className="waves-effect waves-purple nav-btn"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>favorite</i> <p style={{ margin: 0 }}>my favorite</p></Link>
                            <Link to="/SignIN" className="waves-effect waves-purple nav-btn"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>lock</i> <p style={{ margin: 0 }}>Sign in</p></Link>
                            <Link to="/" className="waves-effect waves-purple nav-btn" style={{marginLeft:20 }}> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>shopping_cart</i> <p style={{ marginLeft: -8  , marginTop: 5 , color:"red"}}>{this.props.NumberOfCartItems}</p></Link>
                        </div>
                    </div>

                <div className="show-hide" ref={(el) => { this.Drawer = el }}>
                    <nav className="background-div" onClick={() => { this.hideShowFunc("hide") }}></nav>
                    <nav className="NavigatorComponentDrawer"  >
                        <div className="user-info"></div>
                        <div className="Tabs">
                            <Link to="/" className="waves-effect waves-purple nav-btn-drawer"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>home</i> <p style={{ margin: 0 }}>Home</p></Link>
                            <Link to="/ManageProduct" className="waves-effect waves-purple nav-btn-drawer"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>mode_edit</i> <p style={{ margin: 0 }}>Manage product</p></Link>
                            <Link to="/addProduct" className="waves-effect waves-purple nav-btn-drawer"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>add</i> <p style={{ margin: 0 }}>add product</p></Link>
                            <Link to="/" className="waves-effect waves-purple nav-btn-drawer"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>shopping_cart</i> <p style={{ margin: 0 }}>shop cart</p></Link>
                            <Link to="/favorite" className="waves-effect waves-purple nav-btn-drawer"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>favorite</i> <p style={{ margin: 0 }}>my favorite</p></Link>
                            <Link to="/SignIN" className="waves-effect waves-purple nav-btn-drawer"> <i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>lock</i> <p style={{ margin: 0 }}>Sign in</p></Link>
                        </div>
                    </nav>
    
                </div>
                <div className="hiden" style={{ width: "100%" }}><div className="waves-effect waves-purple Drawer-icon" onClick={() => { this.hideShowFunc("show") }}><i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>dehaze</i></div></div>


                <img className="Header-Logo col s12 m4 l8" src={logo} alt="logo"></img>

            </div>
        );
    }
}

export default NavigatorComponent;

