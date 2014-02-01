class Bob
  hey: (msg) ->
    m = new Message(msg)
    if      m.isSilence()  then 'Fine. Be that way!'
    else if m.isShouting() then 'Woah, chill out!'
    else if m.isQuestion() then 'Sure.'
    else                        'Whatever.'

class Message
  constructor: (str) -> @str = str

  isShouting: ->
    @str == @str.toUpperCase()

  isQuestion: ->
    /\?$/.test @str

  isSilence: ->
    /^$/.test @str.trim()

module.exports = Bob
