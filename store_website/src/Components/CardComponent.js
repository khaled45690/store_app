import React, { Component } from "react";
import Cookies from 'universal-cookie';

import { Cart } from '../DataCenter/Cart'
import { Favorite } from '../DataCenter/Favorite'
class CardComponent extends Component {
    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            isFavorite: false,
            isFound: false,
        };
    }

    render() {
        let { nameOfProduct, images, price } = this.props.item;
        let image = images[0];
        return (
            <Cart.Consumer>{(context) => {
                let { addRemoveProduct } = context
                return (
                    <Favorite.Consumer>{(context) => {
                        let {addRemoveFavorite} = context;
                        return (
                            <div className="CardComponent">
                                <div className="row">
                                    <div className="">
                                        <div className="card">
                                            <div className="card-image">
                                                <img src={image["url"]} alt="productimage" />
                                                <span className="card-title" style={{ color: "black", fontWeight: 700 }}>{nameOfProduct}</span>
                                            </div>
                                            <div className="card-content">
                                                <p>{price + " $"}</p>
                                            </div>
                                            <div className="card-action">
                                                <div className="" style={{ width: "100%", display: "flex" }}>
                                                    <div className="waves-effect waves-purple" onClick={() => { addRemoveFavorite(this.props.item); this.isFavorite()}}><i className="material-icons" style={{ paddingTop: 2, paddingRight: 0, width: 30, color: "red" }}>{this.state.isFavorite ? "favorite" : "favorite_border"}</i></div>
                                                    <div className="waves-effect waves-purple" onClick={() => { addRemoveProduct(this.props.item); this.isCarted() }} style={{ marginLeft: 200 }}><i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>{this.state.isFound ? "remove_shopping_cart" : "add_shopping_cart"}</i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        )
                    }}</Favorite.Consumer>
                )
            }}</Cart.Consumer>
        );
    }


    isCarted = () => {
        if (this.state.isFound) {
            this.setState({
                isFound: false
            })
        } else {
            this.setState({
                isFound: true
            })
        }
    }

    isFavorite = ()=>{
        if (this.state.isFavorite) {
            this.setState({
                isFavorite: false
            })
        } else {
            this.setState({
                isFavorite: true
            })
        }
    }
    componentDidMount() {
        let cookies = new Cookies();
        let favorite = cookies.get("favorite", { path: '/' });
        let Cart = cookies.get("Cart", { path: '/' });
        if (favorite === undefined) { } else {
            console.log(favorite , this.props.item._id);
            if (favorite.some(element => element._id === this.props.item._id)) {
                this.setState({
                    isFavorite: true
                })
            } else {
                this.setState({
                    isFavorite: false
                })
            }
        }

        if (Cart === undefined) { } else {
            if (Cart.some(element => element._id === this.props.item._id)) {
                this.setState({
                    isFound: true
                })
            } else {
                this.setState({
                    isFound: false
                })
            }
        }

    }

}

export default CardComponent;

