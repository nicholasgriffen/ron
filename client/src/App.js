import React from 'react'
import Home from './Home'
import Quote from './Quote'

export default class extends React.Component {
  constructor() {
    super()
    this.state = {
      quotes: [],
      activeQuote: null, 
      endpoint: '/api/quotes'
    }
  }

  getQuote = () => {
    var size = document.getElementById("size-select").value || "small"
    fetch(`${this.state.endpoint}?size=${size}`).then(res => res.json()).then(quote => {
      this.setState({
        ...this.state, 
        activeQuote: quote
      })
    })
    
  }

  rateQuote = id => e => {
    fetch(`${this.state.endpoint}?id=${id}`, {
      method: 'POST', 
      body: JSON.stringify({
        rating: e.target.value
      }), 
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      }
    }).then(res => res.json()).then(rating => {
      this.setState({
        ...this.state, 
        quotes: this.state.quotes.map(quote => {
          if (quote.id === +id) {
            quote.rating = rating 
          }
          return quote 
        })
      })
    })
  }
  render() {
    return (
      <div style={appComponentStyle}>
        <Quote quote={this.state.activeQuote}/>
        <Home
          img_src="./penny.png"
          img_alt="back of a united states penny circa unknown year. click to get a Swanson word of wisdom"
          button_text="CLICK TO GET A SWANSON WORD OF WISDOM"
          click_handler={this.getQuote}
        />
      </div>
    )
  }
}

var appComponentStyle = {
  display: "flex",
  alignItems: "center",
  justifyContent: "space-around", 
  flexDirection: "column"
}
