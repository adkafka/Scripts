#!/bin/bash
# This script will recursively download all files of a given extension form a given url

# wget -r -nd -l1 -A *.mp3 "URL"

#All Music file extensions
MUSIC="*.3gp,*.act,*.AIFF,*.aac,*.ALAC,*.amr,*.atrac,*.Au,*.awb,*.dct,*.divx,*.dss,*.dvf,*.flac,*.flv,*.gsm,*.iklax,*.IVS,*.m4a,*.m4p,*.mmf,*.mp3,*.mpc,*.msv,*.ogg,*.Opus,*.ra,*.rm,*.raw,*.TTA,*.vox,*.wav,*.wma"
#All movie file extensions
MOVIES="*.264,*.3g2,*.3gp,*.3gp2,*.3gpp,*.3gpp2,*.3mm,*.3p2,*.60d,*.787,*.890,*.aaf,*.aec,*.aep,*.aepx,*.aet,*.aetx,*.ajp,*.ale,*.am,*.amc,*.amv,*.amx,*.anim,*.aqt,*.arcut,*.arf,*.asf,*.asx,*.avb,*.avc,*.avd,*.avi,*.avp,*.avs,*.avs,*.avv,*.axm,*.bdm,*.bdmv,*.bdt2,*.bdt3,*.bik,*.bin,*.bix,*.bmk,*.bnp,*.box,*.bs4,*.bsf,*.bvr,*.byu,*.camproj,*.camrec,*.camv,*.ced,*.cel,*.cine,*.cip,*.clpi,*.cmmp,*.cmmtpl,*.cmproj,*.cmrec,*.cpi,*.cst,*.cvc,*.cx3,*.d2v,*.d3v,*.dat,*.dav,*.dce,*.dck,*.dcr,*.dcr,*.ddat,*.dif,*.dir,*.divx,*.dlx,*.dmb,*.dmsd,*.dmsd3d,*.dmsm,*.dmsm3d,*.dmss,*.dmx,*.dnc,*.dpa,*.dpg,*.dream,*.dsy,*.dv,*.dv-avi,*.dv4,*.dvdmedia,*.dvr,*.dvr-ms,*.dvx,*.dxr,*.dzm,*.dzp,*.dzt,*.edl,*.evo,*.eye,*.ezt,*.f4p,*.f4v,*.fbr,*.fbr,*.fbz,*.fcp,*.fcproject,*.ffd,*.flc,*.flh,*.fli,*.flv,*.flx,*.gfp,*.gl,*.gom,*.grasp,*.gts,*.gvi,*.gvp,*.h264,*.hdmov,*.hkm,*.ifo,*.imovieproj,*.imovieproject,*.ircp,*.irf,*.ism,*.ismc,*.ismv,*.iva,*.ivf,*.ivr,*.ivs,*.izz,*.izzy,*.jss,*.jts,*.jtv,*.k3g,*.kmv,*.ktn,*.lrec,*.lsf,*.lsx,*.m15,*.m1pg,*.m1v,*.m21,*.m21,*.m2a,*.m2p,*.m2t,*.m2ts,*.m2v,*.m4e,*.m4u,*.m4v,*.m75,*.mani,*.meta,*.mgv,*.mj2,*.mjp,*.mjpg,*.mk3d,*.mkv,*.mmv,*.mnv,*.mob,*.mod,*.modd,*.moff,*.moi,*.moov,*.mov,*.movie,*.mp21,*.mp21,*.mp2v,*.mp4,*.mp4v,*.mpe,*.mpeg,*.mpeg1,*.mpeg4,*.mpf,*.mpg,*.mpg2,*.mpgindex,*.mpl,*.mpl,*.mpls,*.mpsub,*.mpv,*.mpv2,*.mqv,*.msdvd,*.mse,*.msh,*.mswmm,*.mts,*.mtv,*.mvb,*.mvc,*.mvd,*.mve,*.mvex,*.mvp,*.mvp,*.mvy,*.mxf,*.mxv,*.mys,*.ncor,*.nsv,*.nut,*.nuv,*.nvc,*.ogm,*.ogv,*.ogx,*.osp,*.otrkey,*.pac,*.par,*.pds,*.pgi,*.photoshow,*.piv,*.pjs,*.playlist,*.plproj,*.pmf,*.pmv,*.pns,*.ppj,*.prel,*.pro,*.prproj,*.prtl,*.psb,*.psh,*.pssd,*.pva,*.pvr,*.pxv,*.qt,*.qtch,*.qtindex,*.qtl,*.qtm,*.qtz,*.r3d,*.rcd,*.rcproject,*.rdb,*.rec,*.rm,*.rmd,*.rmd,*.rmp,*.rms,*.rmv,*.rmvb,*.roq,*.rp,*.rsx,*.rts,*.rts,*.rum,*.rv,*.rvid,*.rvl,*.sbk,*.sbt,*.scc,*.scm,*.scm,*.scn,*.screenflow,*.sec,*.sedprj,*.seq,*.sfd,*.sfvidcap,*.siv,*.smi,*.smi,*.smil,*.smk,*.sml,*.smv,*.spl,*.sqz,*.srt,*.ssf,*.ssm,*.stl,*.str,*.stx,*.svi,*.swf,*.swi,*.swt,*.tda3mt,*.tdx,*.thp,*.tivo,*.tix,*.tod,*.tp,*.tp0,*.tpd,*.tpr,*.trp,*.ts,*.tsp,*.ttxt,*.tvs,*.usf,*.usm,*.vc1,*.vcpf,*.vcr,*.vcv,*.vdo,*.vdr,*.vdx,*.veg,*.vem,*.vep,*.vf,*.vft,*.vfw,*.vfz,*.vgz,*.vid,*.video,*.viewlet,*.viv,*.vivo,*.vlab,*.vob,*.vp3,*.vp6,*.vp7,*.vpj,*.vro,*.vs4,*.vse,*.vsp,*.w32,*.wcp,*.webm,*.wlmp,*.wm,*.wmd,*.wmmp,*.wmv,*.wmx,*.wot,*.wp3,*.wpl,*.wtv,*.wvx,*.xej,*.xel,*.xesc,*.xfl,*.xlmv,*.xmv,*.xvid,*.y4m,*.yuv,*.zeg,*.zm1,*.zm2,*.zm3,*.zmv"

echo "This script will output all downloaded files into this directroy: `pwd`"
echo "Before continuing with the script confirm that this is OK. If not, press ctrl+C"

echo "What URL should the search base off?"
read URL

echo "How many levels deep should the recursion go?"
read DEPTH

echo "Which file extension(s) should it download? (comma seperated)"
echo "Ex: *.exe will download all exe files, *.mp3,*.zip will download all mp3s and zip files"
echo "Input 'media' for all movie and music file extensions, 'music' for only music, or 'movies' for only movies"
read ACCEPTLIST

if [ "$ACCEPTLIST" == media ]
then 
	ACCEPTLIST=$MUSIC+$MOVIES
	echo "Setting ACCEPTLIST to all media"
elif [ "$ACCEPTLIST" == music ]
then
	ACCEPTLIST=$MUSIC
elif [ "$ACCEPTLIST" == movies ]
then
	ACCEPTLIST=$MOVIES
fi

wget -r -np -nd -H -N -l${DEPTH} -A ${ACCEPTLIST} -erobots=off "${URL}"
