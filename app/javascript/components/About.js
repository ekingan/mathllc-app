import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import GeneralAbout from "./GeneralAbout"
import Profile from "./Profile"

class About extends React.Component {
  render () {
    const { logo, preparers } = this.props
    const preparerProfiles = Object.keys(preparers).map(function(key) {
      return <Profile key={key} preparer={preparers[key]}/>
    })
    return (
      <div className="home-container">
        <Header logo={logo}/>
        <Nav />
        <GeneralAbout />
        {preparerProfiles}
        <div style={{paddingTop: '50px'}}></div>
      </div>
    );
  }
}

About.propTypes = {
  logo: PropTypes.string,
  preparers: PropTypes.object
};

export default About
