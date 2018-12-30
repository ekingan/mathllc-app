import React from "react"
import PropTypes from "prop-types"

class Header extends React.Component {
  render () {
    return (
      <div className="header">
        <img src={this.props.logo} />
      </div>
    );
  }
}

Header.propTypes = {
  logo: PropTypes.node
}

export default Header