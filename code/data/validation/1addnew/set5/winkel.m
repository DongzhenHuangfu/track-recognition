function x = winkel(i,j,k,matrix)
dy1 = matrix(i,2)-matrix(j,2);
dx1 = matrix(i,1)-matrix(j,1);
dy2 = matrix(j,2)-matrix(k,2);
dx2 = matrix(j,1)-matrix(k,1);
m = dy1*dy2 +dx1*dx2
cs = m / (sqrt(dy1^2+dx1^2) + sqrt(dy2^2+dx2^2));
x = acos(cs);