import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            time: new Date()
        };
    }

    componentDidMount() {
        let ticker = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(ticker);
    }


    tick = () => {
        this.setState({time: new Date()});
    }

    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds = this.state.time.getSeconds();

        hours = (hours > 12) ? hours % 12 : hours;
        hours = (hours < 10) ? `0${hours}` : hours;
        minutes = (minutes < 10) ? `0${minutes}` : minutes;
        seconds = (seconds < 10) ? `0${seconds}` : seconds;

        return (
            <div className='clock'>
                <h1>Rolex</h1>
                <h2>{hours}:{minutes}:{seconds}</h2>
                <h2>{this.state.time.toDateString()}</h2>
            </div>
        )
    }
}

export default Clock;