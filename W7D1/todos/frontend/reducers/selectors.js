// const allTodos = (state) => {
//   return Object.keys(state.todos).map((key) => (key.id));
// };

const allTodos = ({todos}) => {
  return Object.keys(todos).map(id => todos[id]);
};

export default allTodos;
