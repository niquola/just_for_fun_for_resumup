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

def path(p,cls, *pts)
  pth = pts.map{|pt| (pt + p).to_s }.join(" ")
  %Q[<polygon points="#{pth}" class="#{cls}"/>]
end

def arrow(p,cls,w,h)
  path(p,cls, pt(0,0),pt(w,0),pt(w+h,h/2),pt(w,h),pt(0,h))
end

def circle(p, r, cls='')
  %Q[<circle cx="#{p.x}" cy="#{p.y}" r="#{r}" class="#{cls}"/>]
end

def line(p1, p2, cls='')
  %Q[<line x1="#{p1.x}" y1="#{p1.y}" x2="#{p2.x}" y2="#{p2.y}" class="#{cls}"/>]
end

def flag(p,h,r,cls)
  cls = "#{cls} flag"
  up = p + pt(0,-h)
  res = circle(p,r, cls)
  res<< line(p, up, cls)
  res<< path(up,cls,pt(0,0), pt(20,0), pt(10,10), pt(20, 20),pt(0, 20), pt(0,0))
end

def trapecia(p,w, cls, down = false)
  h = 40
  h = -h if down
  d = 20
  path(p, cls, pt(d, -h), pt(w-d,-h), pt(w, 0), pt(0,0))
end
