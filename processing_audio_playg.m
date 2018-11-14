%signals
[audio1, Fs1] = audioread('10secat6_45.wav');
[audio2, Fs2] = audioread('10secatminute11.wav');
[audio3, Fs3] = audioread('10secatminute13.wav');
[audio4, Fs4] = audioread('spkr0.wav'); %this is a mono signal, 16kHz 
audio1_left = audio1(:,1);
audio1_right = audio1(:,2);
audio2_left = audio2(:,1);
audio2_right = audio2(:,2);
audio3_left = audio3(:,1);
audio3_right = audio3(:,2);

figure;
subplot(3,1,1)
spectrogram(audio1_left,1000,500,1000,Fs1)
subplot(3,1,2)
spectrogram(audio2_left,1000,500,1000,Fs2)
subplot(3,1,3)
spectrogram(audio3_left,1000,500,1000,Fs3)
% figure; %comment out to not  view right channels (identical)
% subplot(3,1,1)
% spectrogram(audio1_right,1000,500,1000,Fs1)
% subplot(3,1,2)
% spectrogram(audio2_right,1000,500,1000,Fs2)
% subplot(3,1,3)
% spectrogram(audio3_right,1000,500,1000,Fs3)
figure;
spectrogram(audio4,1000,500,1000,Fs4)