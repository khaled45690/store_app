import React, { Component } from "react";
import Cookies from 'universal-cookie';

import { Kurl } from '../Konstant'
class CardComponent extends Component {
    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            isFavorite: false,
        };
    }

    render() {
        let { nameOfProduct, images, price } = this.props.item;
        return (
            <div className="CardComponent">
                <div className="row">
                    <div className="">
                        <div className="card">
                            <div className="card-image">
                                <img src={Kurl + "/getImage/" + JSON.parse(images[0])} alt="productimage" />
                                <span className="card-title" style={{ color: "black", fontWeight: 700 }}>{nameOfProduct}</span>
                            </div>
                            <div className="card-content">
                                <p>{price + " $"}</p>
                            </div>
                            <div className="card-action">
                                <div className="" style={{ width: "100%", display: "flex" }}>
                                    <div className="waves-effect waves-purple" onClick={() => { this.favoriteFunc(this.props.item) }}><i className="material-icons" style={{ paddingTop: 2, paddingRight: 0, width: 30, color: "red" }}>{this.state.isFavorite ? "favorite" : "favorite_border"}</i></div>
                                    <div className="waves-effect waves-purple" style={{ marginLeft: 200 }}><i className="material-icons" style={{ paddingTop: 2, paddingRight: 5 }}>add_shopping_cart</i></div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }

    favoriteFunc = (item) => {
        let cookies = new Cookies();
        let check = cookies.get("favorite", { path: '/' });
        if (check === undefined) {
            // if there is no favorite cookies
            let favorite = [];
            favorite.push(item);
            cookies.set("favorite", favorite, { path: '/' });
            this.setState({
                isFavorite: true
            })
        } else {
            // if there no favorite cookies
            let favorite = check;
            if (favorite.some(element => element._id === item._id)) {
                // if the item exist in the favorite cookies then remove it
                let filter = []
                favorite.map((e) => {
                    if (e._id === item._id) {
                        return null;
                    } else {
                        filter.push(e);
                        return e;
                    }

                });
                cookies.set("favorite", filter, { path: '/' });
                this.setState({
                    isFavorite: false
                })
            } else {
                // if the item doesn't exist in the favorite cookies then add it
                favorite.push(item);
                this.setState({
                    isFavorite: true
                })
                cookies.set("favorite", favorite, { path: '/' });

            }


        }
    }

    componentWillMount() {
        let cookies = new Cookies();
        let favorite = cookies.get("favorite", { path: '/' });
        if (favorite === undefined) { } else {
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

    }

}

export default CardComponent;

