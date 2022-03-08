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
duration=3;		% �����ɶ�
recObj=audiorecorder;
fprintf('�����N���}�l %g ������G', duration); pause 
fprintf('������...');
recordblocking(recObj, duration);
fprintf('��������\n');
fprintf('�����N���}�l����G'); pause
play(recObj);
 
%%
fs=44100;	% �����W�v
nBits=8;	% �����I�ѪR�סA�����O 8 �� 16 �� 24
nChannel=2;	% �n�D�ӼơA�����O 1�]���n�D�^ �� 2�]���n�D�Υ��魵�^
duration=3;	% �����ɶ��]��^
recObj=audiorecorder(fs, nBits, nChannel);
fprintf('�����N���}�l %g ������G', duration); pause
fprintf('������...');
recordblocking(recObj, duration);
fprintf('��������\n');
fprintf('�����N���}�l����G'); pause
play(recObj); 
y = getaudiodata(recObj, 'double');	% get data as a double array 
plot((1:length(y))/fs, y);  
xlabel('Time (sec)'); ylabel('Amplitude');
audiowrite('test.wav',y,fs)    % �N���������G�s�� *.wav ��
fs = inst('test.wav', 'hi');
semitone = 69 + 12*log(fs/440);
%%
[y, fs]=audioread('�Ⱖ�Ѫ�.mp3',[705600 793800]);
sound(y, fs); % ���񦹭��T
time=(1:length(y))/fs; % �ɶ��b���V�q
plot(time, y); % �e�X�ɶ��b�W���i��

%%
fileName='�i�ڪ��֤k�ɥN Our Times�jMovie Theme Song - ���L�� Hebe Tien�m�p���B A Little Happiness�nOfficial MV.mp3';
[y, fs]=audioread(fileName,[3528000 3572100]); % Ū�����T��
sound(y, fs); % ���񭵰T
left=y(:,1); % ���n�D���T
right=y(:,2); % �k�n�D���T
subplot(2,1,1), plot((1:length(left))/fs, left);
subplot(2,1,2), plot((1:length(right))/fs, right); 
figure(2);inst('�i�ڪ��֤k�ɥN Our Times�jMovie Theme Song - ���L�� Hebe Tien�m�p���B A Little Happiness�nOfficial MV.mp3', 'hi')

%%
im = imread('84043.jpg')
size(im)
image(im)

%%
im2 = imread('kobe.png')
size(im2)
image(im2)

%%
fileName='�Ⱖ�Ѫ�.mp3';
info=audioinfo(fileName);
fprintf('�ɮצW�� = %s\n', info.Filename);
fprintf('���Y�覡 = %s\n', info.CompressionMethod);
fprintf('�q�D�Ӽ� = %g ��\n', info.NumChannels); 
fprintf('�����W�v = %g Hz\n', info.SampleRate);
fprintf('�����I�`�Ӽ� = %g ��\n', info.TotalSamples);
fprintf('���T���� = %g ��\n', info.Duration);
fprintf('�����I�ѪR�� = %g �줸/�����I\n', info.BitsPerSample); 
%%
fileName='�Ⱖ�Ѫ�.mp3';
[y, fs]=audioread(fileName,[705600 706482]);
info=audioinfo(fileName);
nbits = 8;
y0=y*(2^nbits/2)+(2^nbits/2); 
left=y0(:,1); % ���n�D���T
right=y0(:,2); % �k�n�D���T
subplot(2,1,1), plot((1:length(left))/fs, left);
subplot(2,1,2), plot((1:length(right))/fs, right); 
%fs = inst(fileName,fileName);
%semitone = 69 + 12*log(fs/440);
%%
[y, fs]=audioread('�i�ڪ��֤k�ɥN Our Times�jMovie Theme Song - ���L�� Hebe Tien�m�p���B A Little Happiness�nOfficial MV.mp', [1, inf], 'native');
p=audioplayer(y, fs); play(p); % ���񦹭��T
time=(1:length(y))/fs; % �ɶ��b���V�q
plot(time, y); % �e�X�ɶ��b�W���i��
class(y) % ��� y ����ƫ��A
