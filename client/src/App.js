import React from 'react'
import Word from './Word'

// a picture of a quarter. click to get a Swanson word of wisdom
export default function () {
  return (
    <Word
      img_src="./quarter.png"
      img_alt="a united states quarter circa unknown year. click to get a Swanson word of wisdom"
      button_text="CLICK TO GET A SWANSON WORD OF WISDON"
    />
  )
}