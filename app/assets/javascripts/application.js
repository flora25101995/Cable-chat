// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require cable
//= require_tree .


// $(document).off('click', '.open-chat').on('click', '.open-chat', function(event){
//     let id = `${$(event.target).attr('data-id')}`
//     let html = `<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#${id}">${event.target.text}</a></li>`
//     let item = `<div id="${id}" class="container tab-pane"><%= render @show %></div>`

//     $(html).insertAfter($('.insert-room-list'))
//     $(item).insertAfter($('.insert-room-content-list'))

//     $('.room-list li a').removeClass('active').removeClass('show')
//     $(`.tab-content .tab-pane`).removeClass('active').removeClass('show')

//     $($('.room-list li a')[0]).addClass('active').addClass('show')
//     $(`#${id}`).addClass('active').addClass('show')

//     event.preventDefault()
// })