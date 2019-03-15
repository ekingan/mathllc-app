import React from "react"
import TodoItem from './TodoItem'

class TodoList extends React.Component {
  render () {
    return (
      <div className="note">
        <TodoItem />
      </div>
    );
  }
}

export default TodoItem