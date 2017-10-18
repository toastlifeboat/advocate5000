# Description:
#   Create and file anonymous or nonymous reports for review
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot status - tells you the bot's state of development
#
# Author:
#   kellbot

Author  = require './models/author'
Report  = require './models/report'
Util    = require "util"

module.exports = (robot) ->

    Report.robot = robot

    robot.respond /status/i, (msg) ->
        msg.send "Nothing works."

    robot.respond /start report/i, (msg) ->
        report = Report.create(msg.message.user.id)
        msg.send "I created a report with ID #{report.id}."

    robot.respond /find report ([0-9-_]*)/i, (msg) ->
        report = Report.get(msg.match[1])
        msg.send Util.inspect(report)
        
        
    robot.respond /all reports/i, (msg) ->
        msg.send Util.inspect(Report.all())
