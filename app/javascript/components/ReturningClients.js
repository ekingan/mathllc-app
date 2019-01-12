import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import Note from "./Note"
import Section from "./Section"
import Footer from "./Footer"

class ReturningClients extends React.Component {
  render () {
    return (
      <div className="home-container">
        <div className="returning-clients" >
          <Header logo={this.props.logo}/>
          <Nav />
          <Note text={
            "For individual taxpayers interested in filing by the April 18th deadline, we require all your tax materials no later than March 20th. For partnerships and s-corporations, we will need your tax materials no later than Feb 20th in order to meet the March 15th deadline." 
            } />
          <Section text={"For our returning clients, here are a few links to help you get started:"} />
          <Footer />
        </div>
      </div>
    );
  }
}

ReturningClients.propTypes = {
  logo: PropTypes.node
};
export default ReturningClients