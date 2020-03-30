import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import Item from "./Item"
import TextBox from "./TextBox"
import SubItem from "./SubItem"
import Footer from "./Footer"

class Covid19 extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <div className="resources">
          <TextBox text={"The following is a summary of the CARES Act intended to provide economic relief for individuals and businesses affected by the Corona Virus."} />
          <div className="dates">
          <Item text={"Stimulus/Rescue Payments"} />
          <SubItem text={
            "US residents are eligible for a $1,200 rebate ($2,400 for married couples) with an additional rebate of $500 per child. The rebate phases out beginning at AGI of $75,000 for single taxpayers, $150,000 for married taxpayers, and $112,500 for head of household taxpayers. Payments will be based on 2019 tax returns if filed, or 2018 tax returns if 2019 is not filed yet."
          } />
          More info coming soon!
          <div style={{paddingTop: '50px'}}></div>
          </div>
          </div>
        <Footer />
      </div>
    );
  }
}

Covid19.propTypes = {
  logo: PropTypes.node
};
export default Covid19