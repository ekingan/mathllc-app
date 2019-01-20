import React from "react"

class Nav extends React.Component {
  render () {
    return (
      <ul className="nav">
        <li className="page-divider"></li>
        <li> <a href="/about"> About Us </a> </li>
        <li> <a href="/services"> Services </a>  </li>
        <li> <a href="/new-clients"> New Clients </a>  </li>
        <li> <a href="/returning-clients"> Returning Clients </a>  </li>
        <li> <a href="/dates"> Important Dates</a>  </li>
        <li> <a href="/resources"> Other Resources </a>  </li>
        <li className="page-divider"></li>
      </ul>
    );
  }
}

export default Nav