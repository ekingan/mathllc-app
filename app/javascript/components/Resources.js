import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import TextBox from "./TextBox"
import SimpleLink from "./SimpleLink"
import Step from "./Step"
import Footer from "./Footer"

class Resources extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <div className="resources">
          <TextBox text={"COMMON TAXPAYER QUESTIONS:"} />
            <Step
              text={"Detailed instructions on how to file form 1099 for your independent contractors:"}
              link={"http://biztaxlaw.about.com/od/employmenttaxforms/ht/1099misc.htm"}
              instructions={"1. If you anticipate paying a contractor $600 or more during the year, give them form W-9 form when you start working with them."
              }
              plus={false}
            />
            <div className="details">
              2. At the end of the year, you can file the 1099 yourself with the&nbsp; 
              <a href="https://iop.intuit.com/welcome/1099.jsp?SC=ppc_google_1099&cid=ppc_Google_1099_e-file-1099%27s_Exact&X1ID=~uk~&gclid=CjwKCAiA15vTBRAHEiwA7Snfc4Tk7meB_eQTcGk20uZj31OmlBOmU1ATWrRocMykt9nerVnqAdkjiBoCl0UQAvD_BwE&s_kwcid=AL!2419!3!242528822113!e!!g!!e%20file%201099%27s&ef_id=WlKuKQAAAZGZBjUV:20180124053139:s" target="_blank">
              IRS
              </a> 
              &nbsp;and&nbsp; 
              <a href="https://revenueonline.dor.oregon.gov/tap/_/#1" target="_blank">
              OR
              </a>&nbsp;.
            </div> 

            <div className="title" style={{paddingTop: '20px', paddingBottom: '20px'}}>
              <a href="https://www.sba.gov/business-guide/manage-your-business/hire-manage-employees" target="_blank" >Independent Contractor vs. Employee</a> - A link to how to decipher between the two and the implications of each
            </div>

            <Step
              text={"What happens if I file for an extension?"}
              link={"https://www.irs.gov/newsroom/eight-facts-on-late-filing-and-late-payment-penalties"}
              instructions={"Filing an extension to file does not give you extra time to pay your tax due. Those taxpayers who file an extension will be charged the current short term rate plus an interest rate of about 3% on their balance due per year. Unless you have a huge tax liability, the consequences are usually pretty minor but it is still a good idea to send some sort of payment in with your extension if you anticipate having a tax due."
              }
              plus={false}
            />

            <div className="title" style={{paddingTop: '20px'}}>
              <a href="https://www.irs.gov/refunds" target="_blank" >Where's my refund? </a> - IRS website with info on your tax refund
            </div>

            <SimpleLink link={"https://www.macrumors.com/how-to/digitally-sign-a-pdf-using-preview-on-mac/"} text={"How to sign your tax return on your computer"} />

            <div className="title" style={{paddingTop: '20px'}}> 
              <span>What if you get a letter from the IRS or other tax bureau?</span>
              <br></br>
              <span className="details" style={{paddingLeft: '20px'}}>
              Don't panic! Most of these issues can be resolved quickly and painlessly. The first step is to provide your preparer with a copy of the letter you received. We can best help you after reading their letter. 
              </span>
            </div>

            <div className="title" style={{paddingTop: '20px'}}> 
              <span>What if you get a phone call or email from the IRS or other tax bureau?</span>
              <br></br>
              <span className="details" style={{paddingLeft: '20px'}}>
                No tax bureau ever will ever make initial contact you via email or phone. In almost all cases these emails and phone calls are fishing schemes!  
                Sometimes a tax bureau will follow up with you via email or phone with specifics of your case, but only after you have made initial contact with them.    
              </span>
            </div>

            <TextBox text={"USEFUL FORMS:"} />

            <SimpleLink link={"https://s3-us-west-2.amazonaws.com/mathllc/Accountable_Plan_Agreement.pdf"} text={"Download an accountable plan"} />
            <SimpleLink link={"https://s3-us-west-2.amazonaws.com/mathllc/ExpenseReport.xls"} text={"Download an expense report"} />
            <SimpleLink link={"https://s3-us-west-2.amazonaws.com/mathllc/MCNW_Bookkeeping_Template.xlsx"} text={"Download a spreadsheet to track your income and expenses"} />

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
        </div>
        <Footer />
      </div>
    );
  }
}

Resources.propTypes = {
  logo: PropTypes.node
};
export default Resources