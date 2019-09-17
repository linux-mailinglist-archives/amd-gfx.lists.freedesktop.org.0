Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1177BB5094
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 16:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988036ECB4;
	Tue, 17 Sep 2019 14:40:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710089.outbound.protection.outlook.com [40.107.71.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADFE6ECB4
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 14:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/bYY9zKS1Dfs6iCRTR2nh6c4HpHeuFCYi54s5t8xuLQy4hI1Msi9yvoe7EApjVdh3eXBocXV5M+T/G26BWEXqt7t9C+7XjEW9LQLAkMT1dXXj/KEiF6NzV3jtcLr70VAWpYSY9LMEp56BRzXU/gCzlrgRZNRlhFhZ3hPhHQJ0dZuR8U4gO+uHrk6w6o/kgVXq8Elgh6Fq12oE/JBOoWrRlEgVEkIsFfSClzGJDruMSVcq1Okur7tnngc9i7nQD9llQLnbxFMB6eyesq8YGJq2K3PoUje9AKjKji5lPs2E6rAtjmfENwb0Hw1vUUCHvEOjmmeYg2aC+VG4Q0zd8Dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+Bk0NRsEcBEAyFPNFaKD5c7jrtRlMkWgibZXI8nUW8=;
 b=dojb/5d7ObRguhZ06uG+/WidIN+qvPD5CfcxH5PBEbFqFAjtCqFOUNIACRGKfJAYjgVrh+d7aHm9BAsyWUEQOLXtJ9R806HBbv2pWuaJcmVe1r5MnpdL4Xm28ZkwHCRaRJBuiT3vInVDb+I0pH3IUbhQbTm4aOnxua2TiMlmD2d5FnOQgoYZfNSaLHJLxDbtyqymL4xDFF/vTNaRweUm96TiH0PHEjm2JpXCHa5RvJjPOq9qNO8ZFgC/a8AlShImrPz5NUgH4ewfj/mEV3ArOP93iroyN1271f+QF6j38K23MqBuoC43QUQokOA/pV0m+Sp90n475gXu8rr51uv8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2958.namprd12.prod.outlook.com (20.179.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 14:40:08 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 14:40:08 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL
 feature
Thread-Topic: [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL
 feature
Thread-Index: AQHVbUe3IQsLZrI63E66gvUQs3E8Wacv8OEQ
Date: Tue, 17 Sep 2019 14:40:07 +0000
Message-ID: <MN2PR12MB32960DE06FEE0B6780B872A1A28F0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190917110431.12559-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190917110431.12559-1-xiaojie.yuan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab8de51-9e0e-484f-87fd-08d73b7cefc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2958; 
x-ms-traffictypediagnostic: MN2PR12MB2958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2958B5C1E84FC7D1431E361DA28F0@MN2PR12MB2958.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(199004)(189003)(66066001)(9686003)(81156014)(446003)(55016002)(74316002)(54896002)(86362001)(7736002)(19627405001)(99286004)(110136005)(476003)(102836004)(6506007)(26005)(53546011)(186003)(11346002)(3846002)(6246003)(2906002)(5660300002)(66476007)(91956017)(52536014)(54906003)(66446008)(66946007)(316002)(64756008)(76176011)(66556008)(105004)(76116006)(7696005)(8676002)(6436002)(256004)(8936002)(486006)(81166006)(2501003)(229853002)(71200400001)(14454004)(25786009)(4326008)(33656002)(6116002)(478600001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2958;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wGlHOG0h3IP7aw+f97W/+0mu/MR6l8VyKd9AQsg6ZQiXtDk6a4wFTf3O1xY3I+WY9G8jgKXc1fDfp+AMjByZIl8qlLTQi5OQI6U//a5Lokg0VvHixiN8Cv6jzMmHGELd25IcDNiml2oD/rS7LMlmJ1lDcGZhgwDJbuaCl/XH6fJryoQA1zR/dP7hZmTKgvNsj5HDm2Ox3cJUoZtcI+HTJtiL+JeC+64yhDC90b8girRPZP2c7/qv783CFRY5c8sM23uxO1tnQPsXE32JbqK91KP5lar4hSExI3pVZKEeoC3b1jf3MwDugDzUBdulWblA3HLkpd0gRrVyNJ5DhtjSNxN1aGgPBu4xjXNUMwHPbvsIfa1KphhRW/pmgRmmCc/XDUXc5eBmHLnb+GxCfMa5gFd5IMNORCPF3Dy3tiixZco=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab8de51-9e0e-484f-87fd-08d73b7cefc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 14:40:07.8942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPwX9AglsM7APsdu+TETZDSnEUUnOT7VZsndwEzYGJ8B4cbz8NGRAwlhQG6AUzzM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+Bk0NRsEcBEAyFPNFaKD5c7jrtRlMkWgibZXI8nUW8=;
 b=AB+jZW2s+lE2w0TeXIoTQPKSMsS3D3sKrfoUPWGCW/V8nVKs4AmlVMsT2eTK9L0IMk4W1ruKQxxz4J4FYv8EzcIJM/A0HsN/X61tVjowh049Pj3+1XBAFCPQ0QxtcrvUXjgFtxV019uvA7BoLXiJ9ABTi0BYrWpeMkkMTeWsyCI=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0023318866=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0023318866==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32960DE06FEE0B6780B872A1A28F0MN2PR12MB3296namp_"

--_000_MN2PR12MB32960DE06FEE0B6780B872A1A28F0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>


________________________________
From: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Sent: Tuesday, September 17, 2019 7:04 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; Quan, Evan <Evan.Quan@amd.com>; W=
ang, Kevin(Yang) <Kevin1.Wang@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com=
>
Subject: [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL featur=
e

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/inc/smu_types.h | 1 +
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_types.h
index ab8c92a60fc4..12a1de55ce3c 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
@@ -252,6 +252,7 @@ enum smu_clk_type {
        __SMU_DUMMY_MAP(TEMP_DEPENDENT_VMIN),            \
        __SMU_DUMMY_MAP(MMHUB_PG),                       \
        __SMU_DUMMY_MAP(ATHUB_PG),                       \
+       __SMU_DUMMY_MAP(APCC_DFLL),                      \
        __SMU_DUMMY_MAP(WAFL_CG),

 #undef __SMU_DUMMY_MAP
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 16634e657589..5a34d01f7f7c 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -176,6 +176,7 @@ static struct smu_11_0_cmn2aisc_mapping navi10_feature_=
mask_map[SMU_FEATURE_COUN
         FEA_MAP(TEMP_DEPENDENT_VMIN),
         FEA_MAP(MMHUB_PG),
         FEA_MAP(ATHUB_PG),
+       FEA_MAP(APCC_DFLL),
 };

 static struct smu_11_0_cmn2aisc_mapping navi10_table_map[SMU_TABLE_COUNT] =
=3D {
--
2.20.1


--_000_MN2PR12MB32960DE06FEE0B6780B872A1A28F0MN2PR12MB3296namp_
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br style=3D"font-size: 16px; background-color: rgb(255, 255, 255)">
</div>
<br>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Yuan, Xiaojie &lt;Xia=
ojie.Yuan@amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 17, 2019 7:04 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan &lt;Evan.=
Quan@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Yuan, Xiao=
jie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL=
 feature</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.c=
om&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_types.h | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp; | 1 &#43=
;<br>
&nbsp;2 files changed, 2 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_types.h<br>
index ab8c92a60fc4..12a1de55ce3c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
@@ -252,6 &#43;252,7 @@ enum smu_clk_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(TEMP_DEPENDENT_V=
MIN),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(MMHUB_PG),&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(ATHUB_PG),&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(APCC_DFLL),&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(WAFL_CG),<br>
&nbsp;<br>
&nbsp;#undef __SMU_DUMMY_MAP<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 16634e657589..5a34d01f7f7c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -176,6 &#43;176,7 @@ static struct smu_11_0_cmn2aisc_mapping navi10_feat=
ure_mask_map[SMU_FEATURE_COUN<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(TEMP_DEPENDENT_VMI=
N),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(MMHUB_PG),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(ATHUB_PG),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEA_MAP(APCC_DFLL),<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static struct smu_11_0_cmn2aisc_mapping navi10_table_map[SMU_TABLE_CO=
UNT] =3D {<br>
-- <br>
2.20.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32960DE06FEE0B6780B872A1A28F0MN2PR12MB3296namp_--

--===============0023318866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0023318866==--
