import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import allTodos from './reducers/selectors.js';
import todosReducer from './reducers/todos_reducer';
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import Root from './components/root';

class Base extends React.Component {
  render() {
    return(
      <div>
        <h1>Todos App</h1>
        <Root/>
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  const allTods = allTodos(store.getState());
  window.allTods = allTods;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  ReactDOM.render(
    <div>
      <h1>Todos App</h1>
      <Root store = {store}/>
    </div>
    , document.getElementById('root'));
});
