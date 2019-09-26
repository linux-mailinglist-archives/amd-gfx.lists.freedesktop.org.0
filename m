Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC5BEBA1
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 07:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A726ED59;
	Thu, 26 Sep 2019 05:25:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710056.outbound.protection.outlook.com [40.107.71.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9346ED59
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 05:25:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1ZMrjhfOLoddf6b6tAqrvfUOvBwYiychdNqtxq+tm29mlGgeYEmkL/ugFeH66lV6knRA1O7j7VSE4GdSuDXhsXWW36jz1nzaGoaPXboXjJFGree6iY13HqBfp7DinMicLLsMmtRhlbtI2UCrIXbgUS4PI3cPY+7dJ9beE08OXlDRQZg/gsGq3djhjMy3B96aPK9fPfehMd5rGwnbnfZb5hayr11EasPUeQSQnTaPP4CnQKtFXMet80v1yTG6jcTmxiu2bTisBjpWNixDMKzH5hxixBqcigV4lgYLCF+8Xwn1ooLN3c7ITZ9o5sgiXQ6m5RTFyfPcMIPeshhoaZL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nLKnMBSmMKPmm6HP7vw2hpmdaF4eRI8i7X9/i/2OUE=;
 b=Dilm/GT+TKNAKHVU2olJRqKREJbMaKvKFyl4lKO/luOyQXhPAo5igPTdOThm1MT4beL+rs5FSfeQBXaqxcXCr1KAjpC9dU9rPpFfYP1E8J3qESLYAhJ6uC3Rjds9lPeyncSFPmqs4RmALb6DrAuVsl6NiyU8jc39FL4bWaWEXgSdUwx6nVXp1p0MdjQsfLZfeNLD6qGuDfrWVii6vxt22l1rUQRuh8PKZ38E6hK0KdXtqu2rVgEk4qFkSMulBB3mbMeMH/8K1V4o8JMRWaosinTIy4znm4TBjhjWvtEQJtLWyv+OzDBqzdhcp7A94KkZdkrwHk5tIoMTp+Dqd+Bqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3424.namprd12.prod.outlook.com (20.178.243.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 05:25:39 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 05:25:39 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/8] drm/amd/powerplay: add interface for getting workload
 type
Thread-Topic: [PATCH 4/8] drm/amd/powerplay: add interface for getting
 workload type
Thread-Index: AQHVdB2Ba4AhZI7Ci0edFrGqdo5gQqc9bFG0
Date: Thu, 26 Sep 2019 05:25:39 +0000
Message-ID: <MN2PR12MB32967F639C9689655C950902A2860@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>,
 <1569469774-16813-4-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569469774-16813-4-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef7bbda2-ab38-48a4-b8d2-08d74241f7e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3424; 
x-ms-traffictypediagnostic: MN2PR12MB3424:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3424D45DEF9EDAA8CFA57CE6A2860@MN2PR12MB3424.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(229853002)(606006)(7736002)(66066001)(55016002)(33656002)(9686003)(86362001)(54896002)(6306002)(4326008)(74316002)(66476007)(236005)(66556008)(76116006)(91956017)(6436002)(66946007)(66446008)(53546011)(6506007)(2906002)(64756008)(2501003)(26005)(186003)(102836004)(6246003)(3846002)(99286004)(6116002)(476003)(76176011)(7696005)(486006)(5660300002)(11346002)(966005)(14454004)(478600001)(25786009)(446003)(52536014)(105004)(19627405001)(14444005)(256004)(316002)(110136005)(71190400001)(71200400001)(54906003)(81166006)(8936002)(8676002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3424;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pj0bfufoBRCvSl/qIbh1qzNpa8KY94LpeXPobmfviSE8kojCTa8zXZcE71EImVww9Khhf7thsdsBVn2SX9kpCrR3pHYRgrSSfrufgwHboG0vwa1hiw20tOTa+nnkBnw2dNp9v8qJD5SoVB1QAL/zgK8XXkzcHVk/Pe3niGnKpuqH6D8VxCvdCQzyfx0XPfQY+kABNBWkpxou+Y2mPrLqZM3Qx3H7NNx1zjby1gxiHGCWCT6thHwLoflHdkS8otXBmD1zl1aKsyjkGz/MaDn3mb1BTNvOkY3+Tb2U1gqyeE6tcWLCojULZJYts0Q6eABRTEIzhN5xj57NSBw73agjMMo08prML1O7LxjW/3r4dSodHgVdZyW6QGRr8tAMvXoLtoHy1+IK5z+2kx88/TrGwcQfIqNQZMXaksfAXrtpGC9N9YUdhDtc5rVEHFCKsnvuW/tmInT11ydJpV+EhoUp8g==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7bbda2-ab38-48a4-b8d2-08d74241f7e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 05:25:39.4317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxJwaWAz3bO5j2QRywtFSHhj5Sw9oqasieOFblwzHSzmL9hZfk+GLSMBxE0DUtYC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3424
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nLKnMBSmMKPmm6HP7vw2hpmdaF4eRI8i7X9/i/2OUE=;
 b=3pcySHUjAl1ncd18mUnOaPKdQlYhHQfwkvoG8CAKH8xh/6+JTYzrGQ3Aa8yNYDIT9AD+EUn84sf4R8X9hSWsvfl/8tirlzXIypJgAUN2RHpTV5lYzOvslozQdFjBMgmd/YcxKAJATng6jleSCg2HpWmrpdACakFghEx6Mm2g8TI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: multipart/mixed; boundary="===============1079026764=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1079026764==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32967F639C9689655C950902A2860MN2PR12MB3296namp_"

--_000_MN2PR12MB32967F639C9689655C950902A2860MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

this patch, i think the smu driver should be unify the driver code format,
it is very useful for optimize and maintain smu driver code in the furture.

you can reference the navi10_ppt.c and arcuturs_ppt.c
funciton: arcturus_get_workload_type

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Thursday, September 26, 2019 11:50 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Hua=
ng, Ray <Ray.Huang@amd.com>; keneth.feng@amd.com <keneth.feng@amd.com>
Subject: [PATCH 4/8] drm/amd/powerplay: add interface for getting workload =
type

The workload type was got from the input of power profile mode.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
Reviewed-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 29 ++++++++++++++++++++++++++=
+++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index 8ec3663..dc945b8 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -365,6 +365,34 @@ static int renoir_unforce_dpm_levels(struct smu_contex=
t *smu) {
         return ret;
 }

+static int renoir_get_workload_type(struct smu_context *smu, uint32_t prof=
ile)
+{
+
+       uint32_t  pplib_workload =3D 0;
+
+       switch (profile) {
+       case PP_SMC_POWER_PROFILE_FULLSCREEN3D:
+               pplib_workload =3D WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT;
+               break;
+       case PP_SMC_POWER_PROFILE_CUSTOM:
+               pplib_workload =3D WORKLOAD_PPLIB_COUNT;
+               break;
+       case PP_SMC_POWER_PROFILE_VIDEO:
+               pplib_workload =3D WORKLOAD_PPLIB_VIDEO_BIT;
+               break;
+       case PP_SMC_POWER_PROFILE_VR:
+               pplib_workload =3D WORKLOAD_PPLIB_VR_BIT;
+               break;
+       case PP_SMC_POWER_PROFILE_COMPUTE:
+               pplib_workload =3D WORKLOAD_PPLIB_COMPUTE_BIT;
+               break;
+       default:
+               return -EINVAL;
+       }
+
+       return pplib_workload;
+}
+
 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
         .get_smu_table_index =3D renoir_get_smu_table_index,
@@ -376,6 +404,7 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .dpm_set_uvd_enable =3D renoir_dpm_set_uvd_enable,
         .force_dpm_limit_value =3D renoir_force_dpm_limit_value,
         .unforce_dpm_levels =3D renoir_unforce_dpm_levels,
+       .get_workload_type =3D renoir_get_workload_type,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32967F639C9689655C950902A2860MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
this patch, i think the smu driver should be unify the driver code format,<=
/div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
it is very useful for&nbsp;optimize and maintain smu driver code in the fur=
ture.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
you can reference the navi10_ppt.c and arcuturs_ppt.c<br>
funciton: arcturus_get_workload_type<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Best Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Kevin</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 11:50 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; Quan, Evan &lt;Evan.Qu=
an@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; keneth.feng@amd.com &=
lt;keneth.feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH 4/8] drm/amd/powerplay: add interface for getting wo=
rkload type</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">The workload type was got from the input of power =
profile mode.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
Reviewed-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 29 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 29 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index 8ec3663..dc945b8 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -365,6 &#43;365,34 @@ static int renoir_unforce_dpm_levels(struct smu_co=
ntext *smu) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_get_workload_type(struct smu_context *smu, uint32_t =
profile)<br>
&#43;{<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp; pplib_workload =3D=
 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (profile) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_FULLSCR=
EEN3D:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_CUSTOM:=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_COUNT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_VIDEO:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_VIDEO_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_VR:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_VR_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_COMPUTE=
:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_COMPUTE_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pplib_workload;<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D ren=
oir_get_smu_msg_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D r=
enoir_get_smu_table_index,<br>
@@ -376,6 &#43;404,7 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpm_set_uvd_enable =3D re=
noir_dpm_set_uvd_enable,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_dpm_limit_value =3D=
 renoir_force_dpm_limit_value,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unforce_dpm_levels =3D re=
noir_unforce_dpm_levels,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_workload_type =3D renoir_get=
_workload_type,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void renoir_set_ppt_funcs(struct smu_context *smu)<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32967F639C9689655C950902A2860MN2PR12MB3296namp_--

--===============1079026764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1079026764==--
