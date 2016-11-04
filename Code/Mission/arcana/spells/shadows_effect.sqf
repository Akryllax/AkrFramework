PP_chrom = ppEffectCreate ["ChromAberration",200];
PP_chrom ppEffectEnable true;
PP_chrom ppEffectAdjust [0.01,0.01,true];
PP_chrom ppEffectCommit 1;
PP_wetD = ppEffectCreate ["WetDistortion",300];
PP_wetD ppEffectEnable true;
PP_wetD ppEffectAdjust [0.35,0.05,0.05,1,1,1,1,0.05,0.05,0.05,0.05,0.5,1,1,1];
PP_wetD ppEffectCommit 1;
PP_colorC = ppEffectCreate ["ColorCorrections",1500];
PP_colorC ppEffectEnable true;
PP_colorC ppEffectAdjust [1,1,0.09,[0.2,0.2,0.2,0.1],[1.1,1,1.1,2],[0.37,0.94,0.94,0.2],[0.45,0.562,0,0,0,0.5,2]];
PP_colorC ppEffectCommit 1;
PP_film = ppEffectCreate ["FilmGrain",2000];
PP_film ppEffectEnable true;
PP_film ppEffectAdjust [0.2,1,1,0.5,0.5,true];
PP_film ppEffectCommit 1;
// Date YYYY-MM-DD-HH-MM: [2035,6,24,8,0]. Overcast: 0.3. Fog: 0.0868543. Fog params: [0.0800049,0.013,0] 
// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
//[[false,100,[0.05,0.05,0.3,0.3]],[true,200,[0.01,0.01,true]],[true,300,[0.35,0.05,0.05,1,1,1,1,0.05,0.05,0.05,0.05,0.5,1,1,1]],[true,1500,[1,1,0.09,[0.2,0.2,0.2,0.1],[1.1,1,1.1,2],[0.37,0.94,0.94,0.2],[0.45,0.562,0,0,0,0.5,2]]],[false,500,[1]],[true,2000,[0.2,1,1,0.5,0.5,true]],[false,2500,[0.5,0.5,0.5]]]