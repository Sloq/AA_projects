import React from 'react';
import { CSSTransitionGroup } from 'react-transition-group';

class Autocomplete extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            searchTerm: ''
        }
    }

    searchFor = (e) => {
        this.setState({searchTerm: e.currentTarget.value})
    }

    render() {
        let names = this.props.names.filter((name) => name.includes(this.state.searchTerm)).map((word, idx) => {
            return (
                <li
                    key={word}>
                    {word}
                </li>
            )
        })
        return (
            <div className="search-widget">
                <input
                    type="text"
                    onChange={this.searchFor}
                    value={this.state.searchTerm}/>
                <ul className="name-list">
                    <CSSTransitionGroup
                        transitionName="example"
                        transitionEnterTimeout={600}
                        transitionLeaveTimeout={600}>
                        {names}
                    </CSSTransitionGroup>
                </ul>
            </div>
        )
    }
}

export default Autocomplete;