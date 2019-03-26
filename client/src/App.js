import React from 'react'
import Home from './Home'
import Quote from './Quote'
import Error from './Error'

export default class extends React.Component {
  constructor() {
    super()
    this.state = {
      activeQuote: null,
      endpoint: '/api/quotes'
    }
  }

  getQuote = () => {
    var size = document.getElementById("size-select").value || "small"
    fetch(`${this.state.endpoint}?size=${size}`).then(res => res.json()).then(quote => {
      this.setState({
        ...this.state,
        error: null,
        activeQuote: quote
      })
    })

  }

  rateQuote = id => e => {
    e.preventDefault()
    fetch(`${this.state.endpoint}?id=${id}`, {
      method: 'POST',
      body: JSON.stringify({
        rating: Array.from(document.getElementById('ratingForm').children).find(x => x.checked).value
      }),
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      }
    }).then(res => {
      // api returns a 401 if ip is in the quote blacklist
      if (res.status === 401) {
        return Promise.reject("You've already voted on this quote")
      } else {
        return res.json()
      }
    }).then(rating => {
      this.setState({
        activeQuote: Object.assign(this.state.activeQuote, { rating: rating }),
        error: null,
      })
    }).catch(e => this.setState({
      ...this.state,
      error: e
    }))
  }
  render() {
    return (
      <div style={columnContainer}>
        <Error message={this.state.error} />
        <Quote quote={this.state.activeQuote} rateQuote={this.rateQuote} />
        <Home style={columnContainer}
          img_src="./penny.png"
          img_alt="back of a united states penny circa unknown year. click to get a Swanson word of wisdom"
          button_text="CLICK TO GET A SWANSON WORD OF WISDOM"
          click_handler={this.getQuote}
        />
        <footer>
          Quotes sourced from <a href="https://github.com/jamesseanwright/ron-swanson-quotes">Ron Swanson Quotes API</a>
        </footer>
      </div>
    )
  }
}

var columnContainer = {
  display: "flex",
  alignItems: "center",
  justifyContent: "spaceAround",
  flexDirection: "column"
}
