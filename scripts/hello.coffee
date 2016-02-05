# Description:
#   Some fun phrases for hubot, something to make him a bit more 'human'
#
# Commands:
#   hubot greet - Say hello to the world
#

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
        chosen_response = msg.random [1..4]
        msg.send msg.random howareyou_responses
