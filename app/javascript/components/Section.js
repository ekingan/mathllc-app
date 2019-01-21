import React from "react"

class Section extends React.Component {
  render () {
    return (
      <div className="heading">
        {this.props.text}
      </div>
    );
  }
}

export default Section