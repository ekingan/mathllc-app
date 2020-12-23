import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import Section from "./Section"
import Item from "./Item"
import SubItem from "./SubItem"
import Note from "./Note"

class Services extends React.Component {
  render () {
    return (
      <div className="home-container" >
        <div className="services">
          <Header logo={this.props.logo}/>
          <Nav />
          <Section text={"TAX PREPARATION SERVICES"}/>
          <Item text={"preparation of individual, small business, llc, partnership, corporation and some nonprofit tax returns" } />
          <Item text={"electronic filing available for all 50 states" } />
          <Item text={"expert attention to all credits and deductions to maximize your tax savings" } />
          <Section text={"BUSINESS FORMATION AND CONSULTING"} />
          <Item text={"help deciding which business entity is right for you"} />
          <Item text={"initial setup with the state of Oregon and the IRS"} />
          <Item text={"ongoing professional business consultation and advice"} />
          <Item text={"help to set up a bookkeeping system to meet your specific needs (including quickbooks setup)"} />
          <Item text={"bookkeeping and payroll referrals as needed"} />
          <Section text={"PERSONAL TAX PLANNING AND ADVICE"} />
          <Item text={"bookkeeping and payroll referrals as needed"} />
          <Section text={"PRICING"} />
          <Item text={"Consulting fee $80/hour"} />
          <Item text={"On-Site bookkeeping and consultation $60/hour"} />
          <Item text={"Quickbooks Online training $75/hour"} />
          <Item text={"Tax prep fees*"} />
          <SubItem text={"1040-EZ starting at $80"} />
          <SubItem text={"1040A and 1040 forms starting at $100"} />
          <SubItem text={"Schedule A (Itemized Deductions) starting at an additional $60"} />
          <SubItem text={"Schedule E (Rental income and expense) starting at an additional $60"} />
          <SubItem text={"Schedule C (sole proprietor, single member LLC) starting at an additional $90"} />
          <SubItem text={"Additional state returns starting at $40 per state"} />
          <SubItem text={"Corporate and Partnership tax returns starting at $450"} />
          <Note text={
            "* Prices include consultation, preparation and electronic filing of federal return and one state return." + 
            "Prices are subjuect to change. Additional cost may apply for other tax forms required such as schedule A, " + 
            "home office, certain tax credits deductions, other sources of income, and depreciating property."} />
        </div>
      </div>
    );
  }
}

Services.propTypes = {
  logo: PropTypes.string
};

export default Services
