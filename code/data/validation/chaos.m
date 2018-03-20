function new = chaos(old)

length = size(old,1);
x = rand(1,length);
[~,index] = sort(x);

for i = 1:length
    new(i) = old(index(i));
end

end