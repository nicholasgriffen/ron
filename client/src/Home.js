import React from 'react'
// stories
// 1
export default function (props) {
  return (
    <div>
      <img src={props.img_src} alt={props.img_alt} onClick={props.click_handler} style={imgStyle}>
      </img>
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