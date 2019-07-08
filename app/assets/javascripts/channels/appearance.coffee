App.cable.subscriptions.create "AppearanceChannel",
    # Called when the subscription is ready for use on the server.
    connected: ->
        @install()
        @appear()
    
    # Called when the WebSocket connection is closed.
    disconnected: ->
        @uninstall()
    
    # Called when the subscription is rejected by the server.
    rejected: ->
        @uninstall()
    
    appear: ->
        # Calls `AppearanceChannel#appear(data)` on the server.
        @perform("appear", appearing_on: $("main").data("appearing-on"))
    
    away: ->
        # Calls `AppearanceChannel#away` on the server.
        @perform("away")
    
    
    buttonSelector = "[data-behavior~=appear_away]"
    
    install: ->
        $(document).on "turbolinks:load.appearance", =>
        @appear()
    
        $(document).on "click.appearance", buttonSelector, =>
        @away()
        false
    
        $(buttonSelector).show()
    
    uninstall: ->
        $(document).off(".appearance")
        $(buttonSelector).hide()

    received: (data) ->
        userId = data.user_id
        eventType = data.event
        if eventType == 'appear'
            $('.contact-status').addClass 'online'
        else
            $('.contact-status').addClass 'offline'