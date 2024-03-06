function []=nayeem()
load('Data_Year.mat');
fprintf('ENCMP100 Assignment #4A Fitness Data Display\n');
fprintf('Anaylsed by Student Name (ccid)\n');
for i=1:31
    Totals(i,:)=ConvertAndSum(Data(i));
end
save('Total.mat','Totals');
GenPlots(Totals);
Stats = GenStats(Totals);
PrintData(Totals,Stats);
end
function [Totals] = ConvertAndSum(Data)
Totals.Month=Data.Month;
Totals.Day=Data.Day;
Totals.Year=Data.Year;
Totals.Steps=Data.Steps;
Totals.Distance=Data.Steps*0.0006;
Totals.Floors=Data.Floors;
Totals.Sleep_Hours=Data.Sleep_Hours+Data.Sleep_Minutes/60+Data.Nap_Hours+Data.Nap_Minutes/60;
Totals.RestingHR=Data.RestingHR;

end
function []=GenPlots(Totals)

for i=1:1:31
    s1(i)=Totals(i).Sleep_Hours;
    d1(i)=Totals(i).Day;
    st1(i)=Totals(i).Steps;
    f1(i)=Totals(i).Floors;
    r1(i)=Totals(i).RestingHR;
end

subplot(1,4,1), plot(d1,s1,'b'), title('Sleep'), xlabel('Days'), ylabel('Sleep'), subplot(1,4,2), plot(d1,st1,'b'), title('Steps'), xlabel('Days'), ylabel('Steps'), subplot(1,4,3), plot(d1,f1,'b'), title('Floors'), xlabel('Day'), ylabel('Floors'), subplot(1,4,4), plot(d1,r1,'b'), title('Heart Beat'), xlabel('Days'), ylabel('Heart Beat');
end
function [Stats]=GenStats(Totals)
Stats.minsl=min([Totals(:).Sleep_Hours]);
Stats.minst=min([Totals(:).Steps]);
Stats.minfl=min([Totals(:).Floors]);
Stats.maxsl=max([Totals(:).Sleep_Hours]);
Stats.maxst=max([Totals(:).Steps]);
Stats.maxfl=max([Totals(:).Floors]);
Stats.meansl=mean([Totals(:).Sleep_Hours]);
Stats.meanst=mean([Totals(:).Steps]);
Stats.meanfl=mean([Totals(:).Floors]);
Stats.totalstep=sum([Totals(:).Steps]);
Stats.totalsleep=sum([Totals(:).Sleep_Hours]);
Stats.totaldistance=sum([Totals(:).Distance]);
Stats.totalfloors=sum([Totals(:).Floors]);
end
function []=PrintData(Totals,Stats)

fprintf('   Month          Day        Year      Steps      Distance    Floors     Sleep     Resting HR\n');
for i=1:1:31
 fprintf('%8s    %8.02d     %8.02d   %8.02d    %8.02f   %8.02f   %8.02f   %8.02f\n',Totals(i).Month,Totals(i).Day,Totals(i).Year,Totals(i).Steps,Totals(i).Distance,Totals(i).Floors,Totals(i).Sleep_Hours,Totals(i).RestingHR);
end
fprintf('\nTotal\n  Steps        Distance     Floors      Sleep  \n');
fprintf(' %.02f     %.02f       %.02f     %.02f\n\n',Stats.totalstep,Stats.totaldistance,Stats.totalfloors,Stats.totalsleep);
 fprintf('Min value\n       Sleep(Hours): %.02f    Step:  %.02f Floors climbed:  %.02f \n',Stats.minsl,Stats.minst,Stats.minfl);
 fprintf('Max value\n       Sleep(Hours): %.02f    Step:  %.02f Floors climbed:  %.02f \n',Stats.maxsl,Stats.maxst,Stats.maxfl);
 fprintf('Mean value\n      Sleep(Hours): %.02f   Step:  %.02f Floors climbed:  %.02f \n',Stats.meansl,Stats.meanst,Stats.meanfl);
end
