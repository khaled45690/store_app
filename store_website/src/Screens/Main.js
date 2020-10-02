import React, { Component } from 'react';

import CardComponent from "../Components/CardComponent";
import { Kurl } from '../Konstant'
class Main extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = {
            items: []
        }
    }
    componentDidMount() {

        fetch(Kurl + "getMainProduct", {
            method: 'GET',
        }).then((result) => { return result.json(); }).then((result) => {
            this.setState({
                items: result
            })
        });
    }
    render() {
        if (this.state.items.length > 0) {
            return (
                <div className="Main" >
                    {this.state.items.map(item => (
                        <div key={item._id.toString()}><CardComponent item={item}/></div>     
                    ))}
                   
                </div>
            )
        } else {
            return (<div></div>)
        }

    }
}

export default Main;