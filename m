Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B7EBBC9E
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 22:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97B06E986;
	Mon, 23 Sep 2019 20:10:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810083.outbound.protection.outlook.com [40.107.81.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA6A6E9A6
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 20:10:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVpClGwkCxvYU3XL7vkRJWxpIhxT7HfcJuaryoVrHabWWee26/cvuknHsXMNsTUp7p6M8ihyc2Eo+JFiI4+nTPlpnS1UpE1aLQx18MrKgsMKkoWeeZpbqWcEnO/Zq2t39mYciGvZ4zUgwGraYJ+HxPL4nkBbGO9Bc48qzv2KhWvemt98B6LjhU3iejfaQKRUu7mBmtzO+aq+G95JiacOV7Vl6Fw1Jy9ZCCmc1xUe6ho1gSzlzTu+EU7lExcIPws7rfbJgUwzPMFybAmZPPzVfcPE1mBkLPB+xArzMb014kiswGl4fdvsqUYMVvefJESTXnqiOsjqAKQ/UI8YCQlX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJZhlkNMCAxFR1/OVWjRHhvRpXn5DhfAt5EDmjSOSNM=;
 b=Fw1fzSlCj5sFag66T3xHIPd7UsMK+0DF4GCHVEhy3mhcy3/jrKk/HceeVENd5QBlM4d5gb7QreBmsD/JiqW61kKS3N8tNdTiEUamSaKAt4lnQd+eY5neK+Rnr4eS5TA3w879pkr+40Ynz5/Ln9Uj8gfm4UQh+ffDH2+6tjdqZHNx+jlXsPsGBvIKcN4FjYJ9nEK9oRBjSmCZjrg9D6kstCCeAAHXeDWOuYzo+XYkQwEVNoDH+2bzckugUtQzE/WIBLTD5aeS5xXYBFnoSVgPGBAAHuINkilmblvUtjJAQaGtEzWnQZV7mZJpL201HHIpOAd+vYSmZcRUd187ZIrnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1697.namprd12.prod.outlook.com (10.175.100.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 20:10:43 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.030; Mon, 23 Sep
 2019 20:10:43 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: Sync gfx10 kfd2kgd_calls function pointers
Thread-Topic: [PATCH 2/2] drm/amdkfd: Sync gfx10 kfd2kgd_calls function
 pointers
Thread-Index: AQHVckmO4ykfG/WHbUGbUmq96+6n5ac5sUH3
Date: Mon, 23 Sep 2019 20:10:43 +0000
Message-ID: <BN6PR12MB1809688CAE2196667B9EE350F7850@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190923200008.11998-1-Yong.Zhao@amd.com>,
 <20190923200008.11998-2-Yong.Zhao@amd.com>
In-Reply-To: <20190923200008.11998-2-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64883670-ac35-4a79-eee6-08d740621d3c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1697; 
x-ms-traffictypediagnostic: BN6PR12MB1697:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB16979F88C43C9BC9CC667357F7850@BN6PR12MB1697.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(199004)(189003)(110136005)(66946007)(3846002)(66066001)(6116002)(5660300002)(2501003)(229853002)(316002)(2906002)(478600001)(66476007)(66556008)(966005)(64756008)(66446008)(52536014)(14454004)(76116006)(7696005)(55016002)(25786009)(6246003)(486006)(256004)(33656002)(76176011)(446003)(476003)(86362001)(99286004)(11346002)(6306002)(54896002)(9686003)(6436002)(74316002)(606006)(236005)(105004)(186003)(71200400001)(81156014)(102836004)(6506007)(8676002)(53546011)(71190400001)(19627405001)(26005)(7736002)(81166006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1697;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rBT43BSgVV/NafncSQU8fZhNVMId286w9qW3pVEjvY5JwC7ELCjO1ZuUALzNTy4bIeIwKkxi6QQW9JBuMi83m3SP+bv5GtthXWa0/fogKJhTcR30jIPGPS+oMkZuJhLuRFInP3IIJomxoGhQvNwEJTvToizZ8VJuZuud3fsWzeJqwQ++BoYcRs7YmgHJMhOIGisYfcVi86ftxkHh0yUIhdZQNrCgRoUgD6IjPlos3wIkRgJk5tw1gPlFAuo8oYESF1Uu/MkmG7iyOBACuALue20XR0oxR3t7/2qMVyr5IQLuFcXaOixj5b3vlHPleNMobeW+M2gWGt+E2Bs4KT4H4xs9OzX6lBJhDSZw48s7wzDQwzuHwzxm6xfVMn1RYY3F0uepAbuSGNl7336eDJTq/8I57rmFjBggKPZGvpK6+kk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64883670-ac35-4a79-eee6-08d740621d3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 20:10:43.6070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcTU6WrYu8MmQ33ATmFJY7sbXPt5yO3EyjlthVWoIzGvPxiXY5XDNtcY15wc9MJSEvS905Y4iarF3LPveQGElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1697
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJZhlkNMCAxFR1/OVWjRHhvRpXn5DhfAt5EDmjSOSNM=;
 b=GjT04yjUo8qAMCQDKKSGmG9+Y4vbHbSIDMTcUqng0ykQ70BNaGpqV20+UWAvlVhWD2bc9QZmrD6KqdWXaiTqjnjJ+90tD9ufBm+5PanGdFcPpuZCBpJ6smTeHslGi9m16LS8uKLOCM/zDmrO6aIXUO6TEaB22symseOZScbCvXU=
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
Content-Type: multipart/mixed; boundary="===============2071477469=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2071477469==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809688CAE2196667B9EE350F7850BN6PR12MB1809namp_"

--_000_BN6PR12MB1809688CAE2196667B9EE350F7850BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zhao, Yo=
ng <Yong.Zhao@amd.com>
Sent: Monday, September 23, 2019 4:00 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhao, Yong <Yong.Zhao@amd.com>
Subject: [PATCH 2/2] drm/amdkfd: Sync gfx10 kfd2kgd_calls function pointers

get_hive_id was not set. Also, adjust the function setting sequence.

Change-Id: I51962954cd0707ebe9aa6c85c71110dee98d6200
Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index d3713e41ad8b..3ccaa088cafe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -160,10 +160,11 @@ static const struct kfd2kgd_calls kfd2kgd =3D {
                         get_atc_vmid_pasid_mapping_pasid,
         .get_atc_vmid_pasid_mapping_valid =3D
                         get_atc_vmid_pasid_mapping_valid,
+       .get_tile_config =3D amdgpu_amdkfd_get_tile_config,
+       .set_vm_context_page_table_base =3D set_vm_context_page_table_base,
         .invalidate_tlbs =3D invalidate_tlbs,
         .invalidate_tlbs_vmid =3D invalidate_tlbs_vmid,
-       .set_vm_context_page_table_base =3D set_vm_context_page_table_base,
-       .get_tile_config =3D amdgpu_amdkfd_get_tile_config,
+       .get_hive_id =3D amdgpu_amdkfd_get_hive_id,
 };

 struct kfd2kgd_calls *amdgpu_amdkfd_gfx_10_0_get_functions()
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809688CAE2196667B9EE350F7850BN6PR12MB1809namp_
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
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Zhao, Yong &lt;Yong.Zhao@amd.=
com&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 4:00 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amdkfd: Sync gfx10 kfd2kgd_calls function p=
ointers</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">get_hive_id was not set. Also, adjust the function=
 setting sequence.<br>
<br>
Change-Id: I51962954cd0707ebe9aa6c85c71110dee98d6200<br>
Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c | 5 &#43;&#43;&#43=
;--<br>
&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c<br>
index d3713e41ad8b..3ccaa088cafe 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c<br>
@@ -160,10 &#43;160,11 @@ static const struct kfd2kgd_calls kfd2kgd =3D {<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_a=
tc_vmid_pasid_mapping_pasid,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_atc_vmid_pasid_mappin=
g_valid =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_a=
tc_vmid_pasid_mapping_valid,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_tile_config =3D amdgpu_amdkf=
d_get_tile_config,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_vm_context_page_table_base =
=3D set_vm_context_page_table_base,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .invalidate_tlbs =3D inval=
idate_tlbs,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .invalidate_tlbs_vmid =3D =
invalidate_tlbs_vmid,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_vm_context_page_table_base =3D s=
et_vm_context_page_table_base,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_tile_config =3D amdgpu_amdkfd_ge=
t_tile_config,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_hive_id =3D amdgpu_amdkfd_ge=
t_hive_id,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct kfd2kgd_calls *amdgpu_amdkfd_gfx_10_0_get_functions()<br>
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

--_000_BN6PR12MB1809688CAE2196667B9EE350F7850BN6PR12MB1809namp_--

--===============2071477469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2071477469==--
