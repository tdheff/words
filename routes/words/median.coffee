_ = require 'underscore'

module.exports = (req, res) ->
  # remove punctuation
  text = req.body.text.replace /[\.,-\/#!$%\^&\*;:{}=\-_`~()]/g, ""

  # split on spaces, count number of words
  words = text.split " "
  counts = _.countBy words, (word) ->
    return word

  # sort the word counts
  counts_arr = _.pairs counts
  console.log (_.sortBy counts_arr, (a) -> return a[1] )

  # return the midpoint of the list
  res.json { median: (_.sortBy counts_arr, (a) -> a[1] )[counts_arr.length/2] }
