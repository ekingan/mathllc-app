import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import TextBox from "./TextBox"
import Item from "./Item"
import SubItem from "./SubItem"

class Dates extends React.Component {
  render () {
    return (
      <div className="home-container">
        <Header logo={this.props.logo}/>
        <Nav />
        <TextBox text={"IMPORTANT 2021 TAX DEADLINES:"} />
        <div className="dates">
          <Item text={"Jan 15th, 2021"} />
          <SubItem text={"Fourth quarter estimated tax payments due for tax year 2019."} />

          <Item text={"Jan 31st, 2021"} />
          <SubItem text={"Forms 1099-misc must be sent to independent contractors, w-2s must be sent to employees, and information returns 1096, 1099 and w-2 must be sent to the IRS."} />

          <Item text={"Feb 15th, 2021"} />
          <SubItem text={"Last day to provide Math LLC with your paperwork in order to meet March 15th deadlines."} />

          <Item text={"March 15th, 2021"} />
          <SubItem text={"Partnerships and S-Corporation tax returns and extensions due, last day to elect s-corp status for the full year."} />

          <Item text={"March 20th, 2021"} />
          <SubItem text={"Last day to provide Math LLC with your tax paperwork in order to meet the April 15th filing deadline."} />

          <Item text={"April 15th, 2021"} />
          <SubItem text={"Individual, Trusts, and C-Corporation tax returns and extensions are due. First quarter estimated taxes due. FBAR returns due."} />

          <Item text={"May 17th, 2021"} />
          <SubItem text={"Non Profit form 990, 990EZ, and 990N or extensions due."} />

          <Item text={"June 15th, 2021"} />
          <SubItem text={"Second quarter estimated tax payments due."} />

          <Item text={"September 15th, 2021"} />
          <SubItem text={"Last day to file corporate and partnership tax returns. Third quarter estimated tax payments due."} />

          <Item text={"October 15th, 2021"} />
          <SubItem text={"Last day to file individual tax returns and FBAR returns."} />

          <Item text={"November 15th, 2021"} />
          <SubItem text={"Extended non-profit tax returns due."} />

          <Item text={"Estimated tax due dates for 2021: Q1 April 15th, Q2 June 15th, Q3 Sept 15th, and Q4 Jan 15th, (2022)"} />

          <div style={{paddingTop: '50px'}}></div>
        </div>
      </div>
    );
  }
}

Dates.propTypes = {
  logo: PropTypes.node
};
export default Dates
