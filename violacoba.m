penomoran=0;
jumlahframe=819;
%baris untuk ekstrasi
%{
for facenum = 1:10
    va=floor(jumlahframe/100)*10;
    vb=mod(jumlahframe,va);
    vid = int2str(facenum);
    fullpath=strcat('test/test (',vid,').mp4');
    filevideo=VideoReader(fullpath);
    if(facenum==10)
        va=va+vb;
    end
    modulus=filevideo.NumberofFrames/va;
    for img=1: modulus:filevideo.NumberofFrames;
    penomoran=penomoran+1;
    filename=strcat('hasil/gambar ke-',num2str(penomoran),'.jpg');
    b=read(filevideo,round(img));
    b=imresize(b,[320 640]);
    imwrite(b,filename);
    end
end
%}
%akhir baris untuk ekstrasi
%hapus baris ekstraksi untuk melihat deteksinya saja
%baris untuk deteksi
for faceNum = 1:jumlahframe
    img = int2str(faceNum);
    fullpath=strcat('hasil/gambar ke-',img,'.jpg');
    try
    detectFaces(fullpath,faceNum)
    catch
    disp("Gambar tidak bisa dideteksi");
    end
end
%akhir baris untuk deteksi
