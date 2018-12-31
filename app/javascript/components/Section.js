import React from "react"

class Section extends React.Component {
  render () {
    return (
      <div className="section">
        {this.props.text}
      </div>
    );
  }
}

export default Section