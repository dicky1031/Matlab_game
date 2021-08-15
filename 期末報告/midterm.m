%%
% �зǪ������֤��e
% ��X�C�@�Ӧr��semitone
filename = '�Ⱖ�Ѫ�.mp3';
semitone = inst(filename);
%%
% �Ѱ��ɪ̩ҰۥX�����֤��e
% ��X���ɪ̨C�@�Ӧr��semitone
fs=44100;	% �����W�v
nBits=8;	% �����I�ѪR�סA�����O 8 �� 16 �� 24
nChannel=2;	% �n�D�ӼơA�����O 1�]���n�D�^ �� 2�]���n�D�Υ��魵�^
duration=2;	% �����ɶ��]��^
recObj=audiorecorder(fs, nBits, nChannel);
fprintf('�����N���}�l %g ������G', duration); pause;
%[yy, ffs]=audioread('�Ⱖ�Ѫ�.mp3',[705600 793800]);
%sound(yy, ffs);
fprintf('������...');
recordblocking(recObj, duration);
fprintf('��������\n');
fprintf('�����N���}�l����G'); pause
play(recObj); 
y = getaudiodata(recObj, 'double');	% get data as a double array 
plot((1:length(y))/fs, y);  
xlabel('Time (sec)'); ylabel('Amplitude');
audiowrite('test.wav',y,fs) % �N���������G�s�� *.wav ��
denoise_y = denoise_zz('test.wav',0,0.4)
y0=denoise_y*(2^nBits/2)+(2^nBits/2); 
ymax = max(y0,[],'All');  %��X���T�̤j��
db=20*log10(ymax/(2*exp(-5))); 

%%
%�N��̪�semitones����ú�X����
N = length(semitone2);
for ii=1:N
    difference(ii) = abs(semitone(ii) - semitone2(ii));
end
point = 100-mean(difference)/29;

 

