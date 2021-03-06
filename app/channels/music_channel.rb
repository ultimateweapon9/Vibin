<!DOCTYPE html>
<html lang="en">
  <head>
    <title>VibinMusicBeta</title>
    <meta charset="utf-8">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
    <%= stylesheet_link_tag 'application.css', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application.js', 'data-turbolinks-track': 'reload' %>
  </head>
  <body> 
    <div class="navbar">
      <%= render "layouts/nav" %>
    </div>
    <div class="main" id="main">
      <%= yield %>
    </div>
    <div class="modal" id="myModal">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="height: auto; width: 700px;">
        </div>
      </div>
    </div>
    <div class="musicbar">
      <%= render "songs/song_player" %>
    </div>
  </body>
</html>
