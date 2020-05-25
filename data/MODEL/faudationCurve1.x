xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 198;
 21.91608;6.09633;-35.32652;,
 20.74305;-2.61812;-35.66469;,
 20.50931;-1.20177;-49.80945;,
 22.24272;7.51268;-49.80945;,
 16.61620;-0.87523;-36.48557;,
 17.97628;1.93801;-36.21503;,
 21.38036;3.35436;-49.80945;,
 20.85412;0.54113;-49.80945;,
 15.90157;-10.00586;-36.62772;,
 15.57297;-8.58951;-49.80945;,
 12.74301;-6.78543;-37.25600;,
 13.39743;-4.61230;-48.28094;,
 8.65578;-14.94220;-38.06900;,
 8.18522;-13.52584;-49.80945;,
 6.94638;-10.73450;-38.40902;,
 6.44233;-9.31816;-49.80945;,
 0.10878;-16.67561;-39.76910;,
 -0.52922;-15.25926;-49.80945;,
 0.10878;-12.12123;-39.76910;,
 -0.52922;-10.70487;-49.80945;,
 -8.43822;-14.94220;-41.46921;,
 -9.24366;-13.52585;-49.80945;,
 -6.72881;-10.73450;-41.12919;,
 -7.50077;-9.31816;-49.80945;,
 -15.68401;-10.00587;-42.91049;,
 -16.63142;-8.58951;-49.80945;,
 -12.52546;-6.78543;-42.28221;,
 -13.41098;-5.36908;-49.80945;,
 -19.48059;-2.60554;-42.34501;,
 -20.42878;-1.20177;-49.80945;,
 -15.35374;-0.86265;-41.52413;,
 -20.77358;0.54112;-49.80945;,
 -21.18070;6.10891;-42.68318;,
 -22.16218;7.51268;-49.80945;,
 -16.71383;1.95059;-41.79467;,
 -21.29982;3.35436;-49.80945;,
 22.24272;7.51268;-49.80945;,
 20.50931;-1.20177;-49.80945;,
 20.85412;0.54113;-49.80945;,
 21.38036;3.35436;-49.80945;,
 15.57297;-8.58951;-49.80945;,
 13.39743;-4.61230;-48.28094;,
 8.18522;-13.52584;-49.80945;,
 6.44233;-9.31816;-49.80945;,
 -0.52922;-15.25926;-49.80945;,
 -0.52922;-10.70487;-49.80945;,
 -9.24366;-13.52585;-49.80945;,
 -7.50077;-9.31816;-49.80945;,
 -16.63142;-8.58951;-49.80945;,
 -13.41098;-5.36908;-49.80945;,
 -20.42878;-1.20177;-49.80945;,
 -20.77358;0.54112;-49.80945;,
 -22.16218;7.51268;-49.80945;,
 -21.29982;3.35436;-49.80945;,
 14.73216;-2.19802;-22.59784;,
 16.01333;0.61522;-22.06716;,
 17.97628;1.93801;-36.21503;,
 16.61620;-0.87523;-36.48557;,
 20.22103;4.77354;-20.32428;,
 18.61956;-3.94091;-20.98763;,
 20.74305;-2.61812;-35.66469;,
 21.91608;6.09633;-35.32652;,
 11.08368;-8.10822;-24.10909;,
 12.74301;-6.78543;-37.25600;,
 14.05900;-11.32864;-22.87668;,
 15.90157;-10.00586;-36.62772;,
 5.62337;-12.05728;-26.37082;,
 6.94638;-10.73450;-38.40902;,
 7.23359;-16.26498;-25.70385;,
 8.65578;-14.94220;-38.06900;,
 -0.81750;-13.44401;-29.03873;,
 0.10878;-12.12123;-39.76910;,
 -0.81750;-17.99839;-29.03873;,
 0.10878;-16.67561;-39.76910;,
 -7.25837;-12.05728;-31.70662;,
 -6.72881;-10.73450;-41.12919;,
 -8.86860;-16.26498;-32.37359;,
 -8.43822;-14.94220;-41.46921;,
 -12.71870;-8.10822;-33.96835;,
 -12.52546;-6.78543;-42.28221;,
 -15.69398;-11.32865;-35.20076;,
 -15.68401;-10.00587;-42.91049;,
 -15.32225;-2.18544;-33.95109;,
 -15.35374;-0.86265;-41.52413;,
 -19.20966;-3.92833;-35.56130;,
 -19.48059;-2.60554;-42.34501;,
 -16.60342;0.62780;-34.48176;,
 -16.71383;1.95059;-41.79467;,
 -20.81111;4.78612;-36.22465;,
 -21.18070;6.10891;-42.68318;,
 10.00104;-3.61414;-9.74093;,
 11.15408;-0.80090;-8.97050;,
 14.94091;3.35742;-6.44023;,
 13.49963;-5.35702;-7.40326;,
 6.71751;-9.52433;-11.93491;,
 9.39521;-12.74476;-10.14574;,
 1.80336;-13.47340;-15.21845;,
 3.25252;-17.68110;-14.25015;,
 -3.99327;-14.86013;-19.09163;,
 -3.99327;-19.41451;-19.09163;,
 -9.78991;-13.47340;-22.96482;,
 -11.23907;-17.68110;-23.93312;,
 -14.70406;-9.52433;-26.24837;,
 -17.38176;-12.74476;-28.03755;,
 -16.94269;-3.60156;-26.91385;,
 -20.44127;-5.34444;-29.25152;,
 -18.09572;-0.78832;-27.68427;,
 -21.88255;3.37000;-30.21455;,
 2.34733;-4.80015;2.56009;,
 3.32790;-1.98691;3.54065;,
 6.54833;2.17141;6.76108;,
 5.32262;-6.54304;5.53538;,
 -0.44508;-10.71034;-0.23233;,
 1.83211;-13.93078;2.04486;,
 -4.62423;-14.65941;-4.41148;,
 -3.39182;-18.86711;-3.17907;,
 -9.55386;-16.04614;-9.34110;,
 -9.55386;-20.60052;-9.34110;,
 -14.48349;-14.65941;-14.27073;,
 -15.71589;-18.86711;-15.50314;,
 -18.66264;-10.71034;-18.44987;,
 -20.93984;-13.93077;-20.72706;,
 -20.41015;-4.78756;-19.71378;,
 -23.38545;-6.53046;-22.68907;,
 -21.39073;-1.97433;-20.69435;,
 -24.61117;2.18399;-23.91478;,
 -8.79587;-6.05988;11.49062;,
 -8.02544;-3.24664;12.64364;,
 -5.49516;0.91168;16.43047;,
 -6.45820;-7.80278;14.98919;,
 -10.98986;-11.97009;8.20709;,
 -9.20067;-15.19053;10.88478;,
 -14.27339;-15.91916;3.29294;,
 -13.30509;-20.12686;4.74210;,
 -18.14659;-17.30589;-2.50370;,
 -18.14659;-21.86027;-2.50370;,
 -22.01978;-15.91916;-8.30033;,
 -22.98808;-20.12686;-9.74949;,
 -25.30335;-11.97009;-13.21449;,
 -27.09252;-15.19052;-15.89218;,
 -26.45242;-6.04731;-14.96951;,
 -28.79009;-7.79020;-18.46810;,
 -27.22285;-3.23407;-16.12255;,
 -29.75314;0.92425;-19.90938;,
 -22.26977;-6.95488;17.15448;,
 -21.73910;-4.14163;18.43563;,
 -19.99620;0.01669;22.64333;,
 -20.65955;-8.69777;21.04187;,
 -23.78101;-12.86510;13.50601;,
 -22.54861;-16.08553;16.48131;,
 -26.04275;-16.81416;8.04571;,
 -25.37578;-21.02186;9.65593;,
 -28.71066;-18.20089;1.60483;,
 -28.71066;-22.75527;1.60483;,
 -31.37856;-16.81416;-4.83605;,
 -32.04554;-21.02186;-6.44627;,
 -33.64031;-12.86509;-10.29638;,
 -34.87270;-16.08553;-13.27167;,
 -34.10665;-6.94231;-12.41634;,
 -35.71685;-8.68520;-16.30375;,
 -34.63732;-4.12907;-13.69751;,
 -36.38021;0.02925;-17.90521;,
 -36.70828;-6.97155;19.04932;,
 -36.43774;-4.15830;20.40940;,
 -35.54923;0.00002;24.87627;,
 -35.88740;-8.71444;23.17619;,
 -37.47871;-12.88177;15.17616;,
 -36.85043;-16.10220;18.33472;,
 -38.63173;-16.83083;9.37954;,
 -38.29171;-21.03853;11.08893;,
 -39.99182;-18.21756;2.54196;,
 -39.99182;-22.77194;2.54196;,
 -41.35190;-16.83084;-4.29564;,
 -41.69192;-21.03853;-6.00505;,
 -42.50493;-12.88177;-10.09230;,
 -43.13320;-16.10220;-13.25087;,
 -42.23045;-6.95898;-12.43699;,
 -43.05133;-8.70187;-16.56387;,
 -42.50099;-4.14575;-13.79710;,
 -43.38951;0.01258;-18.26397;,
 -49.84855;-6.97154;24.15365;,
 -49.84854;-4.15829;24.67986;,
 -49.84854;0.00003;25.54218;,
 -49.84855;-8.71444;23.80879;,
 -49.84854;-12.88177;15.65204;,
 -49.84854;-16.10220;18.87247;,
 -49.84854;-16.83083;9.74185;,
 -49.84854;-21.03853;11.48473;,
 -49.84855;-18.21756;2.77031;,
 -49.84855;-22.77194;2.77031;,
 -49.84855;-16.83084;-4.20126;,
 -49.84855;-21.03853;-5.94415;,
 -49.84855;-12.88177;-10.11148;,
 -49.84855;-16.10220;-13.33192;,
 -49.84855;-6.97156;-16.78490;,
 -49.84855;-8.71445;-16.44005;,
 -49.84855;-4.15832;-17.31110;,
 -49.84855;0.00001;-18.17345;;
 
 155;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;1,8,9,2;,
 4;10,4,7,11;,
 4;8,12,13,9;,
 4;14,10,11,15;,
 4;12,16,17,13;,
 4;18,14,15,19;,
 4;16,20,21,17;,
 4;22,18,19,23;,
 4;20,24,25,21;,
 4;26,22,23,27;,
 4;24,28,29,25;,
 4;30,26,27,31;,
 4;28,32,33,29;,
 4;34,30,31,35;,
 4;36,37,38,39;,
 4;37,40,41,38;,
 4;40,42,43,41;,
 4;42,44,45,43;,
 4;44,46,47,45;,
 4;46,48,49,47;,
 4;48,50,51,49;,
 4;50,52,53,51;,
 3;39,51,53;,
 3;51,39,38;,
 3;38,49,51;,
 3;49,38,41;,
 3;47,49,41;,
 3;47,41,43;,
 3;47,43,45;,
 4;54,55,56,57;,
 4;58,59,60,61;,
 4;62,54,57,63;,
 4;59,64,65,60;,
 4;66,62,63,67;,
 4;64,68,69,65;,
 4;70,66,67,71;,
 4;68,72,73,69;,
 4;74,70,71,75;,
 4;72,76,77,73;,
 4;78,74,75,79;,
 4;76,80,81,77;,
 4;82,78,79,83;,
 4;80,84,85,81;,
 4;86,82,83,87;,
 4;84,88,89,85;,
 4;90,91,55,54;,
 4;92,93,59,58;,
 4;94,90,54,62;,
 4;93,95,64,59;,
 4;96,94,62,66;,
 4;95,97,68,64;,
 4;98,96,66,70;,
 4;97,99,72,68;,
 4;100,98,70,74;,
 4;99,101,76,72;,
 4;102,100,74,78;,
 4;101,103,80,76;,
 4;104,102,78,82;,
 4;103,105,84,80;,
 4;106,104,82,86;,
 4;105,107,88,84;,
 4;108,109,91,90;,
 4;110,111,93,92;,
 4;112,108,90,94;,
 4;111,113,95,93;,
 4;114,112,94,96;,
 4;113,115,97,95;,
 4;116,114,96,98;,
 4;115,117,99,97;,
 4;118,116,98,100;,
 4;117,119,101,99;,
 4;120,118,100,102;,
 4;119,121,103,101;,
 4;122,120,102,104;,
 4;121,123,105,103;,
 4;124,122,104,106;,
 4;123,125,107,105;,
 4;126,127,109,108;,
 4;128,129,111,110;,
 4;130,126,108,112;,
 4;129,131,113,111;,
 4;132,130,112,114;,
 4;131,133,115,113;,
 4;134,132,114,116;,
 4;133,135,117,115;,
 4;136,134,116,118;,
 4;135,137,119,117;,
 4;138,136,118,120;,
 4;137,139,121,119;,
 4;140,138,120,122;,
 4;139,141,123,121;,
 4;142,140,122,124;,
 4;141,143,125,123;,
 4;144,145,127,126;,
 4;146,147,129,128;,
 4;148,144,126,130;,
 4;147,149,131,129;,
 4;150,148,130,132;,
 4;149,151,133,131;,
 4;152,150,132,134;,
 4;151,153,135,133;,
 4;154,152,134,136;,
 4;153,155,137,135;,
 4;156,154,136,138;,
 4;155,157,139,137;,
 4;158,156,138,140;,
 4;157,159,141,139;,
 4;160,158,140,142;,
 4;159,161,143,141;,
 4;162,163,145,144;,
 4;164,165,147,146;,
 4;166,162,144,148;,
 4;165,167,149,147;,
 4;168,166,148,150;,
 4;167,169,151,149;,
 4;170,168,150,152;,
 4;169,171,153,151;,
 4;172,170,152,154;,
 4;171,173,155,153;,
 4;174,172,154,156;,
 4;173,175,157,155;,
 4;176,174,156,158;,
 4;175,177,159,157;,
 4;178,176,158,160;,
 4;177,179,161,159;,
 4;180,181,163,162;,
 4;182,183,165,164;,
 4;182,181,180,183;,
 4;184,180,162,166;,
 4;183,185,167,165;,
 4;183,180,184,185;,
 4;186,184,166,168;,
 4;185,187,169,167;,
 4;185,184,186,187;,
 4;188,186,168,170;,
 4;187,189,171,169;,
 4;187,186,188,189;,
 4;190,188,170,172;,
 4;189,191,173,171;,
 4;189,188,190,191;,
 4;192,190,172,174;,
 4;191,193,175,173;,
 4;191,190,192,193;,
 4;194,192,174,176;,
 4;193,195,177,175;,
 4;193,192,194,195;,
 4;196,194,176,178;,
 4;195,197,179,177;,
 4;195,194,196,197;,
 3;196,180,181;,
 3;196,194,180;,
 3;194,184,180;,
 3;194,192,184;;
 
 MeshMaterialList {
  3;
  155;
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2;;
  Material {
   1.000000;0.949000;0.200000;1.000000;;
   5.000000;
   0.450000;0.450000;0.450000;;
   0.550000;0.521950;0.110000;;
  }
  Material {
   0.571200;0.571200;0.571200;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.341600;0.762400;0.800000;0.630000;;
   25.000000;
   0.120000;0.120000;0.120000;;
   0.260470;0.581330;0.610000;;
  }
 }
 MeshNormals {
  182;
  0.985314;-0.163484;0.049296;,
  0.931429;-0.363191;0.023070;,
  0.716909;-0.696362;-0.033499;,
  0.401445;-0.911556;-0.088924;,
  0.023206;-0.991433;-0.128540;,
  -0.365960;-0.921334;-0.131214;,
  -0.744876;-0.663460;-0.070570;,
  -0.946410;-0.322527;0.016886;,
  -0.980739;-0.188372;0.051646;,
  0.986411;-0.163758;-0.013294;,
  0.930632;-0.363224;-0.044639;,
  0.711765;-0.696015;-0.094623;,
  0.392284;-0.911051;-0.126886;,
  0.012284;-0.990134;-0.139583;,
  -0.374436;-0.919956;-0.116101;,
  -0.745138;-0.666098;-0.032909;,
  -0.942879;-0.327560;0.060688;,
  -0.977252;-0.190791;0.092614;,
  -0.913923;0.374903;-0.155539;,
  -0.858695;0.502969;-0.098315;,
  -0.688388;0.725151;0.016698;,
  -0.405550;0.909101;0.095211;,
  -0.023369;0.991430;0.128536;,
  0.366056;0.921492;0.129832;,
  0.718138;0.694645;0.041775;,
  0.887844;0.443231;-0.123610;,
  0.909304;0.358775;-0.210823;,
  -0.921991;0.313415;-0.227383;,
  -0.846871;0.516207;-0.127827;,
  -0.654165;0.754519;0.052620;,
  -0.399378;0.906755;0.135247;,
  -0.012431;0.990151;0.139448;,
  0.374584;0.920198;0.113675;,
  0.677187;0.735134;-0.031549;,
  0.834935;0.447039;-0.320998;,
  0.843548;0.255732;-0.472258;,
  0.958491;-0.178503;0.222334;,
  0.908781;-0.370679;0.191608;,
  0.710294;-0.696455;0.102143;,
  0.411500;-0.911349;-0.010561;,
  0.048244;-0.991766;-0.118626;,
  -0.333671;-0.922961;-0.191851;,
  -0.727111;-0.657225;-0.198407;,
  -0.939661;-0.312342;-0.139572;,
  -0.976384;-0.188033;-0.106384;,
  -0.882554;0.435609;-0.177039;,
  -0.855501;0.492131;-0.161012;,
  -0.712380;0.695415;-0.094404;,
  -0.412971;0.910626;0.014687;,
  -0.048401;0.991755;0.118658;,
  0.334009;0.923025;0.190953;,
  0.737958;0.642525;0.206348;,
  0.891310;0.416272;0.179677;,
  0.882528;0.436133;0.175875;,
  0.884970;-0.193256;0.423651;,
  0.843571;-0.378323;0.381130;,
  0.669801;-0.698514;0.251883;,
  0.398239;-0.913730;0.080641;,
  0.064033;-0.992843;-0.100807;,
  -0.291884;-0.922047;-0.254230;,
  -0.677750;-0.646025;-0.351150;,
  -0.889060;-0.300302;-0.345529;,
  -0.926392;-0.189494;-0.325409;,
  -0.824463;0.436775;-0.359845;,
  -0.800919;0.493544;-0.339032;,
  -0.673068;0.697677;-0.245412;,
  -0.400272;0.913137;-0.077221;,
  -0.064185;0.992836;0.100785;,
  0.292356;0.922153;0.253300;,
  0.689214;0.628351;0.360775;,
  0.837876;0.401132;0.370212;,
  0.822070;0.437013;0.364995;,
  0.741130;-0.195825;0.642167;,
  0.709528;-0.383514;0.591174;,
  0.569063;-0.705811;0.421898;,
  0.347876;-0.918844;0.186302;,
  0.077559;-0.993969;-0.077529;,
  -0.208199;-0.922117;-0.326119;,
  -0.532324;-0.644100;-0.549332;,
  -0.718449;-0.298966;-0.628053;,
  -0.751990;-0.197221;-0.628980;,
  -0.694294;0.442737;-0.567398;,
  -0.675440;0.500287;-0.541751;,
  -0.571912;0.705574;-0.418427;,
  -0.349696;0.918577;-0.184198;,
  -0.077434;0.993992;0.077362;,
  0.210252;0.922295;0.324295;,
  0.547593;0.623561;0.557954;,
  0.674991;0.397635;0.621508;,
  0.653238;0.446799;0.611271;,
  0.515851;-0.195735;0.834018;,
  0.497324;-0.384221;0.777845;,
  0.405645;-0.708975;0.576893;,
  0.257986;-0.923347;0.284383;,
  0.081049;-0.995164;-0.055487;,
  -0.097007;-0.915693;-0.389994;,
  -0.294047;-0.630510;-0.718326;,
  -0.407536;-0.290850;-0.865633;,
  -0.426159;-0.194642;-0.883461;,
  -0.486246;0.443739;-0.752768;,
  -0.473833;0.501738;-0.723699;,
  -0.406096;0.709061;-0.576471;,
  -0.258857;0.923338;-0.283621;,
  -0.080503;0.995224;0.055217;,
  0.101573;0.916295;0.387410;,
  0.314374;0.610611;0.726858;,
  0.391312;0.387630;0.834636;,
  0.369637;0.439357;0.818739;,
  0.269304;-0.194597;0.943190;,
  0.257297;-0.382558;0.887382;,
  0.204610;-0.708145;0.675770;,
  0.124860;-0.925414;0.357797;,
  0.038713;-0.999059;-0.019541;,
  -0.032780;-0.916998;-0.397542;,
  -0.091538;-0.631007;-0.770358;,
  -0.114361;-0.291305;-0.949770;,
  -0.112659;-0.188999;-0.975493;,
  -0.248250;0.441657;-0.862155;,
  -0.240195;0.499652;-0.832258;,
  -0.201565;0.708091;-0.676742;,
  -0.124017;0.925438;-0.358028;,
  -0.038040;0.999089;0.019358;,
  0.037718;0.917456;0.396046;,
  0.110560;0.613188;0.782162;,
  0.128481;0.388828;0.912308;,
  0.115197;0.430973;0.894981;,
  0.091635;-0.193190;0.976873;,
  0.084549;-0.379558;0.921297;,
  0.060638;-0.703459;0.708145;,
  0.029486;-0.922325;0.385287;,
  0.003014;-0.999995;-0.000720;,
  -0.006533;-0.920936;-0.389660;,
  0.000606;-0.635597;-0.772021;,
  0.010316;-0.294192;-0.955691;,
  0.013767;-0.188725;-0.981934;,
  -0.218645;0.375041;-0.900854;,
  -0.169569;0.504547;-0.846569;,
  -0.080470;0.734295;-0.674044;,
  -0.028107;0.922234;-0.385609;,
  -0.002539;0.999997;0.000621;,
  0.009873;0.921118;0.389159;,
  -0.040117;0.665023;0.745744;,
  -0.162175;0.408396;0.898283;,
  -0.234312;0.351446;0.906413;,
  0.045021;-0.193940;0.979980;,
  0.041335;-0.380830;0.923721;,
  0.029142;-0.705068;0.708541;,
  0.013630;-0.923071;0.384387;,
  0.001337;-0.999999;-0.000107;,
  -0.000901;-0.922808;-0.385258;,
  -0.000583;-0.639270;-0.768982;,
  -0.008958;-0.297588;-0.954652;,
  -0.015441;-0.193589;-0.980961;,
  -0.315349;0.309159;-0.897204;,
  -0.227437;0.514341;-0.826877;,
  -0.073907;0.765781;-0.638840;,
  -0.012845;0.923047;-0.384472;,
  -0.001058;0.999999;0.000087;,
  0.002944;0.922837;0.385179;,
  -0.094119;0.708808;0.699095;,
  -0.323597;0.416593;0.849550;,
  -0.447611;0.258848;0.855945;,
  0.000000;0.000000;-1.000000;,
  -0.133523;0.061683;-0.989124;,
  -0.041034;-0.050012;-0.997905;,
  -0.140237;0.149985;-0.978692;,
  -0.033223;0.066483;-0.997234;,
  -0.007028;0.088071;-0.996089;,
  -0.003531;0.122157;-0.992505;,
  0.010972;0.078679;-0.996840;,
  0.023863;-0.057847;-0.998040;,
  -1.000000;-0.000083;0.000423;,
  -1.000000;-0.000040;0.000212;,
  -1.000000;-0.000016;0.000084;,
  -1.000000;-0.000042;0.000211;,
  -1.000000;-0.000000;-0.000000;,
  -1.000000;-0.000000;-0.000001;,
  -1.000000;0.000000;0.000001;,
  -1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  -1.000000;-0.000000;0.000000;,
  -1.000000;0.000001;0.000000;;
  155;
  4;0,1,10,9;,
  4;19,18,27,28;,
  4;1,2,11,10;,
  4;20,19,28,29;,
  4;2,3,12,11;,
  4;21,20,29,30;,
  4;3,4,13,12;,
  4;22,21,30,31;,
  4;4,5,14,13;,
  4;23,22,31,32;,
  4;5,6,15,14;,
  4;24,23,32,33;,
  4;6,7,16,15;,
  4;25,24,33,34;,
  4;7,8,17,16;,
  4;26,25,34,35;,
  4;162,163,164,162;,
  4;163,165,166,164;,
  4;165,167,168,166;,
  4;167,162,162,168;,
  4;162,162,169,162;,
  4;162,162,170,169;,
  4;162,162,162,170;,
  4;162,162,162,162;,
  3;162,162,162;,
  3;162,162,164;,
  3;164,170,162;,
  3;170,164,166;,
  3;169,170,166;,
  3;169,166,168;,
  3;169,168,162;,
  4;46,45,18,19;,
  4;36,37,1,0;,
  4;47,46,19,20;,
  4;37,38,2,1;,
  4;48,47,20,21;,
  4;38,39,3,2;,
  4;49,48,21,22;,
  4;39,40,4,3;,
  4;50,49,22,23;,
  4;40,41,5,4;,
  4;51,50,23,24;,
  4;41,42,6,5;,
  4;52,51,24,25;,
  4;42,43,7,6;,
  4;53,52,25,26;,
  4;43,44,8,7;,
  4;64,63,45,46;,
  4;54,55,37,36;,
  4;65,64,46,47;,
  4;55,56,38,37;,
  4;66,65,47,48;,
  4;56,57,39,38;,
  4;67,66,48,49;,
  4;57,58,40,39;,
  4;68,67,49,50;,
  4;58,59,41,40;,
  4;69,68,50,51;,
  4;59,60,42,41;,
  4;70,69,51,52;,
  4;60,61,43,42;,
  4;71,70,52,53;,
  4;61,62,44,43;,
  4;82,81,63,64;,
  4;72,73,55,54;,
  4;83,82,64,65;,
  4;73,74,56,55;,
  4;84,83,65,66;,
  4;74,75,57,56;,
  4;85,84,66,67;,
  4;75,76,58,57;,
  4;86,85,67,68;,
  4;76,77,59,58;,
  4;87,86,68,69;,
  4;77,78,60,59;,
  4;88,87,69,70;,
  4;78,79,61,60;,
  4;89,88,70,71;,
  4;79,80,62,61;,
  4;100,99,81,82;,
  4;90,91,73,72;,
  4;101,100,82,83;,
  4;91,92,74,73;,
  4;102,101,83,84;,
  4;92,93,75,74;,
  4;103,102,84,85;,
  4;93,94,76,75;,
  4;104,103,85,86;,
  4;94,95,77,76;,
  4;105,104,86,87;,
  4;95,96,78,77;,
  4;106,105,87,88;,
  4;96,97,79,78;,
  4;107,106,88,89;,
  4;97,98,80,79;,
  4;118,117,99,100;,
  4;108,109,91,90;,
  4;119,118,100,101;,
  4;109,110,92,91;,
  4;120,119,101,102;,
  4;110,111,93,92;,
  4;121,120,102,103;,
  4;111,112,94,93;,
  4;122,121,103,104;,
  4;112,113,95,94;,
  4;123,122,104,105;,
  4;113,114,96,95;,
  4;124,123,105,106;,
  4;114,115,97,96;,
  4;125,124,106,107;,
  4;115,116,98,97;,
  4;136,135,117,118;,
  4;126,127,109,108;,
  4;137,136,118,119;,
  4;127,128,110,109;,
  4;138,137,119,120;,
  4;128,129,111,110;,
  4;139,138,120,121;,
  4;129,130,112,111;,
  4;140,139,121,122;,
  4;130,131,113,112;,
  4;141,140,122,123;,
  4;131,132,114,113;,
  4;142,141,123,124;,
  4;132,133,115,114;,
  4;143,142,124,125;,
  4;133,134,116,115;,
  4;154,153,135,136;,
  4;144,145,127,126;,
  4;171,172,173,174;,
  4;155,154,136,137;,
  4;145,146,128,127;,
  4;174,173,175,176;,
  4;156,155,137,138;,
  4;146,147,129,128;,
  4;176,175,177,177;,
  4;157,156,138,139;,
  4;147,148,130,129;,
  4;177,177,177,177;,
  4;158,157,139,140;,
  4;148,149,131,130;,
  4;177,177,178,178;,
  4;159,158,140,141;,
  4;149,150,132,131;,
  4;178,178,179,178;,
  4;160,159,141,142;,
  4;150,151,133,132;,
  4;178,179,180,178;,
  4;161,160,142,143;,
  4;151,152,134,133;,
  4;178,180,181,178;,
  3;181,173,172;,
  3;181,180,173;,
  3;180,175,173;,
  3;180,179,175;;
 }
 MeshTextureCoords {
  198;
  0.250000;0.000000;,
  0.312500;0.000000;,
  0.312500;1.000000;,
  0.250000;1.000000;,
  0.312500;0.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.312500;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.437500;0.000000;,
  0.437500;1.000000;,
  0.437500;0.000000;,
  0.437500;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.562500;0.000000;,
  0.562500;1.000000;,
  0.562500;0.000000;,
  0.562500;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.687500;0.000000;,
  0.687500;1.000000;,
  0.687500;0.000000;,
  0.687500;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;;
 }
}