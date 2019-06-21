Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE774EA09
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 15:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051596E8BC;
	Fri, 21 Jun 2019 13:58:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820059.outbound.protection.outlook.com [40.107.82.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338B16E8BC
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 13:58:25 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1186.namprd12.prod.outlook.com (10.168.227.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 13:58:21 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 13:58:21 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu:  add sw_init to df_v1_7
Thread-Topic: [PATCH] drm/amdgpu:  add sw_init to df_v1_7
Thread-Index: AQHVKBYWSuS+hJfp2kyLUqe6OjfIX6amImhw
Date: Fri, 21 Jun 2019 13:58:21 +0000
Message-ID: <BN6PR12MB180927B186CB19A7D5F17008F7E70@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190621094526.96749-1-jonathan.kim@amd.com>
In-Reply-To: <20190621094526.96749-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81518820-4fa6-43f8-43c2-08d6f65085a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1186; 
x-ms-traffictypediagnostic: BN6PR12MB1186:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1186EF2E4A0CA8C21F496640F7E70@BN6PR12MB1186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(376002)(396003)(39860400002)(189003)(199004)(256004)(73956011)(66946007)(66446008)(76116006)(64756008)(486006)(9686003)(54896002)(606006)(11346002)(66556008)(99286004)(446003)(105004)(66476007)(236005)(6306002)(6246003)(7696005)(2906002)(26005)(478600001)(966005)(6506007)(53546011)(55016002)(14454004)(76176011)(66066001)(6436002)(33656002)(6116002)(3846002)(186003)(72206003)(102836004)(53936002)(8936002)(229853002)(5660300002)(316002)(81166006)(8676002)(476003)(25786009)(7736002)(86362001)(68736007)(74316002)(2501003)(81156014)(52536014)(71190400001)(71200400001)(110136005)(19627405001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1186;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p+XAgCOFFkK6RTbwuFQSu4yapMXFgkcrHpoKNql/01OnEHioNuRc/vuu4tBf9FdKosHxDW2Z2P4kPd6fQJ9iMhshDmu2773tS/5qgUCN+Z8giPeMK8nMzrBFjQt9mCXE9LL6WCbxnSmNtv4oKL6R94a8HYmHdk7OTOWm5pO7JSH52YLxyTd5fObJQqxjOuuvFyj3/MSzxW7FOAxKWY6IkZ6HQhl1LZOPy11N7ZRhi6nduq7nvadGPWOKY8DIVGZChYWkF+f4YeFIyE/jGhYVLdojCm/lVkEo1nFFMNds5UPVcTHQQTXhLbwiymrQExkzB+pSrWUYqiZx5kaDQn6/C8AA4ikdvBzICVVceq99FIo47Y02Mid6l4SarJybzYKG1DaKW0F4Ocgq2uRiCjprbBXaE1IyLroKg9K90otXohc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81518820-4fa6-43f8-43c2-08d6f65085a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 13:58:21.7768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4hFzZXtiQhzZr4xDlqRh8Zshb8v9oI2PXEkwWD9HNY=;
 b=LmGhWJlQugPmT6yaMTSun+2E0KB2l6L8Z4adJH6fcoEft25igA+snGUkDkFVm8GgtTwXgMsmbmYpIIWVuwVFY9a2vKQA6sEh8wbquJizd/WCDvzKEUFX4AvRZ4PsRDOk58nObwFwZ8CdtsbAmc0V4aq7gYcf6ZJgvsjLTSpRT0o=
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
Content-Type: multipart/mixed; boundary="===============1393051745=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1393051745==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180927B186CB19A7D5F17008F7E70BN6PR12MB1809namp_"

--_000_BN6PR12MB180927B186CB19A7D5F17008F7E70BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If both init and sw_init are empty, we don't need both.  Just rename the in=
it callback to sw_init.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kim, Jon=
athan <Jonathan.Kim@amd.com>
Sent: Friday, June 21, 2019 5:45 AM
To: amd-gfx@lists.freedesktop.org
Cc: Kim, Jonathan
Subject: [PATCH] drm/amdgpu: add sw_init to df_v1_7

add df sw init to df 1.7 function to prevent regression issues on pre-vega2=
0
products.

Change-Id: I4941003ea4a99ba0ea736c7ecc8800148423c379
Signed-off-by: Jonathan Kim <Jonathan.Kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c b/drivers/gpu/drm/amd/amd=
gpu/df_v1_7.c
index 9935371db7ce..335f2c02878f 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
@@ -33,6 +33,10 @@ static void df_v1_7_init (struct amdgpu_device *adev)
 {
 }

+static void df_v1_7_sw_init(struct amdgpu_device *adev)
+{
+}
+
 static void df_v1_7_enable_broadcast_mode(struct amdgpu_device *adev,
                                           bool enable)
 {
@@ -111,6 +115,7 @@ static void df_v1_7_enable_ecc_force_par_wr_rmw(struct =
amdgpu_device *adev,

 const struct amdgpu_df_funcs df_v1_7_funcs =3D {
         .init =3D df_v1_7_init,
+       .sw_init =3D df_v1_7_sw_init,
         .enable_broadcast_mode =3D df_v1_7_enable_broadcast_mode,
         .get_fb_channel_number =3D df_v1_7_get_fb_channel_number,
         .get_hbm_channel_number =3D df_v1_7_get_hbm_channel_number,
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180927B186CB19A7D5F17008F7E70BN6PR12MB1809namp_
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
If both init and sw_init are empty, we don't need both.&nbsp; Just rename t=
he init callback to sw_init.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kim, Jonathan &lt;Jonathan.Ki=
m@amd.com&gt;<br>
<b>Sent:</b> Friday, June 21, 2019 5:45 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Kim, Jonathan<br>
<b>Subject:</b> [PATCH] drm/amdgpu: add sw_init to df_v1_7</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">add df sw init to df 1.7 function to prevent regre=
ssion issues on pre-vega20<br>
products.<br>
<br>
Change-Id: I4941003ea4a99ba0ea736c7ecc8800148423c379<br>
Signed-off-by: Jonathan Kim &lt;Jonathan.Kim@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/df_v1_7.c | 5 &#43;&#43;&#43;&#43;&#43;<br=
>
&nbsp;1 file changed, 5 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c b/drivers/gpu/drm/amd/amd=
gpu/df_v1_7.c<br>
index 9935371db7ce..335f2c02878f 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/df_v1_7.c<br>
@@ -33,6 &#43;33,10 @@ static void df_v1_7_init (struct amdgpu_device *adev=
)<br>
&nbsp;{<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static void df_v1_7_sw_init(struct amdgpu_device *adev)<br>
&#43;{<br>
&#43;}<br>
&#43;<br>
&nbsp;static void df_v1_7_enable_broadcast_mode(struct amdgpu_device *adev,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; bool enable)<br>
&nbsp;{<br>
@@ -111,6 &#43;115,7 @@ static void df_v1_7_enable_ecc_force_par_wr_rmw(str=
uct amdgpu_device *adev,<br>
&nbsp;<br>
&nbsp;const struct amdgpu_df_funcs df_v1_7_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init =3D df_v1_7_init,<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sw_init =3D df_v1_7_sw_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .enable_broadcast_mode =3D=
 df_v1_7_enable_broadcast_mode,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_fb_channel_number =3D=
 df_v1_7_get_fb_channel_number,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_hbm_channel_number =
=3D df_v1_7_get_hbm_channel_number,<br>
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

--_000_BN6PR12MB180927B186CB19A7D5F17008F7E70BN6PR12MB1809namp_--

--===============1393051745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1393051745==--
