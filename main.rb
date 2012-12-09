require 'gosu'

require_relative 'window'

window = Window.new(30,30, [
  {x:1,y:1}, {x:2,y:1},{x:1,y:2},{x:2, y:2}, #static
  
                      {x:14,y:6},{x:14,y:7},{x:14,y:8}, #pump
  {x:10,y:10},{x:11,y:10},{x:12,y:10}, {x:16,y:10},{x:17,y:10},{x:18,y:10},
                      {x:14,y:12},{x:14,y:13},{x:14,y:14}
                      
  ])
  
window.show

