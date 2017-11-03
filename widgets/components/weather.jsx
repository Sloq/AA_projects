import React from 'react';

class Weather extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            weather: null
        }
    }
    
    componentDidMount() {

        const error = () => {
            console.log("Your location request has been denied bitch")
        }
    
        const success = (position) => {
            const latitude  = position.coords.latitude;
            const longitude = position.coords.longitude;
            const APIKEY = '2c66eb5f2f8e257c68e00ce93cebd55b'            
            fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&APPID=${APIKEY}`
            ).then((response) => {
                return response.json();
            }).then((weatherData) => {
                let temper = parseInt(parseFloat(weatherData.main.temp) * 9/5 - 459.67)
                let sky = weatherData.weather[0].description
                let city = weatherData.name
                // console.log(weatherData.name);
                // console.log(temper);
                // console.log(sky);
                this.setState({weather: {"sky": sky, "temper": temper, "city": city}});
              }
            );
        }
        navigator.geolocation.getCurrentPosition(success, error);
    }

    render() {
        let content
        if (this.state.weather) {
            content = <div className='weather-content'>
                        <h1>{this.state.weather.city}</h1>
                        <h1>{this.state.weather.temper}</h1>
                        <h1>{this.state.weather.sky}</h1>
                    </div>
        } else {
            content = <div className='weather-content'>
                        <img src='./807.gif'/>
                    </div>
        }
        return (
            <div className="weather-widget">
                <h1>Weather</h1>
                {content}
            </div>
        )
    }
}

export default Weather;