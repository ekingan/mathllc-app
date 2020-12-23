import React from "react"

class Nav extends React.Component {
  render () {
    return (
      <ul className="nav">
        <li className="page-divider"></li>
        <li> <a href="/about"> About </a> </li>
        <li> <a href="/dates"> Dates & Deadlines</a>  </li>
        <li> <a href="/resources"> Referrals & Resources </a>  </li>
        <li className="page-divider"></li>
      </ul>
    );
  }
}

export default Nav
