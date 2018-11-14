function [output, fs] = noise_cancel(input,noise)

phase_inv(noise); %phase_inv creates anti-noise .wav file

output = mix(input,'anti_noise.wav',0,0);

end