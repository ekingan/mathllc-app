import React from "react"

class Note extends React.Component {
  render () {
    return (
      <div className="note">
        {this.props.text}
      </div>
    );
  }
}

export default Note