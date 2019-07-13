App.appearance = App.cable.subscriptions.create "AppearanceChannel",

    connected: ->
        # @install()
        @appear()
    
    # Called when the WebSocket connection is closed.
    disconnected: ->
        console.log('You out!')

    appear: ->
        # Calls `AppearanceChannel#appear(data)` on the server.
        console.log('It appear!');
        @perform 'appear'


    received: (data) ->
        console.log('appear', data)
        currentUserId = data.user_id
        currentUserId = currentUserId.toString()
        console.log(currentUserId)

        userID = $('.contacts').find('li[data-user='+currentUserId+']')
        console.log(userID)

        userID.find('.contact-status').addClass 'online'

        # if data == true
        #     $('.contact-status').addClass 'online'
        # else
        #     $('.contact-status').addClass 'offline'

        
#     userId = data.user_id
#     eventType = data.event
#     if eventType == 'appear'
#       $('.contact-status').addClass 'online'
#     else
#       $('.contact-status').addClass 'offline'




#     @uninstall()
 
#   # Called when the subscription is rejected by the server.
#   rejected: ->
#     @uninstall()
 
#   appear: ->
#     # Calls `AppearanceChannel#appear(data)` on the server.
#     console.log('adwdawd');
#     @perform("appear", appearing_on: $("main").data("appearing-on"))
 
#   away: ->
#     # Calls `AppearanceChannel#away` on the server.
#     @perform("away")
 

#   buttonSelector = "[data-behavior~=appear_away]"
 
#   install: ->
#     $(document).on "turbolinks:load.appearance", =>
#       @appear()
 
#     $(document).on "click.appearance", buttonSelector, =>
#       @away()
#       false
 
#     $(buttonSelector).show()
 
#   uninstall: ->
#     $(document).off(".appearance")
#     $(buttonSelector).hide()