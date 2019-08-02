Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98A7FD73
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 17:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34F36EEB3;
	Fri,  2 Aug 2019 15:24:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B1E6EEB3
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 15:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpJv8TsMjcvQS6bHd23rngRWRtFFPM0QMJvpr/w6QiR/3ZdUPYwEiaV//Eiv5VP6gZkHE+NG8dKLy74EY0kyLQipjHJ3xL6EKw3DbAy/T7cAInIVvr4qq3ksLF4xkPU2bCmr7F6tD7l/JQjzLKGLh94UORALKLgZsP6PwV7sHBkKyLQG7X2OGs5f4Q44LYbzTmltGpaT24T7xGcaBRYtrFtla1D1PHAfTWcLzY1QCauYeiErztj3DRAilMxrvrE3yqBy0a0TlZsXdsa5Mq9161/JZethIPKoi6kcBQx8hCgKxhbBaDDmTKA6BCofkaSSopryhrHlbD2WFLYpfkSJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsU+1OautcK+ZuYHFAm5GrR5pYlhDrcEJuVc6n+rQIc=;
 b=L2aOUmfJeJeO3TJ7nMzqxDtBWp3SkJSj+G1t96jbQMs+ZeBxIVTLBtoYuUcFoVt9M3SrJutXLwsSo44Hgrq7WB3GzZ+M2vQ6E3NxV4H7+j09ZHU2dSO6ZmK4wzAkjbKW5jlmViG2/MtmDrwYBnSPqp17giXMTTVR/rmBIKAmM/zkhVmRGmyFmPN2SFsIgfDimqmr0DnI/O7Yzoblv7Hs+At9THmeuzNPYwK0ocsLv6u+ZatzZLkwsnQVPzDaM34kwvlxywvkwojKlHo+L5Uoy+wSyttydrXIXnVkUH/SVYczti1sFay0Ni62+O0u1w0tjZffJoBDF5MzYQTdzuyWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.65.149) by
 BN8PR12MB3297.namprd12.prod.outlook.com (20.179.65.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 2 Aug 2019 15:24:09 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::3492:27b4:40cc:44b7]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::3492:27b4:40cc:44b7%6]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 15:24:09 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/display: Block immediate flips for non-fast
 updates
Thread-Topic: [PATCH 2/2] drm/amd/display: Block immediate flips for non-fast
 updates
