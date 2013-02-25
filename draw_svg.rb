require 'rubygems'
require File.dirname(__FILE__) + '/vangog'
require 'erb'

File.open('test.svg', 'w') do |f|
  start = Time.now
  max_widht = 5000
  max_height = 1000
  ws = hs = 20
  mpt = pt(ws,max_height/2)
  d = (max_widht - 2*ws)/100


  body = []
  body<< arrow(mpt,'black', max_widht - 2*ws,2*hs)

  colors = %[green orange red yellow gray]
  100.times do |i|
    body<< trapecia(mpt + pt(i*d, 0), d, 'green')
    body<< trapecia(mpt + pt(i*d, 40), d, 'orange', true)
  end

  body<< arrow(mpt + pt(0,-ws/2), 'gray', max_widht - 2*ws,hs/2)

  100.times do |i|
    body<< flag(mpt + pt(i*d, -ws/4), max_height/3, ws/4, 'red')
  end

  @svg = %Q[<svg xmlns="http://www.w3.org/2000/svg" version="1.1"> #{body.join('')} </svg>]
  rendering_time =  Time.now - start
  @message = "I love svg and ruby, this chart was generated in #{rendering_time} secons."

  f<< ERB.new(DATA.read).result(binding)
end

__END__
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
<style type="text/css" >
<![CDATA[
  @font-face {
    font-family: ubuntu;
    src: url(font.svg) format("svg");
  }

  .text {
    font-family: "ubuntu";
    color: #000000;
    font-size: 50px;
  }


  .flag {
    stroke: red;
    fill:   red;
  }
  .green {
    stroke: none;
    fill:   #00cc00;
  }
  .orange {
    stroke: none;
    fill:   orange;
  }
  .gray {
    stroke: #555;
    fill:   #555;
  }
  .black {
    stroke: #333;
    fill:   #333;
  }
]]>
</style>
<text x="30" y="100" class="text"><%= @message %></text>
<%= body.join(' ') %>
</svg>
