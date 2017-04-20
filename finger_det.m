clc
clear all
close all
img_db=imread('database.png');

figure,imshow(img_db);
img_tg=imread('target2.png');
figure,imshow(img_tg);

db=rgb2gray(img_db);
tg=rgb2gray(img_tg);
cc=normxcorr2(tg,db);
% figure,imshow(cc);
tr=max(max(cc))

if tr > 0.99999
    load recObj
    sound(myRecording)
    [x,y]=find(cc>0.9999);
    [r,c]=size(img_tg);
  
    t2=x;
    t1=x-r;
    
    if t1==0
        t1=1;
    end
    
    t4=y;
    t3=y-c/3  ;
    
    
    blk=zeros(size(db,1),size(db,2));
    
    blk(t1:t2,t3:t4)=1;
%     figure,imshow(blk);
    ed=edge(blk);
    
    for p=1:size(db,1)
        for i=1:size(db,2)
            if ed(p,i)==1
                img_db(p,i,1)=0;
                img_db(p,i,2)=0;
                img_db(p,i,3)=255;
            end
        end
    end
    figure(1),imshow(img_db);title('target matched');
    
else
    figure,imshow(img_db);title('target  not matched');
    load myRecordingNot
    sound(myRecordingNot)
end
