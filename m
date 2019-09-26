Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C2DBEDE2
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1959C6EE8C;
	Thu, 26 Sep 2019 08:54:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7291F6EE8C
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCGnrooboy3MNtB+PNUvfR2lacqiuqujeSypkEwCH234Luskq1BJhwUDhS6JupTHeY6eqRbf+EDSYVQTConNtPPVtOXKaJByNUo5TGiDgoSybD0k9zax9Nm0By/nYJkK2pipaQEsh+z/1n2xMN9KnGwzhh5DMqPy28//rd8mvyM3lBmezHNADwF/0wqaz5jLNi22VHeT6d4QDZ1wWoM123zmRezdeyWxAFMf9Q8nJCZpOcXLAwCwwNX+V9CAcxS0DEdqlH5yBmprgtAbzJRKlVjol+ADq7h4+9jCnkTpLocKPpUU1RZyckJXuKus4+hvZMIRt1IF6EEtrgexLSa6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSWPo5c92P47yy0ngK6uT8wwt+XvWjmYDaHU9QtABFo=;
 b=Vjk+YmAGru2QoqhDm9+iASp3N4FA7hJ2+F/kUMSeft0H4LZyR4aSClGq4ux01gzfXv2d11/lDTxvnK72afa2m/Gi0GQseHdOPQPzV/sJknQfIrxH7648t2rbI5l5aPZe+jR45VjbfzuEKUQFmQO3vlsxVxKrl7QxVRK2QReJyROfKcHW8An6nBzuzQlItQ1WLMi1LRkFKOcUQkl4E4nGul9mrIdjD0fkn6OXrLLapv/4tk0CStC0kjq2RWjEKCHZ0LwAuU1eLISXgH9/cFe5Rq02Fp1Va5gGXnvxPoF0Dijt47Cxk3tZY2lKTT+BGsQhTgT5V/uLzvTkE/zigIA0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 08:54:05 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 08:54:05 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: add IH cg support on soc15 project
Thread-Topic: [PATCH] drm/amd/amdgpu: add IH cg support on soc15 project
Thread-Index: AQHVdEcU/2qeYXHQjE2u5KMorxj9cKc9pzcU
Date: Thu, 26 Sep 2019 08:54:04 +0000
Message-ID: <MN2PR12MB329667CC068A0E76AE17E199A2860@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569487656-24977-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1569487656-24977-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21c108db-83c7-413c-4ecf-08d7425f15d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3710; 
x-ms-traffictypediagnostic: MN2PR12MB3710:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB37102BB2FD8C9605DDC29D3DA2860@MN2PR12MB3710.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:238;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(199004)(189003)(91956017)(606006)(66946007)(19627405001)(8936002)(33656002)(102836004)(26005)(14454004)(8676002)(14444005)(105004)(476003)(81156014)(81166006)(446003)(256004)(7736002)(74316002)(11346002)(486006)(478600001)(7696005)(76176011)(53546011)(5660300002)(229853002)(99286004)(6116002)(3846002)(2501003)(76116006)(966005)(52536014)(55016002)(6506007)(86362001)(6436002)(9686003)(110136005)(186003)(2906002)(236005)(6246003)(6306002)(316002)(54896002)(66066001)(66556008)(25786009)(64756008)(66476007)(71200400001)(71190400001)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3710;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WhwVFtzfq0n3iVIhQl4z1MZESh/ciNOORAchWAOF22yUPS7IvY2Amrva5xikyAewH9ySqxZidOwFlceml8rXXMr1of29jYAPAsttPlN1+hsXRtCgPSwB0osM0EpI3LrlNnU9cD/13vcrq7Y23gq4qs7t+jfH8rbZGXx+mWpOTtNxLM8cBBr1hDAtU4T30d7ZWsHXsAPcvJXfu7DPeTELbXf9ifRvNP+H9pgyphDqKgPTjDrX4i5dyq653jHYhCR9qNrlsbT2eeH6F1YmrJ4o75kcTag/wVcmzR2oJYCRaNoSBgXEoYXQm3uHJFyhVyzV7aCWh0UmLJa/6ltWwU2w8ZbYO6PG5txdid2lmj6fZ7NRLyPKnnVrakCdgbcYvAIA4dwXrWAintwYUt6Fb6wXy8J2SIERxyQ5+durDgqISeFkFClwQR4EmufDfkVr/jggmXvoAOfiV61+AItKFTW/ZQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c108db-83c7-413c-4ecf-08d7425f15d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:54:04.9899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CA4Dye+XS08vlSK9kkoNfSv3qJf+2/RhqMUeK2pCxLVTz4XTkeyw6wWTxCB2GLuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSWPo5c92P47yy0ngK6uT8wwt+XvWjmYDaHU9QtABFo=;
 b=XJhwucZmHJG/+ULL/gBxQW/5ognvTyOIGN9CuGzfSCuLgPx4sspCDmY8By5fAJ3zTAwktTo0FG5uXwTz3TRjCGvorIcrjDgr0OEqFYDIKwkRQZgzI8I1A3cnjWAOA1gKkojpqxIrSWHFpIUMRMqStMydfrVJquLGcFb8MoTyQik=
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
Content-Type: multipart/mixed; boundary="===============0993931912=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0993931912==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329667CC068A0E76AE17E199A2860MN2PR12MB3296namp_"

