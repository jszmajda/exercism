require 'benchmark'

samples = [
  'Tom-ay-to, tom-aaaah-to.',
  'WATCH OUT!',
  'Does this cryogenic chamber make me look fat?',
  'You are, what, like 15?',
  "Let's go make out behind the gym!",
  "It's OK if you don't want to go to the DMV.",
  'WHAT THE HELL WERE YOU THINKING?',
  '1, 2, 3 GO!',
  '1, 2, 3',
  '4?',
  'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!',
  'I HATE YOU',
  'Ending with ? means a question.',
  "Wait! Hang on. Are you going to be OK?",
  '',
  '    '
]
messages = (1..100000).map { samples.sample }

class Classifier
  attr_accessor :message
  def initialize(message)
    @message = message.gsub(/\n/,'')
  end

  def is_shouting?
    message !~ /[a-z]/ && message =~ /[A-Z]/
  end

  def is_question?
    message =~ /\?$/
  end

  def is_silence?
    message =~ /^\s*$/
  end
end

class IfBob
  def hey(raw_message)
    message = Classifier.new(raw_message)
    if message.is_shouting?
      'Woah, chill out!'
    elsif message.is_question?
      'Sure.'
    elsif message.is_silence?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
ifbob = IfBob.new
class CaseBob
  def hey(raw_message)
    message = Classifier.new(raw_message)
    case
    when message.is_shouting?
      'Woah, chill out!'
    when message.is_question?
      'Sure.'
    when message.is_silence?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
casebob = CaseBob.new

Benchmark.bm do |x|
  x.report("if")   { messages.each {|m| ifbob.hey(m) } }
  x.report("case") { messages.each {|m| casebob.hey(m) } }
end
