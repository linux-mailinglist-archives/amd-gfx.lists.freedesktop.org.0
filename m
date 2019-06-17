Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D9486E7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 17:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87989271;
	Mon, 17 Jun 2019 15:23:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710086.outbound.protection.outlook.com [40.107.71.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F140892D5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 15:23:35 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1393.namprd12.prod.outlook.com (10.168.225.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 15:23:33 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 15:23:33 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: wait to fetch the vbios until after common
 init
Thread-Topic: [PATCH] drm/amdgpu: wait to fetch the vbios until after common
 init
Thread-Index: AQHVJRtERq2gJjt6302sjlj/IgedTaaf9IqAgAACbBo=
Date: Mon, 17 Jun 2019 15:23:33 +0000
Message-ID: <BN6PR12MB1809772C53A7C9BB535D0012F7EB0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190617144500.29491-1-alexander.deucher@amd.com>,
 <BN6PR12MB161858B2EF2FDE6983B8AF8085EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB161858B2EF2FDE6983B8AF8085EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f417523-2908-49a2-07f1-08d6f337c2eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1393; 
x-ms-traffictypediagnostic: BN6PR12MB1393:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1393E86D9E2E0456F03AE611F7EB0@BN6PR12MB1393.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(136003)(346002)(39860400002)(13464003)(189003)(199004)(6436002)(81166006)(7696005)(81156014)(53936002)(74316002)(256004)(14444005)(6506007)(53546011)(478600001)(8676002)(6306002)(54896002)(6246003)(76176011)(72206003)(102836004)(606006)(966005)(25786009)(7736002)(86362001)(8936002)(110136005)(68736007)(486006)(236005)(9686003)(14454004)(55016002)(5660300002)(73956011)(66556008)(66476007)(76116006)(66946007)(316002)(66446008)(64756008)(99286004)(446003)(6116002)(52536014)(3846002)(476003)(11346002)(2906002)(105004)(66066001)(71200400001)(2501003)(186003)(229853002)(33656002)(71190400001)(26005)(19627405001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1393;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: THpI6VyOgHl0hWgWE3VkIutn+zz33EHbLOXnAu6YtdRjEkC+Ryajt9fy9Hg0xAPle7brpOXXum6oXHz7UH7mc9wnSD5P09X44N+uWdcOmNAx+kjxNrJTO4z//LM00xMsxdKKDN0g/EC2nNYGXUvpi4lnY3cXXxKt6Bjc/raQOaQ1Md+RcPfnGIs8sVzYnGU5Ah/X361EUt0q0FkFoOPfB/vXpuqDPm7UGC0wflwA6/yvsHJOqKg6trIUm4cIeSAn+dtEtEI60omw1+cV92eJCsYhYBxdTSm9PE9w3aKy8ZJ5cLmAC0KMwtRuWex5TGb6H04mCGLxnFeoBfQQ5LwJRa02OT88qK3fubu/uGCJ4flxmmMKCrv3PD1L2rbMj42JKNfuf0pXmRbnlcMq3bU19SFievvf1cFH6x1MHCHPVsc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f417523-2908-49a2-07f1-08d6f337c2eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 15:23:33.7576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1393
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9iP+SC3SgNSNJJm7phmiAI4J+3+/gZob5tQVo0s2bA=;
 b=YXv4QVDBcw8AaifREsgfrQ1XrzQIE+OFa8upPJsRx9U1APZnB/zy6RcVKmo0m676CbfoKEPeKCcR/zswNwyK0x6GrNeoL2ntM5rBvhzHlM7p208Y9IF23L+ErfVqvCDx4e9e6AAiy33JWuvhkWuOsyGzujIMrm84RPJ172DA6JA=
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
Content-Type: multipart/mixed; boundary="===============1830520867=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1830520867==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809772C53A7C9BB535D0012F7EB0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809772C53A7C9BB535D0012F7EB0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'll make that a tested-by.  Thanks!

Alex
________________________________
From: Russell, Kent
Sent: Monday, June 17, 2019 11:14 AM
To: Alex Deucher; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander
Subject: RE: [PATCH] drm/amdgpu: wait to fetch the vbios until after common=
 init

This also worked. I don't think that I'm qualified enough to RB it, but you=
 can add my

Verified-By: Kent Russell <kent.russell@amd.com>

 Kent

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex Deu=
cher
Sent: Monday, June 17, 2019 10:45 AM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/amdgpu: wait to fetch the vbios until after common ini=
t

We need the asic_funcs set for the get rom callbacks in some cases.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index 4a836db1000f..e26303bc567e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1534,17 +1534,6 @@ static int amdgpu_device_ip_early_init(struct amdgpu=
_device *adev)
         if (amdgpu_sriov_vf(adev))
                 adev->pm.pp_feature &=3D ~PP_GFXOFF_MASK;

-       /* Read BIOS */
-       if (!amdgpu_get_bios(adev))
-               return -EINVAL;
-
-       r =3D amdgpu_atombios_init(adev);
-       if (r) {
-               dev_err(adev->dev, "amdgpu_atombios_init failed\n");
-               amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAI=
L, 0, 0);
-               return r;
-       }
-
         for (i =3D 0; i < adev->num_ip_blocks; i++) {
                 if ((amdgpu_ip_block_mask & (1 << i)) =3D=3D 0) {
                         DRM_ERROR("disabled ip block: %d <%s>\n", @@ -1566=
,6 +1555,19 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device =
*adev)
                                 adev->ip_blocks[i].status.valid =3D true;
                         }
                 }
+               /* get the vbios after the asic_funcs are set up */
+               if (adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLOCK_TY=
PE_COMMON) {
+                       /* Read BIOS */
+                       if (!amdgpu_get_bios(adev))
+                               return -EINVAL;
+
+                       r =3D amdgpu_atombios_init(adev);
+                       if (r) {
+                               dev_err(adev->dev, "amdgpu_atombios_init fa=
iled\n");
+                               amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_A=
TOMBIOS_INIT_FAIL, 0, 0);
+                               return r;
+                       }
+               }
         }

         adev->cg_flags &=3D amdgpu_cg_mask;
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809772C53A7C9BB535D0012F7EB0BN6PR12MB1809namp_
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
I'll make that a tested-by.&nbsp; Thanks!</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Russell, Kent<br>
<b>Sent:</b> Monday, June 17, 2019 11:14 AM<br>
<b>To:</b> Alex Deucher; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu: wait to fetch the vbios until after=
 common init</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This also worked. I don't think that I'm qualified=
 enough to RB it, but you can add my<br>
<br>
Verified-By: Kent Russell &lt;kent.russell@amd.com&gt;<br>
<br>
&nbsp;Kent<br>
<br>
-----Original Message-----<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf Of Al=
ex Deucher<br>
Sent: Monday, June 17, 2019 10:45 AM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
Subject: [PATCH] drm/amdgpu: wait to fetch the vbios until after common ini=
t<br>
<br>
We need the asic_funcs set for the get rom callbacks in some cases.<br>
<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------<br>
&nbsp;1 file changed, 13 insertions(&#43;), 11 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index 4a836db1000f..e26303bc567e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -1534,17 &#43;1534,6 @@ static int amdgpu_device_ip_early_init(struct am=
dgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev))=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pp_feature &amp;=3D ~PP_GFXOFF_MASK;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Read BIOS */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_get_bios(adev))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_atombios_init(adev);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dev_err(adev-&gt;dev, &quot;amdgpu_atombios_init failed\n&quot;)=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAIL, 0,=
 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return r;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-=
&gt;num_ip_blocks; i&#43;&#43;) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if ((amdgpu_ip_block_mask &amp; (1 &lt;&lt; i)) =3D=
=3D 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_E=
RROR(&quot;disabled ip block: %d &lt;%s&gt;\n&quot;, @@ -1566,6 &#43;1555,1=
9 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;ip_blocks[i].status.val=
id =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* get the vbios after the asic_funcs are set up */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;ip_blocks[i].version-&gt;type =3D=3D AMD_IP_BLO=
CK_TYPE_COMMON) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Read BIOS=
 */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_=
get_bios(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu=
_atombios_init(adev);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(adev-&gt;dev, &quot;amdgpu_atom=
bios_init failed\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vf_error_put(adev, AMDGIM_ERROR_=
VF_ATOMBIOS_INIT_FAIL, 0, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;cg_flags &amp;=3D=
 amdgpu_cg_mask;<br>
--<br>
2.20.1<br>
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

--_000_BN6PR12MB1809772C53A7C9BB535D0012F7EB0BN6PR12MB1809namp_--

--===============1830520867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1830520867==--
