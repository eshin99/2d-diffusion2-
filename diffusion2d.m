%modeling 2d diffusion

csize = 100;
c = zeros(csize,csize); %concentration values
D = 1.9; %diffusion coefficient
 
c(50:55,40:45) = 100;
c(50:55,70:75) = 100;
c(80:83,40:70) = 100;

dt = 0.1; %time interval
dx = 1; %x interval
dy = 1; %y interval

Cx = D*dt/(dx^2); %constant change of x
Cy = D*dt/(dy^2); %constant change of y
 
for i = 1:dt:10 % i for time index
    for m = 2:dx:(csize-1) % m for discrete x position(s)
        for n = 2:dy:(csize-1)
              c_updated = c(m,n) + Cx*(c(m+1,n)-2*c(m,n)+c(m-1,n))+Cy*(c(m,n+1)-2*c(m,n)+c(m,n-1));
              c(m,n) = c_updated;
        end
    end
imagesc(c)
colorbar
drawnow
end

