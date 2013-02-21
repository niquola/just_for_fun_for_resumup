require 'vangog'

File.open('test.svg', 'w') do |f|
  now = Time.now
  max_widht = 1200
  max_height = 800
  ws = hs = 20
  mpt = pt(ws,max_height/2)
  d = (max_widht - 2*ws)/5


  body = []
  body<< arrow(mpt,'black', max_widht - 2*ws,2*hs)
  body<< arrow(mpt + pt(0,-ws/2), 'gray', max_widht - 2*ws,hs/2)

  6.times do |i|
    body<< flag(mpt + pt(i*d, -ws/4), max_height/3, ws/4, 'red')
  end

  f<< %Q[<svg xmlns="http://www.w3.org/2000/svg" version="1.1"> #{body.join('')} </svg>]
  puts "#{Time.now - now} s"
end
