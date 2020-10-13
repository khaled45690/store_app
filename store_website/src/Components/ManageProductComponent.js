import React, { Component } from 'react';

class ManageProductComponent extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            items: []
        }
    }

    render() {
        let { nameOfProduct, images, price, description } = this.props.item;
        
        let image = images[0];
        return (
            <div className="ManageProductComponent" >
                <div className="row">
                    <div className="">
                        <div className="card size">
                            <div style={{height:480}} >
                                <img src={image["url"]} alt="productimage" />
                                <div className="card-content centerized">
                                    <span className="card-title" style={{ color: "black", fontWeight: 700 }}>{nameOfProduct}</span>
                                    <span className="card-title" style={{ color: "black", fontWeight: 700 }}>{description}</span>
                                    <p>{price + " $"}</p>
                                </div>
                            </div>
                               <div onClick={()=>{this.props.deletProduct(this.props.item)}} className="removeProductButton"><i className="material-icons" style={{ paddingTop: 2, paddingRight: 0, width: 30, color: "red" }}>delete</i><p >remove product</p></div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

}

export default ManageProductComponent;