class Pt
  def initialize(x,y)
    @x,@y = x,y
  end

  attr :x
  attr :y

  def from(pt)
    Pt.new(pt.x + x, pt.y + y)
  end

  def +(pt)
    Pt.new(pt.x + self.x, pt.y + self.y)
  end

  def -(pt)
    Pt.new(pt.x - x, pt.y - y)
  end

  def to_s
    "#{x},#{y}"
  end
end

def pt(x,y)
  Pt.new(x,y)
end

def path(p,color, *pts)
  pth = pts.map{|pt| (pt + p).to_s }.join(" ")
  %Q[<polygon points="#{pth}" fill="#{color}"/>]
end

def arrow(p,color,w,h)
  path(p,color, pt(0,0),pt(w,0),pt(w+h,h/2),pt(w,h),pt(0,h))
end

def circle(p,r)
  %Q[<circle cx="#{p.x}" cy="#{p.y}" r="#{r}" fill="red"/>]
end

def line(p1,p2)
  %Q[<line x1="#{p1.x}" y1="#{p1.y}" x2="#{p2.x}" y2="#{p2.y}" style="stroke-width:2; stroke:rgb(255,0,0);"/>]
end

def flag(p,h,r,color)
  up = p + pt(0,-h)
  res = circle(p,r)
  res<< line(p, up)
  res<< path(up,color,pt(0,0), pt(20,0), pt(10,10), pt(20, 20),pt(0, 20), pt(0,0))
end
