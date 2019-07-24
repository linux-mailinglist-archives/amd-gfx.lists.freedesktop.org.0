Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A774156
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 00:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DCE6E65C;
	Wed, 24 Jul 2019 22:23:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF3B6E65C
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 22:23:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcULJ67lU+vbLzNukhNnZtUq+nNAI755vJouiMeaedv5j5rFEKt9VdoWPMk1JO8XAM2kkygohGMHf3QI2iCnlSOOyR30SaxqCol55eec2lxNCmhNiVbybI3sxTsrsSm9DyzpKH3x7qcq03CiOAyUAc7OfE0+dPWpRpCePtXKLXHnHTtkFm/IsV9dlM0blJRlLTGNX0OzgmpzxwX7dfRpTqqDpTuy9NUkTy6hlcdpJXXovhXBnQ/+1AdK/P5aS9wTAlfachurD5+uS/sVRrPggZjrec0npK/VYaP46pAAm3vmG3Swq2lCgmE1D0i4PzG1R5+xwRyyAOpk9WgTE8NDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsu86zn8rPaviG3720d7PYuF2pOATnNc66tbIeelGUQ=;
 b=XZOWoZNZDiPsXD10RiRmXdTcqbhwjIeDV3RO5g2HiwDi1SR507yliHulyWhW+obKM561T7WKZL2IFlFnQd9ZzKB+7gAll1qQYH5DCUGiZpbzdiUe4kBP9vFDKQJad6xgkEPoYwNfKVxI2LSEVXE6PqOvJkbblrSwzg3AhMpD3FDyfVFBY4dbd212O7nnj+qDdEfN1Eq3G3/FvLLXLMtVFYmhf7f/gWIvFG2ePrhzwu+C+TSkp/Bo7G2mq0fsDFp13ptCubMHpRhLDF95OO+qQf5LPm7e7fpP+JWNOenoG5z+z4YDvqBJjl7yLLxcsjHBcq2ULlBt/82MjSaWsq8x3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1897.namprd12.prod.outlook.com (10.175.91.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 22:23:43 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2%5]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 22:23:43 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Thai, Thong" <Thong.Thai@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB commands
Thread-Topic: [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB commands
Thread-Index: AdVCWRU+AoREmKtSQRm81C0QNw55IAAFQ9/F
Date: Wed, 24 Jul 2019 22:23:43 +0000
Message-ID: <DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60@DM5PR12MB2456.namprd12.prod.outlook.com>
References: <BN6PR1201MB0178175C942E341FCEB0D07B9DC60@BN6PR1201MB0178.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR1201MB0178175C942E341FCEB0D07B9DC60@BN6PR1201MB0178.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2605:b100:10a:7c6e:0:10:240e:1e01]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9024773-e3ff-4989-3732-08d71085964a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1897; 
x-ms-traffictypediagnostic: DM5PR12MB1897:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1897E025AC7FFF71D6B99A3BE5C60@DM5PR12MB1897.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(186003)(6506007)(102836004)(229853002)(14444005)(256004)(446003)(476003)(5660300002)(11346002)(8936002)(46003)(64756008)(76116006)(74316002)(66446008)(53546011)(2906002)(66556008)(71190400001)(71200400001)(66946007)(52536014)(66476007)(2501003)(7696005)(486006)(68736007)(76176011)(6246003)(6306002)(236005)(9686003)(54896002)(81156014)(53936002)(55016002)(81166006)(6116002)(110136005)(606006)(6436002)(33656002)(14454004)(25786009)(86362001)(966005)(99286004)(7736002)(478600001)(8676002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1897;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RT8PMccCgD2LtQ3WSbF6uZU/IcILtsu3dVTaVTkYbXdWy7G68pQebjo108e8+3Z5kTHt8fYQEmgrIqGHPzrfan5jVkNZZx0C0Z/87sX03Pmp1Iism4qix3XT4h2CM1b+avhRQ48HeRe+aR4HxVy4DFPzfyxuRSZlRQybtQzip8HxjNj3vBiVAoXMH/4nbIrPDVJMQoUKtYP34bSALDKmI51nUDH95IR+ipOfobuUdtfhBITYxal7dRNPx9aig66yApbwJPZrBWUKPOdxI0HbbkOEIXmqRwF/Kdxp78GJr/aQnMjS9QDlAGShNGAaUAXNUzJaGp7p1emM2TKToWmpII9rmBx2uXWzFk8SksTvgmPQD1We5LK2msXLBB6GKehwuSrwTvaq1kNeN1JvY4O0gunpi/2WFgo2GvvxVT83bzk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9024773-e3ff-4989-3732-08d71085964a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 22:23:43.3286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1897
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsu86zn8rPaviG3720d7PYuF2pOATnNc66tbIeelGUQ=;
 b=JR+mxpXgqTXsjYU5NwP18q9IMvT7jy/hUAFbxdFWbwaYf9+YY/+/x0cdRQsJ++viLCwBlQeB+/NwQYtf9ndGlm5dUKJ1bAe9VR69FpO1cu8TyTSv0Y31jYfB3tEYrVOcEseZU0HBJR7QleYso9B/34tfVmfDEzhrYDzyH5CMics=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1077557585=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1077557585==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60DM5PR12MB2456namp_"

--_000_DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60DM5PR12MB2456namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please separate the patches to 2 patches. i. e. New ring test as one patch.

Regards,
Leo
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Thai, Th=
ong <Thong.Thai@amd.com>
Sent: July 24, 2019 3:50:47 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB commands

Sets the CMD_SOURCE bit for VCN 2.0 decoder ring-buffer commands. This bit =
was previously set by the RBC HW on older versions of the firmware, and now=
 needs to be set by the driver in order to work with the SW RBC found in ne=
wer versions of the firmware.

Signed-off-by: Thong Thai <thong.thai@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 44 ++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v2_0.c
index bc9726787c97..8daee23425f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -1488,7 +1488,7 @@ static void vcn_v2_0_dec_ring_insert_start(struct amd=
gpu_ring *ring)
         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OF=
FSET, 0));
         amdgpu_ring_write(ring, 0);
         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
