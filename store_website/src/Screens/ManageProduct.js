import React, { Component } from 'react';
import CardComponent from "../Components/CardComponent";

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
                        {this.state.items.map(item => (
                            <div key={item._id.toString()}><CardComponent item={item}/></div>     
                        ))}
                       
                    </div>
                )
    }
}

export default ManageProduct;