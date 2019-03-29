import React from "react"
import axios from 'axios'
import { DragDropContext, Droppable, Draggable } from 'react-beautiful-dnd'

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

  onDragEnd = result => {

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
        const todos = this.state.todos
        const todoIndex = todos.findIndex(x => x.id === response.data.id)
        todos[todoIndex] = response.data
        this.setState({
          todos: todos
        })
      })
      .catch(error => console.log(error))   
  }

  deleteTodo = (id) => {
    axios.delete(`/admin/todos/${id}`)
    .then(() => {
      const todos = this.state.todos
      const i = todos.findIndex(x => x.id === id)
      const updatedTodos = todos.slice(0, i).concat(todos.slice(i + 1, todos.length))
      this.setState({
        todos: updatedTodos
      })
    })
    .catch(error => console.log(error))
  }

  sort = (id) => {
    axios.post(`/admin/todos/sort`)
      .then(() => {
        
      })
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
          <DragDropContext onDragEnd={this.onDragEnd}>
            <Droppable droppableId={this.props.user_id}>
              {(provided) => (
                <ul 
                  className="taskList"
                  ref={provided.innerRef}
                  {...provided.droppableProps}
                >
                  {this.state.todos.map((todo,index) => {
                    return(
                      <Draggable draggableId={todo.id} index={index}>
                        {(provided) => (
                          <li 
                            className="task" 
                            todo={todo} 
                            key={todo.id}
                            {...provided.draggableProps}
                            {...provided.dragHandleProps}
                            ref={provided.innerRef}
                          >
                            <input className="taskCheckbox" type="checkbox" 
                              checked={todo.done}
                              onChange={ e => this.updateTodo(e, todo.id)} />              
                            <label className="taskLabel">{todo.title}</label>
                            <span className="deleteTaskBtn" 
                              onClick={() => this.deleteTodo(todo.id)}>
                              x
                            </span>
                          </li>
                        )}
                      </Draggable>
                    )       
                  })}
                  {provided.placeholder}	    
                </ul>
              )}
            </Droppable>
          </DragDropContext>
        </div>
      </div>    
    )
  }
}

export default TodoContainer