import React from "react"

class Profile extends React.Component {
  render () {
    const { first_name, last_name, job_title, bio, image_url } = this.props.preparer
    return (
      <div className="info">
        <div className="about">
            <p>{first_name + " " + last_name + "," + " " + job_title}</p>
            <img src={image_url}></img>
        </div>
      </div>
    );
  }
}

export default Profile