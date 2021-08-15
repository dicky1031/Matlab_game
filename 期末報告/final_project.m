%%
for i=1
    message = 'Please name for your character:'
    A=input(message)
    if isempty(A), A=0; end;
    choice = 'Do you want to name again? press Y(y) or N(n)'
    B=input(choice)
    if length(B)==1;end;
    switch B
       case {'Y'}
           A=input(message)
           if isempty(A), A=0; end;
       case {'y'}
           A=input(message)
           if isempty(A), A=0; end;
       case 'N'
           break
       case 'n'
            break
    end
end
 %%
message = 'Please name for your character:'
A=input(message)
if isempty(A), A=0; end;

%%
duration=3;		% 錄音時間
recObj=audiorecorder;
fprintf('按任意鍵後開始 %g 秒錄音：', duration); pause 
fprintf('錄音中...');
recordblocking(recObj, duration);
fprintf('錄音結束\n');
fprintf('按任意鍵後開始播放：'); pause
play(recObj);
 
%%
fs=44100;	% 取樣頻率
nBits=8;	% 取樣點解析度，必須是 8 或 16 或 24
nChannel=2;	% 聲道個數，必須是 1（單聲道） 或 2（雙聲道或立體音）
duration=3;	% 錄音時間（秒）
recObj=audiorecorder(fs, nBits, nChannel);
fprintf('按任意鍵後開始 %g 秒錄音：', duration); pause
fprintf('錄音中...');
recordblocking(recObj, duration);
fprintf('錄音結束\n');
fprintf('按任意鍵後開始播放：'); pause
play(recObj); 
y = getaudiodata(recObj, 'double');	% get data as a double array 
plot((1:length(y))/fs, y);  
xlabel('Time (sec)'); ylabel('Amplitude');
audiowrite('test.wav',y,fs)    % 將錄音的結果存成 *.wav 檔
fs = inst('test.wav', 'hi');
semitone = 69 + 12*log(fs/440);
%%
[y, fs]=audioread('兩隻老虎.mp3',[705600 793800]);
sound(y, fs); % 播放此音訊
time=(1:length(y))/fs; % 時間軸的向量
plot(time, y); % 畫出時間軸上的波形

%%
fileName='【我的少女時代 Our Times】Movie Theme Song - 田馥甄 Hebe Tien《小幸運 A Little Happiness》Official MV.mp3';
[y, fs]=audioread(fileName,[3528000 3572100]); % 讀取音訊檔
sound(y, fs); % 播放音訊
left=y(:,1); % 左聲道音訊
right=y(:,2); % 右聲道音訊
subplot(2,1,1), plot((1:length(left))/fs, left);
subplot(2,1,2), plot((1:length(right))/fs, right); 
figure(2);inst('【我的少女時代 Our Times】Movie Theme Song - 田馥甄 Hebe Tien《小幸運 A Little Happiness》Official MV.mp3', 'hi')

%%
im = imread('84043.jpg')
size(im)
image(im)

%%
im2 = imread('kobe.png')
size(im2)
image(im2)

%%
fileName='兩隻老虎.mp3';
info=audioinfo(fileName);
fprintf('檔案名稱 = %s\n', info.Filename);
fprintf('壓縮方式 = %s\n', info.CompressionMethod);
fprintf('通道個數 = %g 個\n', info.NumChannels); 
fprintf('取樣頻率 = %g Hz\n', info.SampleRate);
fprintf('取樣點總個數 = %g 個\n', info.TotalSamples);
fprintf('音訊長度 = %g 秒\n', info.Duration);
fprintf('取樣點解析度 = %g 位元/取樣點\n', info.BitsPerSample); 
%%
fileName='兩隻老虎.mp3';
[y, fs]=audioread(fileName,[705600 706482]);
info=audioinfo(fileName);
nbits = 8;
y0=y*(2^nbits/2)+(2^nbits/2); 
left=y0(:,1); % 左聲道音訊
right=y0(:,2); % 右聲道音訊
subplot(2,1,1), plot((1:length(left))/fs, left);
subplot(2,1,2), plot((1:length(right))/fs, right); 
%fs = inst(fileName,fileName);
%semitone = 69 + 12*log(fs/440);
%%
[y, fs]=audioread('【我的少女時代 Our Times】Movie Theme Song - 田馥甄 Hebe Tien《小幸運 A Little Happiness》Official MV.mp', [1, inf], 'native');
p=audioplayer(y, fs); play(p); % 播放此音訊
time=(1:length(y))/fs; % 時間軸的向量
plot(time, y); % 畫出時間軸上的波形
class(y) % 顯示 y 的資料型態
