import React from "react"

class Link extends React.Component {
  render () {
    const { text, link } = this.props
    return (
      <div className="link">
        {text} => <a href={link}>{link}</a>
      </div>
    );
  }
}

export default Link