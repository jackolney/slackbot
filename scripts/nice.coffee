# Description:
#   Tell hubot to play nicely
#
# Commands:
#   hubot be nice

module.exports = (robot) ->
  robot.respond /be nice/i, (msg) ->
    msg.send "Okay... I'll be good :simple_smile:"
