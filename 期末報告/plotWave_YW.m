function plotWave_YW(newfig, signal,fs,type, x_axis, name, removefreq,frame)
if ( nargin < 5)
    x_axis = 0 ;
end
if ( nargin < 7 )
    removefreq = 0;
end
if (nargin < 8 )
    frame = 32;
end
s_length = length(signal);
sampletime = (1:s_length)/fs;
framesize = fix(frame*0.001*fs);
if (newfig == 1)
    figure
end
if (strcmp(type, 'time') && x_axis == 0)
    plot(signal);
    if(nargin > 5)
        title(name)
    end
    xlabel('Sample');ylabel('Amplitude');
end
if (strcmp(type, 'time') && x_axis == 1)
    plot(sampletime, signal);
    if (nargin > 5)
        title(name)
    end
    xlabel('Time(s)');ylabel('Amplitude');
end
if(strcmp(type, 'freq'))
    [B,f,T] = spectrogram(signal, fs,hanning(framesize));
    B = 20*log10(abs(B));
    if (nargin > 6)
        B_idx = B <= removefreq;
        B(B_idx) = -50;
    end
    imagsec(T,f,B);axis xy;colorbar
    if(nargin > 5 )
        title(['Spectrogram' '-' name]);
    end
    xlabel('time(s)');ylabel('Frequency(Hz)');
end
end
