# Description:
#   Tell hubot to play nicely
#
# Commands:
#   hubot be nice

module.exports = (robot) ->
  robot.respond /be nice/i, (msg) ->
    msg.send "okay... I'll be good :simple_smile:"
