import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import TextBox from "./TextBox"
import Item from "./Item"
import SubItem from "./SubItem"
import Step from "./Step"
import SimpleLink from "./SimpleLink"
import Footer from "./Footer"

class Dates extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <TextBox text={"IMPORTANT 2019 TAX DEADLINES:"} />
        <div className="dates">
          <Item text={"Jan 15th, 2019"} />
          <SubItem text={"Fourth quarter estimated tax payments due for tax year 2018."} />
          
          <Item text={"Jan 31st, 2019"} />
          <SubItem text={"Forms 1099-misc must be sent to independent contractors, w-2s must be sent to employees, and information returns 1096, 1099 and w-2 must be sent to the IRS."} />
          
          <Item text={"Feb 15th, 2019"} />
          <SubItem text={"Last day to provide Math LLC with your paperwork in order to meet March 15th deadlines."} />

          <Item text={"March 15th, 2019"} />
          <SubItem text={"Partnerships and S-Corporation tax returns and extensions due, last day to elect s-corp status for the full year."} />

          <Item text={"March 20th, 2019"} />
          <SubItem text={"All tax information due to Math LLC in order to meet the April 15th filing deadline. "} />

          <Item text={"April 15th, 2019"} />
          <SubItem text={"Individual, Trusts, and C-Corporation tax returns and extensions are due.  FBAR returns due."} />

          <Item text={"May 15th, 2019"} />
          <SubItem text={"Non Profit form 990, 990EZ, and 990N or extensions due."} />

          <Item text={"June 15th, 2019"} />
          <SubItem text={"Fourth quarter estimated tax payments due for tax year 2018."} />

          <Item text={"September 16th, 2019"} />
          <SubItem text={"Last day to file corporate and partnership tax returns. Third quarter estimated tax payments due."} />

          <Item text={"October 15th, 2019"} />
          <SubItem text={"Last day to file individual tax returns and FBAR returns."} />

          <Item text={"November 15th, 2019"} />
          <SubItem text={"Extended non-profit tax returns due."} />

          <Item text={"Estimated tax due dates for 2019: April 15th, June 15th, Sept 15th, and Jan 15th, (2020)"} />
         
          <div style={{paddingTop: '20px'}}></div>

          <TextBox text={"USEFUL LINKS TO FORMS AND RESOURCES:"} />
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

          <SimpleLink link={"https://s3-us-west-2.amazonaws.com/mathllc/Accountable_Plan_Agreement.pdf"} text={"Download an accountable plan"} />
          <SimpleLink link={"https://s3-us-west-2.amazonaws.com/mathllc/ExpenseReport.xls"} text={"Download an expense report"} />
          <SimpleLink link={"https://s3-us-west-2.amazonaws.com/mathllc/MCNW_Bookkeeping_Template.xlsx"} text={"Download a spreadsheet to track your income and expenses"} />

          <div style={{paddingTop: '50px'}}></div>
        </div>
        <Footer />
      </div>
    );
  }
}

Dates.propTypes = {
  logo: PropTypes.node
};
export default Dates