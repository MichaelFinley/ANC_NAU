function phase_inv(input)

%interpret input
[input, Fs] = audioread(input);

%invert phase
output = -1 * input;

%write .wav file so can be passed to mix function
audiowrite('anti_noise.wav', output, Fs);

end