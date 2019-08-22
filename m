Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3CF99262
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 13:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249DA6EB00;
	Thu, 22 Aug 2019 11:42:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ACA6EB05
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 11:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnaEBVkyHvQg+SGipBqnsuXj5ZtVDHxTbjLqnhyZtYwtV3j+91PhYcjrWpbazx4I13xq61spX5cLro2iaiNA3grc1b1+pKBjI47++eWmumOfg0S1Bob9d9nOC2YD+etDAr/eXrHKS6hGIBqGlbQ7bkfdh4hDczZgShrmxFtmfiNtRGARKG7ZYy5NDZDMsj31ky3j9SknnujsdD8qEhroDUfanka6QxaGbSaSGfxbGYzTKOV2dNdf1a3dL0vuBT0mIPlIxrRVApj3GEfEeTXoeXRDuf4kDuIJbQ2X8gV1wgYMlvB79GQAVu5sTLIksRBNRtKIpL6SKBPq9719f3Od6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQIK0FrWKWnCmSg+Uyr61hDa2NQiC6YqDobHbXZ1R0M=;
 b=aalnbizpUy07hO5o31s9vI8ZURx/3hWC3/XAHfmJ0urp6in3xsOTVh436LqvdOAu56noiHKhnlvVxHVw7zvMWv8Xtt+9HGrlT7lWslOWOSy5s/rUBU2VEcjiMc78dwk4+SIXOECLdscDpvsnAABT7KGIy0IB0E2srbnLkdmyXy4B723XiIabZsP+nAxptff7eajeJTY0JRtzbtJsLnqAKmfZ539w5amA46TvhtW8/kQ4jZkqSxPxaG6n5LwfoGUjNgWksegzSI+vpTj3nV3xgaZS7JM25MubCtAaW/FDrIYm0Gg235VdK97apHcWpTNj9srfnN+g5BJN9x5ANSIpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3887.namprd12.prod.outlook.com (10.255.237.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 11:42:03 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.018; Thu, 22 Aug 2019
 11:42:03 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output on
 Arcturus
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output on
 Arcturus
Thread-Index: AQHVV/xQ7uPUucKTcES25EpU4ZES2acG9peAgAAWly4=
Date: Thu, 22 Aug 2019 11:42:03 +0000
Message-ID: <MN2PR12MB32963C565726A29BCFCB126BA2A50@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190821084143.25713-1-evan.quan@amd.com>
 <20190821084143.25713-2-evan.quan@amd.com>,
 <MN2PR12MB3344D88565FD9A38CF442F7EE4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344D88565FD9A38CF442F7EE4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee3edb05-d8ac-4fcf-92ee-08d726f5c08c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3887; 
x-ms-traffictypediagnostic: MN2PR12MB3887:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3887E8D13975D61E1E54C625A2A50@MN2PR12MB3887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:328;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(189003)(199004)(13464003)(25786009)(6246003)(8676002)(66066001)(4326008)(66946007)(478600001)(11346002)(476003)(3846002)(486006)(2501003)(64756008)(66446008)(66476007)(66556008)(86362001)(19627405001)(76116006)(105004)(229853002)(446003)(33656002)(606006)(6116002)(71190400001)(2906002)(71200400001)(102836004)(53936002)(256004)(14454004)(6506007)(9686003)(236005)(5660300002)(53546011)(316002)(7736002)(6306002)(110136005)(76176011)(8936002)(55016002)(26005)(7696005)(186003)(54896002)(6436002)(966005)(52536014)(99286004)(74316002)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3887;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uL61m+zJUYL5WRnTKhK43qc9Va0ZgqvbR1XinJWH7PvVEY+R3T2i/3kwBCwGOrJ6xTQ6ybN6ySdpA13g4SYxk5onJ3fVVdtRNwej1HIQWiioUsfTE4ZPgq/p/S8LOzoxjP4cr9dS1tVQ8KNGDLp/IJIgshfVj1olgfpDcANyelnj96PNZc51MR6HBNxIGfLyq0uCjuk3j8fMOJ7nO51fT7w0C7G+zZdw962+IlMBRCKFh1IQXES+T0oOi7+2TGZaKh7wjlR8HVKfV/CQsh2i+/kKxMx9i7WWkJ3ffLRMHyvtJOqZqJ0xEzYV56mdrbIh8awMFKibyBMe1/YWryEdA3iD0JdHkuezhVrUuqb5fDWLp4LweyMW++0tdqA7eettd/qYHXpRkaCGJwqUmTFd7v8juu/I0vSftvPx/pRK1O0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3edb05-d8ac-4fcf-92ee-08d726f5c08c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 11:42:03.3626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4Wv6f9xV5zueHytxIJjA9A3HC0UtB/BH66O2ghGUG1y4+FyF9gVRK77vk5NZRGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQIK0FrWKWnCmSg+Uyr61hDa2NQiC6YqDobHbXZ1R0M=;
 b=aDstnaKCUQ9AwnZR+ATDxQB2jG1+1LL3iX86WS5vKXf2qsxQsY8es9s04h2Tz+qtjPgLXQFH75hWi0SAO6qkDMG4vQgqxqxKfq3DhYIK4RDGk65wS5QHal88ht+UUAp7o1bNLFY/FB1tn9zlNRu0ZjzfNqL7QpcXGtF8uoxyFok=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0549601324=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0549601324==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32963C565726A29BCFCB126BA2A50MN2PR12MB3296namp_"

--_000_MN2PR12MB32963C565726A29BCFCB126BA2A50MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Quan, Ev=
an <Evan.Quan@amd.com>
Sent: Thursday, August 22, 2019 6:20 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output o=
n Arcturus

Ping..

> -----Original Message-----
> From: Evan Quan <evan.quan@amd.com>
> Sent: Wednesday, August 21, 2019 4:42 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Quan, Evan <Evan.Quan@amd.com>
> Subject: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output on
> Arcturus
>
> Fix for the commit below:
> drm/amd/powerplay: implment sysfs feature status function in smu
>
> Change-Id: Id9a373f8d8866b97450be0aef0ba19d0835d40d8
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  | 2 ++
> drivers/gpu/drm/amd/powerplay/inc/smu_types.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> index dd6563358e8e..f1f072012fac 100644
> --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> @@ -141,6 +141,7 @@ static struct smu_11_0_cmn2aisc_mapping
> arcturus_feature_mask_map[SMU_FEATURE_CO
>        FEA_MAP(DPM_SOCCLK),
>        FEA_MAP(DPM_FCLK),
>        FEA_MAP(DPM_MP0CLK),
> +     ARCTURUS_FEA_MAP(SMU_FEATURE_XGMI_BIT,
> FEATURE_DPM_XGMI_BIT),
>        FEA_MAP(DS_GFXCLK),
>        FEA_MAP(DS_SOCCLK),
>        FEA_MAP(DS_LCLK),
> @@ -149,6 +150,7 @@ static struct smu_11_0_cmn2aisc_mapping
> arcturus_feature_mask_map[SMU_FEATURE_CO
>        FEA_MAP(GFX_ULV),
>        ARCTURUS_FEA_MAP(SMU_FEATURE_VCN_PG_BIT,
> FEATURE_DPM_VCN_BIT),
>        FEA_MAP(RSMU_SMN_CG),
> +     FEA_MAP(WAFL_CG),
>        FEA_MAP(PPT),
>        FEA_MAP(TDC),
>        FEA_MAP(APCC_PLUS),
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> index 72962e842d69..c3c74098f614 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> @@ -207,6 +207,7 @@ enum smu_clk_type {
>         __SMU_DUMMY_MAP(TEMP_DEPENDENT_VMIN),                  \
>         __SMU_DUMMY_MAP(MMHUB_PG),                             \
>         __SMU_DUMMY_MAP(ATHUB_PG),                             \
> +       __SMU_DUMMY_MAP(WAFL_CG),
>
>  #undef __SMU_DUMMY_MAP
>  #define __SMU_DUMMY_MAP(feature)
>        SMU_FEATURE_##feature##_BIT
> --
> 2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32963C565726A29BCFCB126BA2A50MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Quan, Evan &lt;Evan.Quan@amd.=
com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 6:20 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature o=
utput on Arcturus</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Ping..<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; Sent: Wednesday, August 21, 2019 4:42 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
&gt; Subject: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output =
on<br>
&gt; Arcturus<br>
&gt; <br>
&gt; Fix for the commit below:<br>
&gt; drm/amd/powerplay: implment sysfs feature status function in smu<br>
&gt; <br>
&gt; Change-Id: Id9a373f8d8866b97450be0aef0ba19d0835d40d8<br>
&gt; Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/arcturus_ppt.c&nbsp; | 2 &#43;&#43=
;<br>
&gt; drivers/gpu/drm/amd/powerplay/inc/smu_types.h | 1 &#43;<br>
&gt;&nbsp; 2 files changed, 3 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; index dd6563358e8e..f1f072012fac 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; @@ -141,6 &#43;141,7 @@ static struct smu_11_0_cmn2aisc_mapping<br>
&gt; arcturus_feature_mask_map[SMU_FEATURE_CO<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(DPM_SOCCLK),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(DPM_FCLK),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(DPM_MP0CLK),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ARCTURUS_FEA_MAP(SMU_FEATURE_XGMI_BIT,<b=
r>
&gt; FEATURE_DPM_XGMI_BIT),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(DS_GFXCLK),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(DS_SOCCLK),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(DS_LCLK),<br>
&gt; @@ -149,6 &#43;150,7 @@ static struct smu_11_0_cmn2aisc_mapping<br>
&gt; arcturus_feature_mask_map[SMU_FEATURE_CO<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(GFX_ULV),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARCTURUS_FEA_MAP(SMU_FEATURE=
_VCN_PG_BIT,<br>
&gt; FEATURE_DPM_VCN_BIT),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(RSMU_SMN_CG),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(WAFL_CG),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(PPT),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(TDC),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(APCC_PLUS),<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; index 72962e842d69..c3c74098f614 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; @@ -207,6 &#43;207,7 @@ enum smu_clk_type {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(TEMP_D=
EPENDENT_VMIN),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(MMHUB_=
PG),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(ATHUB_=
PG),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(WAFL_CG),<br=
>
&gt; <br>
&gt;&nbsp; #undef __SMU_DUMMY_MAP<br>
&gt;&nbsp; #define __SMU_DUMMY_MAP(feature)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_##feature##_BIT<=
br>
&gt; --<br>
&gt; 2.23.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32963C565726A29BCFCB126BA2A50MN2PR12MB3296namp_--

--===============0549601324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0549601324==--
