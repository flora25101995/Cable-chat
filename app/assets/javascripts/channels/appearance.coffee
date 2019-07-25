App.appearance = App.cable.subscriptions.create "AppearanceChannel",

    connected: ->
        console.log('You in!')
        # @install()
        @appear()
    
    # Called when the WebSocket connection is closed.
    disconnected: ->
        console.log('You out!')
        @disappear()

    appear: ->
        # Calls `AppearanceChannel#appear(data)` on the server.
        console.log('Call appear!');
        @perform 'appear'

    disappear: ->
        @perform 'disappear'

    received: (data) ->
        console.log('appear', data)
        currentUserId = data.user_id
        currentUserId = currentUserId.toString()
        console.log("currentUserId", currentUserId)

        userID = $('.contacts').find('li[data-user='+currentUserId+']')
        console.log(userID)

        if data.online == false
            userID.find('.contact-status').removeClass 'online'
            userID.find('.contact-status').addClass 'offline'
            return # phải có return không sẽ nhảy xuống dưới, hoặc dùng else        

        userID.find('.contact-status').removeClass 'offline'
        userID.find('.contact-status').addClass 'online'
