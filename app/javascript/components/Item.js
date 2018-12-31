import React from "react"

class Item extends React.Component {
  render () {
    return (
      <div className="item">
        {this.props.text}
      </div>
    );
  }
}

export default Item