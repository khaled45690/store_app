import React, { Component } from 'react';
import { createBrowserHistory } from 'history'

import { Kurl } from '../Konstant'
export const history = createBrowserHistory({
    forceRefresh: true
});


class addProduct extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            product: {},
            imagesLoaded: false,
            check: false
        }
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
                                <div className="input-field" onChange={(value) => { this.addProduct("nameOfProduct", value.target.value) }} style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="nameOfProduct" type="text" className="validate" style={{ color: "white" }} />
                                    <label htmlFor="nameOfProduct" style={{ color: "rgb(15, 153, 213)" }}>Product Name</label>
                                </div>
                                <div className="input-field" onChange={(value) => { this.addProduct("description", value.target.value) }} style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="description" type="text" className="validate" style={{ color: "white" }} />
                                    <label htmlFor="description" style={{ color: "rgb(15, 153, 213)" }}>Product describtion</label>
                                </div>
                                <div className="input-field" onChange={(value) => { this.addProduct("price", value.target.value) }} style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="price" type="text" className="validate" style={{ color: "white" }} />
                                    <label htmlFor="price" style={{ color: "rgb(15, 153, 213)" }}>Product price</label>
                                </div>
                                <div className="input-field" onChange={(value) => { this.addProduct("quantity", value.target.value) }} style={{ color: "rgb(15, 153, 213)" }}>
                                    <input id="quantity" type="text" className="validate" style={{ color: "white" }} />
                                    <label htmlFor="quantity" style={{ color: "rgb(15, 153, 213)" }}>Product quantity</label>
                                </div>

                                <div className="file-field input-field" onChange={(value) => { this.uploadImages(value.target.files) }}>
                                    <div className="btn">
                                        <span>File</span>
                                        <input type="file" multiple />
                                    </div>
                                    <div className="file-path-wrapper">
                                        <input className="file-path validate" type="text" placeholder="Upload one or more files" />
                                    </div>
                                </div>

                                <fieldset style={{ border: "none", display: "flex" }} >
                                    <label ><h4 style={{ color: "black", marginTop: "20px", width: 300 }}>select category</h4></label >
                                    <select onChange={(value) => { this.addProduct("Category", value.target.value) }} className="myList" style={{ color: "black" }}>
                                        <option value="none">none</option>
                                        <option value="t-shirt">t-shirt</option>
                                        <option value="shoes">shoes</option>
                                        <option value="jeans">jeans</option>
                                        <option value="sweetPants">sweetPants</option>
                                        <option value="others">others</option>
                                    </select>
                                </fieldset>
                            </div>

                            {this.state.check ? <div className="productBtn" onClick={this.saveProduct}> <p className="BtnAction">save the product</p></div> : <div className="productBtn"> <p>add images first or complete the info above to see save bottun</p></div>}

                        </form>
                    </div>
                </div>
            </div>
        );
    }
    saveProduct=()=>{
        fetch(Kurl + "addProduct", {
            method: 'POST',
            headers: { 'Content-Type': "application/json" },
            body: JSON.stringify(this.state.product)
        }).then(() => {  history.push('/');})
    }
    addProduct = (varName, varValue) => {
        let product = this.state.product;
        console.log(product["nameOfProduct"] !== undefined , product["description"] !== undefined , product["price"] !== undefined , product["quantity"] !== undefined , this.state.imagesLoaded === true);
        if (product["nameOfProduct"] !== undefined && product["description"] !== undefined && product["price"] !== undefined && product["quantity"] !== undefined && this.state.imagesLoaded === true) {
            this.setState({
                check: true
            })
        }
        this.setState({
            product: { ...this.state.product, [varName]: varValue }
        })
    }

    uploadImages = (files) => {
        let images = []
        Object.keys(files).map((value) => {
            let product = this.state.product;
            let file = files[value]
            fetch(Kurl + "uploadWebImage", {
                method: 'POST',
                headers: { 'Content-Type': file["type"] },
                body: file
            }).then((result) => { return result.json(); }).then((result) => {
                images.push(result);
                console.log(images);
                if(images.length === files.length){
                    this.setState({
                        product: { ...this.state.product, "images": images } ,
                        imagesLoaded : true
                    } , ()=>{
                        if (product["nameOfProduct"] !== undefined && product["description"] !== undefined && product["price"] !== undefined && product["quantity"] !== undefined && this.state.imagesLoaded === true) {
                            this.setState({
                                check: true
                            })
                        }
                    })
                }
                return result;
            });

        });

    }
}

export default addProduct;