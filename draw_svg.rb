require 'rubygems'
require File.dirname(__FILE__) + '/vangog'
require 'erb'

File.open('test.svg', 'w') do |f|
  now = Time.now
  max_widht = 3000
  max_height = 800
  ws = hs = 20
  mpt = pt(ws,max_height/2)
  d = (max_widht - 2*ws)/50


  body = []
  body<< arrow(mpt,'black', max_widht - 2*ws,2*hs)

  colors = %[green orange red yellow gray]
  30.times do |i|
    body<< trapecia(mpt + pt(i*200, 0), 190, 'green')
    body<< trapecia(mpt + pt(i*200, 40), 100, 'orange', true)
  end

  body<< arrow(mpt + pt(0,-ws/2), 'gray', max_widht - 2*ws,hs/2)

  50.times do |i|
    body<< flag(mpt + pt(i*d, -ws/4), max_height/3, ws/4, 'red')
  end

  @svg = %Q[<svg xmlns="http://www.w3.org/2000/svg" version="1.1"> #{body.join('')} </svg>]
  puts "#{Time.now - now} s"

  f<< ERB.new(DATA.read).result(binding)
end

__END__
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
<style type="text/css" >
<![CDATA[
  .flag {
    stroke: #006600;
    fill:   #00cc00;
  }
]]>
</style>
<%= body.join(' ') %>
</svg>
