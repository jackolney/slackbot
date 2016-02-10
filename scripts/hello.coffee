# Description:
#   Some fun phrases for hubot, something to make him a bit more 'human'
#
# Commands:
#   hubot greet - Say hello to the world
#   hubot pub - if you mention the pub, hubot will leap at the chance
#   hubot lunch - if you mention lunch, hubot will ask you to get him some
#   hubot windows - if you mention an OS that is not Unix-based, hubot will be mad
#   hubot how are you? - ask hubot how he is

module.exports = (robot) ->
    robot.respond /greet/i, (msg) ->
        msg.send "Hello, Jack!"

    robot.hear /pub/i, (res) ->
        res.send "Did someone mention the pub -- can I come?? (anywhere but the Monkey Puzzle)"

    robot.hear /lunch/i, (res) ->
        res.send "One Pad Thai for me please."

    robot.hear /windows/i, (res) ->
        res.send "You know Windows is a pile of crap, right?"

    howareyou_responses = [
        "Fine, thanks. You?",
        "I'm good!",
        "Urgh, wheres the coffee?",
        "Good thanks."
    ]

    robot.respond /how are you?/, (msg) ->
        msg.send msg.random howareyou_responses
