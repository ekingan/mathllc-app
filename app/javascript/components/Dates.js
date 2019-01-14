import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import TextBox from "./TextBox"
import Item from "./Item"
import SubItem from "./SubItem"
import Step from "./Step"
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
         
          <div style={{paddingTop: '50px'}}></div>

          <TextBox text={"USEFUL LINKS TO FORMS AND RESOURCES:"} />
          <Step
            text={"Detailed instructions on how to file form 1099 for your independent contractors:"}
            link={"http://biztaxlaw.about.com/od/employmenttaxforms/ht/1099misc.htm"}
            instructions={"1. If you anticipate paying a contractor $600 or more during the year, give them form W-9 form when you start working with them."
            }
            plus={false}
          />
          <div className="details">
            2. At the end of the year, you can file the 1099 yourself with the 
            <a href="https://iop.intuit.com/welcome/1099.jsp?SC=ppc_google_1099&cid=ppc_Google_1099_e-file-1099%27s_Exact&X1ID=~uk~&gclid=CjwKCAiA15vTBRAHEiwA7Snfc4Tk7meB_eQTcGk20uZj31OmlBOmU1ATWrRocMykt9nerVnqAdkjiBoCl0UQAvD_BwE&s_kwcid=AL!2419!3!242528822113!e!!g!!e%20file%201099%27s&ef_id=WlKuKQAAAZGZBjUV:20180124053139:s" target="_blank">
             IRS
            </a> 
             and 
            <a href="https://revenueonline.dor.oregon.gov/tap/_/#1" target="_blank">
             OR
            </a>.
          </div> 

          <div className="title">
            <a href="" target="_blank" >Independent Contractor vs. Employee</a> - A link to how to decipher between the two and the implications of each
          </div>


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