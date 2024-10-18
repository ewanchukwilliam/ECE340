
% question 3 start 
vase = imread("vase.jpg");
[row,col ,something] = size(vase)
vase_bright = vase+30;
imwrite(vase_bright,'vase_bright.jpg','jpg','Quality',100);
% question 3 finish`