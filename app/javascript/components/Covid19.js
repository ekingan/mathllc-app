import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import TextBox from "./TextBox"
import SimpleLink from "./SimpleLink"

class Covid19 extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <div className="resources">
          <TextBox text={"Information about COVID-19 is changing by the day. Listed below are several resources to help navigate the ever changing situation:"} />
          <div className="dates">
          <SimpleLink
            text={'Recording of Covid-19 Webinar by Jenna Goldin'}
            link={'https://www.youtube.com/watch?v=ca5Lyjizj0I'} />
          <SimpleLink
            text={'Covid-19 resources Doc compiled by Jenna Goldin'}
            link={'https://docs.google.com/document/d/1wRGemkyysB3ysiZrE-1lGMc5TXq7O7swtQLyYgBMwMk'} />
          <SimpleLink
            text={'Emergency Loan information from US Chamber of Commerce'}
            link={'https://www.uschamber.com/sites/default/files/023595_comm_corona_virus_smallbiz_loan_final_revised.pdf'} />
          <SimpleLink
            text={'Financial Resource List by Asset to the Resistance'}
            link={'https://mathllc.us3.list-manage.com/track/click?u=e23fffa9729db9bbb789ebad5&id=db39c534fd&e=3fe579e241'} />
          <div style={{paddingTop: '50px'}}></div>
          </div>
          </div>
      </div>
    );
  }
}

Covid19.propTypes = {
  logo: PropTypes.node
};
export default Covid19
