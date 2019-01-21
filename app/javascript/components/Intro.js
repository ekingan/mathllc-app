import React from "react"

class Intro extends React.Component {
  render () {
    return (
      <div className="intro">
        <div className="background">
          <div className="text">
            {this.props.text} 
          </div>
        </div>
      </div>
    );
  }
}

export default Intro