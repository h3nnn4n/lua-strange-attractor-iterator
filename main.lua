#!/usr/bin/lua

a = 1.1
b = -1.2
c = 1.0
d = 1.5

iters=50000

x=0.0
y=0.0
xn=0.0
yn=0.0

screenx=1600
screeny=1200

minx=2.2
maxx=minx*-1.0
miny=3.0
maxy=miny*-1.0

sens=0.5

bitmap={}

bigger=0

for i = 0,screeny
do
	for j = 0,screenx
	do
		bitmap[i*screenx+j]=0
	end
end

io.write('P3\n',screenx,' ',screeny,'\n255\n')

for i = 0,iters
do
	xn=math.sin(a*y)+c*math.cos(a*x)
	yn=math.sin(b*x)+d*math.cos(b*y)
	x=xn
	y=yn

	xi=math.floor((x-minx)*screenx/(maxx-minx))	
	yi=math.floor((y-miny)*screeny/(maxy-miny))
	if xi>=0 and xi<screenx and yi>=0 and yi<screeny then
		bitmap[(yi*screenx+xi)]=bitmap[(yi*screenx+xi)]+1
		if bitmap[(yi*screenx+xi)] > bigger then bigger=bitmap[(yi*screenx+xi)] end
	end
end

k=0
for i=0,(screeny-1) do
	for j=0,(screenx-1) do
		io.write((1.0-math.exp(-sens*bitmap[(i*screenx+j)]))*255.0,' ')	
		io.write((1.0-math.exp(-sens*bitmap[(i*screenx+j)]))*255.0,' ')	
		io.write((1.0-math.exp(-sens*bitmap[(i*screenx+j)]))*255.0,' ')	
	k=k+1
	io.write('\n')
	end
end
