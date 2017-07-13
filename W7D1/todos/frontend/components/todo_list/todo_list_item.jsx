import React from 'react';

class TodoListItem extends React.Component{
  constructor() {
    //some stuff
  }
  render() {
    return <li>this.props.todo.title</li>; 
  }
}
