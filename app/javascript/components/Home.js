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
        <Intro text={
          "MATH LLC PROVIDES TAX PREPARATION, ACCOUNTING SERVICES AND FINANCIAL CONSULTING " + 
          "FOR INDIVIDUALS AND SMALL BUSINESSES.  WE HOPE TO MAKE TAXES AND FINANCE A " +
          "SOURCE OF EMPOWERMENT BY PROVIDING INCREASED ACCESSIBILITY TO A OFTEN INTIMIDATING FIELD. " + 
          "WE AIM TO CREATE A SPACE WHERE OUR CLIENTS CAN CONNECT WITH AND SUPPORT ONE ANOTHER " +
          "THROUGH THE EXCHANGE OF GOODS AND SERVICES. "
        }/>
        <Footer />
      </div>
    );
  }
}

Home.propTypes = {
  logo: PropTypes.node
};
export default Home
