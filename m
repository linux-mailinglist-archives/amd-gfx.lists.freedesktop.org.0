Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DADD63A7
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 15:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7F6E2E1;
	Mon, 14 Oct 2019 13:19:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394A46E2E1
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 13:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9+ipiCWj/amb9na64oD2KTmuhvH2HWTl+MOEYPYICUO4Eq2pjwPKtK0GjGLM8dOGLJFy17GcsnZdC1lcOzc0QM2sf8a7ihBe21imsbIVhvgsRZFS/kYenbo+wWjCk5ZxsNfHtgTyGfh+tOGYKhh3AhqJff/qWPUxojyKEYBbhrLtlrQkwkOwuk9pwpMSXwS6D1JA6eqSNkILk1fWsgSb/3wtNX/4bJDc/RATuhtRFSk5WQYNxEx5q/0Pg3a89UXI9EHfciNwKTbWm9tuZQwhrljM8+jW3fIWecLtjOmt55pcid2I4Aq22x9WFVF96ztS8lx3GNWrhSRW+6oxIlEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaCFoSzSBLIgwXvAuS5WeX1xMDAj4/IEmpJSYoTnEHc=;
 b=d58qeU10OaTigxtNcOC6d48w5cYbcNjTLWLvkMRUfW3XeUjnVDOELYijxst2IUFL22xWABm3vxj04b3eN6Uq+lQ3Ob8YSV2kAnqfyR574qHr0YUyxiKXjQR4RC3BtjeRRiMocLOnl2RLys3lycMC6CQKMlp6Mhn3CFVU+ML8oM+MG7SQpCUyL82NMECAwgGdj7sywfrXglLopTG5f32LOETnu3s1e5jaO0xgWvw0+6k3oyPx0RqrJO+/eEPrOwbIfSADqYwHS3pEINnR3aG7mRFX13xK/7ZYzqCA1Z3vN3SXM1vfRdynSeJ3W5XV7hHpIgZWuVoN1r06uy7D5jFoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1314.namprd12.prod.outlook.com (10.168.228.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Mon, 14 Oct 2019 13:19:44 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.021; Mon, 14 Oct
 2019 13:19:44 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow
 compute issue
Thread-Topic: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow
 compute issue
Thread-Index: AQHVfo+VH7lCsMTeskmGCvYOgcVWbKdWgMYAgAOmIJs=
Date: Mon, 14 Oct 2019 13:19:44 +0000
Message-ID: <BN6PR12MB1809828E95CEF9151F1C7180F7900@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1570618306-11560-1-git-send-email-Emily.Deng@amd.com>,
 <MN2PR12MB2975AFBB743A6C57493F96878F960@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2975AFBB743A6C57493F96878F960@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90cb99c5-af65-45c4-ebfa-08d750a92dff
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1314:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1314FC18BD1178CB5CB727AFF7900@BN6PR12MB1314.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(13464003)(189003)(199004)(86362001)(2501003)(606006)(476003)(966005)(19627405001)(446003)(105004)(81166006)(66066001)(3846002)(11346002)(14454004)(33656002)(8936002)(478600001)(6116002)(74316002)(316002)(486006)(81156014)(5660300002)(8676002)(7736002)(2906002)(26005)(6246003)(55016002)(229853002)(9686003)(256004)(52536014)(186003)(25786009)(76116006)(6506007)(99286004)(7696005)(64756008)(66556008)(66476007)(66946007)(53546011)(54896002)(71200400001)(71190400001)(236005)(6436002)(102836004)(76176011)(6306002)(66446008)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1314;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jd8O3t2f403bTkObl1NuisPToZNDe4Zoy7bii4Pbjq+eMqofOXGmbz4tqi3BdIYj0SpVqS4EB24eLSo39GInlWpnmaFqIHkRPbdpmogacNxi+lYwUH8n1lgTDmfF3zcjS80INxg8EbeiBeh4DnNgzIYpptEvobK+iCd7mVrt8w++lxCwi4+99IM7Mj+5cdTNj3K/GlNNs8UWNlFaHcxx1G9P0N+xiEARPgmQQI0YHY0HKPytVv91SE/1aCihGl3IMh9qzu4u+KZWZ2uePz2uL6SjzA8K+h37emHzPx+Q4n+4BTzJ+fv4M5snTt+QaBzTtpeRqilsols2gqPhhmK/2EG2LOnBELrw3q9sS+oMjH5zIoY+6ecp3+b+N1TOay9HRsXkGFbulTHldHRSp8ilmXzHgGPGcyddNMnv45wWfDfk/85mihr2+mSEXWGpvxhTpTYi189oaLhK3iSJyrN1Ew==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cb99c5-af65-45c4-ebfa-08d750a92dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 13:19:44.5607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YeyHbuP0owBre/ong8yPTmZeUW1XkgCZG7mzJyDsmGQUN5B7W6GVSfhB/vDXhs6/urR/9Y/qGK5rHLV+7Oft0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaCFoSzSBLIgwXvAuS5WeX1xMDAj4/IEmpJSYoTnEHc=;
 b=injUnqYdSmEeZxlD/TWhR8I/cwVx3OGXQlTf5L+piIqVyZOQqO8ZOWYFkPt07wmr1ZJOEyktfCufQYeHCnAjrmgv8PK8U8gJ35jdGW+klabfJEnXinnCqvf6eb/77Lxdcxfk2iezhddlMLGM99Zh7oVQJ9Q/toaLIuehfnivzlw=
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
Content-Type: multipart/mixed; boundary="===============0948234385=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0948234385==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809828E95CEF9151F1C7180F7900BN6PR12MB1809namp_"

--_000_BN6PR12MB1809828E95CEF9151F1C7180F7900BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Deng, Em=
ily <Emily.Deng@amd.com>
Sent: Saturday, October 12, 2019 1:36 AM
To: Deng, Emily <Emily.Deng@amd.com>; amd-gfx@lists.freedesktop.org <amd-gf=
x@lists.freedesktop.org>
Subject: RE: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow=
 compute issue

Ping....

Best wishes
Emily Deng



>-----Original Message-----
>From: Emily Deng <Emily.Deng@amd.com>
>Sent: Wednesday, October 9, 2019 6:52 PM
>To: amd-gfx@lists.freedesktop.org
>Cc: Deng, Emily <Emily.Deng@amd.com>
>Subject: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow
>compute issue
>
>When index is 1, need to set compute ring timeout for sriov and passthroug=
h.
>
>Signed-off-by: Emily Deng <Emily.Deng@amd.com>
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 ++++-
> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 6 ++++--
> 2 files changed, 8 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>index 53ce227..2f5a015 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>@@ -2664,8 +2664,11 @@ static int
>amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
>                 * There is only one value specified and
>                 * it should apply to all non-compute jobs.
>                 */
>-              if (index =3D=3D 1)
>+              if (index =3D=3D 1) {
>                        adev->sdma_timeout =3D adev->video_timeout =3D ade=
v-
>>gfx_timeout;
>+                      if (amdgpu_sriov_vf(adev) ||
>amdgpu_passthrough(adev))
>+                              adev->compute_timeout =3D adev->gfx_timeout=
;
>+              }
>        }
>
>        return ret;
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>index a88ea74..311abc8 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>@@ -250,9 +250,11 @@ module_param_named(msi, amdgpu_msi, int, 0444);
>  * By default(with no lockup_timeout settings), the timeout for all non-
>compute(GFX, SDMA and Video)
>  * jobs is 10000. And there is no timeout enforced on compute jobs.
>  */
>-MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default:
>10000 for non-compute jobs and infinity timeout for compute jobs."
>+MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default:
>for bare metal 10000 for non-compute jobs and infinity timeout for compute
>jobs; "
>+              "for passthrough or sriov, 10000 for all jobs."
>                " 0: keep default value. negative: infinity timeout), "
>-              "format is [Non-Compute] or [GFX,Compute,SDMA,Video]");
>+              "format: for bare metal [Non-Compute] or
>[GFX,Compute,SDMA,Video]; "
>+              "for passthrough or sriov [all jobs] or
>[GFX,Compute,SDMA,Video].");
> module_param_string(lockup_timeout, amdgpu_lockup_timeout,
>sizeof(amdgpu_lockup_timeout), 0444);
>
> /**
>--
>2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809828E95CEF9151F1C7180F7900BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Deng, Emily &lt;Emily.Deng@am=
d.com&gt;<br>
<b>Sent:</b> Saturday, October 12, 2019 1:36 AM<br>
<b>To:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;; amd-gfx@lists.freedeskto=
p.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> RE: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang wi=
th slow compute issue</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Ping....<br>
<br>
Best wishes<br>
Emily Deng<br>
<br>
<br>
<br>
&gt;-----Original Message-----<br>
&gt;From: Emily Deng &lt;Emily.Deng@amd.com&gt;<br>
&gt;Sent: Wednesday, October 9, 2019 6:52 PM<br>
&gt;To: amd-gfx@lists.freedesktop.org<br>
&gt;Cc: Deng, Emily &lt;Emily.Deng@amd.com&gt;<br>
&gt;Subject: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow=
<br>
&gt;compute issue<br>
&gt;<br>
&gt;When index is 1, need to set compute ring timeout for sriov and passthr=
ough.<br>
&gt;<br>
&gt;Signed-off-by: Emily Deng &lt;Emily.Deng@amd.com&gt;<br>
&gt;---<br>
&gt; drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 &#43;&#43;&#43;&#43;-<b=
r>
&gt; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp;&nbsp;&nbsp; | 6 &#43;&#4=
3;&#43;&#43;--<br>
&gt; 2 files changed, 8 insertions(&#43;), 3 deletions(-)<br>
&gt;<br>
&gt;diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;index 53ce227..2f5a015 100644<br>
&gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;@@ -2664,8 &#43;2664,11 @@ static int<br>
&gt;amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * There is only one value specified and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * it should apply to all non-compute jobs.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; if (index =3D=3D 1)<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (index =3D=3D 1) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&g=
t;sdma_timeout =3D adev-&gt;video_timeout =3D adev-<br>
&gt;&gt;gfx_timeout;<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sri=
ov_vf(adev) ||<br>
&gt;amdgpu_passthrough(adev))<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;compute_timeout =3D adev-&gt;gfx=
_timeout;<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;index a88ea74..311abc8 100644<br>
&gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;@@ -250,9 &#43;250,11 @@ module_param_named(msi, amdgpu_msi, int, 0444)=
;<br>
&gt;&nbsp; * By default(with no lockup_timeout settings), the timeout for a=
ll non-<br>
&gt;compute(GFX, SDMA and Video)<br>
&gt;&nbsp; * jobs is 10000. And there is no timeout enforced on compute job=
s.<br>
&gt;&nbsp; */<br>
&gt;-MODULE_PARM_DESC(lockup_timeout, &quot;GPU lockup timeout in ms (defau=
lt:<br>
&gt;10000 for non-compute jobs and infinity timeout for compute jobs.&quot;=
<br>
&gt;&#43;MODULE_PARM_DESC(lockup_timeout, &quot;GPU lockup timeout in ms (d=
efault:<br>
&gt;for bare metal 10000 for non-compute jobs and infinity timeout for comp=
ute<br>
&gt;jobs; &quot;<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;for passthrough or sriov, 10000 for all jobs.&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot; 0: keep default value. negative: infinity timeou=
t), &quot;<br>
&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &quot;format is [Non-Compute] or [GFX,Compute,SDMA,Video]&quot;);<=
br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;format: for bare metal [Non-Compute] or<br>
&gt;[GFX,Compute,SDMA,Video]; &quot;<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;for passthrough or sriov [all jobs] or<br>
&gt;[GFX,Compute,SDMA,Video].&quot;);<br>
&gt; module_param_string(lockup_timeout, amdgpu_lockup_timeout,<br>
&gt;sizeof(amdgpu_lockup_timeout), 0444);<br>
&gt;<br>
&gt; /**<br>
&gt;--<br>
&gt;2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809828E95CEF9151F1C7180F7900BN6PR12MB1809namp_--

--===============0948234385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0948234385==--
