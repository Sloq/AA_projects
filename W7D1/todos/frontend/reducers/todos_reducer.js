import merge from 'lodash/merge';
import { RECEIVE_TODO, RECEIVE_TODOS } from '../actions/todo_actions.js';
import allTodos from './selectors';


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  // console.log(state);
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_TODOS:
      const newState = {};
      Object.keys(action.todos).map(key => ( newState[key] = action.todos[key]));
      // let nextState = merge( {}, state, action.todos);
      return newState;
    case RECEIVE_TODO:
      // console.log('first');
      const newTodo = {[action.todo.id]: action.todo};
      let nextOtherState = merge( {}, state, newTodo);
      return nextOtherState;
    default:
      // console.log('second');
     return state;
  }
};

export default todosReducer;
