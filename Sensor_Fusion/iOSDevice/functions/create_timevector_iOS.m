function [t,tfin] = create_timevector_iOS(ta,tw,tm,to)
%%Create time vector with minimum length that willl be matched with the orientation data 

tfin = min([length(ta),length(tw),length(tm),length(to)]);
t = ta(1:tfin);
end