import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNums = this.addNums.bind(this);
    this.subtractNums = this.subtractNums.bind(this);
    this.multiplyNums = this.multiplyNums.bind(this);
    this.divideNums = this.divideNums.bind(this);
    this.clearInputs = this.clearInputs.bind(this);
  }

  setNum1(e) {
    const num1 = e.currentTarget.value;
    this.setState({ num1 });
  }

  setNum2(e) {
    const num2 = e.currentTarget.value;
    this.setState({ num2 });
  }

  addNums(e) {
    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) + parseInt(this.state.num2) });
  }

  subtractNums(e) {
    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) - parseInt(this.state.num2) });
  }

  multiplyNums(e) {
    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) * parseInt(this.state.num2) });
  }

  divideNums(e) {
    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) / parseInt(this.state.num2) });
  }

  clearInputs(e) {
    e.preventDefault();
    this.setState({ result: 0, num1: "", num2: ""});
  }

  render() {
    const { result, num1, num2 } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input type="text" onChange={this.setNum1} value={num1} />
        <input type="text" onChange={this.setNum2} value={num2} />
        <button onClick={this.addNums}>+</button>
        <button onClick={this.subtractNums}>-</button>
        <button onClick={this.divideNums}>/</button>
        <button onClick={this.multiplyNums}>*</button>
        <button onClick ={this.clearInputs}>Clear</button>
      </div>
    );
  }
}

export default Calculator;
