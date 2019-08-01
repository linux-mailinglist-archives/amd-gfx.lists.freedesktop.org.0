Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C157DF2D
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D96E6F5;
	Thu,  1 Aug 2019 15:35:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A522B6E6F5
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1/DWG0kwgikZs6qdZtcLLJMn3o/CktFzigvtDspU7R3JEqU+NmOrVasG8FX+hqb73qgQKVsAkxT3IGcKbPhdVgFceXiG9tPsLsEjpnkXJYbZII5fRlovMY+h1PC7lF6NeOC29d+vrWDJ24TK9D3rYE4/PLXRe2wwmYR5PrHQ0JH3hYi+WIgJdKQ3rvBZiw5LLX9odFOyvhhSTcQ5FUqCzG0n1flXQocjj/OH+bAXgTPHDk85JxbuXJLU5/d+thSCPlKSBf8H6aKiIXwxifYNzKBR9okHfzjLgBQL/H0JTK6uPRZBtHez+yqETLWY66AjIFt0pujVbNRZSVabYouiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohg8KM7GowSJhIOUmFF25Wz1H7NugP0U9csngajGnn8=;
 b=e0Zc0vnq+c6TWqujb2DHgGTV2t5JJkxd6seUHv6UHqcwRqnqb2yTX88tC1otH4BsNdSZ4BOj0RyNJzg5syoeLlaYRuZA8cjgytuUzLyEvvQ+TptHIg7Wy4u9TKJE/BnaC7JvJgYQPZo3GMdritoWEdcuE5KehvxAlhxpVSrEDGSs/bSGt9RxMvVS43g3yv5siUznlcg12YBtxW2BIryT9J1nD+vmQVJvi4p4JuKqr3EiN9kLkDjlFDcZ9uZulqeD6qrUWxcH1MBiJ9m/9svNbOs5lv04ygp+FeiyTW7xPkqRBPIfcbHK9AI435zHLmvD5b3dxrv5uHnRYRqwuKwgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1667.namprd12.prod.outlook.com (10.172.18.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 1 Aug 2019 15:35:16 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.017; Thu, 1 Aug 2019
 15:35:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 4/4] drm/amdgpu: only uncorrectable error needs gpu reset
Thread-Topic: [PATCH 4/4] drm/amdgpu: only uncorrectable error needs gpu reset
Thread-Index: AQHVSDYN3rQCUx4SD0iguRPwwD80FabmbNiR
Date: Thu, 1 Aug 2019 15:35:16 +0000
Message-ID: <BN6PR12MB18091A23CA998C296FCD74C2F7DE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>,
 <20190801065342.8450-5-tao.zhou1@amd.com>
