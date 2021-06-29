photo1=imread('LEGO_61.jpg');


bw = rgb2gray(photo1);
bw = 1 - imbinarize(bw);

group = cell(1,6);
%% Loading a data

% yellow = [];
% 
% for i = 1:2
%     pound = bwselect(bw);
%     
%     props = regionprops(pound, 'Centroid');
%     x = props.Centroid(1);
%     y = props.Centroid(2);
%     
%     r = photo1(floor(y),floor(x),1);
%     g = photo1(floor(y),floor(x),2);
%     b = photo1(floor(y),floor(x),3);
%     color = [r, g, b];
%     
%     
%     yellow = [yellow; color];
%     
% end
group{1,1} = yellow;


% green = [];
% for i = 1:4
%     pound = bwselect(bw);
%     
%     props = regionprops(pound, 'Centroid');
%     x = props.Centroid(1);
%     y = props.Centroid(2);
%     
%     r = photo1(floor(y),floor(x),1);
%     g = photo1(floor(y),floor(x),2);
%     b = photo1(floor(y),floor(x),3);
%     color = [r, g, b];
%     
%     
%     green = [green; color];
%     
% end

group{1,2} = green;

% blue = [];
% for i = 1:15
%     pound = bwselect(bw);
%     
%     props = regionprops(pound, 'Centroid');
%     x = props.Centroid(1);
%     y = props.Centroid(2);
%     
%     r = photo1(floor(y),floor(x),1);
%     g = photo1(floor(y),floor(x),2);
%     b = photo1(floor(y),floor(x),3);
%     color = [r, g, b];
%     
%     
%     blue = [blue; color];
%     
% end

group{1,3} = blue;

% gray = [];
% for i = 1:8
%     pound = bwselect(bw);
%     
%     props = regionprops(pound, 'Centroid');
%     x = props.Centroid(1);
%     y = props.Centroid(2);
%     
%     r = photo1(floor(y),floor(x),1);
%     g = photo1(floor(y),floor(x),2);
%     b = photo1(floor(y),floor(x),3);
%     color = [r, g, b];
%     
%     
%     gray = [gray; color];
%     
% end

group{1,4} = gray;
% 
% pink = [];
% for i = 1:6
%     pound = bwselect(bw);
%     
%     props = regionprops(pound, 'Centroid');
%     x = props.Centroid(1);
%     y = props.Centroid(2);
%     
%     r = photo1(floor(y),floor(x),1);
%     g = photo1(floor(y),floor(x),2);
%     b = photo1(floor(y),floor(x),3);
%     color = [r, g, b];
%     
%     
%     pink = [pink; color];
%     
% end

group{1,5} = pink;

% red = [];
% for i = 1:4
%     pound = bwselect(bw);
%     
%     props = regionprops(pound, 'Centroid');
%     x = props.Centroid(1);
%     y = props.Centroid(2);
%     
%     r = photo1(floor(y),floor(x),1);
%     g = photo1(floor(y),floor(x),2);
%     b = photo1(floor(y),floor(x),3);
%     color = [r, g, b];
%     
%     
%     red = [red; color];
%     
% end

group{1,6} = red;


% view(3);
% hold on
% grid on
% for i = 1:15
%     scatter3(group{i}(:,1), group{i}(:,2), group{i}(:,3), '*');
%     set(gcf,'color','w');
% end
% hold off
% xlabel('red');
% ylabel('green');
% zlabel('blue');


%% Grouping new image


%loading new image

% photo1=imread('LEGO_13.jpg');
% 
% 
% bw = rgb2gray(photo1);
% bw = 1 - imbinarize(bw);
% 
% new = [];
% 
% pound = bwselect(bw);
% 
% props = regionprops(pound, 'Centroid');
% x = props.Centroid(1);
% y = props.Centroid(2);
% 
% r = photo1(floor(y),floor(x),1);
% g = photo1(floor(y),floor(x),2);
% b = photo1(floor(y),floor(x),3);
% color = [r, g, b];



%calculating k-nn

k = 3;

for i = 1:size(yellow,1)
    distance(i,1) = abs(double(yellow(i,1))-double(color(1,1)))+abs(double(yellow(i,2))-double(color(1,2)))+abs(double(yellow(i,3))-double(color(1,3)));
end

for i = 1:size(green,1)
    distance(i,2) = abs(double(green(i,1))-double(color(1,1)))+abs(double(green(i,2))-double(color(1,2)))+abs(double(green(i,3))-double(color(1,3)));
end

for i = 1:size(blue,1)
    distance(i,3) = abs(double(blue(i,1))-double(color(1,1)))+abs(double(blue(i,2))-double(color(1,2)))+abs(double(blue(i,3))-double(color(1,3)));
end

for i = 1:size(gray,1)
    distance(i,4) = abs(double(gray(i,1))-double(color(1,1)))+abs(double(gray(i,2))-double(color(1,2)))+abs(double(gray(i,3))-double(color(1,3)));
end

for i = 1:size(pink,1)
    distance(i,5) = abs(double(pink(i,1))-double(color(1,1)))+abs(double(pink(i,2))-double(color(1,2)))+abs(double(pink(i,3))-double(color(1,3)));
end

for i = 1:size(red,1)
    distance(i,6) = abs(double(red(i,1))-double(color(1,1)))+abs(double(red(i,2))-double(color(1,2)))+abs(double(red(i,3))-double(color(1,3)));
end


disctance_all = vertcat(distance(:,1), distance(:,2), distance(:,3), distance(:,4), distance(:,5), distance(:,6));

distance_withoutzeros = nonzeros(disctance_all);

sorted = sort(distance_withoutzeros);
sortedinterval = sorted(1:k);


d = [];
for i = 1:k
    [r,c] = find(distance == sortedinterval(i));
    d = [d; c];
end

%% plot


% view(3);
% hold on
% grid on
% scatter3(group{1}(:,1), group{1}(:,2), group{1}(:,3), '*y');
% set(gcf,'color','w');
% 
% hold off
% 
% hold on
% grid on
% scatter3(group{2}(:,1), group{2}(:,2), group{2}(:,3), '*g');
% set(gcf,'color','w');
% 
% hold off
% 
% hold on
% grid on
% scatter3(group{3}(:,1), group{3}(:,2), group{3}(:,3), '*b');
% set(gcf,'color','w');
% 
% hold off
% 
% hold on
% grid on
% scatter3(group{4}(:,1), group{4}(:,2), group{4}(:,3), '*k');
% set(gcf,'color','w');
% 
% hold off
% hold on
% grid on
% scatter3(group{5}(:,1), group{5}(:,2), group{5}(:,3), '*m');
% set(gcf,'color','w');
% 
% hold on
% grid on
% scatter3(group{6}(:,1), group{6}(:,2), group{6}(:,3), '*r');
% set(gcf,'color','w');
% 
% hold off
% 
% hold off
% xlabel('red');
% ylabel('green');
% zlabel('blue');
