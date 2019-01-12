import React from "react"

class TextBox extends React.Component {
  render () {
    return (
      <div className="textbox">
        {this.props.text} 
      </div>
    );
  }
}

export default TextBox