In-Reply-To: <20190801065342.8450-5-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.6.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 336e1e47-8bda-46b3-55d4-08d71695da74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1667; 
x-ms-traffictypediagnostic: BN6PR12MB1667:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1667E7D830CC94F50EF2D4A0F7DE0@BN6PR12MB1667.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(199004)(189003)(66066001)(71190400001)(26005)(476003)(110136005)(99286004)(71200400001)(81166006)(8676002)(81156014)(102836004)(76176011)(5660300002)(8936002)(7696005)(316002)(6636002)(2501003)(52536014)(446003)(478600001)(3846002)(105004)(6116002)(86362001)(606006)(6436002)(966005)(229853002)(14454004)(14444005)(256004)(25786009)(66446008)(64756008)(66556008)(11346002)(66476007)(19627405001)(76116006)(6246003)(6306002)(54896002)(9686003)(2906002)(33656002)(236005)(53936002)(66946007)(486006)(55016002)(186003)(53546011)(68736007)(7736002)(6506007)(74316002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1667;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CP8MIgvRgmZUX6IGKTU11f3sgQb64Grpd/yq5cFachxzXcRo0R30ob6KaX19RZcbrIgPUlDdr6AE+/myeKqOlBz4mWCJBRSAcG7OZ8e2aLme71JerfOP71+QLp126ihS3aVyuJQBEJqfXMimm0cbhC6DTEd6XaN+JqUtmbihwLoyg71c8n10kQwJg2SalP5gKNwvaGmjeYchti2sLl8xPaAXlXQfjhVh2VTxqwD5ydkZFWRJl67ZGV1jtm2ZPE5JGqZyoySSOm5OqLI7LZqR5vw5Ow23yJrDdzeGqH3Io8l+y9GaWyRmUhoI1lHaS1v9gYO/jkYHdHTJi2Pp0C+Ev1YnctXbHAJ6cXvvtDO5eRSdw+scA1k8FXs1DcNI1gBQCdkU3oVwhQpNtbeFxkeKaoLCjyYajDgknUczU3PZ6a0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336e1e47-8bda-46b3-55d4-08d71695da74
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:35:16.6070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohg8KM7GowSJhIOUmFF25Wz1H7NugP0U9csngajGnn8=;
 b=MUL+cSaGC/Pgg6A0qVtyAQKZhUiqQpLVw9fOMGWCIRmQaSQXGu1ujYRo5y/gPCl6C436f3cq9JxnUqefmM+wcjYeA4bhhB0pro+0Q3rcE7IhmWt0/GMnmeBWEcGp71lK6YbpEnKsHiqj7ZE9ewoI8wy7dbqM5zGyvYX1kMae3kQ=
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
Content-Type: multipart/mixed; boundary="===============1132377979=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1132377979==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18091A23CA998C296FCD74C2F7DE0BN6PR12MB1809namp_"

--_000_BN6PR12MB18091A23CA998C296FCD74C2F7DE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please add a patch description for this patch.  With that fixed, the series=
 is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tao Zhou=
 <tao.zhou1@amd.com>
Sent: Thursday, August 1, 2019 2:53 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zhang, H=
awking <Hawking.Zhang@amd.com>; Li, Dennis <Dennis.Li@amd.com>; Chen, Guchu=
n <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Zhou1, Tao <Tao.Zhou1@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: only uncorrectable error needs gpu reset

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c
index 05cbd90d9b6c..b6edad8bb31c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -250,7 +250,11 @@ static int gmc_v9_0_process_ras_data_cb(struct amdgpu_=
device *adev,
          */
         if (adev->umc.funcs->query_ras_error_address)
                 adev->umc.funcs->query_ras_error_address(adev, err_data);
-       amdgpu_ras_reset_gpu(adev, 0);
+
+       /* only uncorrectable error needs gpu reset */
+       if (err_data->ue_count)
+               amdgpu_ras_reset_gpu(adev, 0);
+
         return AMDGPU_RAS_UE;
 }

--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18091A23CA998C296FCD74C2F7DE0BN6PR12MB1809namp_
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
Please add a patch description for this patch.&nbsp; With that fixed, the s=
eries is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Tao Zhou &lt;tao.zhou1@amd.co=
m&gt;<br>
<b>Sent:</b> Thursday, August 1, 2019 2:53 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Li, Dennis &lt;Dennis.Li=
@amd.com&gt;; Chen, Guchun &lt;Guchun.Chen@amd.com&gt;; Pan, Xinhui &lt;Xin=
hui.Pan@amd.com&gt;<br>
<b>Cc:</b> Zhou1, Tao &lt;Tao.Zhou1@amd.com&gt;<br>
<b>Subject:</b> [PATCH 4/4] drm/amdgpu: only uncorrectable error needs gpu =
reset</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Tao Zhou &lt;tao.zhou1@amd.com&gt;<=
br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 6 &#43;&#43;&#43;&#43;&#43;-<=
br>
&nbsp;1 file changed, 5 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c<br>
index 05cbd90d9b6c..b6edad8bb31c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
@@ -250,7 &#43;250,11 @@ static int gmc_v9_0_process_ras_data_cb(struct amd=
gpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;umc.funcs-&gt=
;query_ras_error_address)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;umc.funcs-&gt;query_ras_error_address(adev, =
err_data);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ras_reset_gpu(adev, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only uncorrectable error needs=
 gpu reset */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err_data-&gt;ue_count)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ras_reset_gpu(adev, 0);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return AMDGPU_RAS_UE;<br>
&nbsp;}<br>
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

--_000_BN6PR12MB18091A23CA998C296FCD74C2F7DE0BN6PR12MB1809namp_--

--===============1132377979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1132377979==--
