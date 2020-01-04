import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import TextBox from "./TextBox"
import Link from "./Link"
import Footer from "./Footer"

class NewClients extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <TextBox text={
          "Hello and thank you for your interest in working with Math! We are no longer accepting new clients at this time. Here are a few tax professionals we recommend. Just tell them that Math sent you!"
          } />
        <Link text={"In or Out Tax Service"} link={"https://inorouttaxservice.com/"}/>
        <Link text={"Artemis Tax"} link={"http://www.artemistax.com"}/>
        <Link text={"Marisa Barto"} link={"http://thetaxstrategistnw.com/"}/>
        <div style={{paddingTop: '50px'}}></div>
        <Footer />
      </div>
    );
  }
}

NewClients.propTypes = {
  logo: PropTypes.node
};
export default NewClients