Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEFBB165
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 11:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234256E328;
	Mon, 23 Sep 2019 09:28:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720048.outbound.protection.outlook.com [40.107.72.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6B66E290
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 09:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cfa0dMHDsVhkipauOXGrhTAa4/Dm5oZD+NCSkn29SspYKCBSFJGfPv1MjwPeW+dRN8wQ9Lx9g7NviJN7sys16/B/PO+lndaemFKkJCf1AQCBkElrQ5mywZAZ9YWIuQ//O0m8RaR32LTFD6Fy/y3s5cwaWdcOu5feoB5Ei/vmVHiu2nV2o2C7PRsvrwVytGvMChyqBQYLAUa3CHYJpgWeoK9mKulwK8LRRQnos4ShbSurSAoiNwuhK9abmtk6I0QWiTI8kKCsLVw5Ih4zenKu8UNfyrMD9KMXJQunJjk1eRecdv/5nNrMgpituaHXws/OOXTMAXiw6pH/Hn2hQsTyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhEuKbC6lEh2d5/20C0ykmooBBs0ZdXv3GQYeRv6B4M=;
 b=hRXY0t4x2ZR4bBsYX6PfjmpOqjcj5UNZuplteynz22Cv10EHGJioJFlbHLLrGrg1W0el5KxUYfnAP2sBEOmUBazMBw5gjFJw78Pp4UnMtW5MLU0xrL71IFpljLZI1jPB3F3GAFt8gFj/Lk5lKilhE5iOkVdBTkmH8ebASH3zToKtD6qkX+r5WqbYRiJ+ofFrfujSftYqeIIXkttZG+vKefCiT1LB2OdF3MaiowGRFCcOUFC7iPrlLRWF/BuYHu5jYm6Do+zefKHume8JL4p7kSasLsG/Ln4oRTpAGVUxiA0yptkw3biVG31iSqSdBHWfB7IvPhLmMvB2am95oMSICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3229.namprd12.prod.outlook.com (20.179.82.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 09:28:51 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:28:51 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting and
 setting profiling dpm clock level
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting
 and setting profiling dpm clock level
Thread-Index: AQHVcerz2yDpqv1oRUecCeNV6s4aFKc4/eP1
Date: Mon, 23 Sep 2019 09:28:51 +0000
Message-ID: <MN2PR12MB3296355152137CECE6334B2FA2850@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>,
 <1569228167-3120-4-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-4-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aed233c0-c60b-4ff3-e9d2-08d7400871eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3229; 
x-ms-traffictypediagnostic: MN2PR12MB3229:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3229E8DCAA3467BEF386FB45A2850@MN2PR12MB3229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(199004)(189003)(19627405001)(71200400001)(7696005)(76176011)(71190400001)(105004)(7736002)(99286004)(6436002)(229853002)(486006)(966005)(476003)(5660300002)(6506007)(14454004)(53546011)(81166006)(52536014)(8676002)(91956017)(66476007)(81156014)(66556008)(66446008)(64756008)(186003)(26005)(446003)(102836004)(478600001)(8936002)(76116006)(11346002)(66946007)(25786009)(6116002)(3846002)(54906003)(110136005)(316002)(2906002)(66066001)(606006)(86362001)(6246003)(74316002)(256004)(14444005)(4326008)(33656002)(2501003)(55016002)(6306002)(54896002)(236005)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3229;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JkVz4lfzBzZU1v6RrB0NRg5OFVMlZeDgAUyJG7HhS2Rct9MOXhtzrA24pIP3a4qpCU2/GYtv6g9ntKf01EdthzVw0uBBW3M1Pe8ZNcHRN8Wl7o9vjy8L9NI1rCbhXaFmyi27l13gdAZgxn7DMJ+AU1sFDrvIXCse7oFz6Mb+5uriwh64SBu3zLUCkLfHquqN8PprwnNRBt60sjTDuZYHOV6jkU9EIo047d9I/X/VpHS7g3s3HDZCFNj5mEOk6cAOosdM4PrfHx/dS04W9V7m7Av2YNBGl0JI5Y4tbP+B/6dMXU39V3Mg5zmlrl7rgAGGZMcsDd46CHiPcbEQD6YjR5TgLUNA6bN9gZ0vTvbTSuyAICC1Bk0vJ3OiT3Y8TtaACnAXUNZJrBD/jqMuUsuuxcWh+OS7XgPCwMY5cWEvPVU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed233c0-c60b-4ff3-e9d2-08d7400871eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:28:51.0287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: haMGqhsoYGfVh7gCsKexKxqts89vvQK1pz+RDIruawxr4YjK6s2WUILMrco+hht6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhEuKbC6lEh2d5/20C0ykmooBBs0ZdXv3GQYeRv6B4M=;
 b=VvQqWuGUC/n7oVbCyuFFViUmwWiRZsvTi//UTzULOW5xYTSkdAs8c0Aqqvt37upP1ol+Er9Y3YIFXb5Vq6+inOoqsgCn0NTiqj8a/J1WA407hsCElhZqb6LNYgSRJn15clQmrCJYJMg4v2i88Q4aoqN6eJVEw0fo8nZkD6k0COw=
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: multipart/mixed; boundary="===============0554528702=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0554528702==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296355152137CECE6334B2FA2850MN2PR12MB3296namp_"

--_000_MN2PR12MB3296355152137CECE6334B2FA2850MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

comment inline.
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Monday, September 23, 2019 4:43 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: arron.liu@amd.com <arron.liu@amd.com>; Huang, Ray <Ray.Huang@amd.com>; =
Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Feng, K=
enneth <Kenneth.Feng@amd.com>
Subject: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting and =
setting profiling dpm clock level

implement get_profiling_clk_mask and force_clk_levels for forcing dpm clk t=
o limit value.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 83 ++++++++++++++++++++++++++=
++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index f87aa56..c6aae1c 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -392,6 +392,87 @@ static int renoir_get_workload_type(struct smu_context=
 *smu, uint32_t profile)
         return pplib_workload;
 }

+static int renoir_get_profiling_clk_mask(struct smu_context *smu,
+                                        enum amd_dpm_forced_level level,
+                                        uint32_t *sclk_mask,
+                                        uint32_t *mclk_mask,
+                                        uint32_t *soc_mask)
+{
+
+       if (level =3D=3D AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK) {
+               if (sclk_mask)
+                       *sclk_mask =3D 0;
+       } else if (level =3D=3D AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK) {
+               if (mclk_mask)
+                       *mclk_mask =3D 0;
+       } else if (level =3D=3D AMD_DPM_FORCED_LEVEL_PROFILE_PEAK) {
+               if(sclk_mask)
+                       /* The sclk as gfxclk and has three level about max=
/min/current */
+                       *sclk_mask =3D 3 - 1;
[kevin]:
you should return the max level not current level.
+
+               if(mclk_mask)
+                       *mclk_mask =3D NUM_MEMCLK_DPM_LEVELS - 1;
+
+               if(soc_mask)
+                       *soc_mask =3D NUM_SOCCLK_DPM_LEVELS - 1;
+       }
+
+       return 0;
+}
+
+static int renoir_force_clk_levels(struct smu_context *smu,
+                                  enum smu_clk_type clk_type, uint32_t mas=
k)
+{
+
+       int ret =3D 0 ;
+       uint32_t soft_min_level =3D 0, soft_max_level =3D 0, min_freq =3D 0=
, max_freq =3D 0;
+       DpmClocks_t *clk_table =3D smu->smu_table.clocks_table;
+
+       soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
+       soft_max_level =3D mask ? (fls(mask) - 1) : 0;
+
+       switch (clk_type) {
+       case SMU_GFXCLK:
+       case SMU_SCLK:
+               ret =3D smu_get_dpm_freq_range(smu, SMU_GFXCLK, &min_freq, =
&max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMax=
GfxClk, max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMin=
GfxClk, min_freq);
+               if (ret)
+                       return ret;
+               break;
+       case SMU_SOCCLK:
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_f=
req);
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_f=
req);
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMax=
SocclkByFreq, max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMin=
SocclkByFreq, min_freq);
+               if (ret)
+                       return ret;
+               break;
+       case SMU_MCLK:
+       case SMU_FCLK:
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_f=
req);
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_f=
req);
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMax=
FclkByFreq, max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMin=
FclkByFreq, min_freq);
+               if (ret)
+                       return ret;
+
[kevin]:
after remove this blank line,
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
+               break;
+       default:
+               break;
+       }
+
+       return ret;
+}
+
 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
         .get_smu_table_index =3D renoir_get_smu_table_index,
