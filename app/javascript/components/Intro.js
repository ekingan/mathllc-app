import React from "react"

class Intro extends React.Component {
  render () {
    return (
      <div className="intro">
          <div className="text">
            {this.props.text} 
          </div>
      </div>
    );
  }
}

export default Intro
