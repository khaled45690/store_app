import React, { Component } from 'react';
class Main extends Component {

    constructor(props) {
        super(props);
        this.myRef = React.createRef();
        this.state = { }
    }

    render() {
        return (
            <div className="Main" >
            </div>
        );
    }
}

export default Main;