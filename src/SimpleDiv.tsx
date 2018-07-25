import * as React from 'react';

interface IUser extends React.Props<any> {   
  username : string 
}

class Simple extends React.Component<IUser> {

  public render() {
    return (
      <div>
           Hello there, {this.props.username}  </div> 
    );
 }
}

export default Simple;