%this is a silly test as it's basically  saying 
%we have y (ideal result) and x (unwanted noise)
%y + x = z (create noisey signal)
%z - x =~ y (subract noise, which is known, from noisey signal and get
%ideal result)
%so we need to create a way to generalize the noise that we mix in with our
%ideal signal create a generic anti-noise in real time as opposed to just
%inverting what we KNOW is noies and mixing that in with the noisey signal.

%original files
[input1, Fs1] = audioread('spkr0.wav');
[input2, Fs2] = audioread('10secatminute11.wav');

%mix noise with skr0.wav file
[signal, Fs] = mix('spkr0.wav','10secatminute11.wav',0,0);
audiowrite('test_file.wav', signal, Fs);

%interpret new file
[test_file, Fs1] = audioread('test_file.wav');

%remove noise
result = noise_cancel('test_file.wav','10secatminute11.wav');

%plot results
figure;
subplot(2,1,1)
plot(test_file);
ylim([-1 1])
title('input')
subplot(2,1,2)
plot(result);
ylim([-1 1])
title('output')