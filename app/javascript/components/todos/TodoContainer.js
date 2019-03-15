import React from "react"
import TodoList from './TodoList'
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
      const newTodos = this.state.todos.slice()
      newTodos[0] = { title: e.target.value }
      console.log(newTodos)
      axios.post('/admin/todos', {todo: {title: e.target.value}})
      .then(response => {
        console.log(response)
        this.setState({
          todos: newTodos,
          inputValue: ''
        })
        console.log(this.state)
      })
      .catch(error => console.log(error))      
    }    
  }

  handleChange = (e) => {
    this.setState({inputValue: e.target.value});
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
            <TodoList />
          </ul>
        </div>
      </div>    
    )
  }
}

export default TodoContainer