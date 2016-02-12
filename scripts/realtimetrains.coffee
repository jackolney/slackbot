# Description:
#   Get UK rail departure information from realtimetrains.co.uk
#
# Dependencies:
#   None
#
# Configuration:
#   # deprecated (for now): HUBOT_DEFAULT_STATION - set the default from station (nearest to your home/office)
#
# Commands:
#   hubot: trains from <departure station> to <arrival station> - Get trains from one station to another
#   # deprecated (for now): hubot: trains to <arrival station> - Get trains from the default station to another
#
# Notes:
#   Uses http://www.realtimetrains.co.uk/ to pull down national rail times
#   Really my first hubot script, so its rough!
#
# Author:
#  Jack Olney <jack.olney@me.com>

module.exports = (robot) ->

    user = "rttapi_jackolney"
    pass = "0e84b0f9e86b7c574ab4de0cf3f76691014adca3"

    robot.respond /trains from (.+) to (.+)/i, (res) ->
        from = res.match[1]
        to = res.match[2]
        rtt_call = "https://#{user}:#{pass}@api.rtt.io/api/v1/json/search/#{from}/to/#{to}"
        res.http(rtt_call)
            .get() (err, httpRes, body) ->
                json = JSON.parse(body)
                if json.services.length
                    res.send "Next trains from #{from} to #{to}:"
                    i = 0
                    while i < json.services.length
                        train = json.services[i]
                        if i < 5
                            train.locationDetail.platform
                            response = "The #{train.locationDetail.origin[0].description} to #{train.locationDetail.destination[0].description}"
                            response += ", from platform #{train.locationDetail.platform}"
                            response += ", departs at #{train.locationDetail.realtimeDeparture}"
                            res.send response
                            i++
                else
                    res.send "Sorry, there's no trains today"
