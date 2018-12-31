import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import Footer from "./Footer"
import Section from "./Section"
import Item from "./Item"

class Services extends React.Component {
  render () {
    return (
      <div className="services">
        <Header logo={this.props.logo}/>
        <Nav />
        <Section text={"TAX PREPARATION SERVICES"}/>
        <Item text={"+ preparation of individual, small business, llc, partnership, corporation and some nonprofit tax returns" } />
        <Footer />
      </div>
    );
  }
}

Services.propTypes = {
  logo: PropTypes.string
};

export default Services