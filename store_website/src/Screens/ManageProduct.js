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
                            <div key={item._id.toString()}><ManageProductComponent item={item}/></div>     
                        ))}
                         
                      
                    </div>
                )
    }
}

export default ManageProduct;