Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31971572
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 11:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C38889FDB;
	Tue, 23 Jul 2019 09:43:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710087.outbound.protection.outlook.com [40.107.71.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1329689FDB
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 09:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxjFZhoPp5yoe5Yg72/FXDPdH3Zm0VNtz7EKbcSt0LlqJDYtWrlP86Qkqgyjx/g2jlj6zky7s1PBteCxVHKMSZXTyTaTQJeeA4/I1hBBdhqdHdAA9mxH1Ua6hmSURiA2qfCcxYwgfaN1qL46yU4stfHrTM/1fluxn1sXx+ecONBaM3uTIuA14oQHAz17j/iItLrNqpZL6yLidQh+QwgSj87DrAK9iA3BLIkugciou13Q1vuvf6W67KlaTJxh3RtkZ79wzxeQYispiuHurWgupBAXYUlXzxvOyrfCbsD7cOMyH7ADEIsr8ra55tFnMBIGnjehCmfgrXNUEvWjyhKExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPwvDWnYsDZJ7B+/g/ph9XWBOYSJHOVfneTGZJS5/VA=;
 b=P1Npqc9/gdWW86FKPNJVrZQ8Iqw1GpFyrT36jAqXSjO6NS0feRG47Dxz6Jc9RFY9ZrAt8JhAx3pkkjAxoNipyC+97Ij8MwRN26uiOBEKFXkvxoaQBKA9cm3oinGOxNY6VFWQj6U2m8rPq/D0e6eLf6VHDSXm/BzMvFYD4nidgEaPXjiPDaqRBuis/uRn+6OFhQvwhwAdtZ8XhJedbb68nCLuiG6Y3AdyK8xOW/IeAYN9XCAnikoCGKAD7IkoVEMwB1ykFD9xIVYC+p92fRwyTRI63Pd02zFfaL9qUlDRzMoeMrj6dpLnJvD3dQD4DzC1eEkHX4nSsLZWZxMTJVvMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3662.namprd12.prod.outlook.com (10.255.86.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Tue, 23 Jul 2019 09:43:50 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 09:43:50 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu
Thread-Topic: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu
Thread-Index: AQHVQTqGJo84cqbU1USb8tfj+Nt5SabX82+1
Date: Tue, 23 Jul 2019 09:43:49 +0000
Message-ID: <MN2PR12MB3296043F281A9E7345179AE1A2C70@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1563874746-6318-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1563874746-6318-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: Alexander.Deucher@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ac43cf4-1a17-4a38-619c-08d70f524414
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3662; 
x-ms-traffictypediagnostic: MN2PR12MB3662:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3662B21BC3746A174B418F52A2C70@MN2PR12MB3662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(199004)(189003)(256004)(7696005)(8936002)(26005)(68736007)(76116006)(1015004)(186003)(102836004)(86362001)(76176011)(478600001)(606006)(14444005)(6506007)(53546011)(33656002)(74316002)(2501003)(476003)(81166006)(25786009)(8676002)(7736002)(81156014)(14454004)(19627405001)(66066001)(236005)(966005)(11346002)(53936002)(6606003)(52536014)(3846002)(316002)(9686003)(6636002)(55016002)(6246003)(6306002)(54896002)(6116002)(5660300002)(2906002)(110136005)(486006)(6436002)(66556008)(66946007)(64756008)(66446008)(71190400001)(71200400001)(99286004)(229853002)(446003)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3662;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MjihUcFPDXW9N0fmANoYeI3mYYBDkfDRmIEnH5YYWXF2TNDRa0RifbpResGxIKCvbMClR54bb9JZJbywTGkxUQCvcr78DwjJU+ECRnh9gIrsg9pJqIkSaVIBzfm4rJcCSFr2AjUfQvRqb7YDOn5TTdM/pNtkaaJ7k1kg1cSVLuv53a4RGTXW8IoeTuJRdIjQ+FW1obHu21k6l5UghZMLKn5V6Vrb7kqU3i5UuCRQmAFvYhLImDDuJR/32QKQ7PwR9IFZapsDfsVCvg88zpdDIYbV6dIUGnO3s3eUKTzXOUAC+KDC/fcIGuXNKVvZc5w41/rqX44CgkTEj0k8Dtcg40rrGzrvr8Pm5QHiM5TMDHyV4J3go2liZE9Gt0gcBBNSXUKaSGz6boRtLQmSnCGYjL1rqXLwHKkNg0wfXeKZvSc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac43cf4-1a17-4a38-619c-08d70f524414
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:43:49.8526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPwvDWnYsDZJ7B+/g/ph9XWBOYSJHOVfneTGZJS5/VA=;
 b=T/QVbg+Mb7yrPaClzDAqb2c8Zuls2di0298WKQynB557xo/PFgRj3nCUNaSHYmTejaG4lbBJ2PK71C2VQqlp5Y0h8DMBYpcgr5s+EM6uPNj52pCrGEpxLq2ojzWxk8h1+szfi9H2jPQsnbPHUeCgGb7LVcuzrNNvHIxjLQVLIyk=
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
Content-Type: multipart/mixed; boundary="===============2099513554=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2099513554==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296043F281A9E7345179AE1A2C70MN2PR12MB3296namp_"

--_000_MN2PR12MB3296043F281A9E7345179AE1A2C70MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

it looks fine for me,

please @Deucher, Alexander<mailto:Alexander.Deucher@amd.com> double check c=
onfirm.

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kenneth =
Feng <kenneth.feng@amd.com>
Sent: Tuesday, July 23, 2019 5:39 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu

change the smu_read_sensor sequence to:

asic specific sensor read -> smu v11 specific sensor read -> smu v11 common=
 sensor read

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c     | 3 +++
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 4 ++--
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c     | 5 ++++-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c      | 8 ++++----
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c     | 5 ++++-
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 416f9a8..8ff18c8 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -315,6 +315,9 @@ int smu_common_read_sensor(struct smu_context *smu, enu=
m amd_pp_sensors sensor,
 {
         int ret =3D 0;

+       if(!data || !size)
+               return -EINVAL;
+
         switch (sensor) {
         case AMDGPU_PP_SENSOR_STABLE_PSTATE_SCLK:
                 *((uint32_t *)data) =3D smu->pstate_sclk;
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index b702c9e..fabb373 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -819,9 +819,9 @@ struct smu_funcs
 #define smu_start_thermal_control(smu) \
         ((smu)->funcs->start_thermal_control? (smu)->funcs->start_thermal_=
control((smu)) : 0)
 #define smu_read_sensor(smu, sensor, data, size) \
-       ((smu)->funcs->read_sensor? (smu)->funcs->read_sensor((smu), (senso=
r), (data), (size)) : 0)
-#define smu_asic_read_sensor(smu, sensor, data, size) \
         ((smu)->ppt_funcs->read_sensor? (smu)->ppt_funcs->read_sensor((smu=
), (sensor), (data), (size)) : 0)
+#define smu_smc_read_sensor(smu, sensor, data, size) \
+       ((smu)->funcs->read_sensor? (smu)->funcs->read_sensor((smu), (senso=
r), (data), (size)) : -EINVAL)
 #define smu_get_power_profile_mode(smu, buf) \
         ((smu)->ppt_funcs->get_power_profile_mode ? (smu)->ppt_funcs->get_=
power_profile_mode((smu), buf) : 0)
 #define smu_set_power_profile_mode(smu, param, param_size) \
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index c8ce9bb..6409718 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1366,6 +1366,9 @@ static int navi10_read_sensor(struct smu_context *smu=
,
         struct smu_table_context *table_context =3D &smu->smu_table;
         PPTable_t *pptable =3D table_context->driver_pptable;

+       if(!data || !size)
+               return -EINVAL;
+
         switch (sensor) {
         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
                 *(uint32_t *)data =3D pptable->FanMaximumRpm;
@@ -1387,7 +1390,7 @@ static int navi10_read_sensor(struct smu_context *smu=
,
                 *size =3D 4;
                 break;
         default:
-               return -EINVAL;
+               ret =3D smu_smc_read_sensor(smu, sensor, data, size);
         }

         return ret;
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index e3a1784..5267b68 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1267,6 +1267,10 @@ static int smu_v11_0_read_sensor(struct smu_context =
*smu,
                                  void *data, uint32_t *size)
 {
         int ret =3D 0;
+
+       if(!data || !size)
+               return -EINVAL;
+
         switch (sensor) {
         case AMDGPU_PP_SENSOR_GFX_MCLK:
                 ret =3D smu_get_current_clk_freq(smu, SMU_UCLK, (uint32_t =
*)data);
@@ -1289,10 +1293,6 @@ static int smu_v11_0_read_sensor(struct smu_context =
*smu,
                 break;
         }

-       /* try get sensor data by asic */
-       if (ret)
-               ret =3D smu_asic_read_sensor(smu, sensor, data, size);
-
         if (ret)
                 *size =3D 0;

diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index 9ead361..e864a54 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3163,6 +3163,9 @@ static int vega20_read_sensor(struct smu_context *smu=
,
         struct smu_table_context *table_context =3D &smu->smu_table;
         PPTable_t *pptable =3D table_context->driver_pptable;

+       if(!data || !size)
+               return -EINVAL;
+
         switch (sensor) {
         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
                 *(uint32_t *)data =3D pptable->FanMaximumRpm;
@@ -3186,7 +3189,7 @@ static int vega20_read_sensor(struct smu_context *smu=
,
                 *size =3D 4;
                 break;
         default:
-               return -EINVAL;
+               ret =3D smu_smc_read_sensor(smu, sensor, data, size);
         }

         return ret;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
amd-gfx Info Page - freedesktop.org<https://lists.freedesktop.org/mailman/l=
istinfo/amd-gfx>
lists.freedesktop.org
To see the collection of prior postings to the list, visit the amd-gfx Arch=
ives.. Using amd-gfx: To post a message to all the list members, send email=
 to amd-gfx@lists.freedesktop.org. You can subscribe to the list, or change=
 your existing subscription, in the sections below.


--_000_MN2PR12MB3296043F281A9E7345179AE1A2C70MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-size: 12pt;">=
it looks fine for me,&nbsp;</span><br>
</p>
<div>please <a class=3D"mention ms-bgc-nlr ms-fcl-b" id=3D"OWAAM928179" hre=
f=3D"mailto:Alexander.Deucher@amd.com">
@Deucher, Alexander</a>&nbsp;double check confirm.</div>
<div><br>
</div>
<div>Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div><br>
</div>
<div>Best Regards,<br>
Kevin<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kenneth Feng &lt;kenneth.feng=
@amd.com&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 5:39 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: change smu_read_sensor sequence =
in smu</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">change the smu_read_sensor sequence to:<br>
<br>
asic specific sensor read -&gt; smu v11 specific sensor read -&gt; smu v11 =
common sensor read<br>
<br>
Signed-off-by: Kenneth Feng &lt;kenneth.feng@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp;&nbsp; | =
3 &#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 4 &#43;&#43;--<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp;&nbsp; | =
5 &#43;&#43;&#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 8 &#43;&#43;&#43;&#43;----<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp; | =
5 &#43;&#43;&#43;&#43;-<br>
&nbsp;5 files changed, 17 insertions(&#43;), 8 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 416f9a8..8ff18c8 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -315,6 &#43;315,9 @@ int smu_common_read_sensor(struct smu_context *smu,=
 enum amd_pp_sensors sensor,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!data || !size)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_STAB=
LE_PSTATE_SCLK:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)data) =3D smu-&gt;pstate_sclk;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index b702c9e..fabb373 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -819,9 &#43;819,9 @@ struct smu_funcs<br>
&nbsp;#define smu_start_thermal_control(smu) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;start=
_thermal_control? (smu)-&gt;funcs-&gt;start_thermal_control((smu)) : 0)<br>
&nbsp;#define smu_read_sensor(smu, sensor, data, size) \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;read_sensor? (sm=
u)-&gt;funcs-&gt;read_sensor((smu), (sensor), (data), (size)) : 0)<br>
-#define smu_asic_read_sensor(smu, sensor, data, size) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&gt;r=
ead_sensor? (smu)-&gt;ppt_funcs-&gt;read_sensor((smu), (sensor), (data), (s=
ize)) : 0)<br>
&#43;#define smu_smc_read_sensor(smu, sensor, data, size) \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;read_sensor?=
 (smu)-&gt;funcs-&gt;read_sensor((smu), (sensor), (data), (size)) : -EINVAL=
)<br>
&nbsp;#define smu_get_power_profile_mode(smu, buf) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&gt;g=
et_power_profile_mode ? (smu)-&gt;ppt_funcs-&gt;get_power_profile_mode((smu=
), buf) : 0)<br>
&nbsp;#define smu_set_power_profile_mode(smu, param, param_size) \<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index c8ce9bb..6409718 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1366,6 &#43;1366,9 @@ static int navi10_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *=
table_context =3D &amp;smu-&gt;smu_table;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D tab=
le_context-&gt;driver_pptable;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!data || !size)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MAX_=
FAN_RPM:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm;<br>
@@ -1387,7 &#43;1390,7 @@ static int navi10_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_smc_read_sensor(smu, sensor, data, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index e3a1784..5267b68 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -1267,6 &#43;1267,10 @@ static int smu_v11_0_read_sensor(struct smu_cont=
ext *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data, uint32_t *size=
)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!data || !size)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GFX_=
MCLK:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_current_clk_freq(smu, SMU_UCLK, (uint=
32_t *)data);<br>
@@ -1289,10 &#43;1293,6 @@ static int smu_v11_0_read_sensor(struct smu_cont=
ext *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* try get sensor data by asic */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_asic_read_sensor(smu, sensor, data, size);<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 0;<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index 9ead361..e864a54 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -3163,6 &#43;3163,9 @@ static int vega20_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *=
table_context =3D &amp;smu-&gt;smu_table;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D tab=
le_context-&gt;driver_pptable;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!data || !size)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MAX_=
FAN_RPM:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm;<br>
@@ -3186,7 &#43;3189,7 @@ static int vega20_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_smc_read_sensor(smu, sensor, data, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" id=3D"LP=
lnk308364" class=3D"OWAAutoLink" previewremoved=3D"true">https://lists.free=
desktop.org/mailman/listinfo/amd-gfx</a></div>
<div id=3D"LPBorder_GT_15638749518470.02267473158651634" style=3D"margin-bo=
ttom: 20px; overflow: auto; width: 100%; text-indent: 0px;">
<table id=3D"LPContainer_15638749518450.8626503153022167" role=3D"presentat=
ion" cellspacing=3D"0" style=3D"width: 90%; background-color: rgb(255, 255,=
 255); position: relative; overflow: auto; padding-top: 20px; padding-botto=
