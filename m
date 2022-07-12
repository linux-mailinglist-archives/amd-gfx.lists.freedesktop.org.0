Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB76571E19
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jul 2022 17:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622B394E6D;
	Tue, 12 Jul 2022 15:06:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CE494E6F;
 Tue, 12 Jul 2022 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rtek8DRv01Hvaxj6RDYdPgwM34BpE4XZ2q+yjshVK2o=; b=jjoX66wQttqZxUn8LC/qe71vSZ
 mPrdxs8D0bDpOzaX5thwvW8w4lRzfWq5iUeaDbxf5RFnDpa1ALiubRrw/kjEaRrSe/F9A17Fo60Bs
 txrUshoayhfs+6Enf/vyBR8AGpizuO/dTHttxRd9KhJgstlc3WSCNxtwFsGtJ+uTXakjYbrAOAQ8M
 KO6giygVFXRBEwJTbvUslUrC19ndHwfTVVSFn4ziLJfoa2QGQhwX49pBIwfoLLjmL1J3p5IUJlaSO
 yXETEe8RccYJQ4smgshqRKb9TPun+E0ni/zmyQNU66+MpCEOKYc6Ma6Uxo3u/3j++Lmls/sMmdigK
 lnRRBXEQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oBHSa-00DgpR-0C; Tue, 12 Jul 2022 17:06:00 +0200
Date: Tue, 12 Jul 2022 14:05:43 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: [RFC PATCH 2/5] Documentation/amdgpu/display: add DC color caps
 info
Message-ID: <20220712150543.cdhuw6nkwercld2g@mail.igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-3-mwen@igalia.com>
 <c5c8cad6-7779-17bb-8790-1bdd30e4455b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dsitkthnyym4dxxu"
Content-Disposition: inline
In-Reply-To: <c5c8cad6-7779-17bb-8790-1bdd30e4455b@amd.com>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: tzimmermann@suse.de, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, nikola.cornij@amd.com,
 bhawanpreet.lakha@amd.com, sunpeng.li@amd.com, alex.hung@amd.com,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 seanpaul@chromium.org, nicholas.kazlauskas@amd.com, harry.wentland@amd.com,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--dsitkthnyym4dxxu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 06/28, Harry Wentland wrote:
>=20
>=20
> On 6/19/22 18:31, Melissa Wen wrote:
> > Add details about color correction capabilities and explain a bit about
> > differences between DC hw generations and also how they are mapped
> > between DRM and DC interface. Two schemas for DCN 2.0 and 3.0
> > (rasterized from the original png) is included to illustrate it. They
> > were obtained from a discussion[1] in the amd-gfx mailing list.
> >=20
> > [1] https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Famd-gfx%2F20220422142811.dm6vtk6v64jcwydk%40mail.igalia.=
com%2F&amp;data=3D05%7C01%7Charry.wentland%40amd.com%7C11fb474339ba49ad492a=
08da52439534%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63791274802780071=
9%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&amp;sdata=3D1eUQmjydQoDifmsZHfS%2F9PPEJea=
ZvQ4xGgjblTL9dZE%3D&amp;reserved=3D0
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../amdgpu/display/dcn2_cm_drm_current.svg    | 1370 +++++++++++++++
> >  .../amdgpu/display/dcn3_cm_drm_current.svg    | 1528 +++++++++++++++++
> >  .../gpu/amdgpu/display/display-manager.rst    |   35 +
> >  drivers/gpu/drm/amd/display/dc/dc.h           |   53 +-
> >  4 files changed, 2985 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_curren=
t.svg
> >  create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_curren=
t.svg
> >=20
> > diff --git a/Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg b=
/Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
> > new file mode 100644
> > index 000000000000..0156f56d4482
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
> > @@ -0,0 +1,1370 @@
> > +<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
> > +<!-- Created with Inkscape (https://nam11.safelinks.protection.outlook=
=2Ecom/?url=3Dhttp%3A%2F%2Fwww.inkscape.org%2F&amp;data=3D05%7C01%7Charry.w=
entland%40amd.com%7C11fb474339ba49ad492a08da52439534%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&a=
mp;sdata=3DnC4FE5ttTFICm%2BFhXGDlmGgwcGIZKICf6jrnW6ZZ%2FEI%3D&amp;reserved=
=3D0) -->
> > +
> > +<svg
> > +   version=3D"1.1"
> > +   id=3D"svg2019"
> > +   width=3D"1702"
> > +   height=3D"1845"
> > +   viewBox=3D"0 0 1702 1845"
> > +   sodipodi:docname=3D"dcn2_cm_drm_current.svg"
> > +   inkscape:version=3D"1.1.2 (0a00cf5339, 2022-02-04)"
> > +   xmlns:inkscape=3D"https://nam11.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Fwww.inkscape.org%2Fnamespaces%2Finkscape&amp;data=3D05%7C=
01%7Charry.wentland%40amd.com%7C11fb474339ba49ad492a08da52439534%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C200=
0%7C%7C%7C&amp;sdata=3DRV2BnPZ1Ash3pjMW8pWj%2FG%2FMiWXYfuxgCsaeDIchYOQ%3D&a=
mp;reserved=3D0"
> > +   xmlns:sodipodi=3D"https://nam11.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Fsodipodi.sourceforge.net%2FDTD%2Fsodipodi-0.dtd&amp;data=
=3D05%7C01%7Charry.wentland%40amd.com%7C11fb474339ba49ad492a08da52439534%7C=
3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637912748027800719%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C2000%7C%7C%7C&amp;sdata=3DHMMzEZP%2BCNjxPLjW8R0sK3Q%2FRANhtKg7Q65pQZdW=
Dw8%3D&amp;reserved=3D0"
> > +   xmlns=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
%3A%2F%2Fwww.w3.org%2F2000%2Fsvg&amp;data=3D05%7C01%7Charry.wentland%40amd.=
com%7C11fb474339ba49ad492a08da52439534%7C3dd8961fe4884e608e11a82d994e183d%7=
C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&amp;sdata=3Dvx9=
VHcwk90HcOCQRAFGldDF0qI4teUyzWiojodX3tKc%3D&amp;reserved=3D0"
> > +   xmlns:svg=3D"https://nam11.safelinks.protection.outlook.com/?url=3D=
http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg&amp;data=3D05%7C01%7Charry.wentland%40=
amd.com%7C11fb474339ba49ad492a08da52439534%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&amp;sdata=
=3Dvx9VHcwk90HcOCQRAFGldDF0qI4teUyzWiojodX3tKc%3D&amp;reserved=3D0">
> > +  <defs
> > +     id=3D"defs2023" />
> > +  <sodipodi:namedview
> > +     id=3D"namedview2021"
> > +     pagecolor=3D"#ffffff"
> > +     bordercolor=3D"#666666"
> > +     borderopacity=3D"1.0"
> > +     inkscape:pageshadow=3D"2"
> > +     inkscape:pageopacity=3D"0.0"
> > +     inkscape:pagecheckerboard=3D"0"
> > +     showgrid=3D"false"
> > +     inkscape:zoom=3D"0.56413987"
> > +     inkscape:cx=3D"1004.1836"
> > +     inkscape:cy=3D"833.12673"
> > +     inkscape:window-width=3D"1920"
> > +     inkscape:window-height=3D"1131"
> > +     inkscape:window-x=3D"0"
> > +     inkscape:window-y=3D"0"
> > +     inkscape:window-maximized=3D"1"
> > +     inkscape:current-layer=3D"g2025" />
> > +  <g
> > +     inkscape:groupmode=3D"layer"
> > +     inkscape:label=3D"Image"
> > +     id=3D"g2025">
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect34"
> > +       width=3D"208.83351"
> > +       height=3D"486.09872"
> > +       x=3D"0.90158081"
> > +       y=3D"132.77872" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1019"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"188.06937" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1021"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"346.06937" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1103"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"266.06937" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1105"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"426.06937" />
> > +    <rect
> > +       style=3D"fill:#e6e6e6;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1107"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"506.06934" />
> > +    <path
> > +       d=3D"m 402.61883,171.88069 c 0.025,10.97895 0.01,1001.03791 0.0=
49,1012.01891 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -=
5.4987,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.4=
751 2.6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-1000.84096=
 -0.031,-1011.72348 0.053,-0.30366 -0.2175,-0.50268 -0.3652,-0.72837 l 1.53=
