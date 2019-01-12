import React from "react"

class SubItem extends React.Component {
  render () {
    return (
      <div className="sub-item">
        <span className="blue">+</span>{this.props.text}
      </div>
    );
  }
}

export default SubItem