m: 20px; margin-top: 20px; border-top: 1px dotted rgb(200, 200, 200); borde=
r-bottom: 1px dotted rgb(200, 200, 200);">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td id=3D"TextCell_15638749518460.7609342713450393" colspan=3D"2" style=3D"=
vertical-align: top; position: relative; padding: 0px; display: table-cell;=
">
<div id=3D"LPRemovePreviewContainer_15638749518460.24310328073303422"></div=
>
<div id=3D"LPTitle_15638749518460.7214757521911543" style=3D"top: 0px; colo=
r: rgb(0, 120, 215); font-weight: 400; font-size: 21px; font-family: wf_seg=
oe-ui_light, &quot;Segoe UI Light&quot;, &quot;Segoe WP Light&quot;, &quot;=
Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; line-heigh=
t: 21px;">
<a id=3D"LPUrlAnchor_15638749518460.9823406329165418" href=3D"https://lists=
.freedesktop.org/mailman/listinfo/amd-gfx" target=3D"_blank" style=3D"text-=
decoration: none;">amd-gfx Info Page - freedesktop.org</a></div>
<div id=3D"LPMetadata_15638749518470.8057760659421027" style=3D"margin: 10p=
x 0px 16px; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_se=
goe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, s=
ans-serif; font-size: 14px; line-height: 14px;">
lists.freedesktop.org</div>
<div id=3D"LPDescription_15638749518470.6436677658830974" style=3D"display:=
 block; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_segoe-=
ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-=
serif; font-size: 14px; line-height: 20px; max-height: 100px; overflow: hid=
den;">
To see the collection of prior postings to the list, visit the amd-gfx Arch=
ives.. Using amd-gfx: To post a message to all the list members, send email=
 to amd-gfx@lists.freedesktop.org. You can subscribe to the list, or change=
 your existing subscription, in
 the sections below.</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
</span></font></div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3296043F281A9E7345179AE1A2C70MN2PR12MB3296namp_--

--===============2099513554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2099513554==--
