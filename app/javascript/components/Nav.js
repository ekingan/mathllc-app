import React from "react"

class Nav extends React.Component {
  render () {
    return (
      <ul className="nav">
        <li className="page-divider"></li>
        <li> <a> About Us </a> </li>
        <li> <a> Services </a>  </li>
        <li> <a> New Clients </a>  </li>
        <li> <a> Returning Clients </a>  </li>
        <li> <a> Dates & Forms </a>  </li>
        <li> <a> Resources </a>  </li>
        <li className="page-divider"></li>
      </ul>
    );
  }
}

export default Nav