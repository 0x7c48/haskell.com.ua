port module Ports exposing (setTitle, updateAnalytics)


port setTitle : String -> Cmd msg


port updateAnalytics: String -> Cmd msg
