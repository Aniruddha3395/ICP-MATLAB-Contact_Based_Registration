function return_T  = all_input_w_T_p(num)

Input_w_T_p = {};


% % cell 1-13: car bonnet_placement 1
% % cell 14-22: car bonnet placement 2
% % cell 23-37: ge blade
% % cell 38-52: composite mold
% % cell 53-67: fender

%% data1
Input_w_T_p{1} = [
    0.9994   -0.0214   -0.0257  478.4168;
    0.0214    0.9998   -0.0015 -150.7013;
    0.0257    0.0009    0.9997  318.4602;
    0         0         0    1.0000
    ];

Input_w_T_p{2} = [
    0.9965    0.0667    0.0505  474.1740;
    -0.0676    0.9976    0.0173 -135.5993;
    -0.0492   -0.0206    0.9986  308.7845;
    0         0         0    1.0000
    ];

Input_w_T_p{3} = [
    0.9830   -0.1150    0.1428  478.0404;
    0.1250    0.9901   -0.0635 -143.4438;
    -0.1341    0.0803    0.9877  312.7779;
    0         0         0    1.0000
    ];

Input_w_T_p{4} = [
    0.9994    0.0201    0.0272  480.9904;
    -0.0226    0.9953    0.0942 -146.0414;
    -0.0252   -0.0947    0.9952  313.9695;
    0         0         0    1.0000
    ];

Input_w_T_p{5} = [
    0.9964   -0.0230   -0.0821  477.9658;
    0.0281    0.9977    0.0621 -137.4346;
    0.0805   -0.0642    0.9947  317.7837;
    0         0         0    1.0000
    ];

Input_w_T_p{6} = [
    0.9915   -0.0905   -0.0936  472.2536;
    0.0966    0.9933    0.0636 -138.3261;
    0.0872   -0.0721    0.9936  315.6703;
    0         0         0    1.0000
    ];

Input_w_T_p{7} = [
    0.9970   -0.0137   -0.0762  480.9422;
    0.0127    0.9998   -0.0134 -146.0501;
    0.0764    0.0124    0.9970  311.6714;
    0         0         0    1.0000
    ];

Input_w_T_p{8} = [
    0.9994    0.0273    0.0235  482.5358;
    -0.0276    0.9996    0.0110 -139.9001;
    -0.0231   -0.0116    0.9997  304.3676;
    0         0         0    1.0000
    ];

Input_w_T_p{9} = [
    0.9949    -0.007    0.1010  469.3457;
    0.0078    0.9999   -0.0080 -147.1221;
    -0.1010    0.0087    0.9949  312.8431;
    0         0         0    1.0000
    ];

Input_w_T_p{10} = [
    0.9995    0.0299    0.0064  480.6698;
    -0.0289    0.9921   -0.1221 -148.3946;
    -0.0100    0.1219    0.9925  310.6153;
    0         0         0    1.0000
    ];

Input_w_T_p{11} = [
    0.9821   -0.1148    0.1491  474.2381;
    0.1276    0.9887   -0.0791 -131.8888;
    -0.1383    0.0968    0.9856  300.3053;
    0         0         0    1.0000
    ];

Input_w_T_p{12} = [
    0.9730    0.1060   -0.2052  489.1473;
    -0.1237    0.9895   -0.0754 -148.5755;
    0.1951    0.0987    0.9758  317.3620;
    0         0         0    1.0000
    ];

Input_w_T_p{13} = [
    0.9730    0.1060   -0.2052  490.1473;
    -0.1237    0.9895   -0.0754 -140.5755;
    0.1951    0.0987    0.9758  310.3620;
    0         0         0    1.0000
    ];

%% data2 & data3
Input_w_T_p{14} = [
    0.9949    0.0602   -0.0805  524.6857;
    -0.0543    0.9958    0.0739 -165.9295;
    0.0846   -0.0692    0.9940  322.8853;
    0         0         0    1.0000
    ];

Input_w_T_p{15} = [
    0.9977   -0.0588   -0.0322  526.7439;
    0.0582    0.9981   -0.0208 -165.0832;
    0.0334    0.0189    0.9993  319.4440;
    0         0         0    1.0000
    ];

Input_w_T_p{16} = [
    0.9905   -0.0774    0.1133  509.9171;
    0.0648    0.9917    0.1108 -169.7210;
    -0.1209   -0.1024    0.9874  314.9160;
    0         0         0    1.0000
    ];

Input_w_T_p{17} = [
    0.9852   -0.1237   -0.1186  511.4476;
    0.1247    0.9922    0.0011 -154.2837;
    0.1175   -0.0159    0.9929  315.0668;
    0         0         0    1.0000
    ];

%% data4

