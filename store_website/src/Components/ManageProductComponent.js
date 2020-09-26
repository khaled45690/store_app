import React, { Component } from 'react';

import { Kurl } from '../Konstant'
class ManageProductComponent extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            items: []
        }
    }

    render() {
        console.log(this.props.item);
        let { nameOfProduct, images, price, description } = this.props.item;
        return (
            <div className="ManageProductComponent" >
                <div className="row">
                    <div className="">
                        <div className="card size">
                            <div style={{height:480}} >
                                <img src={Kurl + "/getImage/" + JSON.parse(images[0])} alt="productimage" />
                                <div className="card-content centerized">
                                    <span className="card-title" style={{ color: "black", fontWeight: 700 }}>{nameOfProduct}</span>
                                    <span className="card-title" style={{ color: "black", fontWeight: 700 }}>{description}</span>
                                    <p>{price + " $"}</p>
                                </div>
                            </div>
                               <div className="removeProductButton"><i className="material-icons" style={{ paddingTop: 2, paddingRight: 0, width: 30, color: "red" }}>delete</i><p >remove product</p></div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default ManageProductComponent;