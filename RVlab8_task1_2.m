amountOfpoints = 10;

class1intervalk1 = 0:0.01:2;
class1intervalk2 = 0:0.01:2;
class1intervalk3 = 0:0.01:2;

class2intervalk1 = 2:0.01:4;
class2intervalk2 = 2:0.01:4;
class2intervalk3 = 2:0.01:4;

k = 4;

for i = 1:amountOfpoints
    class1positionk1(i) = randsample(class1intervalk1, 1);
    class1positionk2(i) = randsample(class1intervalk2, 1);
    class1positionk3(i) = randsample(class1intervalk3, 1);

    class2positionk1(i) = randsample(class2intervalk1, 1);
    class2positionk2(i) = randsample(class2intervalk2, 1);
    class2positionk3(i) = randsample(class2intervalk3, 1);
    
end

% 2 groups with random positions
c1 = [class1positionk1(:), class1positionk2(:), class1positionk3(:)];
c2 = [class2positionk1(:), class2positionk2(:), class2positionk3(:)];

pointintervalk1 = 0:0.01:4;
pointintervalk2 = 0:0.01:4;
pointintervalk3 = 0:0.01:4;
pointk1 = randsample(pointintervalk1, 1);
pointk2 = randsample(pointintervalk2, 1);
pointk3 = randsample(pointintervalk3, 1);

point = [pointk1, pointk2, pointk3];



for i = 1:size(c1,1)
    distancec1(i) = sqrt((c1(i,1)-point(1,1))^2+(c1(i,2)-point(1,2))^2+(c1(i,3)-point(1,3))^2);
    distancec2(i) = sqrt((c2(i,1)-point(1,1))^2+(c2(i,2)-point(1,2))^2+(c2(i,3)-point(1,3))^2);
end



distance = horzcat(distancec1, distancec2);
sortdistance = sort(distance);

sortinterval = sortdistance(1:k);


d = [];
for i = 1:k
    [r,c] = find(distance == sortinterval(i));
    d = [d c];
end

%countig which group satisfy the condition
count1=0;
count2=0;

for i = 1:k
    if (d(i)<=amountOfpoints)
        count1 = count1 + 1;
    end
    if (d(i)>amountOfpoints)
        count2 = count2 + 1;
    end
end

sum1 = 0;
sum2 = 0;

for i = 1:k
    if (count1 == count2 && d(i)<=amountOfpoints)
        sum1 = sum1 + distance(d(i));
    end
     if (count1 == count2 && d(i)>amountOfpoints)
         sum2 = sum2 + distance(d(i));
     end
end
group1 = 0;
group2 = 0;

if (sum1>sum2)
    group1 = 1;
end
if (sum2>sum1)
    group2 = 1;
end
    
    
    
    
    
    
    
