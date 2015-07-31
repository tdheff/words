_ = require 'underscore'

module.exports = (req, res) ->
  # remove punctuation
  text = req.body.text.replace /[\.,-\/#!$%\^&\*;:{}=\-_`~()]/g, ""

  # split on spaces, count number of words
  words = text.split " "
  counts = _.countBy words, (word) ->
    return word

  # iterate through to find most common word, break ties
  # by alphabetical order
  max = 0
  max_word = ''
  for word, count of counts
    if count > max or (count is max and word < max_word)
      max_word = word
      max = count

  # this could be done slightly more efficiently by merging
  # the countin process with the finding of the most common
  # word. that said, this should have the same asymptotic time
  res.json { most_com: max_word }