47,0.39394 z"
> > +       id=3D"path381056"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1131"
> > +       width=3D"239.47592"
> > +       height=3D"1015.9909"
> > +       x=3D"298.65631"
> > +       y=3D"82.399658" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.27861;stroke-opacity:1"
> > +       id=3D"rect1133"
> > +       width=3D"340.44653"
> > +       height=3D"525.77448"
> > +       x=3D"298.79562"
> > +       y=3D"1142.5299" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1237"
> > +       width=3D"284.00113"
> > +       height=3D"945.41412"
> > +       x=3D"827.75012"
> > +       y=3D"82.880798"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1239"
> > +       width=3D"239.37569"
> > +       height=3D"179.03308"
> > +       x=3D"1356.9507"
> > +       y=3D"98.758331" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.00744;stroke-opacity:1"
> > +       id=3D"rect1241"
> > +       width=3D"239.4184"
> > +       height=3D"713.64905"
> > +       x=3D"1356.9543"
> > +       y=3D"307.7951"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1345"
> > +       width=3D"330.32059"
> > +       height=3D"409.44757"
> > +       x=3D"1363.8723"
> > +       y=3D"1147.7572" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1347"
> > +       width=3D"369.8941"
> > +       height=3D"682.32245"
> > +       x=3D"825.72528"
> > +       y=3D"1146.6448"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1349"
> > +       width=3D"163.95746"
> > +       height=3D"40.144867"
> > +       x=3D"1389.9988"
> > +       y=3D"190.80583" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:0.964132;stroke-opacity:1"
> > +       id=3D"rect1619"
> > +       width=3D"271.99091"
> > +       height=3D"42.038273"
> > +       x=3D"1393.981"
> > +       y=3D"1197.161"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <path
> > +       d=3D"m 1469.3028,1238.8328 c 0.025,10.9789 0.01,175.0378 0.049,=
186.0188 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -5.498=
7,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.4751 2=
=2E6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-174.8409 -0.0=
31,-185.7234 0.053,-0.3037 -0.2175,-0.5027 -0.3652,-0.7284 l 1.5347,0.394 z"
> > +       id=3D"path106-1"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <path
> > +       d=3D"m 407.4759,1238.4728 c 0.025,10.9789 0.01,291.0378 0.049,3=
02.0188 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -5.4987=
,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.4751 2.=
6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-290.8409 -0.031,=
-301.7234 0.053,-0.3037 -0.2175,-0.5027 -0.3652,-0.7284 l 1.5347,0.394 z"
> > +       id=3D"path106-1-7"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1623"
> > +       width=3D"137.32646"
> > +       height=3D"41.782684"
> > +       x=3D"1396.3848"
> > +       y=3D"1268.2837"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1705"
> > +       width=3D"137.32646"
> > +       height=3D"41.782684"
> > +       x=3D"1396.3848"
> > +       y=3D"1348.2837" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1707"
> > +       width=3D"137.32646"
> > +       height=3D"41.782684"
> > +       x=3D"1396.3848"
> > +       y=3D"1432.2837" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1731"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"190.42665"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1813"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"254.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1815"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"318.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1817"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"412.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1819"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"560.42664" />
> > +    <rect
> > +       style=3D"fill:#e6e6e6;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1821"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"674.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1823"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"744.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1825"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"820.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1827"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"890.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1829"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"956.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1831"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1256.4268" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1833"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1402.4268" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1915"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1330.4268"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1917"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1478.4268" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1919"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1548.4268" />
> > +    <rect
> > +       style=3D"fill:#eeeeee;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1921"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1614.4268" />
> > +    <rect
> > +       style=3D"fill:#eeeeee;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1923"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1686.4268" />
> > +    <rect
> > +       style=3D"fill:#eeeeee;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1925"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1754.4268" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1925-3"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"134.37756" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1954"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"276.37756"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.87333333;stroke-opacity:1;stroke-miterlimit:4;stroke-dasharray:none"
> > +       id=3D"rect1956"
> > +       width=3D"168.66573"
> > +       height=3D"122.14091"
> > +       x=3D"325.50134"
> > +       y=3D"358.6615"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#e6e6e6;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1958"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"672.37756" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1960"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"744.37756" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.965912;stroke-opacity:1"
> > +       id=3D"rect1962"
> > +       width=3D"169.14041"
> > +       height=3D"54.756817"
> > +       x=3D"325.26404"
> > +       y=3D"814.42413"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.965912;stroke-opacity:1"
> > +       id=3D"rect1964"
> > +       width=3D"169.14041"
> > +       height=3D"54.756817"
> > +       x=3D"325.26404"
> > +       y=3D"886.42413"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.965912;stroke-opacity:1"
> > +       id=3D"rect1966"
> > +       width=3D"169.14041"
> > +       height=3D"54.756817"
> > +       x=3D"325.26404"
> > +       y=3D"952.42413"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:1.02091;stroke-opacity:1"
> > +       id=3D"rect2428"
> > +       width=3D"169.0854"
> > +       height=3D"61.19017"
> > +       x=3D"325.29156"
> > +       y=3D"1468.4518" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.839627;stroke-opacity:1"
> > +       id=3D"rect2430"
> > +       width=3D"169.26669"
> > +       height=3D"41.344128"
> > +       x=3D"325.20093"
> > +       y=3D"1550.3611" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.13491;stroke-opacity:1"
> > +       id=3D"rect2432"
> > +       width=3D"287.86237"
> > +       height=3D"44.416805"
> > +       x=3D"325.34854"
> > +       y=3D"1194.5088" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.13102;stroke-opacity:1"
> > +       id=3D"rect2434"
> > +       width=3D"285.86655"
> > +       height=3D"44.4207"
> > +       x=3D"867.34656"
> > +       y=3D"1194.5068" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2509" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2511" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2513" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2515" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2517" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2519" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2521" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2523" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2525" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2527" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2529" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2531" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 409.83425,179.05653 v 33.6932 h 457.52867"
> > +       id=3D"path6876"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1925-3"
> > +       inkscape:connection-end=3D"#rect1731"
> > +       sodipodi:nodetypes=3D"ccc" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.45103,156.71704 h 168.64955 v 161.7096 h 204.26234"
> > +       id=3D"path6878"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1925-3"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 409.83425,321.05653 v 19.69319 h 457.52867"
> > +       id=3D"path7294"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1954"
> > +       inkscape:connection-end=3D"#rect1815"
> > +       sodipodi:nodetypes=3D"ccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.45103,298.71704 H 659.10058 V 434.74972 H 867.36292"
> > +       id=3D"path7296"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-end=3D"#rect1817"
> > +       inkscape:connection-start=3D"#rect1954"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 867.36292,560.42664 H 494.16705 V 480.8024"
> > +       id=3D"path7720"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.45103,696.74972 H 867.36292"
> > +       id=3D"path7726"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1958"
> > +       inkscape:connection-end=3D"#rect1821" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 867.36292,766.74972 H 494.45103"
> > +       id=3D"path7728"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1823"
> > +       inkscape:connection-end=3D"#rect1960" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.45105,789.05652 H 657.82418 V 1278.7498 H 867.36292"
> > +       id=3D"path7730"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-end=3D"#rect1831"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.40445,841.80254 h 167.41973 v 0.94718 h 205.53874"
> > +       id=3D"path8140"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1962"
> > +       inkscape:connection-end=3D"#rect1825" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.40445,913.80254 h 167.41973 v -1.05282 h 205.53874"
> > +       id=3D"path8142"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1964"
> > +       inkscape:connection-end=3D"#rect1827" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.40445,979.80254 h 167.41973 v -1.05282 h 205.53874"
> > +       id=3D"path8144"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1966"
> > +       inkscape:connection-end=3D"#rect1829" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.37697,1500.7498 H 867.36292"
> > +       id=3D"path8150"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect2428"
> > +       inkscape:connection-end=3D"#rect1917" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.46762,1570.7498 h 372.8953"
> > +       id=3D"path8152"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect2430"
> > +       inkscape:connection-end=3D"#rect1919" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 1396.3848,1289.175 H 1288.1445 V 582.74972 h -198.4368"
> > +       id=3D"path8154"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1623"
> > +       inkscape:connection-end=3D"#rect1819" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 1396.3848,1369.175 h -112.2403 v -90.4252 h -194.4368"
> > +       id=3D"path8462"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1705"
> > +       inkscape:connection-end=3D"#rect1831"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 1089.7077,1500.7498 h 375.3403 v -26.6834"
> > +       id=3D"path8668"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1917"
> > +       inkscape:connection-end=3D"#rect1707" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 1389.9988,212.74973 H 1089.7077"
> > +       id=3D"path8672"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1349"
> > +       inkscape:connection-end=3D"#rect1731" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 1389.9988,230.9507 H 1223.331 v 109.79902 h -133.6233"
> > +       id=3D"path8674"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-end=3D"#rect1815"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:40px;li=
ne-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:no=
ne"
> > +       x=3D"58.63356"
> > +       y=3D"69.574417"
> > +       id=3D"text28675"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan28673"
> > +         x=3D"58.63356"
> > +         y=3D"69.574417" /></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"56.388252"
> > +       y=3D"221.86568"
> > +       id=3D"text31913"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan31911"
> > +         x=3D"56.388252"
> > +         y=3D"221.86568">Matrix</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"53.441296"
> > +       y=3D"300.866"
> > +       id=3D"text38843"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan38841"
> > +         x=3D"53.441296"
> > +         y=3D"300.866">1D LUT</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"53.441296"
> > +       y=3D"378.866"
> > +       id=3D"text41049"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan41047"
> > +         x=3D"53.441296"
> > +         y=3D"378.866">3D LUT</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"40.831493"
> > +       y=3D"460.87411"
> > +       id=3D"text45037"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan45035"
> > +         x=3D"40.831493"
> > +         y=3D"460.87411"
> > +         style=3D"font-size:18.6667px">Unpacking</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"62.130371"
> > +       y=3D"540.68872"
> > +       id=3D"text49945"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan49943"
> > +         x=3D"62.130371"
> > +         y=3D"540.68872"
> > +         style=3D"font-size:18.6667px">Other</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1423.2806"
> > +       y=3D"128.08769"
> > +       id=3D"text55719"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan55717"
> > +         x=3D"1423.2806"
> > +         y=3D"128.08769"
> > +         style=3D"font-size:18.6667px">drm_framebuffer</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1439.9988"
> > +       y=3D"218.74973"
> > +       id=3D"text62479"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan62477"
> > +         x=3D"1439.9988"
> > +         y=3D"218.74973"
> > +         style=3D"font-size:18.6667px">format</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1475.2806"
> > +       y=3D"340.08771"
> > +       id=3D"text64465"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64463"
> > +         x=3D"1475.2806"
> > +         y=3D"340.08771"
> > +         style=3D"font-size:18.6667px">drm_plane</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1589.2806"
> > +       y=3D"1178.0876"
> > +       id=3D"text64469"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467"
> > +         x=3D"1589.2806"
> > +         y=3D"1178.0876"
> > +         style=3D"font-size:18.6667px">drm_crtc</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"872.23993"
> > +       y=3D"1172.4491"
> > +       id=3D"text64469-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2"
> > +         x=3D"872.23993"
> > +         y=3D"1172.4491"
> > +         style=3D"font-size:18.6667px">Stream</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"328.26071"
> > +       y=3D"1175.6371"
> > +       id=3D"text64469-9-2"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-8"
> > +         x=3D"328.26071"
> > +         y=3D"1175.6371"
> > +         style=3D"font-size:18.6667px">MPC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"330.14737"
> > +       y=3D"114.41869"
> > +       id=3D"text64469-9-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-7"
> > +         x=3D"330.14737"
> > +         y=3D"114.41869"
> > +         style=3D"font-size:18.6667px">DPP</tspan></text>
> > +    <path
> > +       d=3D"m 1488.3608,401.47792 c 0.025,10.97895 0.01,773.03788 0.04=
9,784.01888 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -5.=
4987,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.475=
1 2.6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-772.84093 -0=
=2E031,-783.72345 0.053,-0.30366 -0.2175,-0.50268 -0.3652,-0.72837 l 1.5347=
,0.39394 z"
> > +       id=3D"path106"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1495.9988"
> > +       y=3D"1224.7498"
> > +       id=3D"text78849"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78847"
> > +         x=3D"1495.9988"
> > +         y=3D"1224.7498"
> > +         style=3D"font-size:18.6667px">Blender</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1417.9988"
> > +       y=3D"1294.7498"
> > +       id=3D"text78853"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78851"
> > +         x=3D"1417.9988"
> > +         y=3D"1294.7498"
> > +         style=3D"font-size:18.6667px">Degamma</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1451.9988"
> > +       y=3D"1376.7498"
> > +       id=3D"text78857"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78855"
> > +         x=3D"1451.9988"
> > +         y=3D"1376.7498"
> > +         style=3D"font-size:18.6667px">CTM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1427.9988"
> > +       y=3D"1458.7498"
> > +       id=3D"text78861"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78859"
> > +         x=3D"1427.9988"
> > +         y=3D"1458.7498"
> > +         style=3D"font-size:18.6667px">Gamma</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"949.99878"
> > +       y=3D"218.74973"
> > +       id=3D"text104653"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104651"
> > +         x=3D"949.99878"
> > +         y=3D"218.74973"
> > +         style=3D"font-size:18.6667px">format</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"911.99878"
> > +       y=3D"284.74973"
> > +       id=3D"text104657"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104655"
> > +         x=3D"911.99878"
> > +         y=3D"284.74973"
> > +         style=3D"font-size:18.6667px">bias_and_scale</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"887.99878"
> > +       y=3D"346.74973"
> > +       id=3D"text104661"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104659"
> > +         x=3D"887.99878"
> > +         y=3D"346.74973"
> > +         style=3D"font-size:18.6667px">color space matrix</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"871.99878"
> > +       y=3D"442.74973"
> > +       id=3D"text104665"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104663"
> > +         x=3D"871.99878"
> > +         y=3D"442.74973"
> > +         style=3D"font-size:18.6667px">input_csc_color_matrix</tspan><=
/text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"905.99878"
> > +       y=3D"586.74976"
> > +       id=3D"text125075"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan125073"
> > +         x=3D"905.99878"
> > +         y=3D"586.74976"
> > +         style=3D"font-size:18.6667px">in_transfer_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"945.0083"
> > +       y=3D"702.85938"
> > +       id=3D"text117309"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307"
> > +         x=3D"945.0083"
> > +         y=3D"702.85938"
> > +         style=3D"font-size:18.6667px">hdr_mult</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"874.5556"
> > +       y=3D"773.42615"
> > +       id=3D"text117309-6"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-7"
> > +         x=3D"874.5556"
> > +         y=3D"773.42615"
> > +         style=3D"font-size:18.6667px">gamut_remap_matrix</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"913.72528"
> > +       y=3D"846.55896"
> > +       id=3D"text117309-5"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-3"
> > +         x=3D"913.72528"
> > +         y=3D"846.55896"
> > +         style=3D"font-size:18.6667px">in_shaper_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"937.72528"
> > +       y=3D"918.25787"
> > +       id=3D"text117309-56"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-2"
> > +         x=3D"937.72528"
> > +         y=3D"918.25787"
> > +         style=3D"font-size:18.6667px">lut3d_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"945.9895"
> > +       y=3D"986.10767"
> > +       id=3D"text117309-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-1"
> > +         x=3D"945.9895"
> > +         y=3D"986.10767"
> > +         style=3D"font-size:18.6667px">blend_tf</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"975.91803"
> > +       y=3D"1224.5564"
> > +       id=3D"text137434"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432"
> > +         x=3D"975.91803"
> > +         y=3D"1224.5564"
> > +         style=3D"font-size:18.6667px">Blender</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"879.31372"
> > +       y=3D"1283.4249"
> > +       id=3D"text137434-2"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-7"
> > +         x=3D"879.31372"
> > +         y=3D"1283.4249"
> > +         style=3D"font-size:18.6667px">gamut_remap_matrix</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"925.31372"
> > +       y=3D"1359.2747"
> > +       id=3D"text137434-0"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-9"
> > +         x=3D"925.31372"
> > +         y=3D"1359.2747"
> > +         style=3D"font-size:18.6667px">func_shaper</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"930.33252"
> > +       y=3D"1430.2566"
> > +       id=3D"text137434-3"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-6"
> > +         x=3D"930.33252"
> > +         y=3D"1430.2566"
> > +         style=3D"font-size:18.6667px">lut3d_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"900.18158"
> > +       y=3D"1504.6725"
> > +       id=3D"text137434-06"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-2"
> > +         x=3D"900.18158"
> > +         y=3D"1504.6725"
> > +         style=3D"font-size:18.6667px">out_transfer_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"904.0307"
> > +       y=3D"1575.8053"
> > +       id=3D"text137434-6"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-1"
> > +         x=3D"904.0307"
> > +         y=3D"1575.8053"
> > +         style=3D"font-size:18.6667px">csc_color_matrix</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"903.16278"
> > +       y=3D"1642.1078"
> > +       id=3D"text137434-8"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-79"
> > +         x=3D"903.16278"
> > +         y=3D"1642.1078"
> > +         style=3D"font-size:18.6667px">bit_depth_param</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"939.31372"
> > +       y=3D"1713.8068"
> > +       id=3D"text137434-20"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-23"
> > +         x=3D"939.31372"
> > +         y=3D"1713.8068"
> > +         style=3D"font-size:18.6667px">clamping</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"894.0307"
> > +       y=3D"1782.5244"
> > +       id=3D"text137434-7"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-5"
> > +         x=3D"894.0307"
> > +         y=3D"1782.5244"
> > +         style=3D"font-size:18.6667px">output_color_space</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"869.63062"
> > +       y=3D"117.7968"
> > +       id=3D"text176429"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427"
> > +         x=3D"869.63062"
> > +         y=3D"117.7968"
> > +         style=3D"font-size:18.6667px">Plane</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"27.605465"
> > +       y=3D"162.20587"
> > +       id=3D"text176429-2"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-0"
> > +         x=3D"27.605465"
> > +         y=3D"162.20587"
> > +         style=3D"font-size:18.6667px">Legend</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"298.63959"
> > +       y=3D"59.293999"
> > +       id=3D"text176429-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-2"
> > +         x=3D"298.63959"
> > +         y=3D"59.293999"
> > +         style=3D"font-size:18.6667px">DCN 2.0</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"826.65735"
> > +       y=3D"59.458061"
> > +       id=3D"text176429-66"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-4"
> > +         x=3D"826.65735"
> > +         y=3D"59.458061"
> > +         style=3D"font-size:18.6667px">DC Interface</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1362.9948"
> > +       y=3D"59.458061"
> > +       id=3D"text176429-95"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-04"
> > +         x=3D"1362.9948"
> > +         y=3D"59.458061"
> > +         style=3D"font-size:18.6667px">DRM Interface</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:40px;li=
ne-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:no=
ne"
> > +       x=3D"867.34656"
> > +       y=3D"1194.5068"
> > +       id=3D"text184728"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan184726"
> > +         x=3D"867.34656"
> > +         y=3D"1194.5068" /></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"389.01593"
> > +       y=3D"159.8909"
> > +       id=3D"text64469-9-3"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-6"
> > +         x=3D"389.01593"
> > +         y=3D"159.8909"
> > +         style=3D"font-size:18.6667px">CNVC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"365.88379"
> > +       y=3D"303.59048"
> > +       id=3D"text64469-9-1"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-2"
> > +         x=3D"365.88379"
> > +         y=3D"303.59048"
> > +         style=3D"font-size:18.6667px">Input CSC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"409.06488"
> > +       y=3D"404.95001"
> > +       id=3D"text64469-9-93"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-1"
> > +         x=3D"409.06488"
> > +         y=3D"404.95001"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">DeGamma</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"409.06488"
> > +         y=3D"428.28339"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan233797">RAM and ROM</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"409.06488"
> > +         y=3D"451.61676"
> > +         style=3D"font-size:10.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan242597">(sRGB, BT2020</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"351.16684"
> > +       y=3D"700.34918"
> > +       id=3D"text64469-9-0"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-3"
> > +         x=3D"351.16684"
> > +         y=3D"700.34918"
> > +         style=3D"font-size:18.6667px">HDR Multiply</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"345.16684"
> > +       y=3D"771.33112"
> > +       id=3D"text64469-9-6"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-10"
> > +         x=3D"345.16684"
> > +         y=3D"771.33112"
> > +         style=3D"font-size:18.6667px">Gamut Remap</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"412.5184"
> > +       y=3D"836.04877"
> > +       id=3D"text64469-9-63"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-20"
> > +         x=3D"412.5184"
> > +         y=3D"836.04877"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">Shaper LUT</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"412.5184"
> > +         y=3D"859.38214"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan222533">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"413.54086"
> > +       y=3D"908.61554"
> > +       id=3D"text64469-9-61"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-55"
> > +         x=3D"413.54086"
> > +         y=3D"908.61554"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">3D LUT</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"413.54086"
> > +         y=3D"931.94891"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan221121">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"344.0347"
> > +       y=3D"985.33319"
> > +       id=3D"text64469-9-47"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-65"
> > +         x=3D"344.0347"
> > +         y=3D"985.33319"
> > +         style=3D"font-size:18.6667px">Blend Gamma</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"433.84625"
> > +       y=3D"1223.411"
> > +       id=3D"text64469-9-69"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-37"
> > +         x=3D"433.84625"
> > +         y=3D"1223.411"
> > +         style=3D"font-size:18.6667px">Blender</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"408.64996"
> > +       y=3D"1492.8102"
> > +       id=3D"text64469-9-8"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-84"
> > +         x=3D"408.64996"
> > +         y=3D"1492.8102"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">Gamma</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"408.64996"
> > +         y=3D"1516.1436"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan197733">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"385.46863"
> > +       y=3D"1575.2261"
> > +       id=3D"text64469-9-31"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-49"
> > +         x=3D"385.46863"
> > +         y=3D"1575.2261"
> > +         style=3D"font-size:18.6667px">OCSC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:40px;li=
ne-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:no=
ne"
> > +       x=3D"1356.5106"
> > +       y=3D"53.140579"
> > +       id=3D"text273287"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan273285"
> > +         x=3D"1356.5106"
> > +         y=3D"53.140579" /></text>
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1411"
> > +       width=3D"177.28049"
> > +       height=3D"38.940468"
> > +       x=3D"1392.2576"
> > +       y=3D"459.24118" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1411.7203"
> > +       y=3D"485.93231"
> > +       id=3D"text78841"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78839"
> > +         x=3D"1411.7203"
> > +         y=3D"485.93231"
> > +         style=3D"font-size:18.6667px">color_encoding</tspan></text>
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1515"
> > +       width=3D"175.11876"
> > +       height=3D"43.239407"
> > +       x=3D"1393.7493"
> > +       y=3D"525.6983" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:17.3333=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1399.212"
> > +       y=3D"553.44904"
> > +       id=3D"text78845"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78843"
> > +         x=3D"1399.212"
> > +         y=3D"553.44904">pixel_blend_mode</tspan></text>
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect371322"
> > +       width=3D"177.28049"
> > +       height=3D"38.940468"
> > +       x=3D"1391.6781"
> > +       y=3D"385.61713" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1427.5771"
> > +       y=3D"409.29523"
> > +       id=3D"text78837"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78835"
> > +         x=3D"1427.5771"
> > +         y=3D"409.29523"
> > +         style=3D"font-size:18.6667px">color_range</tspan></text>
> > +    <path
> > +       d=3D"m 1469.6815,1334.9145 c 3.2597,-1.4841 6.4827,-3.0444 9.75=
56,-4.5049 -3.5093,6.1834 -7.0396,12.3483 -10.5778,18.5131 -3.575,-6.178 -7=
=2E1683,-12.3481 -10.7354,-18.5314 3.3569,1.5025 6.685,3.0627 10.0367,4.573=
1 0,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 1467.8882,1256.0056 c 3.2597,-1.4841 6.4827,-3.0443 9.75=
56,-4.5048 -3.5093,6.1833 -7.0396,12.3482 -10.5778,18.5131 -3.575,-6.178 -7=
=2E1683,-12.3482 -10.7354,-18.5315 3.3569,1.5025 6.685,3.0628 10.0367,4.573=
1 0,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7-2"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 1487.6154,441.80981 c 3.2597,-1.48411 6.4827,-3.04435 9.=
7556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.=
17798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.=
0367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-7"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 1489.4088,515.3385 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-22"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 400.8254,264.26491 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-6"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.6188,346.76052 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-1"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.6188,658.80913 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-5"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.6188,732.33782 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-9"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.4121,800.48637 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-4"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.2055,875.80845 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-90"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 400.4121,942.16362 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-91"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 407.9989,1458.6579 c 3.2597,-1.4841 6.4827,-3.0444 9.755=
6,-4.5049 -3.5093,6.1834 -7.0396,12.3483 -10.5778,18.5131 -3.575,-6.178 -7.=
1683,-12.3481 -10.7354,-18.5314 3.3569,1.5025 6.685,3.0627 10.0367,4.5731 0=
,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7-59"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +  </g>
> > +</svg>
> > diff --git a/Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg b=
/Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg
> > new file mode 100644
> > index 000000000000..35f99f6db999
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg
> > @@ -0,0 +1,1528 @@
> > +<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
> > +<!-- Created with Inkscape (https://nam11.safelinks.protection.outlook=
=2Ecom/?url=3Dhttp%3A%2F%2Fwww.inkscape.org%2F&amp;data=3D05%7C01%7Charry.w=
entland%40amd.com%7C11fb474339ba49ad492a08da52439534%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&a=
mp;sdata=3DnC4FE5ttTFICm%2BFhXGDlmGgwcGIZKICf6jrnW6ZZ%2FEI%3D&amp;reserved=
=3D0) -->
> > +
> > +<svg
> > +   version=3D"1.1"
> > +   id=3D"svg2019"
> > +   width=3D"1702"
> > +   height=3D"1845"
> > +   viewBox=3D"0 0 1702 1845"
> > +   sodipodi:docname=3D"dcn3_cm_drm_current.svg"
> > +   inkscape:version=3D"1.1.2 (0a00cf5339, 2022-02-04)"
> > +   xmlns:inkscape=3D"https://nam11.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Fwww.inkscape.org%2Fnamespaces%2Finkscape&amp;data=3D05%7C=
01%7Charry.wentland%40amd.com%7C11fb474339ba49ad492a08da52439534%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C200=
0%7C%7C%7C&amp;sdata=3DRV2BnPZ1Ash3pjMW8pWj%2FG%2FMiWXYfuxgCsaeDIchYOQ%3D&a=
mp;reserved=3D0"
> > +   xmlns:sodipodi=3D"https://nam11.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Fsodipodi.sourceforge.net%2FDTD%2Fsodipodi-0.dtd&amp;data=
=3D05%7C01%7Charry.wentland%40amd.com%7C11fb474339ba49ad492a08da52439534%7C=
3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637912748027800719%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C2000%7C%7C%7C&amp;sdata=3DHMMzEZP%2BCNjxPLjW8R0sK3Q%2FRANhtKg7Q65pQZdW=
Dw8%3D&amp;reserved=3D0"
> > +   xmlns=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
%3A%2F%2Fwww.w3.org%2F2000%2Fsvg&amp;data=3D05%7C01%7Charry.wentland%40amd.=
com%7C11fb474339ba49ad492a08da52439534%7C3dd8961fe4884e608e11a82d994e183d%7=
C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&amp;sdata=3Dvx9=
VHcwk90HcOCQRAFGldDF0qI4teUyzWiojodX3tKc%3D&amp;reserved=3D0"
> > +   xmlns:svg=3D"https://nam11.safelinks.protection.outlook.com/?url=3D=
http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg&amp;data=3D05%7C01%7Charry.wentland%40=
amd.com%7C11fb474339ba49ad492a08da52439534%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C637912748027800719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&amp;sdata=
=3Dvx9VHcwk90HcOCQRAFGldDF0qI4teUyzWiojodX3tKc%3D&amp;reserved=3D0">
> > +  <defs
> > +     id=3D"defs2023" />
> > +  <sodipodi:namedview
> > +     id=3D"namedview2021"
> > +     pagecolor=3D"#ffffff"
> > +     bordercolor=3D"#666666"
> > +     borderopacity=3D"1.0"
> > +     inkscape:pageshadow=3D"2"
> > +     inkscape:pageopacity=3D"0.0"
> > +     inkscape:pagecheckerboard=3D"0"
> > +     showgrid=3D"false"
> > +     inkscape:zoom=3D"0.55760543"
> > +     inkscape:cx=3D"1012.3646"
> > +     inkscape:cy=3D"966.63335"
> > +     inkscape:window-width=3D"1920"
> > +     inkscape:window-height=3D"1131"
> > +     inkscape:window-x=3D"0"
> > +     inkscape:window-y=3D"0"
> > +     inkscape:window-maximized=3D"1"
> > +     inkscape:current-layer=3D"g2025" />
> > +  <g
> > +     inkscape:groupmode=3D"layer"
> > +     inkscape:label=3D"Image"
> > +     id=3D"g2025">
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect34"
> > +       width=3D"208.83351"
> > +       height=3D"486.09872"
> > +       x=3D"0.90158081"
> > +       y=3D"132.77872" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1019"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"188.06937" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1021"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"346.06937" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1103"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"266.06937" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1105"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"426.06937" />
> > +    <rect
> > +       style=3D"fill:#e6e6e6;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1107"
> > +       width=3D"126.38867"
> > +       height=3D"55.320732"
> > +       x=3D"25.960823"
> > +       y=3D"506.06934" />
> > +    <path
> > +       d=3D"m 402.61883,171.88069 c 0.025,10.97895 0.01,1001.03791 0.0=
49,1012.01891 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -=
5.4987,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.4=
751 2.6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-1000.84096=
 -0.031,-1011.72348 0.053,-0.30366 -0.2175,-0.50268 -0.3652,-0.72837 l 1.53=
47,0.39394 z"
> > +       id=3D"path381056"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1131"
> > +       width=3D"239.47592"
> > +       height=3D"1015.9909"
> > +       x=3D"298.65631"
> > +       y=3D"82.399658" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.27861;stroke-opacity:1"
> > +       id=3D"rect1133"
> > +       width=3D"340.44653"
> > +       height=3D"525.77448"
> > +       x=3D"298.79562"
> > +       y=3D"1142.5299" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1237"
> > +       width=3D"284.00113"
> > +       height=3D"945.41412"
> > +       x=3D"827.75012"
> > +       y=3D"82.880798"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1239"
> > +       width=3D"239.37569"
> > +       height=3D"179.03308"
> > +       x=3D"1356.9507"
> > +       y=3D"98.758331" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.00744;stroke-opacity:1"
> > +       id=3D"rect1241"
> > +       width=3D"239.4184"
> > +       height=3D"713.64905"
> > +       x=3D"1356.9543"
> > +       y=3D"307.7951"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1345"
> > +       width=3D"330.32059"
> > +       height=3D"409.44757"
> > +       x=3D"1363.8723"
> > +       y=3D"1147.7572" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1347"
> > +       width=3D"369.8941"
> > +       height=3D"682.32245"
> > +       x=3D"825.72528"
> > +       y=3D"1146.6448"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1349"
> > +       width=3D"163.95746"
> > +       height=3D"40.144867"
> > +       x=3D"1389.9988"
> > +       y=3D"190.80583" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:0.964132;stroke-opacity:1"
> > +       id=3D"rect1619"
> > +       width=3D"271.99091"
> > +       height=3D"42.038273"
> > +       x=3D"1393.981"
> > +       y=3D"1197.161"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <path
> > +       d=3D"m 1469.3028,1238.8328 c 0.025,10.9789 0.01,175.0378 0.049,=
186.0188 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -5.498=
7,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.4751 2=
=2E6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-174.8409 -0.0=
31,-185.7234 0.053,-0.3037 -0.2175,-0.5027 -0.3652,-0.7284 l 1.5347,0.394 z"
> > +       id=3D"path106-1"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <path
> > +       d=3D"m 407.4759,1238.4728 c 0.025,10.9789 0.01,291.0378 0.049,3=
02.0188 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -5.4987=
,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.4751 2.=
6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-290.8409 -0.031,=
-301.7234 0.053,-0.3037 -0.2175,-0.5027 -0.3652,-0.7284 l 1.5347,0.394 z"
> > +       id=3D"path106-1-7"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1623"
> > +       width=3D"137.32646"
> > +       height=3D"41.782684"
> > +       x=3D"1396.3848"
> > +       y=3D"1268.2837"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1705"
> > +       width=3D"137.32646"
> > +       height=3D"41.782684"
> > +       x=3D"1396.3848"
> > +       y=3D"1348.2837" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1707"
> > +       width=3D"137.32646"
> > +       height=3D"41.782684"
> > +       x=3D"1396.3848"
> > +       y=3D"1432.2837" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1731"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"190.42665"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1813"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"254.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1815"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"318.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1817"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"412.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1819"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"560.42664" />
> > +    <rect
> > +       style=3D"fill:#e6e6e6;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1821"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"674.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1823"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"744.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1825"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"820.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1827"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"890.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1829"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"956.42664"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1831"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1256.4268" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1833"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1402.4268" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1915"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1330.4268"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1917"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1478.4268" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1919"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1548.4268" />
> > +    <rect
> > +       style=3D"fill:#eeeeee;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1921"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1614.4268" />
> > +    <rect
> > +       style=3D"fill:#eeeeee;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1923"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1686.4268" />
> > +    <rect
> > +       style=3D"fill:#eeeeee;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1925"
> > +       width=3D"222.34483"
> > +       height=3D"44.64616"
> > +       x=3D"867.36292"
> > +       y=3D"1754.4268" />
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1925-3"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"134.37756" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1954"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"276.37756"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.87333333;stroke-opacity:1;stroke-miterlimit:4;stroke-dasharray:none"
> > +       id=3D"rect1956"
> > +       width=3D"168.66573"
> > +       height=3D"122.14091"
> > +       x=3D"325.50134"
> > +       y=3D"358.6615"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#e6e6e6;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1958"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"672.37756" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect1960"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"744.37756" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.965912;stroke-opacity:1"
> > +       id=3D"rect1962"
> > +       width=3D"169.14041"
> > +       height=3D"54.756817"
> > +       x=3D"325.26404"
> > +       y=3D"814.42413"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.965912;stroke-opacity:1"
> > +       id=3D"rect1964"
> > +       width=3D"169.14041"
> > +       height=3D"54.756817"
> > +       x=3D"325.26404"
> > +       y=3D"886.42413"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.965912;stroke-opacity:1"
> > +       id=3D"rect1966"
> > +       width=3D"169.14041"
> > +       height=3D"54.756817"
> > +       x=3D"325.26404"
> > +       y=3D"952.42413"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect2418"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"510.37756"
> > +       inkscape:connector-avoid=3D"true" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect2422"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"1262.3777" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.981369;stroke-opacity:1"
> > +       id=3D"rect2424"
> > +       width=3D"169.12494"
> > +       height=3D"56.528603"
> > +       x=3D"325.27179"
> > +       y=3D"1322.432" />
> > +    <rect
> > +       style=3D"fill:#d0cee2;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.981369;stroke-opacity:1"
> > +       id=3D"rect2426"
> > +       width=3D"169.12494"
> > +       height=3D"56.528603"
> > +       x=3D"325.27179"
> > +       y=3D"1396.432" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:1.02091;stroke-opacity:1"
> > +       id=3D"rect2428"
> > +       width=3D"169.0854"
> > +       height=3D"61.19017"
> > +       x=3D"325.29156"
> > +       y=3D"1468.4518" />
> > +    <rect
> > +       style=3D"fill:#fad7ac;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.839627;stroke-opacity:1"
> > +       id=3D"rect2430"
> > +       width=3D"169.26669"
> > +       height=3D"41.344128"
> > +       x=3D"325.20093"
> > +       y=3D"1550.3611" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.13491;stroke-opacity:1"
> > +       id=3D"rect2432"
> > +       width=3D"287.86237"
> > +       height=3D"44.416805"
> > +       x=3D"325.34854"
> > +       y=3D"1194.5088" />
> > +    <rect
> > +       style=3D"fill:#000000;fill-opacity:0;stroke:#000000;stroke-widt=
h:1.13102;stroke-opacity:1"
> > +       id=3D"rect2434"
> > +       width=3D"285.86655"
> > +       height=3D"44.4207"
> > +       x=3D"867.34656"
> > +       y=3D"1194.5068" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2509" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2511" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2513" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2515" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2517" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2519" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2521" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2523" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2525" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2527" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2529" />
> > +    <path
> > +       style=3D"fill:none;stroke:#000000;stroke-width:2.66666675;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;s=
troke-dasharray:8.00000024, 8.00000024;stroke-dashoffset:0"
> > +       d=3D"m 867.36292,235.07281 v 0"
> > +       id=3D"path2531" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 409.83425,179.05653 v 33.6932 h 457.52867"
> > +       id=3D"path6876"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1925-3"
> > +       inkscape:connection-end=3D"#rect1731"
> > +       sodipodi:nodetypes=3D"ccc" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.45103,156.71704 h 168.64955 v 161.7096 h 204.26234"
> > +       id=3D"path6878"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1925-3"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 409.83425,321.05653 v 19.69319 h 457.52867"
> > +       id=3D"path7294"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1954"
> > +       inkscape:connection-end=3D"#rect1815"
> > +       sodipodi:nodetypes=3D"ccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.45103,298.71704 H 659.10058 V 434.74972 H 867.36292"
> > +       id=3D"path7296"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-end=3D"#rect1817"
> > +       inkscape:connection-start=3D"#rect1954"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 867.36292,560.42664 H 661.10058 V 480.8024 H 494.16705"
> > +       id=3D"path7720"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 409.83425,594.37756 V 582.74972 H 867.36292"
> > +       id=3D"path7724"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect2420"
> > +       inkscape:connection-end=3D"#rect1819" />
> > +    <rect
> > +       style=3D"fill:#afdde9;fill-opacity:1;stroke:#000000;stroke-widt=
h:0.872749;stroke-opacity:1"
> > +       id=3D"rect2420"
> > +       width=3D"169.23357"
> > +       height=3D"44.678963"
> > +       x=3D"325.21747"
> > +       y=3D"594.37756" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.45103,696.74972 H 867.36292"
> > +       id=3D"path7726"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1958"
> > +       inkscape:connection-end=3D"#rect1821" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 867.36292,766.74972 H 494.45103"
> > +       id=3D"path7728"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1823"
> > +       inkscape:connection-end=3D"#rect1960" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.45105,789.05652 H 657.82418 V 1278.7498 H 867.36292"
> > +       id=3D"path7730"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-end=3D"#rect1831"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.40445,841.80254 h 167.41973 v 0.94718 h 205.53874"
> > +       id=3D"path8140"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1962"
> > +       inkscape:connection-end=3D"#rect1825" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.40445,913.80254 h 167.41973 v -1.05282 h 205.53874"
> > +       id=3D"path8142"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1964"
> > +       inkscape:connection-end=3D"#rect1827" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.40445,979.80254 h 167.41973 v -1.05282 h 205.53874"
> > +       id=3D"path8144"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1966"
> > +       inkscape:connection-end=3D"#rect1829" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.39673,1352.7498 H 867.36292"
> > +       id=3D"path8146"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect2424"
> > +       inkscape:connection-end=3D"#rect1915" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.39673,1424.7498 H 867.36292"
> > +       id=3D"path8148"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect2426"
> > +       inkscape:connection-end=3D"#rect1833" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 494.37697,1500.7498 H 867.36292"
> > +       id=3D"path8150"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect2428"
> > +       inkscape:connection-end=3D"#rect1917" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 494.46762,1570.7498 h 372.8953"
> > +       id=3D"path8152"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect2430"
> > +       inkscape:connection-end=3D"#rect1919" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 1396.3848,1289.175 H 1288.1445 V 582.74972 h -198.4368"
> > +       id=3D"path8154"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1623"
> > +       inkscape:connection-end=3D"#rect1819" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 1396.3848,1369.175 h -112.2403 v -90.4252 h -194.4368"
> > +       id=3D"path8462"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1705"
> > +       inkscape:connection-end=3D"#rect1831"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"m 1089.7077,1500.7498 h 375.3403 v -26.6834"
> > +       id=3D"path8668"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1917"
> > +       inkscape:connection-end=3D"#rect1707" />
> > +    <path
> > +       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-widt=
h:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-da=
sharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 1389.9988,212.74973 H 1089.7077"
> > +       id=3D"path8672"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-start=3D"#rect1349"
> > +       inkscape:connection-end=3D"#rect1731" />
> > +    <path
> > +       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#000=
000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterli=
mit:4;stroke-dasharray:6, 6;stroke-dashoffset:0;stroke-opacity:1"
> > +       d=3D"M 1389.9988,230.9507 H 1223.331 v 109.79902 h -133.6233"
> > +       id=3D"path8674"
> > +       inkscape:connector-type=3D"orthogonal"
> > +       inkscape:connector-curvature=3D"0"
> > +       inkscape:connection-end=3D"#rect1815"
> > +       sodipodi:nodetypes=3D"cccc" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:40px;li=
ne-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:no=
ne"
> > +       x=3D"58.63356"
> > +       y=3D"69.574417"
> > +       id=3D"text28675"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan28673"
> > +         x=3D"58.63356"
> > +         y=3D"69.574417" /></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"56.388252"
> > +       y=3D"221.86568"
> > +       id=3D"text31913"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan31911"
> > +         x=3D"56.388252"
> > +         y=3D"221.86568">Matrix</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"53.441296"
> > +       y=3D"300.866"
> > +       id=3D"text38843"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan38841"
> > +         x=3D"53.441296"
> > +         y=3D"300.866">1D LUT</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"53.441296"
> > +       y=3D"378.866"
> > +       id=3D"text41049"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan41047"
> > +         x=3D"53.441296"
> > +         y=3D"378.866">3D LUT</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"40.831493"
> > +       y=3D"460.87411"
> > +       id=3D"text45037"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan45035"
> > +         x=3D"40.831493"
> > +         y=3D"460.87411"
> > +         style=3D"font-size:18.6667px">Unpacking</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"62.130371"
> > +       y=3D"540.68872"
> > +       id=3D"text49945"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan49943"
> > +         x=3D"62.130371"
> > +         y=3D"540.68872"
> > +         style=3D"font-size:18.6667px">Other</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1423.2806"
> > +       y=3D"128.08769"
> > +       id=3D"text55719"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan55717"
> > +         x=3D"1423.2806"
> > +         y=3D"128.08769"
> > +         style=3D"font-size:18.6667px">drm_framebuffer</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1439.9988"
> > +       y=3D"218.74973"
> > +       id=3D"text62479"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan62477"
> > +         x=3D"1439.9988"
> > +         y=3D"218.74973"
> > +         style=3D"font-size:18.6667px">format</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1475.2806"
> > +       y=3D"340.08771"
> > +       id=3D"text64465"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64463"
> > +         x=3D"1475.2806"
> > +         y=3D"340.08771"
> > +         style=3D"font-size:18.6667px">drm_plane</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1589.2806"
> > +       y=3D"1178.0876"
> > +       id=3D"text64469"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467"
> > +         x=3D"1589.2806"
> > +         y=3D"1178.0876"
> > +         style=3D"font-size:18.6667px">drm_crtc</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"872.23993"
> > +       y=3D"1172.4491"
> > +       id=3D"text64469-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2"
> > +         x=3D"872.23993"
> > +         y=3D"1172.4491"
> > +         style=3D"font-size:18.6667px">Stream</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"328.26071"
> > +       y=3D"1175.6371"
> > +       id=3D"text64469-9-2"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-8"
> > +         x=3D"328.26071"
> > +         y=3D"1175.6371"
> > +         style=3D"font-size:18.6667px">MPC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"330.14737"
> > +       y=3D"114.41869"
> > +       id=3D"text64469-9-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-7"
> > +         x=3D"330.14737"
> > +         y=3D"114.41869"
> > +         style=3D"font-size:18.6667px">DPP</tspan></text>
> > +    <path
> > +       d=3D"m 1488.3608,401.47792 c 0.025,10.97895 0.01,773.03788 0.04=
9,784.01888 2.5462,-1.1592 5.0637,-2.3779 7.6202,-3.5187 -2.7411,4.8298 -5.=
4987,9.6453 -8.2624,14.4607 -2.7925,-4.8257 -5.5993,-9.6453 -8.3856,-14.475=
1 2.6221,1.1736 5.2217,2.3923 7.8398,3.5721 0,-10.8825 -0.035,-772.84093 -0=
=2E031,-783.72345 0.053,-0.30366 -0.2175,-0.50268 -0.3652,-0.72837 l 1.5347=
,0.39394 z"
> > +       id=3D"path106"
> > +       sodipodi:nodetypes=3D"cccccccccc"
> > +       style=3D"stroke-width:0.205176"
> > +       inkscape:transform-center-x=3D"-325.50819"
> > +       inkscape:transform-center-y=3D"-121.97185" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1495.9988"
> > +       y=3D"1224.7498"
> > +       id=3D"text78849"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78847"
> > +         x=3D"1495.9988"
> > +         y=3D"1224.7498"
> > +         style=3D"font-size:18.6667px">Blender</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1417.9988"
> > +       y=3D"1294.7498"
> > +       id=3D"text78853"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78851"
> > +         x=3D"1417.9988"
> > +         y=3D"1294.7498"
> > +         style=3D"font-size:18.6667px">Degamma</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1451.9988"
> > +       y=3D"1376.7498"
> > +       id=3D"text78857"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78855"
> > +         x=3D"1451.9988"
> > +         y=3D"1376.7498"
> > +         style=3D"font-size:18.6667px">CTM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1427.9988"
> > +       y=3D"1458.7498"
> > +       id=3D"text78861"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78859"
> > +         x=3D"1427.9988"
> > +         y=3D"1458.7498"
> > +         style=3D"font-size:18.6667px">Gamma</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"949.99878"
> > +       y=3D"218.74973"
> > +       id=3D"text104653"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104651"
> > +         x=3D"949.99878"
> > +         y=3D"218.74973"
> > +         style=3D"font-size:18.6667px">format</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"911.99878"
> > +       y=3D"284.74973"
> > +       id=3D"text104657"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104655"
> > +         x=3D"911.99878"
> > +         y=3D"284.74973"
> > +         style=3D"font-size:18.6667px">bias_and_scale</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"887.99878"
> > +       y=3D"346.74973"
> > +       id=3D"text104661"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104659"
> > +         x=3D"887.99878"
> > +         y=3D"346.74973"
> > +         style=3D"font-size:18.6667px">color space matrix</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"871.99878"
> > +       y=3D"442.74973"
> > +       id=3D"text104665"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan104663"
> > +         x=3D"871.99878"
> > +         y=3D"442.74973"
> > +         style=3D"font-size:18.6667px">input_csc_color_matrix</tspan><=
/text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"905.99878"
> > +       y=3D"586.74976"
> > +       id=3D"text125075"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan125073"
> > +         x=3D"905.99878"
> > +         y=3D"586.74976"
> > +         style=3D"font-size:18.6667px">in_transfer_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"945.0083"
> > +       y=3D"702.85938"
> > +       id=3D"text117309"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307"
> > +         x=3D"945.0083"
> > +         y=3D"702.85938"
> > +         style=3D"font-size:18.6667px">hdr_mult</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"874.5556"
> > +       y=3D"773.42615"
> > +       id=3D"text117309-6"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-7"
> > +         x=3D"874.5556"
> > +         y=3D"773.42615"
> > +         style=3D"font-size:18.6667px">gamut_remap_matrix</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"913.72528"
> > +       y=3D"846.55896"
> > +       id=3D"text117309-5"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-3"
> > +         x=3D"913.72528"
> > +         y=3D"846.55896"
> > +         style=3D"font-size:18.6667px">in_shaper_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"937.72528"
> > +       y=3D"918.25787"
> > +       id=3D"text117309-56"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-2"
> > +         x=3D"937.72528"
> > +         y=3D"918.25787"
> > +         style=3D"font-size:18.6667px">lut3d_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"945.9895"
> > +       y=3D"986.10767"
> > +       id=3D"text117309-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan117307-1"
> > +         x=3D"945.9895"
> > +         y=3D"986.10767"
> > +         style=3D"font-size:18.6667px">blend_tf</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"975.91803"
> > +       y=3D"1224.5564"
> > +       id=3D"text137434"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432"
> > +         x=3D"975.91803"
> > +         y=3D"1224.5564"
> > +         style=3D"font-size:18.6667px">Blender</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"879.31372"
> > +       y=3D"1283.4249"
> > +       id=3D"text137434-2"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-7"
> > +         x=3D"879.31372"
> > +         y=3D"1283.4249"
> > +         style=3D"font-size:18.6667px">gamut_remap_matrix</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"925.31372"
> > +       y=3D"1359.2747"
> > +       id=3D"text137434-0"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-9"
> > +         x=3D"925.31372"
> > +         y=3D"1359.2747"
> > +         style=3D"font-size:18.6667px">func_shaper</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"930.33252"
> > +       y=3D"1430.2566"
> > +       id=3D"text137434-3"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-6"
> > +         x=3D"930.33252"
> > +         y=3D"1430.2566"
> > +         style=3D"font-size:18.6667px">lut3d_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"900.18158"
> > +       y=3D"1504.6725"
> > +       id=3D"text137434-06"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-2"
> > +         x=3D"900.18158"
> > +         y=3D"1504.6725"
> > +         style=3D"font-size:18.6667px">out_transfer_func</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"904.0307"
> > +       y=3D"1575.8053"
> > +       id=3D"text137434-6"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-1"
> > +         x=3D"904.0307"
> > +         y=3D"1575.8053"
> > +         style=3D"font-size:18.6667px">csc_color_matrix</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"903.16278"
> > +       y=3D"1642.1078"
> > +       id=3D"text137434-8"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-79"
> > +         x=3D"903.16278"
> > +         y=3D"1642.1078"
> > +         style=3D"font-size:18.6667px">bit_depth_param</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"939.31372"
> > +       y=3D"1713.8068"
> > +       id=3D"text137434-20"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-23"
> > +         x=3D"939.31372"
> > +         y=3D"1713.8068"
> > +         style=3D"font-size:18.6667px">clamping</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"894.0307"
> > +       y=3D"1782.5244"
> > +       id=3D"text137434-7"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan137432-5"
> > +         x=3D"894.0307"
> > +         y=3D"1782.5244"
> > +         style=3D"font-size:18.6667px">output_color_space</tspan></tex=
t>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"869.63062"
> > +       y=3D"117.7968"
> > +       id=3D"text176429"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427"
> > +         x=3D"869.63062"
> > +         y=3D"117.7968"
> > +         style=3D"font-size:18.6667px">Plane</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"27.605465"
> > +       y=3D"162.20587"
> > +       id=3D"text176429-2"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-0"
> > +         x=3D"27.605465"
> > +         y=3D"162.20587"
> > +         style=3D"font-size:18.6667px">Legend</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"298.63959"
> > +       y=3D"59.293999"
> > +       id=3D"text176429-9"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-2"
> > +         x=3D"298.63959"
> > +         y=3D"59.293999"
> > +         style=3D"font-size:18.6667px">DCN 3.0</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"826.65735"
> > +       y=3D"59.458061"
> > +       id=3D"text176429-66"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-4"
> > +         x=3D"826.65735"
> > +         y=3D"59.458061"
> > +         style=3D"font-size:18.6667px">DC Interface</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1362.9948"
> > +       y=3D"59.458061"
> > +       id=3D"text176429-95"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan176427-04"
> > +         x=3D"1362.9948"
> > +         y=3D"59.458061"
> > +         style=3D"font-size:18.6667px">DRM Interface</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:40px;li=
ne-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:no=
ne"
> > +       x=3D"867.34656"
> > +       y=3D"1194.5068"
> > +       id=3D"text184728"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan184726"
> > +         x=3D"867.34656"
> > +         y=3D"1194.5068" /></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"389.01593"
> > +       y=3D"159.8909"
> > +       id=3D"text64469-9-3"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-6"
> > +         x=3D"389.01593"
> > +         y=3D"159.8909"
> > +         style=3D"font-size:18.6667px">CNVC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"365.88379"
> > +       y=3D"303.59048"
> > +       id=3D"text64469-9-1"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-2"
> > +         x=3D"365.88379"
> > +         y=3D"303.59048"
> > +         style=3D"font-size:18.6667px">Input CSC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"413.06488"
> > +       y=3D"390.95001"
> > +       id=3D"text64469-9-93"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-1"
> > +         x=3D"413.06488"
> > +         y=3D"390.95001"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">DeGamma</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"413.06488"
> > +         y=3D"414.28339"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan233797">ROM</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"413.06488"
> > +         y=3D"437.61676"
> > +         style=3D"font-size:10.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan233799">(sRGB, BT2020, Gamma 2.2,</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"413.06488"
> > +         y=3D"460.95013"
> > +         style=3D"font-size:10.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan242597">PQ, HLG)</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"372.44986"
> > +       y=3D"538.83807"
> > +       id=3D"text64469-9-94"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-78"
> > +         x=3D"372.44986"
> > +         y=3D"538.83807"
> > +         style=3D"font-size:18.6667px">Post CSC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:16px;li=
ne-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:no=
ne"
> > +       x=3D"335.31775"
> > +       y=3D"622.23511"
> > +       id=3D"text64469-9-4"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-5"
> > +         x=3D"335.31775"
> > +         y=3D"622.23511"
> > +         style=3D"font-size:16px">Gamma Correction</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"351.16684"
> > +       y=3D"700.34918"
> > +       id=3D"text64469-9-0"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-3"
> > +         x=3D"351.16684"
> > +         y=3D"700.34918"
> > +         style=3D"font-size:18.6667px">HDR Multiply</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"345.16684"
> > +       y=3D"771.33112"
> > +       id=3D"text64469-9-6"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-10"
> > +         x=3D"345.16684"
> > +         y=3D"771.33112"
> > +         style=3D"font-size:18.6667px">Gamut Remap</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"412.5184"
> > +       y=3D"836.04877"
> > +       id=3D"text64469-9-63"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-20"
> > +         x=3D"412.5184"
> > +         y=3D"836.04877"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">Shaper LUT</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"412.5184"
> > +         y=3D"859.38214"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan222533">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"413.54086"
> > +       y=3D"908.61554"
> > +       id=3D"text64469-9-61"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-55"
> > +         x=3D"413.54086"
> > +         y=3D"908.61554"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">3D LUT</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"413.54086"
> > +         y=3D"931.94891"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan221121">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"344.0347"
> > +       y=3D"985.33319"
> > +       id=3D"text64469-9-47"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-65"
> > +         x=3D"344.0347"
> > +         y=3D"985.33319"
> > +         style=3D"font-size:18.6667px">Blend Gamma</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"433.84625"
> > +       y=3D"1223.411"
> > +       id=3D"text64469-9-69"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-37"
> > +         x=3D"433.84625"
> > +         y=3D"1223.411"
> > +         style=3D"font-size:18.6667px">Blender</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"343.73291"
> > +       y=3D"1290.2421"
> > +       id=3D"text64469-9-45"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-25"
> > +         x=3D"343.73291"
> > +         y=3D"1290.2421"
> > +         style=3D"font-size:18.6667px">Gamut Remap</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"408.74442"
> > +       y=3D"1344.2428"
> > +       id=3D"text64469-9-474"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-4"
> > +         x=3D"408.74442"
> > +         y=3D"1344.2428"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">Shaper LUT</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"408.74442"
> > +         y=3D"1367.5762"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan208303">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"407.1257"
> > +       y=3D"1420.2435"
> > +       id=3D"text64469-9-30"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-786"
> > +         x=3D"407.1257"
> > +         y=3D"1420.2435"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">3D LUT</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"407.1257"
> > +         y=3D"1443.5769"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan204749">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"408.64996"
> > +       y=3D"1492.8102"
> > +       id=3D"text64469-9-8"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-84"
> > +         x=3D"408.64996"
> > +         y=3D"1492.8102"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle">Gamma</tspan><tspan
> > +         sodipodi:role=3D"line"
> > +         x=3D"408.64996"
> > +         y=3D"1516.1436"
> > +         style=3D"font-size:18.6667px;text-align:center;text-anchor:mi=
ddle"
> > +         id=3D"tspan197733">RAM</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"385.46863"
> > +       y=3D"1575.2261"
> > +       id=3D"text64469-9-31"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan64467-2-49"
> > +         x=3D"385.46863"
> > +         y=3D"1575.2261"
> > +         style=3D"font-size:18.6667px">OCSC</tspan></text>
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:40px;li=
ne-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:no=
ne"
> > +       x=3D"1356.5106"
> > +       y=3D"53.140579"
> > +       id=3D"text273287"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan273285"
> > +         x=3D"1356.5106"
> > +         y=3D"53.140579" /></text>
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1411"
> > +       width=3D"177.28049"
> > +       height=3D"38.940468"
> > +       x=3D"1392.2576"
> > +       y=3D"459.24118" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1411.7203"
> > +       y=3D"485.93231"
> > +       id=3D"text78841"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78839"
> > +         x=3D"1411.7203"
> > +         y=3D"485.93231"
> > +         style=3D"font-size:18.6667px">color_encoding</tspan></text>
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect1515"
> > +       width=3D"175.11876"
> > +       height=3D"43.239407"
> > +       x=3D"1393.7493"
> > +       y=3D"525.6983" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:17.3333=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1399.212"
> > +       y=3D"553.44904"
> > +       id=3D"text78845"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78843"
> > +         x=3D"1399.212"
> > +         y=3D"553.44904">pixel_blend_mode</tspan></text>
> > +    <rect
> > +       style=3D"fill:#f9f7ed;fill-opacity:1;stroke:#000000;stroke-opac=
ity:1"
> > +       id=3D"rect371322"
> > +       width=3D"177.28049"
> > +       height=3D"38.940468"
> > +       x=3D"1391.6781"
> > +       y=3D"385.61713" />
> > +    <text
> > +       xml:space=3D"preserve"
> > +       style=3D"font-style:normal;font-weight:normal;font-size:18.6667=
px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stro=
ke:none"
> > +       x=3D"1427.5771"
> > +       y=3D"409.29523"
> > +       id=3D"text78837"><tspan
> > +         sodipodi:role=3D"line"
> > +         id=3D"tspan78835"
> > +         x=3D"1427.5771"
> > +         y=3D"409.29523"
> > +         style=3D"font-size:18.6667px">color_range</tspan></text>
> > +    <path
> > +       d=3D"m 1469.6815,1334.9145 c 3.2597,-1.4841 6.4827,-3.0444 9.75=
56,-4.5049 -3.5093,6.1834 -7.0396,12.3483 -10.5778,18.5131 -3.575,-6.178 -7=
=2E1683,-12.3481 -10.7354,-18.5314 3.3569,1.5025 6.685,3.0627 10.0367,4.573=
1 0,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 1467.8882,1256.0056 c 3.2597,-1.4841 6.4827,-3.0443 9.75=
56,-4.5048 -3.5093,6.1833 -7.0396,12.3482 -10.5778,18.5131 -3.575,-6.178 -7=
=2E1683,-12.3482 -10.7354,-18.5315 3.3569,1.5025 6.685,3.0628 10.0367,4.573=
1 0,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7-2"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 1487.6154,441.80981 c 3.2597,-1.48411 6.4827,-3.04435 9.=
7556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.=
17798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.=
0367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-7"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 1489.4088,515.3385 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-22"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 400.8254,264.26491 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-6"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.6188,346.76052 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-1"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 404.2055,500.78482 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-0"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.6188,581.69367 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-61"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.6188,658.80913 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-5"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.6188,732.33782 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-9"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.4121,800.48637 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-4"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 402.2055,875.80845 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-90"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 400.4121,942.16362 c 3.2597,-1.48411 6.4827,-3.04435 9.7=
556,-4.50482 -3.5093,6.18331 -7.0396,12.34823 -10.5778,18.51307 -3.575,-6.1=
7798 -7.1683,-12.34815 -10.7354,-18.53146 3.3569,1.50251 6.685,3.06275 10.0=
367,4.57314 0,0 0,0 1.5209,-0.0499 z"
> > +       id=3D"path371636-7-91"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 407.9989,1311.6005 c 3.2597,-1.4841 6.4827,-3.0444 9.755=
6,-4.5048 -3.5093,6.1833 -7.0396,12.3482 -10.5778,18.513 -3.575,-6.1779 -7.=
1683,-12.3481 -10.7354,-18.5314 3.3569,1.5025 6.685,3.0627 10.0367,4.5731 0=
,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7-77"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 407.9989,1381.5424 c 3.2597,-1.4841 6.4827,-3.0443 9.755=
6,-4.5048 -3.5093,6.1833 -7.0396,12.3482 -10.5778,18.5131 -3.575,-6.178 -7.=
1683,-12.3482 -10.7354,-18.5315 3.3569,1.5025 6.685,3.0627 10.0367,4.5731 0=
,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7-11"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +    <path
> > +       d=3D"m 407.9989,1458.6579 c 3.2597,-1.4841 6.4827,-3.0444 9.755=
6,-4.5049 -3.5093,6.1834 -7.0396,12.3483 -10.5778,18.5131 -3.575,-6.178 -7.=
1683,-12.3481 -10.7354,-18.5314 3.3569,1.5025 6.685,3.0627 10.0367,4.5731 0=
,0 0,0 1.5209,-0.05 z"
> > +       id=3D"path371636-7-59"
> > +       sodipodi:nodetypes=3D"cccccc"
> > +       style=3D"stroke-width:0.262672"
> > +       inkscape:transform-center-x=3D"-416.72543"
> > +       inkscape:transform-center-y=3D"-156.15191" />
> > +  </g>
> > +</svg>
> > diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Doc=
umentation/gpu/amdgpu/display/display-manager.rst
> > index b1b0f11aed83..8960a5f1fa66 100644
> > --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> > +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> > @@ -49,3 +49,38 @@ Color Management Properties
> > =20
> >  .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >     :internal:
> > +
> > +
> > +DC Color Capabilities between DCN generations
> > +---------------------------------------------
> > +
> > +DRM/KMS framework defines three CRTC color correction properties: dega=
mma,
> > +color transformation matrix (ctm) and gamma, and two properties for de=
gamma and
> > +gamma lut sizes. AMD DC programs some of the color correction features
> > +pre-blending but DRM/KMS has not per-plane color correction properties.
> > +
> > +What's possible to do before and after blending has changed quite a bi=
t between
> > +DCN generations as it depends on hardware color capabilities. DPP and =
MPC color
> > +correction caps are described below.
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/dc.h
> > +   :doc: color-management-caps
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/dc.h
> > +   :internal:
> > +
> > +In general, the DRM three properties are programed to DC, as follows: =
CRTC
> > +gamma after blending, and CRTC degamma pre-blending. Although CTM is p=
rogrammed
> > +after blending, it is mapped to DPP hw blocks (pre-blending). Other co=
lor caps
> > +available in the hw is not currently exposed by DRM interface and are =
by
> > +passed.  To illustrate DCN generation capabilities and differences bet=
ween
> > +them, you can compare the color management schemas for DCN 2.0 and DCN=
 3.0
> > +families below.
> > +
> > +**DCN 2.0 family color caps and mapping**
> > +
> > +.. kernel-figure:: dcn2_cm_drm_current.svg
> > +
> > +**DCN 3.0 family color caps and mapping**
> > +
> > +.. kernel-figure:: dcn3_cm_drm_current.svg
> > diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/=
display/dc/dc.h
> > index 76db013aac6e..5729de58a356 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> > @@ -118,7 +118,26 @@ struct dc_plane_cap {
> >  	uint32_t min_height;
> >  };
> > =20
> > -// Color management caps (DPP and MPC)
> > +/**
> > + * DOC: color-management-caps
> > + *
> > + * **Color management caps (DPP and MPC)**
> > + *
> > + * Modules/color calculates various colour operations which are transl=
ated to
> > + * abstracted HW. DCE 5-12 had almost no important changes, but starti=
ng with
> > + * DCN1, every new generation comes with fairly major differences in c=
olor
> > + * pipeline. Therefore, we abstract color pipe capabilities so modules=
/DM can
> > + * decide mapping to HW block based on logical capabilities.
> > + */
> > +
> > +/**
> > + * struct rom_curve_caps - predefined transfer function caps for degam=
ma and regamma
> > + * @srgb: RGB color space transfer func
> > + * @bt2020: BT.2020 transfer func
> > + * @gamma2_2: standard gamma
> > + * @pq: perceptual quantizer transfer function
> > + * @hlg: hybrid log=E2=80=93gamma transfer function
> > + */
> >  struct rom_curve_caps {
> >  	uint16_t srgb : 1;
> >  	uint16_t bt2020 : 1;
> > @@ -127,6 +146,24 @@ struct rom_curve_caps {
> >  	uint16_t hlg : 1;
> >  };
> > =20
> > +/**
> > + * struct dpp_color_caps - color pipeline capabilities for display pip=
e and plane blocks
> > + *
> > + * @dcn_arch: all DCE generations treated the same
>=20
> You seem to copy-paste comments from the struct into the kernel-doc.
> In that case please delete the original comment to avoid duplication
> (and therefore confusion once someone changes things).
>=20
> > + * @input_lut_shared: shared with DGAM. Input lut is different than mo=
st LUTs,
> > + * just plain 256-entry lookup
> > + * @icsc: input color space convertion
>=20
> /s/convertion/conversion
>=20
> Same on the next line.
>

Thanks for reviewing both documentation patches. I'll separate them from
this 3D LUT series, apply your suggestions and send it soon.

Melissa

> Harry
>=20
> > + * @post_csc: post color space convertion, before gamut remap
> > + * @gamma_corr: degamma correction
> > + * @hw_3d_lut: 3d lut support. It implies a shaper LUT before, it may =
be shared
> > + * with MPC by setting mpc:shared_3d_lut flag
> > + * @ogam_ram: blend gamma
> > + * @ocsc: output color space convertion
> > + * @dgam_rom_caps: caps for degamma
> > + * @ogam_rom_caps: caps for regamma 1D lut
> > + *
> > + * Note: hdr_mult and gamut remap (ctm) are always available in DPP (i=
n that order)
> > + */
> >  struct dpp_color_caps {
> >  	uint16_t dcn_arch : 1; // all DCE generations treated the same
> >  	// input lut is different than most LUTs, just plain 256-entry lookup
> > @@ -147,6 +184,15 @@ struct dpp_color_caps {
> >  	struct rom_curve_caps ogam_rom_caps;
> >  };
> > =20
> > +/**
> > + * struct mpc_color_caps - color pipeline capabilities for multiple pi=
pe and plane combined blocks
> > + *
> > + * @gamut_remap: color transformation matrix
> > + * @ocsc: output color space convertion matrix
> > + * @num_3dluts: 3d lut, always assumes a preceding shaper LUT
> > + * @shared_3d_lut: shared 3d lut flag, can be either DPP or MPC, but s=
ingle instance
> > + * @ogam_rom_caps: caps for regama 1d lut
> > + */
> >  struct mpc_color_caps {
> >  	uint16_t gamut_remap : 1;
> >  	uint16_t ogam_ram : 1;
> > @@ -157,6 +203,11 @@ struct mpc_color_caps {
> >  	struct rom_curve_caps ogam_rom_caps;
> >  };
> > =20
> > +/**
> > + * struct dc_color_caps - color pipes capabilities for DPP and MPC hw =
blocks
> > + * @dpp: color pipes caps for DPP
> > + * @mpc: color pipes caps for MPC
> > + */
> >  struct dc_color_caps {
> >  	struct dpp_color_caps dpp;
> >  	struct mpc_color_caps mpc;

--dsitkthnyym4dxxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLNjccACgkQwqF3j0dL
ehzJVBAAj49BNqzHsiJMISMxZmBgVkF+ZjjJmajeRTWwYNN7HVCLCo9kRSPeuws1
f4I3JGNUBzhNPJ5efAcis+xWka4eD6zSqWuqECeN+0Dr7FXkgSgjx6MHONcgw40I
xQA/AN+dq+cPWEvu9x4/Jyp4socalC8lXTrAl2nmNsg7aTaT/sdi+RnZK15eO3uw
D485IcUBFH8hbj/w27H6h0tbGCRbdUbsVOShLTkSjOYZcmtf0L8o7wBohxYf3hJ2
EglQZxrK8FQGXC7sJAw1dYeqMHTEM9oseK0/EieZ8mFuECgqNJnZI0z7WHWVktZ0
kILoyx8E9TXTYwrGSZ7i6ZbyekrKNPCNUywZE2diuNXr4+jDoYiLigboZTs2jFSv
T7EKBmJcqH/8K368Yc4gcNFBRnlYa9G/OjEhnDArJyLfURInoog+uoO1iG5t8avC
9MdWuR3D3DXQohQ7ZRnL7mQ6QKbTWK2gFU2z500EMTgo0ghddXh8e+7W8ABd3k3N
tMQYc9i4g/z9qCWJCQArZGMWfl52SoUCbHIOAfw+dFOCoFyJhIoQJEK8aX4v7Q4S
iq76V8rQZeWDAeJQi/4LE+nqqMP1q2Zq6DKjrdm7mjxvboazJ2bFIqp4NuB9HTFI
dkC6CaGPd7PKVrW6d2ifrs7bffrYsU/9Bj34VlEsaAEMpjtOgj0=
=JvY1
-----END PGP SIGNATURE-----

--dsitkthnyym4dxxu--
