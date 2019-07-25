
jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  message_list = $('.messages')
  if $('#messages').length > 0
    messages_to_bottom = -> message_list.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()


    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
        },
            
        connected: ->
            console.log('You are connected!');
            # Called when the subscription is ready for use on the server

        disconnected: ->
            # Called when the subscription has been terminated by the server

        received: (data) ->  

            console.log(data)
            messages.append data['message']          
            messages_to_bottom()

            user_id = document.getElementById("messages").getAttribute("current-user-id").toString()
            console.log("cookie:", user_id)
            muser_id = data.message_user_id.toString()

            if muser_id == user_id
                $(".message-info").find('div').removeClass 'sent'
                $(".message-info").find('div').addClass 'replies'
                return

            $(".message-info").find('div').removeClass 'replies'
            $(".message-info").find('div').addClass 'sent'



        send_message: (message, chat_room_id) ->
            @perform 'send_message', message: message, chat_room_id: chat_room_id


    $('#new_message').submit (e) ->
        $this = $(this)
        textarea = $this.find('#message_body')

        if $.trim(textarea.val()).length > 0 
            App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
            textarea.val('')                    
                
        e.preventDefault()
        return false  
    

    $('.input').keypress (e) ->
        if e.which == 13
            $('#new_message').submit();
            return false; 
