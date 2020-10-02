import React, { Component } from 'react';
class addProduct extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {}
    }

    render() {
        return (
            <div className="addProduct" >
                <div className="container">
                    <div className="row" style={{ width: "80%", justifyContent: "center" }}>
                        <form className="col s12 centrize" >
                            <h2 style={{ fontWeight: 700, color: "white", paddingTop: 40, paddingBottom: 20 }}>add the product details</h2>
                            <h5 style={{ fontWeight: 600, color: "white" }}>please note you should add three pictures only no less or more</h5>
                            <div className="centrizedContent">
                                <div className="input-field" style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="last_name" type="text" className="validate" style={{ color: "white" }} />
                                    <label for="last_name" style={{ color: "rgb(15, 153, 213)" }}>Product Name</label>
                                </div>
                                <div className="input-field" style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="last_name" type="text" className="validate" style={{ color: "white" }} />
                                    <label for="last_name" style={{ color: "rgb(15, 153, 213)" }}>Product describtion</label>
                                </div>
                                <div className="input-field" style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="last_name" type="text" className="validate" style={{ color: "white" }} />
                                    <label for="last_name" style={{ color: "rgb(15, 153, 213)" }}>Product price</label>
                                </div>
                                <div className="input-field" style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="last_name" type="text" className="validate" style={{ color: "white" }} />
                                    <label for="last_name" style={{ color: "rgb(15, 153, 213)" }}>Product quantity</label>
                                </div>
                                <div class="file-field input-field">
                                <div class="btn">
                                    <span>File</span>
                                    <input type="file" multiple />
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text" placeholder="Upload one or more files" />
                                </div>
                            </div>
                            </div>

                            <div className="productBtn"> <p className="BtnAction">save the product</p></div>

                        </form>
                    </div>
                </div>
            </div>
        );
    }
}

export default addProduct;