class Project extends React.Component {
  render () {
    return (
      <div>
        <div>Name: {this.props.name}</div>
      </div>
    );
  }
}

Project.propTypes = {
  name: React.PropTypes.string
};
