require 'gosu'

require_relative 'window'

window = Window.new(30,30, [{x:1,y:1}, {x:1,y:2},{x:1,y:3},{x:9, y:2}, {x:3, y:4}, {x:5, y:5},{x:8, y:5}])
window.show

