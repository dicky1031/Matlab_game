[clean, fs]=audioread('�i�ڪ��֤k�ɥN Our Times�jMovie Theme Song - ���L�� Hebe Tien�m�p���B A Little Happiness�nOfficial MV.mp3');
plotWave_YW(1,clean,fs,'freq',1,'clean speech')
if(strcmp(type, 'freq'))
    [B,f,T] = specgram(signal, framesize*2, fs , hanning(framesize) , round(framesize/2) );
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