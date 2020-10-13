import React, { Component } from 'react';
import ManageProductComponent from "../Components/ManageProductComponent";

import { Link } from "react-router-dom";
import { Kurl } from '../Konstant'
class ManageProduct extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            items: []
        }
    }
    componentWillMount() {

        fetch(Kurl + "getMainProduct", {
            method: 'GET',
        }).then((result) => { return result.json(); }).then((result) => {
            this.setState({
                items: result
            })
        });
    }

    render() {
        return (
            <div className="ManageProduct" >
                <Link to="/addProduct" className="floActionBtn"><i className="material-icons addProductIcon">add</i><div>add product</div> </Link>
                {this.state.items.map(item => (
                    <div key={item._id.toString()}><ManageProductComponent deletProduct={this.deletProduct} item={item} /></div>
                ))}


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
                .then((data) => {  })
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
                        items : filter
                    })
                }
            })
    }
}

export default ManageProduct;