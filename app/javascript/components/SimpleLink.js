import React from "react"

class SimpleLink extends React.Component {
  render () {
    const { text, link } = this.props
    return (
      <div className="link">
        <a href={link} target="_blank">{text}</a>
      </div>
    );
  }
}

export default SimpleLink