import {combineReducers} from 'redux';
import todosReducer from './todos_reducer';
// import todo

const rootReducer = combineReducers({
  todos: todosReducer,
  // todo: todoReducer
});

export default rootReducer;
