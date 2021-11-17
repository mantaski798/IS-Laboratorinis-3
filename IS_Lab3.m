clc
clear
x = 0.1: 1/22: 1;
fx = ((1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x)) / 2;

max_vals = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
xs = [];
it = 1;
for i = 2:length(x)
    if fx(i-1) < fx(i)
        if fx(i+1) < fx(i)
            max_vals(i) = fx(i);
            xs(it) = x(i);
            it = it + 1;
        end
    end
end

c1 = xs(1);
r1 = 0.15;
c2 = xs(2);
r2 = 0.15;

w1 = rand();
w2 = rand();
b = rand();

for iii = 1:100
    for i = 1:length(x)
        fi1=exp(-(x(i)-c1)^2/(2*r1*r1));
        fi2=exp(-(x(i)-c2)^2/(2*r2*r2));

        y = fi1*w1+fi2*w2+b;

        e = fx(i) - y;

        w1=w1+e*fi1*0.2;
        w2=w2+e*fi2*0.2;
        b=b+e*0.2;
    end
end
yy = [];
for i = 1:length(x)
    fi1=exp(-(x(i)-c1)^2/(2*r1*r1));
    fi2=exp(-(x(i)-c2)^2/(2*r2*r2));
    yy(i) = fi1*w1+fi2*w2+b;
end
plot(x,fx,x,yy);