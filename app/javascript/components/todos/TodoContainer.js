import React from "react"
import axios from 'axios'

class TodoContainer extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      todos: [],
      inputValue: ''
    }
  }

  componentDidMount() {
    this.setState({todos: this.props.todos})
  }

  createTodo = (e) => {
    if (e.key === 'Enter') {
      axios.post('/admin/todos', {todo: {title: e.target.value}})
      .then(response => {
        this.setState({
          todos: [ ...this.state.todos, response.data],
          inputValue: ''
        })
      })
      .catch(error => console.log(error))      
    }    
  }

  handleChange = e => {
    this.setState({inputValue: e.target.value});
  }

  updateTodo = (e, id) => {
    axios.put(`/admin/todos/${id}`, {todo: {done: e.target.checked}})
      .then(response => {
        const todos = this.state.todos.splice()
        debugger
        const todoIndex = todos.findIndex(x => x.id === response.data.id)
        todos[todoIndex] = response.data
        this.setState({
          todos: todos
        })
      })
      .catch(error => console.log(error))   
  }

  render () {
    return (
      <div>
        <div className="inputContainer">
          <input className="taskInput" type="text" 
            placeholder="Add a task" maxLength="50"
            onKeyPress={this.createTodo}
            value={this.state.inputValue}
            onChange={this.handleChange} />
        </div>  	    
        <div className="listWrapper">
          <ul className="taskList">
            {this.state.todos.map((todo) => {
		          return(
                <li className="task" todo={todo} key={todo.id}>
                  <input className="taskCheckbox" type="checkbox" 
                    checked={todo.done}
                    onChange={ e => this.updateTodo(e, todo.id)} />              
                  <label className="taskLabel">{todo.title}</label>
                  <span className="deleteTaskBtn">x</span>
                </li>
		          )       
		         })} 	    
          </ul>
        </div>
      </div>    
    )
  }
}

export default TodoContainer