Input_w_T_p{18} = [
    0.998357	-0.041477	0.039541	522.587297;
    0.037538	0.994709	0.095630	-155.706266;
    -0.043298	-0.093989	0.994631	309.820502;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{19} = [
    0.992268	0.073549	0.099975	519.344311;
    -0.079868	0.994953	0.060738	-168.027511;
    -0.095003	-0.068253	0.993134	307.285880;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{20} = [
    0.985204	-0.123731	-0.118588	511.447560;
    0.124743	0.992188	0.001119	-154.283660;
    0.117523	-0.015896	0.992943	315.066849;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{21} = [
    0.994027	-0.054709	0.094433	510.533055;
    0.063873	0.993240	-0.096921	-151.562038;
    -0.088492	0.102374	0.990802	304.392684;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{22} = [
    0.988205	0.116229	0.099710	512.036941;
    -0.113376	0.992976	-0.033842	-165.523942;
    -0.102943	0.022138	0.994441	307.210780;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data5

Input_w_T_p{23} = [
    0.128677	-0.982812	0.132376	697.774147;
    0.986898	0.140012	0.080185	-162.510151;
    -0.097341	0.120323	0.987951	322.814814;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{24} = [
    0.125595	-0.989216	0.075349	696.050922;
    0.985709	0.115833	-0.122312	-181.063343;
    0.112265	0.089633	0.989627	315.238460;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{25} = [
    0.067359	-0.995801	-0.061993	692.874311;
    0.993195	0.061007	0.099201	-178.927511;
    -0.095003	-0.068253	0.993134	312.685880;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{26} = [
    0.041730	-0.996464	-0.072929	698.215697;
    0.995539	0.047651	-0.081438	-176.829501;
    0.084625	-0.069205	0.994007	328.285272;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{27} = [
    0.115626	-0.987655	0.105683	695.714290;
    0.990411	0.106537	-0.087957	-166.736968;
    0.075612	0.114840	0.990502	318.710832;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data6

Input_w_T_p{28} = [
    -0.137147	-0.990551	0.000375	684.977560;
    0.983554	-0.136223	-0.118593	-165.183660;
    0.117523	-0.015896	0.992943	320.466849;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{29} = [
    -0.034048	-0.999407	0.005116	692.927204;
    0.998554	-0.034231	-0.041459	-178.800904;
    0.041610	0.003697	0.999127	326.760622;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{30} = [
    -0.123888	-0.992293	-0.002662	690.275341;
    0.992293	-0.123881	-0.002903	-180.706911;
    0.002551	-0.003001	0.999992	327.754322;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{31} = [
    0.040830	-0.990520	-0.131160	693.434172;
    0.995143	0.028545	0.094211	-180.504409;
    -0.089574	-0.134370	0.986874	314.395598;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{32} = [
    -0.049910	-0.996522	0.066735	683.904246;
    0.993601	-0.056320	-0.097901	-176.462576;
    0.101319	0.061421	0.992956	316.407137;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data7

Input_w_T_p{33} = [
    0.083564	-0.994878	0.056871	699.748450;
    0.987891	0.075220	-0.135695	-175.016739;
    0.130723	0.067521	0.989117	323.674917;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{34} = [
    -0.030659	-0.994599	0.099157	691.930449;
    0.998990	-0.027231	0.035746	-172.101557;
    -0.032853	0.100153	0.994430	327.794445;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{35} = [
    0.072139	-0.989763	-0.123144	698.039788;
    0.991560	0.057833	0.116035	-170.165570;
    -0.107725	-0.130476	0.985582	313.358449;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{36} = [
    0.012899	-0.995816	0.090470	701.389491;
    0.999739	0.011136	-0.019970	-168.720170;
    0.018879	0.090704	0.995699	325.706612;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{37} = [
    0.102686	-0.991739	-0.076873	695.892110;
    0.984966	0.090583	0.147097	-168.369442;
    -0.138919	-0.090822	0.986130	313.262649;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data8

Input_w_T_p{38} = [
    0.995154	-0.044037	-0.087914	305.782016;
    0.047049	0.998364	0.032482	-306.486004;
    0.086340	-0.036461	0.995598	124.357330;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{39} = [
    0.997755	0.056223	0.036397	312.822382;
    -0.058455	0.996270	0.063479	-306.050272;
    -0.032692	-0.065464	0.997319	111.756122;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{40} = [
    0.999170	-0.035194	0.020511	316.312284;
    0.033476	0.996328	0.078797	-308.058909;
    -0.023209	-0.078045	0.996680	119.071392;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{41} = [
    0.998117	-0.041113	-0.045525	317.333346;
    0.039292	0.998419	-0.040195	-300.386897;
    0.047106	0.038330	0.998154	112.571313;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{42} = [
    0.997399	0.064304	0.032568	318.252248;
    -0.061568	0.994970	-0.079019	-314.622116;
    -0.037485	0.076808	0.996341	112.796643;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data9

Input_w_T_p{43} = [
    0.999819	0.016342	-0.009733	321.785860;
    -0.016899	0.998046	-0.060162	-315.691583;
    0.008731	0.060315	0.998141	116.119187;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{44} = [
    0.992020	0.099835	-0.076997	312.289549;
    -0.103254	0.993777	-0.041774	-303.154171;
    0.072347	0.049391	0.996156	116.261714;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{45} = [
    0.995828	-0.055919	-0.072110	311.015594;
    0.059135	0.997312	0.043257	-301.031211;
    0.069498	-0.047341	0.996458	113.024985;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{46} = [
    0.999808	-0.010939	-0.016246	308.587815;
    0.010407	0.999420	-0.032434	-306.490650;
    0.016592	0.032259	0.999342	119.653812;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{47} = [
    0.999895	0.010798	-0.009617	310.909689;
    -0.011139	0.999287	-0.036066	-313.799660;
    0.009221	0.036169	0.999303	118.436863;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data10

Input_w_T_p{48} = [
    0.996909	0.024347	0.074697	319.454568;
    -0.018675	0.996954	-0.075718	-310.106512;
    -0.076313	0.074089	0.994327	119.312154;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{49} = [
    0.996546	-0.013424	0.081956	311.233056;
    0.009070	0.998539	0.053273	-305.894628;
    -0.082552	-0.052345	0.995211	118.035987;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{50} = [
    0.999461	-0.032638	-0.003572	312.219185;
    0.032511	0.998983	-0.031251	-313.802567;
    0.004588	0.031118	0.999505	123.757272;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{51} = [
    0.993491	-0.050226	0.102236	312.983059;
    0.060440	0.993211	-0.099390	-303.493926;
    -0.096550	0.104923	0.989782	118.766342;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{52} = [
    0.996128	0.013548	0.086865	311.454327;
    -0.015596	0.999615	0.022950	-312.557139;
    -0.086521	-0.024216	0.995956	121.867539;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data11

Input_w_T_p{53} = [
    -0.998002	0.055106	0.030898	588.185830;
    -0.056933	-0.996467	-0.061740	344.598664;
    0.027387	-0.063376	0.997614	7.676226;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{54} = [
    -0.999174	0.039165	0.010811	588.526515;
    -0.038248	-0.996457	0.074904	353.438863;
    0.013706	0.074429	0.997132	-0.018953;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{55} = [
    -0.992063	-0.098178	0.078564	588.519408;
    0.091134	-0.991878	-0.088723	343.346388;
    0.086637	-0.080858	0.992953	3.285026;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{56} = [
    -0.998864	0.042512	-0.021523	589.491403;
    -0.043914	-0.996613	0.069524	347.218952;
    -0.018495	0.070390	0.997348	9.613742;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{57} = [
    -0.996354	0.078323	-0.033819	589.944222;
    -0.081523	-0.990929	0.106835	354.072586;
    -0.025145	0.109203	0.993701	-5.251642;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data12

Input_w_T_p{58} = [
    -0.998216	0.021297	0.055786	585.074580;
    -0.019178	-0.999084	0.038248	351.772851;
    0.056550	0.037110	0.997710	6.558245;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{59} = [
    -0.994025	0.008718	0.108808	588.184465;
    -0.017787	-0.996419	-0.082666	347.553144;
    0.107698	-0.084107	0.990620	9.593009;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{60} = [
    -0.992386	-0.066302	0.103798	577.849340;
    0.069044	-0.997347	0.023050	341.537907;
    0.101995	0.030041	0.994331	-2.915761;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{61} = [
    -0.995201	0.079935	0.056438	577.862916;
    -0.083329	-0.994679	-0.060586	346.095717;
    0.051294	-0.064999	0.996566	8.387970;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{62} = [
    -0.997973	-0.046045	0.043930	578.022900;
    0.044328	-0.998244	-0.039302	338.744233;
    0.045662	-0.037275	0.998261	9.766267;
    0.000000	0.000000	0.000000	1.000000
    ];

%% data13

Input_w_T_p{63} = [
    -0.996992	0.075097	-0.019143	583.353091;
    -0.076369	-0.994041	0.077789	348.621175;
    -0.013188	0.079017	0.996786	-4.856349;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{64} = [
    -0.996955	0.049204	-0.060490	585.535488;
    -0.046193	-0.997670	-0.050202	346.667639;
    -0.062819	-0.047255	0.996906	6.415351;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{65} = [
    -0.997672	0.023778	-0.063909	581.742986;
    -0.021833	-0.999282	-0.030968	344.157181;
    -0.064600	-0.029501	0.997475	5.700456;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{66} = [
    -0.998192	-0.001374	-0.060098	578.879373;
    0.002764	-0.999730	-0.023064	342.508861;
    -0.060050	-0.023188	0.997926	7.505284;
    0.000000	0.000000	0.000000	1.000000
    ];

Input_w_T_p{67} = [
    -0.998157	0.034401	-0.049992	577.357637;
    -0.034705	-0.999384	0.005238	338.375125;
    -0.049781	0.006964	0.998736	1.509750;
    0.000000	0.000000	0.000000	1.000000
    ];

return_T = Input_w_T_p{num};
end