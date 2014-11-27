function [ Aligned ] = alignSchelling( recordings,goldSample )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

sz = size(recordings);
numRecordings = sz(2);

shifted = zeros(400,sz(2) + 100);

    s2 = recordings(goldSample,:);

for i = 1:sz(1);
    i;
%     ik = waitforbuttonpress 
    s1 = recordings(i,:);
% 
%     clf
%     hold on;
% 
%     ax(1) = subplot(3,1,1);
%     plot(s1,'r')
%     ylabel('s_1')
%     axis tight




    [C21,lag21] = xcorr(s2,s1);
    C21 = C21/max(C21);

    [M21,I21] = max(C21);
    t21 = lag21(I21);


    if abs(t21) > 50
         t21 = 0;
    end
    
    startNum = 51;
    endNum = sz(2) + 50;

    shifted(i,startNum+t21:endNum+t21) = recordings(i,:);
    
    shifts(i) = t21;
    
%     title(['shift = ' int2str(t21)]);
    
    
% 
%     ax(3) = subplot(3,1,2);
%     plot(shifted(i,:))
%     ylabel('s_1')
%     axis tight
% 
%     ax(4) = subplot(3,1,3);
%     plot(recordings(goldSample,:))
%     ylabel('s_2')
%     axis tight
% 
% pause(0.1);
    
%     linkaxes(ax,'x')

end

% 
% for k = i : 400
%    RMSval = rms(shifted(k,:)); 
%    shifted(k,:) = shifted(k,:) ./ RMSval;
% end

Aligned = shifted(:,startNum+20:endNum-20);


end