--_000_MN2PR12MB329667CC068A0E76AE17E199A2860MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kenneth =
Feng <kenneth.feng@amd.com>
Sent: Thursday, September 26, 2019 4:47 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: [PATCH] drm/amd/amdgpu: add IH cg support on soc15 project

enable/disable IH clock gating on soc15 projects.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  3 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             | 39 ++++++++++++++++++=
++++
 .../amd/include/asic_reg/oss/osssys_4_0_sh_mask.h  |  4 +++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index 58818761..e40410e 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1166,7 +1166,8 @@ static int soc15_common_early_init(void *handle)
                         AMD_CG_SUPPORT_SDMA_MGCG |
                         AMD_CG_SUPPORT_SDMA_LS |
                         AMD_CG_SUPPORT_MC_MGCG |
-                       AMD_CG_SUPPORT_MC_LS;
+                       AMD_CG_SUPPORT_MC_LS |
+                       AMD_CG_SUPPORT_IH_CG;
                 adev->pg_flags =3D 0;
                 adev->external_rev_id =3D adev->rev_id + 0x32;
                 break;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/vega10_ih.c
index 14e0b04..5cb7e23 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -675,10 +675,49 @@ static int vega10_ih_soft_reset(void *handle)
         return 0;
 }

+static void vega10_ih_update_clockgating_state(struct amdgpu_device *adev,
+                                              bool enable)
+{
+       uint32_t data, def, field_val;
+
+       if (adev->cg_flags & AMD_CG_SUPPORT_IH_CG) {
+               def =3D data =3D RREG32_SOC15(OSSSYS, 0, mmIH_CLK_CTRL);
+               field_val =3D enable ? 0 : 1;
+               /**
+                * Vega10 does not have IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERR=
IDE
+                * and IH_BUFFER_MEM_CLK_SOFT_OVERRIDE field.
+                */
+               if (adev->asic_type > CHIP_VEGA10) {
+                       data =3D REG_SET_FIELD(data, IH_CLK_CTRL,
+                                    IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERRIDE=
, field_val);
+                       data =3D REG_SET_FIELD(data, IH_CLK_CTRL,
+                                    IH_BUFFER_MEM_CLK_SOFT_OVERRIDE, field=
_val);
+               }
+
+               data =3D REG_SET_FIELD(data, IH_CLK_CTRL,
+                                    DBUS_MUX_CLK_SOFT_OVERRIDE, field_val)=
;
+               data =3D REG_SET_FIELD(data, IH_CLK_CTRL,
+                                    OSSSYS_SHARE_CLK_SOFT_OVERRIDE, field_=
val);
+               data =3D REG_SET_FIELD(data, IH_CLK_CTRL,
+                                    LIMIT_SMN_CLK_SOFT_OVERRIDE, field_val=
);
+               data =3D REG_SET_FIELD(data, IH_CLK_CTRL,
+                                    DYN_CLK_SOFT_OVERRIDE, field_val);
+               data =3D REG_SET_FIELD(data, IH_CLK_CTRL,
+                                    REG_CLK_SOFT_OVERRIDE, field_val);
+               if (def !=3D data)
+                       WREG32_SOC15(OSSSYS, 0, mmIH_CLK_CTRL, data);
+       }
+}
+
 static int vega10_ih_set_clockgating_state(void *handle,
                                           enum amd_clockgating_state state=
)
 {
+       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
+
+       vega10_ih_update_clockgating_state(adev,
+                               state =3D=3D AMD_CG_STATE_GATE ? true : fal=
se);
         return 0;
+
 }

 static int vega10_ih_set_powergating_state(void *handle,
diff --git a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h =
b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h
index dc9895a..096d878 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h
@@ -588,11 +588,15 @@
 #define IH_STORM_CLIENT_LIST_CNTL__CLIENT30_IS_STORM_CLIENT_MASK          =
                                    0x40000000L
 #define IH_STORM_CLIENT_LIST_CNTL__CLIENT31_IS_STORM_CLIENT_MASK          =
                                    0x80000000L
 //IH_CLK_CTRL
+#define IH_CLK_CTRL__IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERRIDE__SHIFT        =
                                     0x19
+#define IH_CLK_CTRL__IH_BUFFER_MEM_CLK_SOFT_OVERRIDE__SHIFT               =
                                                0x1a
 #define IH_CLK_CTRL__DBUS_MUX_CLK_SOFT_OVERRIDE__SHIFT                    =
                                    0x1b
 #define IH_CLK_CTRL__OSSSYS_SHARE_CLK_SOFT_OVERRIDE__SHIFT                =
                                    0x1c
 #define IH_CLK_CTRL__LIMIT_SMN_CLK_SOFT_OVERRIDE__SHIFT                   =
                                    0x1d
 #define IH_CLK_CTRL__DYN_CLK_SOFT_OVERRIDE__SHIFT                         =
                                    0x1e
 #define IH_CLK_CTRL__REG_CLK_SOFT_OVERRIDE__SHIFT                         =
                                    0x1f
+#define IH_CLK_CTRL__IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERRIDE_MASK          =
                                    0x02000000L
+#define IH_CLK_CTRL__IH_BUFFER_MEM_CLK_SOFT_OVERRIDE_MASK                 =
                                        0x04000000L
 #define IH_CLK_CTRL__DBUS_MUX_CLK_SOFT_OVERRIDE_MASK                      =
                                    0x08000000L
 #define IH_CLK_CTRL__OSSSYS_SHARE_CLK_SOFT_OVERRIDE_MASK                  =
                                    0x10000000L
 #define IH_CLK_CTRL__LIMIT_SMN_CLK_SOFT_OVERRIDE_MASK                     =
                                    0x20000000L
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB329667CC068A0E76AE17E199A2860MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
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
ounces@lists.freedesktop.org&gt; on behalf of Kenneth Feng &lt;kenneth.feng=
@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 4:47 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/amdgpu: add IH cg support on soc15 project<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">enable/disable IH clock gating on soc15 projects.<=
br>
<br>
Signed-off-by: Kenneth Feng &lt;kenneth.feng@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#4=
3;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vega10_ih.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 39 &#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&nbsp;.../amd/include/asic_reg/oss/osssys_4_0_sh_mask.h&nbsp; |&nbsp; 4 &#4=
3;&#43;&#43;<br>
&nbsp;3 files changed, 45 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index 58818761..e40410e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -1166,7 &#43;1166,8 @@ static int soc15_common_early_init(void *handle)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_SDMA_MGCG |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_SDMA_LS |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_MC_MGCG |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPORT_M=
C_LS;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPO=
RT_MC_LS |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPO=
RT_IH_CG;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;pg_flags =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;external_rev_id =3D adev-&gt;rev_id &#43; 0x=
32;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/vega10_ih.c<br>
index 14e0b04..5cb7e23 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c<br>
@@ -675,10 &#43;675,49 @@ static int vega10_ih_soft_reset(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static void vega10_ih_update_clockgating_state(struct amdgpu_device *a=
dev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool enable)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t data, def, field_val;<br=
>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;cg_flags &amp; AMD_C=
G_SUPPORT_IH_CG) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; def =3D data =3D RREG32_SOC15(OSSSYS, 0, mmIH_CLK_CTRL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; field_val =3D enable ? 0 : 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /**<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * Vega10 does not have IH_RETRY_INT_CAM_MEM_CLK_SOFT_O=
VERRIDE<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * and IH_BUFFER_MEM_CLK_SOFT_OVERRIDE field.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;asic_type &gt; CHIP_VEGA10) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D REG=
_SET_FIELD(data, IH_CLK_CTRL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IH_RETRY_=
INT_CAM_MEM_CLK_SOFT_OVERRIDE, field_val);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D REG=
_SET_FIELD(data, IH_CLK_CTRL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IH_BUFFER=
_MEM_CLK_SOFT_OVERRIDE, field_val);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data =3D REG_SET_FIELD(data, IH_CLK_CTRL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBUS_MUX_=
CLK_SOFT_OVERRIDE, field_val);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data =3D REG_SET_FIELD(data, IH_CLK_CTRL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OSSSYS_SH=
ARE_CLK_SOFT_OVERRIDE, field_val);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data =3D REG_SET_FIELD(data, IH_CLK_CTRL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIMIT_SMN=
_CLK_SOFT_OVERRIDE, field_val);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data =3D REG_SET_FIELD(data, IH_CLK_CTRL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DYN_CLK_S=
OFT_OVERRIDE, field_val);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data =3D REG_SET_FIELD(data, IH_CLK_CTRL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_CLK_S=
OFT_OVERRIDE, field_val);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (def !=3D data)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15=
(OSSSYS, 0, mmIH_CLK_CTRL, data);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;}<br>
&#43;<br>
&nbsp;static int vega10_ih_set_clockgating_state(void *handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_clockgating_state state)<br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (s=
truct amdgpu_device *)handle;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vega10_ih_update_clockgating_stat=
e(adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state =3D=3D AMD_CG_STATE_GATE ? true :=
 false);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int vega10_ih_set_powergating_state(void *handle,<br>
diff --git a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h =
b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h<br>
index dc9895a..096d878 100644<br>
--- a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_ma=
sk.h<br>
@@ -588,11 &#43;588,15 @@<br>
&nbsp;#define IH_STORM_CLIENT_LIST_CNTL__CLIENT30_IS_STORM_CLIENT_MASK&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x40000000L<br>
&nbsp;#define IH_STORM_CLIENT_LIST_CNTL__CLIENT31_IS_STORM_CLIENT_MASK&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80000000L<br>
&nbsp;//IH_CLK_CTRL<br>
&#43;#define IH_CLK_CTRL__IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERRIDE__SHIFT&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x19<br>
&#43;#define IH_CLK_CTRL__IH_BUFFER_MEM_CLK_SOFT_OVERRIDE__SHIFT&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1a<br>
&nbsp;#define IH_CLK_CTRL__DBUS_MUX_CLK_SOFT_OVERRIDE__SHIFT&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0x1b<br>
&nbsp;#define IH_CLK_CTRL__OSSSYS_SHARE_CLK_SOFT_OVERRIDE__SHIFT&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1c=
<br>
&nbsp;#define IH_CLK_CTRL__LIMIT_SMN_CLK_SOFT_OVERRIDE__SHIFT&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0x1d<br>
&nbsp;#define IH_CLK_CTRL__DYN_CLK_SOFT_OVERRIDE__SHIFT&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1e<br>
&nbsp;#define IH_CLK_CTRL__REG_CLK_SOFT_OVERRIDE__SHIFT&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1f<br>
&#43;#define IH_CLK_CTRL__IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERRIDE_MASK&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x02000000L<br>
&#43;#define IH_CLK_CTRL__IH_BUFFER_MEM_CLK_SOFT_OVERRIDE_MASK&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x04000000L<br>
&nbsp;#define IH_CLK_CTRL__DBUS_MUX_CLK_SOFT_OVERRIDE_MASK&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 0x08000000L<br>
&nbsp;#define IH_CLK_CTRL__OSSSYS_SHARE_CLK_SOFT_OVERRIDE_MASK&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 0x10000000L<br>
&nbsp;#define IH_CLK_CTRL__LIMIT_SMN_CLK_SOFT_OVERRIDE_MASK&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 0x20000000L<br>
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

--_000_MN2PR12MB329667CC068A0E76AE17E199A2860MN2PR12MB3296namp_--

--===============0993931912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0993931912==--
