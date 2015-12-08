import Effects exposing (Never)
import Html
import StartApp
import Signal
import Task

import Application
import VideoPlayer exposing (videoMailbox)

-- Define our application using the StartApp MVC library to handle our
-- basic architecture.
app : StartApp.App Application.Model
app =
  StartApp.start
    { init = Application.init
    , view = Application.view
    , update = Application.update
    , inputs = [] -- for receiving messages from JavaScript
    }

-- Display the HTML of our application.
main : Signal Html.Html
main = app.html

-- This is apparently how our runnable tasks get connected to JavaScript.
port tasks : Signal (Task.Task Never ())
port tasks = app.tasks

-- Send commands to our <video> tag.
port videoSeek : Signal Float
port videoSeek = videoMailbox.signal