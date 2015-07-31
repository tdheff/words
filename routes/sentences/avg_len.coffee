module.exports = (req, res) ->
  enders = ((req.body.text.match /\.\.\.\.?|[.!?]/g) || [])
  text = req.body.text.replace /\.\.\.\.?|[ .!?]/g, ""
  # note: to ignore other chars, simply add them to the list of
  # ignore chars (currently ".!?" in the second regex)

  # currently ignores spaces but not other punctuation

  console.log text

  # simple divides the number of characters total by the number of characters
  # that end sentences. should handle ellipses
  res.json { avg_len: text.length/enders.length }
