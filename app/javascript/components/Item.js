import React from "react"

class Item extends React.Component {
  render () {
    return (
      <div className="item">
        <span className="blue">+ </span>{this.props.text}
      </div>
    );
  }
}

export default Item