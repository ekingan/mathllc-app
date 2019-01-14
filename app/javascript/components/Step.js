import React from "react"

class Step extends React.Component {
  render () {
    const { text, link, instructions, plus } = this.props
    return (
      <div className="step">
        <div className="title">
          { plus && <span className="blue">+ </span> } <a href={link}>{text}</a>
        </div>
        <div className="details">
    { plus && <span className="blue">+</span>} {instructions}
        </div>
      </div>
    );
  }
}

export default Step