Thread-Index: AQHVSUSldjJB1gcFdkqExQ4fHM4UXKbn+fmS
Date: Fri, 2 Aug 2019 15:24:08 +0000
Message-ID: <BN8PR12MB3217B2D3CE3341BE111B314CEFD90@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190802151150.26628-1-nicholas.kazlauskas@amd.com>,
 <20190802151150.26628-2-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190802151150.26628-2-nicholas.kazlauskas@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dce1419e-70b1-451a-2666-08d7175d7701
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3297; 
x-ms-traffictypediagnostic: BN8PR12MB3297:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3297B5DF3069897712F3AC89EFD90@BN8PR12MB3297.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:370;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(189003)(199004)(102836004)(8676002)(6606003)(9686003)(81166006)(81156014)(8936002)(478600001)(53936002)(6246003)(236005)(66556008)(64756008)(66446008)(52536014)(229853002)(2906002)(66946007)(25786009)(5660300002)(33656002)(4326008)(3846002)(6116002)(54896002)(6306002)(66476007)(55016002)(6436002)(71200400001)(91956017)(71190400001)(14454004)(76116006)(606006)(68736007)(15650500001)(66066001)(19627405001)(14444005)(11346002)(74316002)(446003)(186003)(2501003)(476003)(7736002)(256004)(86362001)(486006)(54906003)(26005)(53546011)(99286004)(6506007)(316002)(110136005)(966005)(76176011)(7696005)(14773001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3297;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wiFxNUqnPFLoiwsBGKw9+yiua2Y/wefgA+zHtu+ohLjjiqNw8+9j4wmhb9SF0chFbEm9d2t89j8J5sK+Rbj3t4vSaqGYE54x+RkPBMQGArkGppYKoZZNhAl3vFtJe4810b4+wDUnJP3tViiWgXsdpS2AHFEca8Pwv+pY2ieBmO/i2Wh8Upa+SSoR8EZdf9irCZG6kH45Poa7riCqlL5IeCVrKZMvg2ihKuzp6tACUvv3h11TUBZtjQutEhklSfU5d6sDTkA6LnM3xqbraA4YeKRattCrhJ9YWCOVRsew+ODX1McMfRw5HFZ/IUWd5ERsG/v4BEIRiXHjq2KzCaUYPvQhk6KPWdUlpIErAX/MA+lQV4t7Nso1GdJZz04RLOMuA4ffOqGwkhjGpJTEjMNKQYoGgJesp714IOIJMBbtq2Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce1419e-70b1-451a-2666-08d7175d7701
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 15:24:08.9877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdavid@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3297
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsU+1OautcK+ZuYHFAm5GrR5pYlhDrcEJuVc6n+rQIc=;
 b=aBiE7nk0b/PyFddeBz6WrUc5KPIFiyjiukGYsOezxtCIjjhy8LmlTmfAyqeDWFiBJHfat71bft+uID7dIsrlouRKpsRMMfODXdEhLPaqYaOXw0OBrRE7CfNowfbHKvjX4Cpzn0ndcjHHKg2pQu0S0U/wNu+UX5ATFYu5vnc1mD4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David.Francis@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Type: multipart/mixed; boundary="===============1154488033=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1154488033==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3217B2D3CE3341BE111B314CEFD90BN8PR12MB3217namp_"

--_000_BN8PR12MB3217B2D3CE3341BE111B314CEFD90BN8PR12MB3217namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:

Reviewed-by: David Francis <david.francis@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: August 2, 2019 11:11:50 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Francis, David <David.Francis@=
amd.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Kazlauskas, Nicho=
las <Nicholas.Kazlauskas@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Block immediate flips for non-fast up=
dates

[Why]
Underflow can occur in the case where we change buffer pitch, DCC state,
rotation or mirroring for a plane while also performing an immediate
flip. It can also generate a p-state warning stack trace on DCN1 which
is typically observed during the cursor handler pipe locking because of
how frequent cursor updates can occur.

[How]
Store the update type on each CRTC - every plane will have access to
the CRTC state if it's flipping. If the update type is not
UPDATE_TYPE_FAST then the immediate flip should be disallowed.

No changes to the target vblank sequencing need to be done, we just
need to ensure that the surface registers do a double buffered update.

Cc: David Francis <david.francis@amd.com>
Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 +++++++++++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h    |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ffb3c7247ac6..e941d0d3794b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5690,8 +5690,14 @@ static void amdgpu_dm_commit_planes(struct drm_atomi=
c_state *state,
                 bundle->surface_updates[planes_count].plane_info =3D
                         &bundle->plane_infos[planes_count];

+               /*
+                * Only allow immediate flips for fast updates that don't
+                * change FB pitch, DCC state, rotation or mirroing.
+                */
                 bundle->flip_addrs[planes_count].flip_immediate =3D
-                               (crtc->state->pageflip_flags & DRM_MODE_PAG=
E_FLIP_ASYNC) !=3D 0;
+                       (crtc->state->pageflip_flags &
+                        DRM_MODE_PAGE_FLIP_ASYNC) !=3D 0 &&
+                       acrtc_state->update_type =3D=3D UPDATE_TYPE_FAST;

                 timestamp_ns =3D ktime_get_ns();
                 bundle->flip_addrs[planes_count].flip_timestamp_in_us =3D =
div_u64(timestamp_ns, 1000);
@@ -7311,6 +7317,14 @@ static int amdgpu_dm_atomic_check(struct drm_device =
*dev,
                 state->async_update =3D !drm_atomic_helper_async_check(dev=
, state);
         }

+       /* Store the overall update type for use later in atomic check. */
+       for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+               struct dm_crtc_state *dm_new_crtc_state =3D
+                       to_dm_crtc_state(new_crtc_state);
+
+               dm_new_crtc_state->update_type =3D (int)overall_update_type=
;
+       }
+
         /* Must be success */
         WARN_ON(ret);
         return ret;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index da48a857949f..cbd6608f58e6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -307,6 +307,7 @@ struct dm_crtc_state {
         bool cm_has_degamma;
         bool cm_is_degamma_srgb;

+       int update_type;
         int active_planes;
         bool interrupts_enabled;

--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB3217B2D3CE3341BE111B314CEFD90BN8PR12MB3217namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Series is:</p>
<p style=3D"margin-top:0;margin-bottom:0"><span>Reviewed-by: David Francis =
&lt;david.francis@amd.com&gt;</span><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nicho=
las.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> August 2, 2019 11:11:50 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Francis, David &l=
t;David.Francis@amd.com&gt;; Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.c=
om&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/display: Block immediate flips for non-=
fast updates</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Why]<br>
Underflow can occur in the case where we change buffer pitch, DCC state,<br=
>
rotation or mirroring for a plane while also performing an immediate<br>
flip. It can also generate a p-state warning stack trace on DCN1 which<br>
is typically observed during the cursor handler pipe locking because of<br>
how frequent cursor updates can occur.<br>
<br>
[How]<br>
Store the update type on each CRTC - every plane will have access to<br>
the CRTC state if it's flipping. If the update type is not<br>
UPDATE_TYPE_FAST then the immediate flip should be disallowed.<br>
<br>
No changes to the target vblank sequencing need to be done, we just<br>
need to ensure that the surface registers do a double buffered update.<br>
<br>
Cc: David Francis &lt;david.francis@amd.com&gt;<br>
Cc: Bhawanpreet Lakha &lt;bhawanpreet.lakha@amd.com&gt;<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c&nbsp;&nbsp;&nbsp; | 16 =
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
-<br>
&nbsp;.../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h&nbsp;&nbsp;&nbsp; |&nbs=
p; 1 &#43;<br>
&nbsp;2 files changed, 16 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index ffb3c7247ac6..e941d0d3794b 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -5690,8 &#43;5690,14 @@ static void amdgpu_dm_commit_planes(struct drm_a=
tomic_state *state,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bundle-&gt;surface_updates[planes_count].plane_info =
=3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;=
bundle-&gt;plane_infos[planes_count];<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /*<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * Only allow immediate flips for fast updates that don=
't<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * change FB pitch, DCC state, rotation or mirroing.<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bundle-&gt;flip_addrs[planes_count].flip_immediate =
=3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (crtc-&gt;state-&gt;pageflip_flags &amp; DR=
M_MODE_PAGE_FLIP_ASYNC) !=3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (crtc-&gt;st=
ate-&gt;pageflip_flags &amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MO=
DE_PAGE_FLIP_ASYNC) !=3D 0 &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acrtc_state-=
&gt;update_type =3D=3D UPDATE_TYPE_FAST;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; timestamp_ns =3D ktime_get_ns();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bundle-&gt;flip_addrs[planes_count].flip_timestamp_in=
_us =3D div_u64(timestamp_ns, 1000);<br>
@@ -7311,6 &#43;7317,14 @@ static int amdgpu_dm_atomic_check(struct drm_dev=
ice *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; state-&gt;async_update =3D !drm_atomic_helper_async_c=
heck(dev, state);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Store the overall update type =
for use later in atomic check. */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_new_crtc_in_state (state=
, crtc, new_crtc_state, i) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; struct dm_crtc_state *dm_new_crtc_state =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to_dm_crtc_s=
tate(new_crtc_state);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; dm_new_crtc_state-&gt;update_type =3D (int)overall_update_ty=
pe;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Must be success */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(ret);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.h<br>
index da48a857949f..cbd6608f58e6 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h<br>
@@ -307,6 &#43;307,7 @@ struct dm_crtc_state {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool cm_has_degamma;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool cm_is_degamma_srgb;<b=
r>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int update_type;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int active_planes;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool interrupts_enabled;<b=
r>
&nbsp;<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB3217B2D3CE3341BE111B314CEFD90BN8PR12MB3217namp_--

--===============1154488033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1154488033==--
