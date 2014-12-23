--local libpng = require'libpng'
require "imlua"
local filename = "gaoyue.png"
local image = im.FileImageLoad(filename)
local r = image[0]
local g = image[1]
local b = image[2]


function largest(a,b,c,d)
  if (a>=b) and (a>=c) and(a>=d) then
  	return a
  end
  if (b>=a) and (b>=c) and(b>=d) then
  	return b
  end
  if (c>=a) and (c>=b) and(c>=d) then
  	return c
  end
  if (d>=b) and (d>=c) and(d>=a) then
  	return d
  end  
end

for row = 1, image:Height() - 2 do
  for column = 1, image:Width() - 2 do
    print(row)
    --check1=r[row-1][column]-r[row][column]+g[row-1][column]-g[row][column]+b[row-1][column]-b[row][column]
    check2=r[row+1][column]-r[row][column]+g[row+1][column]-g[row][column]+b[row+1][column]-b[row][column]
    --check3=r[row][column-1]-r[row][column]+g[row][column-1]-g[row][column]+b[row][column-1]-b[row][column]
    check4=r[row][column+1]-r[row][column]+g[row][column+1]-g[row][column]+b[row][column+1]-b[row][column]
    
    check=largest(0,check2,0,check4)

    if check>60 then
      r[row][column] = 0
      g[row][column] = 0
      b[row][column] = 0
    else
      r[row][column] = 255
      g[row][column] = 255
      b[row][column] = 255	
    end
  end
end





image:Save("test.bmp", "BMP")


