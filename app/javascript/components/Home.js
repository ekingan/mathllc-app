import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import Intro from "./Intro"
import Footer from "./Footer"

class Home extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <Intro />
        <Footer />
      </div>
    );
  }
}

Home.propTypes = {
  logo: PropTypes.node
};
export default Home
