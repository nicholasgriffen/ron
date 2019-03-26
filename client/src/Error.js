import React from 'react'

export default function ({message}) {
  return (
      message ?
      <div id="errors">
        {message}
      </div> 
      : null 
  )
}
