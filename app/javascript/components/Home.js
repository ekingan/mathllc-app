import React from "react"
import PropTypes from "prop-types"
import Header from "./Header"
import Nav from "./Nav"
import Intro from "./Intro"

class Home extends React.Component {
  render () {
    return (
      <div className="home-container">
      <Header logo={this.props.logo}/>
        <div className="intro">
          <div className="text">
            Like many businesses in 2020, Math LLC has experienced some big changes.
            <p></p>
            Beginning in 2021, Math LLC goes from a team of 4 to a team of 1.
            <br></br>
            As the founding member of Math LLC, Em Kingan will continue working with her existing clients moving forward.
            You are considered an exisiting client if you filed your taxes with Kingan in 2020.
          </div>
          <div className="text">
            Jenna and Amanda have formed an amazing new company called <a href='https://www.shiftaccountingllc.com/' target="blank">Shift Accounting</a>.
            They are awesome, you should check them out!
          </div>
          <div className="text">
            Brian Frank will continue to work with his clients under <a href="http://www.brianfrankpdx.com/" target="blank">Brian Frank Consulting</a>.
          </div>
          <br></br>
          <div className="text">
            Math LLC is not accepting new clients at this time.
          </div>
        </div>
      </div>
    );
  }
}

Home.propTypes = {
  logo: PropTypes.node
};
export default Home
