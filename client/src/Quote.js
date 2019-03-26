import React from 'react'

export default function ({quote, rateQuote}) {
  return (
      quote ?
      <div>
        Ron says: {quote.text}<br></br>
        Average Rating: <span>{quote.rating}</span><br></br>
        Select your rating: 
        <form id="ratingForm" onSubmit={rateQuote(quote.id)}>
            <input type="radio" name="rating" value="1" /> 1
            <input type="radio" name="rating" value="2"/>  2
            <input type="radio" name="rating" value="3" /> 3
            <input type="radio" name="rating" value="4" /> 4  
            <input type="radio" name="rating" value="5" checked/> 5  
            <input type="submit" value="Rate" />
        </form>
      </div> 
      : null 
  )
}
