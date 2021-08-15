%%
% 標準版的音樂內容
% 算出每一個字的semitone
filename = '兩隻老虎.mp3';
semitone = inst(filename);
%%
% 由參賽者所唱出的音樂內容
% 算出參賽者每一個字的semitone
fs=44100;	% 取樣頻率
nBits=8;	% 取樣點解析度，必須是 8 或 16 或 24
nChannel=2;	% 聲道個數，必須是 1（單聲道） 或 2（雙聲道或立體音）
duration=2;	% 錄音時間（秒）
recObj=audiorecorder(fs, nBits, nChannel);
fprintf('按任意鍵後開始 %g 秒錄音：', duration); pause;
%[yy, ffs]=audioread('兩隻老虎.mp3',[705600 793800]);
%sound(yy, ffs);
fprintf('錄音中...');
recordblocking(recObj, duration);
fprintf('錄音結束\n');
fprintf('按任意鍵後開始播放：'); pause
play(recObj); 
y = getaudiodata(recObj, 'double');	% get data as a double array 
plot((1:length(y))/fs, y);  
xlabel('Time (sec)'); ylabel('Amplitude');
audiowrite('test.wav',y,fs) % 將錄音的結果存成 *.wav 檔
denoise_y = denoise_zz('test.wav',0,0.4)
y0=denoise_y*(2^nBits/2)+(2^nBits/2); 
ymax = max(y0,[],'All');  %找出振幅最大值
db=20*log10(ymax/(2*exp(-5))); 

%%
%將兩者的semitones比較並算出分數
N = length(semitone2);
for ii=1:N
    difference(ii) = abs(semitone(ii) - semitone2(ii));
end
point = 100-mean(difference)/29;

 

