function answer = findanswer(name)

load(name)
index = 1;
answer = [];
i = 1;
while i <= size(left,1)
    
    if left(i,1) < right(index,1)
        answer(i) = index -1;
        i = i + 1;
    elseif index >= size(right,1)
        answer(i) = index;
        i = i + 1;
    else
        index = index + 1;
    end
    
end

end