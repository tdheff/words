module.exports = (req, res) ->
  text = req.body.text.replace /[\.,-\/#!$%\^&\*;:{}=\-_`~()]/g, ""
  words = text.split " "
  chars = (words.map (a) -> return a.length).reduce (prev, next) ->
    return prev + next

  # pretty simply strips punctuation, splits on spaces, then adds up
  # the number of chars in the words and divides by the number of words

  res.json { avg_len: chars/words.length }
