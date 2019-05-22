Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B6266D5
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF4689A4E;
	Wed, 22 May 2019 15:23:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800052.outbound.protection.outlook.com [40.107.80.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4562989A4E
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:23:54 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1651.namprd12.prod.outlook.com (10.172.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Wed, 22 May 2019 15:23:52 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1900.020; Wed, 22 May
 2019 15:23:52 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/display: Use new connector state when getting
 color depth
Thread-Topic: [PATCH 2/2] drm/amd/display: Use new connector state when
 getting color depth
Thread-Index: AQHVELC1TsaDRPTYR0yTyrlqIDQyYqZ3Q0Lq
Date: Wed, 22 May 2019 15:23:52 +0000
Message-ID: <BN6PR12MB1809C8BC406BE615527D6362F7000@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190522151116.22916-1-nicholas.kazlauskas@amd.com>,
 <20190522151116.22916-2-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190522151116.22916-2-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.72.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3983a7ca-bf6a-4815-4092-08d6dec97f4c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1651; 
x-ms-traffictypediagnostic: BN6PR12MB1651:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1651265788032E5CB1F6A3CDF7000@BN6PR12MB1651.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(199004)(74316002)(26005)(256004)(186003)(66476007)(236005)(52536014)(66556008)(5660300002)(73956011)(66946007)(25786009)(66446008)(64756008)(76116006)(6436002)(316002)(14444005)(81166006)(81156014)(8676002)(68736007)(66066001)(4326008)(476003)(446003)(11346002)(105004)(486006)(55016002)(54896002)(9686003)(6306002)(33656002)(102836004)(6506007)(76176011)(53546011)(8936002)(3846002)(229853002)(7736002)(2906002)(86362001)(6116002)(19627405001)(2501003)(6246003)(110136005)(54906003)(606006)(99286004)(71190400001)(53936002)(14454004)(7696005)(478600001)(71200400001)(966005)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1651;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 886vnHwV0ZlKFycCpAsHvthxkr+SFsMO3dgN76qkJ+lnJQx7QLlsHuwQ8akDg0kN7q4EKJqqdZ0zWqgWa+bvUno5jXhsu2c+Y41NmA2koPlgoELc/qpw3ybZ0JfqMI+MwrtziZHMYI1h8PG0tO5zg+NiaLqdCTzGSZ0to6uiSlXoQGBGp2iP/pCuZDqWkrYXHFg7vocdXLBXVFAs3LCKs2pQji8JXCT+vG1RM/UoaTbdHinScwW+FBM0dsqum5AGih09vDKIswzFiEv7r6NP9LWZNAi7lfRbZe9VWGvDhYWkxy/2G7fATBcpePGg8ZyE5R/47xFI3byH7w9U7lc0JmiP9kzQ/8EMuxAo6CEqogvxFd69uvkc66L7oNsKNvMatXiJecIgtht7v68KhZV5rwWAmkLmwxfT5FOpbE3TFT4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3983a7ca-bf6a-4815-4092-08d6dec97f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:23:52.3398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0heEO7dEk65hJIqp/6eihVlJJhXrwDA6gUkvWiA2BDo=;
 b=JNL8JF57TyHa5eVfL1D4xE3Tu2Tr+HnG6loSUXrSq+WwtVfH1WFJOr5mJ7lbiYbZbCLaMJA+6Wn0yVutBIjjLJs7YQwbcMXVjwJX6l29eNlZTLI0ZKoOaVwdpmFHOeeesJXaDbFjrHZyufaKuuDaWQUTPfiSZr5GEoEwJxNMxo0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: multipart/mixed; boundary="===============0904119368=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0904119368==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809C8BC406BE615527D6362F7000BN6PR12MB1809namp_"

--_000_BN6PR12MB1809C8BC406BE615527D6362F7000BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: Wednesday, May 22, 2019 11:11 AM
To: amd-gfx@lists.freedesktop.org
Cc: Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas
Subject: [PATCH 2/2] drm/amd/display: Use new connector state when getting =
color depth

[CAUTION: External Email]

[Why]
The current state on the connector is queried when getting the max bpc
rather than the new state. This means that a new max bpc value can only
currently take effect on the commit *after* it changes.

The new state should be passed in instead.

[How]
Pass down the dm_state as drm state to where we do color depth lookup.

The passed in state can still be NULL when called from
amdgpu_dm_connector_mode_valid, so make sure that we have reasonable
defaults in place. That should probably be addressed at some point.

This change now (correctly) causes a modeset to occur when changing the
max bpc for a connector.

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a7a9e4d81a17..580c324891fd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3038,13 +3038,14 @@ static void update_stream_scaling_settings(const st=
ruct drm_display_mode *mode,
 }

 static enum dc_color_depth
-convert_color_depth_from_display_info(const struct drm_connector *connecto=
r)
+convert_color_depth_from_display_info(const struct drm_connector *connecto=
r,
+                                     const struct drm_connector_state *sta=
te)
 {
        uint32_t bpc =3D 8;

        /* TODO: Use passed in state instead of the current state. */
-       if (connector->state) {
-               bpc =3D connector->state->max_bpc;
+       if (state) {
+               bpc =3D state->max_bpc;
                /* Round down to the nearest even number. */
                bpc =3D bpc - (bpc & 1);
        }
@@ -3165,11 +3166,12 @@ static void adjust_colour_depth_from_display_info(s=
truct dc_crtc_timing *timing_

 }

-static void
-fill_stream_properties_from_drm_display_mode(struct dc_stream_state *strea=
m,
-                                            const struct drm_display_mode =
*mode_in,
-                                            const struct drm_connector *co=
nnector,
-                                            const struct dc_stream_state *=
old_stream)
+static void fill_stream_properties_from_drm_display_mode(
+       struct dc_stream_state *stream,
+       const struct drm_display_mode *mode_in,
+       const struct drm_connector *connector,
+       const struct drm_connector_state *connector_state,
+       const struct dc_stream_state *old_stream)
 {
        struct dc_crtc_timing *timing_out =3D &stream->timing;
        const struct drm_display_info *info =3D &connector->display_info;
@@ -3192,7 +3194,7 @@ fill_stream_properties_from_drm_display_mode(struct d=
c_stream_state *stream,

        timing_out->timing_3d_format =3D TIMING_3D_FORMAT_NONE;
        timing_out->display_color_depth =3D convert_color_depth_from_displa=
y_info(
-                       connector);
+               connector, connector_state);
        timing_out->scan_type =3D SCANNING_TYPE_NODATA;
        timing_out->hdmi_vic =3D 0;

@@ -3389,6 +3391,8 @@ create_stream_for_sink(struct amdgpu_dm_connector *ac=
onnector,
 {
        struct drm_display_mode *preferred_mode =3D NULL;
        struct drm_connector *drm_connector;
+       const struct drm_connector_state *con_state =3D
+               dm_state ? &dm_state->base : NULL;
        struct dc_stream_state *stream =3D NULL;
        struct drm_display_mode mode =3D *drm_mode;
        bool native_mode_found =3D false;
@@ -3461,10 +3465,10 @@ create_stream_for_sink(struct amdgpu_dm_connector *=
aconnector,
        */
        if (!scale || mode_refresh !=3D preferred_refresh)
                fill_stream_properties_from_drm_display_mode(stream,
-                       &mode, &aconnector->base, NULL);
+                       &mode, &aconnector->base, con_state, NULL);
        else
                fill_stream_properties_from_drm_display_mode(stream,
-                       &mode, &aconnector->base, old_stream);
+                       &mode, &aconnector->base, con_state, old_stream);

        update_stream_scaling_settings(&mode, dm_state, stream);

--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809C8BC406BE615527D6362F7000BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nicho=
las.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> Wednesday, May 22, 2019 11:11 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/display: Use new connector state when g=
etting color depth</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
[Why]<br>
The current state on the connector is queried when getting the max bpc<br>
rather than the new state. This means that a new max bpc value can only<br>
currently take effect on the commit *after* it changes.<br>
<br>
The new state should be passed in instead.<br>
<br>
[How]<br>
Pass down the dm_state as drm state to where we do color depth lookup.<br>
<br>
The passed in state can still be NULL when called from<br>
amdgpu_dm_connector_mode_valid, so make sure that we have reasonable<br>
defaults in place. That should probably be addressed at some point.<br>
<br>
This change now (correctly) causes a modeset to occur when changing the<br>
max bpc for a connector.<br>
<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------<br>
&nbsp;1 file changed, 15 insertions(&#43;), 11 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index a7a9e4d81a17..580c324891fd 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -3038,13 &#43;3038,14 @@ static void update_stream_scaling_settings(cons=
t struct drm_display_mode *mode,<br>
&nbsp;}<br>
<br>
&nbsp;static enum dc_color_depth<br>
-convert_color_depth_from_display_info(const struct drm_connector *connecto=
r)<br>
&#43;convert_color_depth_from_display_info(const struct drm_connector *conn=
ector,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; con=
st struct drm_connector_state *state)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t bpc =3D 8;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* TODO: Use passed in state ins=
tead of the current state. */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (connector-&gt;state) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bpc =3D connector-&gt;state-&gt;max_bpc;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (state) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; bpc =3D state-&gt;max_bpc;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* Round down to the nearest even number. */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; bpc =3D bpc - (bpc &amp; 1);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
@@ -3165,11 &#43;3166,12 @@ static void adjust_colour_depth_from_display_in=
fo(struct dc_crtc_timing *timing_<br>
<br>
&nbsp;}<br>
<br>
-static void<br>
-fill_stream_properties_from_drm_display_mode(struct dc_stream_state *strea=
m,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_display_mode *mode_in,<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_connector *connector,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct dc_stream_state *old_stream=
)<br>
&#43;static void fill_stream_properties_from_drm_display_mode(<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_stream_state *stream,<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_display_mode *mo=
de_in,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_connector *conne=
ctor,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_connector_state =
*connector_state,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct dc_stream_state *old=
_stream)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_crtc_timing *timing_ou=
t =3D &amp;stream-&gt;timing;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_display_info *i=
nfo =3D &amp;connector-&gt;display_info;<br>
@@ -3192,7 &#43;3194,7 @@ fill_stream_properties_from_drm_display_mode(stru=
ct dc_stream_state *stream,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing_out-&gt;timing_3d_format =
=3D TIMING_3D_FORMAT_NONE;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing_out-&gt;display_color_dep=
th =3D convert_color_depth_from_display_info(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; connector, connector_state);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing_out-&gt;scan_type =3D SCA=
NNING_TYPE_NODATA;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing_out-&gt;hdmi_vic =3D 0;<b=
r>
<br>
@@ -3389,6 &#43;3391,8 @@ create_stream_for_sink(struct amdgpu_dm_connector=
 *aconnector,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_display_mode *preferr=
ed_mode =3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *drm_connec=
tor;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_connector_state =
*con_state =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; dm_state ? &amp;dm_state-&gt;base : NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_stream_state *stream =
=3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_display_mode mode =3D=
 *drm_mode;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool native_mode_found =3D false=
;<br>
@@ -3461,10 &#43;3465,10 @@ create_stream_for_sink(struct amdgpu_dm_connect=
or *aconnector,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!scale || mode_refresh !=3D =
preferred_refresh)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; fill_stream_properties_from_drm_display_mode(stream,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;mode, &amp;=
aconnector-&gt;base, NULL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;mode, &=
amp;aconnector-&gt;base, con_state, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; fill_stream_properties_from_drm_display_mode(stream,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;mode, &amp;=
aconnector-&gt;base, old_stream);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;mode, &=
amp;aconnector-&gt;base, con_state, old_stream);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_stream_scaling_settings(&=
amp;mode, dm_state, stream);<br>
<br>
--<br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809C8BC406BE615527D6362F7000BN6PR12MB1809namp_--

--===============0904119368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0904119368==--
