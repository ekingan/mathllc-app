import React from "react"
import TodoItem from './TodoItem'

class TodoList extends React.Component {
  render () {
    return (
      <ul className="taskList">
        {this.state.todos.map((todo) => {
          return(
            <li className="task" todo={todo} key={todo.id}>
              <input className="taskCheckbox" type="checkbox" 
                checked={todo.done}
                onChange={ e => this.updateTodo(e, todo.id)} />              
              <label className="taskLabel">{todo.title}</label>
              <span className="deleteTaskBtn" 
                onClick={() => this.deleteTodo(todo.id)}>
                x
              </span>
            </li>
          )       
        })} 	    
      </ul>
    );
  }
}

export default TodoList