-       amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_START << 1);
+       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_PACKET_START << 1=
));
 }

 /**
@@ -1501,7 +1501,7 @@ static void vcn_v2_0_dec_ring_insert_start(struct amd=
gpu_ring *ring)
 static void vcn_v2_0_dec_ring_insert_end(struct amdgpu_ring *ring)
 {
         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
-       amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_END << 1);
+       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_PACKET_END << 1))=
;
 }

 /**
@@ -1546,7 +1546,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct amdgp=
u_ring *ring, u64 addr, u64
         amdgpu_ring_write(ring, upper_32_bits(addr) & 0xff);

         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
-       amdgpu_ring_write(ring, VCN_DEC_CMD_FENCE << 1);
+       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_FENCE << 1));

         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OF=
FSET, 0));
         amdgpu_ring_write(ring, 0);
@@ -1556,7 +1556,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct amdgp=
u_ring *ring, u64 addr, u64

         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));

-       amdgpu_ring_write(ring, VCN_DEC_CMD_TRAP << 1);
+       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_TRAP << 1));
 }

 /**
@@ -1600,7 +1600,7 @@ static void vcn_v2_0_dec_ring_emit_reg_wait(struct am=
dgpu_ring *ring,

         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));

-       amdgpu_ring_write(ring, VCN_DEC_CMD_REG_READ_COND_WAIT << 1);
+       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_REG_READ_COND_WAI=
T << 1));
 }

 static void vcn_v2_0_dec_ring_emit_vm_flush(struct amdgpu_ring *ring,
@@ -1629,7 +1629,7 @@ static void vcn_v2_0_dec_ring_emit_wreg(struct amdgpu=
_ring *ring,

         amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));

-       amdgpu_ring_write(ring, VCN_DEC_CMD_WRITE_REG << 1);
+       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_WRITE_REG << 1));
 }

 /**
@@ -2082,6 +2082,36 @@ static int vcn_v2_0_process_interrupt(struct amdgpu_=
device *adev,
         return 0;
 }

+int vcn_v2_0_dec_ring_test_ring(struct amdgpu_ring *ring)
+{
+       struct amdgpu_device *adev =3D ring->adev;
+       uint32_t tmp =3D 0;
+       unsigned i;
+       int r;
+
+       WREG32(adev->vcn.external.scratch9, 0xCAFEDEAD);
+       r =3D amdgpu_ring_alloc(ring, 3);
+       if (r)
+               return r;
+       amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
+       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_PACKET_START << 1=
));
+       amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.scratch9, 0));
+       amdgpu_ring_write(ring, 0xDEADBEEF);
+       amdgpu_ring_commit(ring);
+       for (i =3D 0; i < adev->usec_timeout; i++) {
+               tmp =3D RREG32(adev->vcn.external.scratch9);
+               if (tmp =3D=3D 0xDEADBEEF)
+                       break;
+               DRM_UDELAY(1);
+       }
+
+       if (i >=3D adev->usec_timeout)
+               r =3D -ETIMEDOUT;
+
+       return r;
+}
+
+
 static int vcn_v2_0_set_powergating_state(void *handle,
                                           enum amd_powergating_state state=
)
 {
@@ -2145,7 +2175,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_dec_ri=
ng_vm_funcs =3D {
         .emit_ib =3D vcn_v2_0_dec_ring_emit_ib,
         .emit_fence =3D vcn_v2_0_dec_ring_emit_fence,
         .emit_vm_flush =3D vcn_v2_0_dec_ring_emit_vm_flush,
-       .test_ring =3D amdgpu_vcn_dec_ring_test_ring,
+       .test_ring =3D vcn_v2_0_dec_ring_test_ring,
         .test_ib =3D amdgpu_vcn_dec_ring_test_ib,
         .insert_nop =3D vcn_v2_0_dec_ring_insert_nop,
         .insert_start =3D vcn_v2_0_dec_ring_insert_start,
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60DM5PR12MB2456namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
Please separate the patches to 2 patches. i. e. New ring test as one patch.=
<br>
<br>
Regards, <br>
Leo<br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Thai, Thong &lt;Thong.Thai@am=
d.com&gt;<br>
<b>Sent:</b> July 24, 2019 3:50:47 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB comm=
ands</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Sets the CMD_SOURCE bit for VCN 2.0 decoder ring-b=
uffer commands. This bit was previously set by the RBC HW on older versions=
 of the firmware, and now needs to be set by the driver in order to work wi=
th the SW RBC found in newer versions
 of the firmware.<br>
<br>
Signed-off-by: Thong Thai &lt;thong.thai@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 44 &#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;-----<br>
&nbsp;1 file changed, 37 insertions(&#43;), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v2_0.c<br>
index bc9726787c97..8daee23425f8 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
@@ -1488,7 &#43;1488,7 @@ static void vcn_v2_0_dec_ring_insert_start(struct=
 amdgpu_ring *ring)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_P=
ACKET_START &lt;&lt; 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x8000000=
0 | (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
@@ -1501,7 &#43;1501,7 @@ static void vcn_v2_0_dec_ring_insert_start(struct=
 amdgpu_ring *ring)<br>
&nbsp;static void vcn_v2_0_dec_ring_insert_end(struct amdgpu_ring *ring)<br=
>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_P=
ACKET_END &lt;&lt; 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x8000000=
0 | (VCN_DEC_CMD_PACKET_END &lt;&lt; 1));<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
@@ -1546,7 &#43;1546,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct a=
mdgpu_ring *ring, u64 addr, u64<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, up=
per_32_bits(addr) &amp; 0xff);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_F=
ENCE &lt;&lt; 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x8000000=
0 | (VCN_DEC_CMD_FENCE &lt;&lt; 1));<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0)=
;<br>
@@ -1556,7 &#43;1556,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct a=
mdgpu_ring *ring, u64 addr, u64<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_T=
RAP &lt;&lt; 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x8000000=
0 | (VCN_DEC_CMD_TRAP &lt;&lt; 1));<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
@@ -1600,7 &#43;1600,7 @@ static void vcn_v2_0_dec_ring_emit_reg_wait(struc=
t amdgpu_ring *ring,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_R=
EG_READ_COND_WAIT &lt;&lt; 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x8000000=
0 | (VCN_DEC_CMD_REG_READ_COND_WAIT &lt;&lt; 1));<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static void vcn_v2_0_dec_ring_emit_vm_flush(struct amdgpu_ring *ring,=
<br>
@@ -1629,7 &#43;1629,7 @@ static void vcn_v2_0_dec_ring_emit_wreg(struct am=
dgpu_ring *ring,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_W=
RITE_REG &lt;&lt; 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x8000000=
0 | (VCN_DEC_CMD_WRITE_REG &lt;&lt; 1));<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
@@ -2082,6 &#43;2082,36 @@ static int vcn_v2_0_process_interrupt(struct amd=
gpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;int vcn_v2_0_dec_ring_test_ring(struct amdgpu_ring *ring)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D ri=
ng-&gt;adev;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t tmp =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(adev-&gt;vcn.external.scra=
tch9, 0xCAFEDEAD);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ring_alloc(ring, 3);=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return r;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACKET0(a=
dev-&gt;vcn.internal.cmd, 0));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x8000000=
0 | (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACKET0(a=
dev-&gt;vcn.internal.scratch9, 0));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0xDEADBEE=
F);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_commit(ring);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-&gt;use=
c_timeout; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; tmp =3D RREG32(adev-&gt;vcn.external.scratch9);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (tmp =3D=3D 0xDEADBEEF)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_UDELAY(1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i &gt;=3D adev-&gt;usec_timeo=
ut)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; r =3D -ETIMEDOUT;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&#43;}<br>
&#43;<br>
&#43;<br>
&nbsp;static int vcn_v2_0_set_powergating_state(void *handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_powergating_state state)<br>
&nbsp;{<br>
@@ -2145,7 &#43;2175,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_de=
c_ring_vm_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emit_ib =3D vcn_v2_0_dec_=
ring_emit_ib,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emit_fence =3D vcn_v2_0_d=
ec_ring_emit_fence,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emit_vm_flush =3D vcn_v2_=
0_dec_ring_emit_vm_flush,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .test_ring =3D amdgpu_vcn_dec_ring_te=
st_ring,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .test_ring =3D vcn_v2_0_dec_ring_=
test_ring,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .test_ib =3D amdgpu_vcn_de=
c_ring_test_ib,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .insert_nop =3D vcn_v2_0_d=
ec_ring_insert_nop,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .insert_start =3D vcn_v2_0=
_dec_ring_insert_start,<br>
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

--_000_DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60DM5PR12MB2456namp_--

--===============1077557585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1077557585==--
