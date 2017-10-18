class Report

    @robot = null

    @store: ->
        throw new Error('robot is not set up') unless @robot
        @robot.brain.data.reports or= {}

    @all: ->
        reports = []
        for key, reportData of @store()
            reports.push new Report(reportData.author, key, reportData.details)
        reports

    @get: (id) ->
        return null unless @exists id
        reportData = @store()[id]
        new Report(reportData.author, id, reportData.details)

    @exists: (id) ->
        id of @store()

    @create: (author) ->
        return false unless author
        id = Report.generateId()
        details = {	status: "new" }
        @store()[id] =
            author: author
            details: details
        new Report(author, id, details)

    @generateId: ->
        Date.now()

    constructor: (@author, @id, details = {}) ->
        {@message, @involved, @status} = details

module.exports = Report
