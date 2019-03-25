import React from 'react'
// stories
// 1
export default function (props) {
  return (
    <div>
      <img src={props.img_src} alt={props.img_alt}>
      </img>
      <button role="link">
        {props.button_text}
      </button>
    </div>
  )
}
