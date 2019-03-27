import React from 'react'
import Quote from './Quote'
// stories
// 1
export default function (props) {
  return (
    <div style={columnContainer}>
      <h1>Click to give Ron Swanson a penny for his thoughts</h1>
      <Quote quote={props.quote} rateQuote={props.rateQuote} />
      <input type="image" src={props.img_src} alt={props.img_alt} role="button" onClick={props.click_handler} style={imgStyle}>
      </input>
      <button onClick={props.click_handler}>
        {props.button_text}
      </button>
      <label htmlFor="size-select">Select a quote length</label>
      <select id="size-select">
        <option value="small">Small</option>
        <option value="medium">Medium</option>
        <option value="large">Large</option>
      </select>
    </div>
  )
}

var imgStyle = {
  width: "125px",
  height: "124px"
}


var columnContainer = {
  display: "flex",
  alignItems: "center",
  justifyContent: "space-around",
  flexDirection: "column"
}