import React from 'react';
import ReactDOM from 'react-dom';
import Greeting from './components/greeting';
import Clock from './components/clock';
import Tabs from './components/tabs';
import Autocomplete from './components/autocomplete';
import Weather from './components/weather';


const Panes = [
    {title: 'one', content: 'I am the first'},
    {title: 'two', content: 'Second pane here'},
    {title: 'three', content: 'Third pane here'}
];

const Names = [
    "Peter",
    "Paul",
    "Alex",
    "Adam",
    "Beatrix",
    "Carl",
    "David",
    "Cat",
    "Daniel",
    "Lucifer",
    "Jesus"
];

class Root extends React.Component {
    render() {
        return (
            <div>
                <Greeting/>
                <Clock/>
                <Tabs panes={Panes}/>
                <Autocomplete names={Names}/>
                <Weather/>
            </div>
        )
    }
}

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Root/>, root);
});