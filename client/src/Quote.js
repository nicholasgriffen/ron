import React from 'react'

export default function ({activeQuote, rateQuote}) {
  return (
      activeQuote ?
      <div>
        Ron says: {activeQuote.text}<br></br>
        Average Rating: <span>{activeQuote.rating}</span><br></br>
        Select your rating: 
        <form onSubmit={rateQuote(activeQuote.id)}>
            <input type="radio" name="rating" value="1" /> 1
            <input type="radio" name="rating" value="2"/> 2
            <input type="radio" name="rating" value="3" /> 3
            <input type="radio" name="rating" value="4" /> 4  
            <input type="radio" name="rating" value="5" /> 5  
            <input type="submit" value="Rate" />
        </form>
      </div> 
      : null 
  )
}
