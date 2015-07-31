module.exports = (req, res) ->
  text = req.body.text

  res.json { numbers: getphones text, false }

# searches a string for phone numbers and finds them
# will accept phone numbers separated by spaces, and
# any of the separators in the swtich case, currently
# '(', ')', '-', '.'

# accepts numbers with a leading one, and with or
# without area code

# should handle a lot of sensible input. will fail if the
# phone numbers are among other numbers and separators
# or if the input doesn't have sensible delineation,
# ie 8 8 8 8 8 8 8 7 7 7 7 7 7 7 where the phone numbers
# are 888-8888 and 777-7777

# will accept some 'questionable' phone numbers,
# like 8.8.8.8.8.8.8

# turning on strict will not pick these numbers up,
# but may ignore numbers that follow a mess of numbers
getphones = (str, strict) ->
  str += 'x'
  phones = []

  i = 0
  num = ''
  min_length = 7
  max_length = 11
  for i in [0..str.length-1]

    switch str[i]
      # accept separators
      when '(', ')', '-', '.'
        if strict
          if num.length is 1 and num[0] isnt '1' or
          num.length is 3 and num[0] is '1' or
          num.length is 4 and num[0] isnt '1' or
          num.length is 6 and num[0] is '1' or
          num.length is 7 and num[0] isnt '1'
            num = ''
      # end number on spaces if the minimum has been reached
      # checks a special case where the number starts with leading 1
      # for long distance calls and there is a space betwen the three
      # and four number bits of the number, ie: 1 888 888 8888
      when ' '
        if num.length >= min_length and not (num.length is 7 and num[0] is '1')
          phones.push num
          num = ''
      # handle numbers and other random characters
      else
        if str[i].match /\d/
          num = num + str[i]
        else
          if num.length >= min_length
            phones.push num
          num = ''

  phones = (phone for phone in phones when phone.length <= max_length and testrules phone)

  return phones

# tests given phone number against simple format rules for US phone numbers
testrules = (num) ->
  switch num.length
    when 11
      if num[0] isnt '1'
        return false
      if num[1] is '0' or num[1] is '1'
        return false
      if num[4] is '0' or num[4] is '1'
        return false
      return true
    when 10
      if num[0] is '0' or num[0] is '1'
        return false
      if num[3] is '0' or num[3] is '1'
        return false
      return true
    when 7
      if num[0] is '0' or num[0] is '1'
        return false
      return true
    else
      return false
