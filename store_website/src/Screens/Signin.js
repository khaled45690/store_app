import React, { Component } from 'react';

import { Link } from "react-router-dom";
import { Kurl } from '../Konstant';
import "../Css/Signin.css"

class Signin extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            items: []
        }
    }
    // style="background-image: url('images/bg-01.jpg');"
    render() {
        return (
            <div className="Signin" >
                <div class="limiter">
                    <div class="container-login100" >
                        <div class="wrap-login100">
                            <form class="login100-form validate-form">
                                <span class="login100-form-logo">
                                    <i class="zmdi zmdi-landscape"></i>
                                </span>

                                <span class="login100-form-title p-b-34 p-t-27">Log in</span>

                                <div class="wrap-input100 validate-input" data-validate="Enter username">
                                    <input class="input100" type="text" name="username" placeholder="Username" />
                                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                                </div>

                                <div class="wrap-input100 validate-input" data-validate="Enter password">
                                    <input class="input100" type="password" name="pass" placeholder="Password" />
                                    <span class="focus-input100" data-placeholder="&#xf191;"></span>
                                </div>

                                <div class="contact100-form-checkbox">
                                    <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" />
                                    <label class="label-checkbox100" for="ckb1">Remember me</label>
                                </div>

                                <div class="container-login100-form-btn">
                                    <button class="login100-form-btn">Login</button>
                                </div>

                                <div class="text-center p-t-90">
                                    <a class="txt1" href="#">Forgot Password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
    deletProduct = (deletProduct) => {
        let images = deletProduct["images"];
        images.map((value) => {
            fetch(`${Kurl}deleteProductImages`, {
                method: "POST",
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(value)
            })
                .then(response => response.text())
                .then((data) => { })
            return null;
        })
        fetch(`${Kurl}deleteProduct`, {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(deletProduct)
        })
            .then(response => response.text())
            .then((data) => {
                if (data === "done") {
                    let filter = this.state.items.filter((value) => {
                        return value["_id"] !== deletProduct["_id"];
                    });
                    console.log(filter);
                    this.setState({
                        items: filter
                    })
                }
            })
    }
}

export default Signin;