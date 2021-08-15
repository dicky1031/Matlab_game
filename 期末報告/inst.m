function semitone = inst(name)
for ii=16:0.04:18
    a=ii*44100;
    a = floor(a);
    b=(ii+0.02)*44100;
    b = floor(b);
    [x, Fs] = audioread(name,[a b]);
    x = x(:,1);
    N = length(x);
    dt = 1/Fs; 
    t = (1:N)* dt;
    %xx = x(ii*44100:(ii+0.02)*44100,:);
    Y = abs(fft(x));
    df = 1/t(end);
   % NN=882;
    fmax = df*N/2;
    f = (1:N)*2*fmax/N;
    up = floor(N/10);
     %plot(f(1:up), Y(1:up));
     %title('tt1')
    %xlabel('Frequency(Hz)')
     %ylabel('Energy')
    [ymaxi,i] = max(Y(1:up));
    maxi = f(i);
    iii=fix(ii*25-399);
    semitone(iii) = 69 + 12*log2(maxi/440);
end 

    

 
 