@@ -404,6 +485,8 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .force_dpm_limit_value =3D renoir_force_dpm_limit_value,
         .unforce_dpm_levels =3D renoir_unforce_dpm_levels,
         .get_workload_type =3D renoir_get_workload_type,
+       .get_profiling_clk_mask =3D renoir_get_profiling_clk_mask,
+       .force_clk_levels =3D renoir_force_clk_levels,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296355152137CECE6334B2FA2850MN2PR12MB3296namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
comment inline.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 4:43 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> arron.liu@amd.com &lt;arron.liu@amd.com&gt;; Huang, Ray &lt;Ray.=
Huang@amd.com&gt;; Liang, Prike &lt;Prike.Liang@amd.com&gt;; Quan, Evan &lt=
;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH 4/5] drm/amd/powerplay: add the interfaces for getti=
ng and setting profiling dpm clock level</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">implement get_profiling_clk_mask and force_clk_lev=
els for forcing dpm clk to limit value.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 83 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 83 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index f87aa56..c6aae1c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -392,6 &#43;392,87 @@ static int renoir_get_workload_type(struct smu_con=
text *smu, uint32_t profile)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pplib_workload;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_get_profiling_clk_mask(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; enum amd_dpm_forced_level level,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t *sclk_mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t *mclk_mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t *soc_mask)<br>
&#43;{<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (level =3D=3D AMD_DPM_FORCED_L=
EVEL_PROFILE_MIN_SCLK) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (sclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sclk_mask =
=3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (level =3D=3D AMD_DPM_F=
ORCED_LEVEL_PROFILE_MIN_MCLK) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (mclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mclk_mask =
=3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (level =3D=3D AMD_DPM_F=
ORCED_LEVEL_PROFILE_PEAK) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if(sclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The sclk =
as gfxclk and has three level about max/min/current */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sclk_mask =
=3D 3 - 1;</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">you should return the max level not current level.=
</div>
<div class=3D"PlainText">&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if(mclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mclk_mask =
=3D NUM_MEMCLK_DPM_LEVELS - 1;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if(soc_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *soc_mask =
=3D NUM_SOCCLK_DPM_LEVELS - 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&#43;static int renoir_force_clk_levels(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clk=
_type, uint32_t mask)<br>
&#43;{<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0 ;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t soft_min_level =3D 0, so=
ft_max_level =3D 0, min_freq =3D 0, max_freq =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DpmClocks_t *clk_table =3D smu-&g=
t;smu_table.clocks_table;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soft_min_level =3D mask ? (ffs(ma=
sk) - 1) : 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soft_max_level =3D mask ? (fls(ma=
sk) - 1) : 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (clk_type) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_GFXCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_SCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(smu, SMU_GFXCLK, &amp;min_fre=
q, &amp;max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxG=
fxClk, max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinG=
fxClk, min_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_SOCCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxS=
occlkByFreq, max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinS=
occlkByFreq, min_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_MCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_FCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxF=
clkByFreq, max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinF=
clkByFreq, min_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">after remove this blank line,</div>
<div class=3D"PlainText">Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt=
;</div>
<div class=3D"PlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D ren=
oir_get_smu_msg_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D r=
enoir_get_smu_table_index,<br>
@@ -404,6 &#43;485,8 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_dpm_limit_value =3D=
 renoir_force_dpm_limit_value,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unforce_dpm_levels =3D re=
noir_unforce_dpm_levels,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_workload_type =3D ren=
oir_get_workload_type,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_profiling_clk_mask =3D renoi=
r_get_profiling_clk_mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_clk_levels =3D renoir_forc=
e_clk_levels,<br>
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

--_000_MN2PR12MB3296355152137CECE6334B2FA2850MN2PR12MB3296namp_--

--===============0554528702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0554528702==--
