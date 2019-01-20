import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import TextBox from "./TextBox"
import SimpleLink from "./SimpleLink"
import Footer from "./Footer"

class Resources extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <TextBox text={"STARTING A BUSINESS IN OREGON"} />
        <SimpleLink text={"Oregon Business Toolkit"} link={"https://www.oregon.gov/business/Pages/toolkit.aspx"} />
        <SimpleLink text={"Oregon Start-A-Business Guide"} link={"https://sos.oregon.gov/business/Documents/business-guides/start-business-guide.pdf"} />
        <SimpleLink text={"Business Name Search"} link={"http://egov.sos.state.or.us/br/pkg_web_name_srch_inq.login"} />
        <SimpleLink text={"Register a business in Oregon"} link={"https://secure.sos.state.or.us/cbrmanager/index.action#stay"} />
        <SimpleLink text={"Get an EIN (Employer Identification Number)"} link={"https://www.irs.gov/businesses/small-businesses-self-employed/apply-for-an-employer-identification-number-ein-online"} />
        
        <TextBox text={"LOW-COST & FREE OREGON BUSINESS ASSISTANCE"} />
        <SimpleLink text={"Oregon IDA Grants"} link={"https://oregonidainitiative.org/"} />
        <SimpleLink text={"Inclusive Business Resource Network"} link={"https://prosperportland.us/portfolio-items/inclusive-business-resource-network/"} />
        
        <TextBox text={"LOW INCOME TAX LEGAL SUPPORT"} />
        <SimpleLink text={"El Programa Hispano Catolico"} link={"http://elprograma.org/program-services/tax-services/low-income-taxpayer-clinic-litc/"} />
        
        <TextBox text={"NON PROFIT PERSONAL FINANCIAL SERVICES"} />
        <SimpleLink text={"Innovative Changes"} link={"https://www.innovativechanges.org/"} />
        <SimpleLink text={"Metropolitan Family Services"} link={"https://www.metfamily.org/"} />
        <SimpleLink text={"Financial Beginnings (For youth)"} link={"https://www.financialbeginnings.org/"} />

        <TextBox text={"SELF EMPLOYED TAXES"} />
        <SimpleLink text={"June Walker - Tax advisor to the self employed. Check out her website for tips and tricks"} link={"https://www.innovativechanges.org/"} />

        <TextBox text={"PERSONAL FINANCE"} />
        <SimpleLink text={"Hadassah Damien - Real talk on personal finance, relating to money, and progressive economics"} link={"http://www.ridefreefearlessmoney.com/"} />
        <SimpleLink text={"ridefreefearlessmoney.com"} link={"https://www.ridefreefearlessmoney.com/"} />
        <SimpleLink text={"Oh My Dollar"} link={"https://www.ohmydollar.com/"} />

        <div style={{paddingTop: '50px'}}></div>
        <Footer />
      </div>
    );
  }
}

Resources.propTypes = {
  logo: PropTypes.node
};
export default Resources