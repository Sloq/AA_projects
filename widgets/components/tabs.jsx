import React from 'react';

class Headers extends React.Component {
    render() {
        let selected = this.props.selectedPane;
        let titles = this.props.panes.map((pane, idx) => {
            let title = pane.title;
            let klass = selected === idx ? 'active' : '';
            return (
                <li
                    key={idx}
                    className={"tab " + klass}
                    onClick={this.props.onTabChosen.bind(null, idx)}>
                    {title}
                </li>
            )
        })
        return (
            <ul className="tab-headers">
                {titles}
            </ul>
        )
    }
}

class Tabs extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            index: 0
        }
    }

    onTabChosen = (num) => {
        this.setState({index: num})
    }

    render() {
        let content = this.props.panes[this.state.index].content
        return (
            <div className='tabs-widget'>
                <Headers
                    panes={this.props.panes}
                    selectedPane={this.state.index}
                    onTabChosen={this.onTabChosen}>
                </Headers>
                <p> {content} </p>
            </div>
        )
    }
}

export default Tabs;