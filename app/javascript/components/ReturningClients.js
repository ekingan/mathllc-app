import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import Note from "./Note"
import Section from "./Section"
import Step from "./Step"

class ReturningClients extends React.Component {
  render () {
    return (
      <div className="home-container">
        <div className="returning-clients" >
          <Header logo={this.props.logo}/>
          <Nav />
          <Note text={
            "For individual taxpayers interested in filing by the April 15th deadline, we require all your tax materials no later than March 20th. For partnerships and s-corporations, we will need your tax materials no later than Feb 20th in order to meet the March 15th deadline."
            } />
          <Section text={"For our returning clients, here are a few links to help you get started:"} />
          <div className="step-header">Step #1</div>
          <Step
            plus={true}
            text={"FILL OUT THE TAX ORGANIZER:"}
            link={"https://mathllc.s3.us-west-2.amazonaws.com/MATH_TAX_ORGANIZER_2021.pdf"}
            instructions={"All clients will have to complete this organizer, including the engagement letter,  in order for us to begin working on your taxes! If we are preparing a return for your small business and you use Quickbooks or other accounting software, please provide us with a back-up version of your Quickbooks, access to it online, or financial statements."
            }/>
          <Note text={"* note - You must use a software program like Adobe or Preview to complete the organizer rather than completing it within your web browser, otherwise you will not be able to save your work. You can also print it out and complete it by hand."}/>
          <div className="step-header">Step #2</div>
          <Step
            plus={true}
            text={"UPLOAD TAX DOCUMENTS:"}
            link={"https://mathllc.securefilepro.com/"}
            instructions={"If you need to set up a web portal account, please email us and we can set it up for you. If you already have a portal account, you may upload your documents at any time!"}
          />
          <div className="step-header" style={{ paddingTop: '20px', paddingBottom: '20px' }}>OR</div>
          <Step
            plus={true}
            text={"MAIL OR DROP OFF YOUR DOCUMENTS:"}
            link={""}
            instructions={"We have a secure drop-box located at 4815 NE 30th Ave Portland OR 97211. You may also mail your materials to this address."}
          />
          <div className="step-header" style={{ paddingTop: '40px'}}>Step #3</div>
          <Step
            plus={true}
            text={"SIGN YOUR TAX RETURN:"}
            link={""}
            instructions={"Under the assumption that meeting in person this year is not possible, we will upload your tax return to the web portal for you to sign and review."}
          />
          <div style={{ paddingTop: '40px'}}></div>
        </div>
      </div>
    );
  }
}

ReturningClients.propTypes = {
  logo: PropTypes.node
};
export default ReturningClients
