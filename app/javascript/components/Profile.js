import React from "react"

class Profile extends React.Component {
  render () {
    const { first_name, last_name, job_title, bio, image_url } = this.props.preparer
    return (
      <div className="about">
        <div className="profile">
          <div className="left">
            <p>{first_name + " " + last_name + "," + " " + job_title}</p>
            <p className="bio">{bio}</p>
          </div>
          <div className="right">
            <img src={image_url}></img>
          </div>
        </div>
        <hr></hr>
      </div>
    );
  }
}

export default Profile