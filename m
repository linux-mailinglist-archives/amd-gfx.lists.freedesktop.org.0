Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E767F0D4A
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Nov 2019 04:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2766E150;
	Wed,  6 Nov 2019 03:49:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800053.outbound.protection.outlook.com [40.107.80.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C666E150
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Nov 2019 03:49:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur6u80/Xa8LCA/xj0L5KDyf2xH3Ru4T3rznLTUF2nkv4qUCDfipozCHPXjORsDHaL4LwkHu+0xhW+hQwHYbCBZiV+gHhPWyUVwckeFEtQCCsyomPajRNjNTkEXwLHPD+gLd9BQz84YzyFMGW3lwzacE3vO5Q2hbj939fZENNtLutDBSBrtiQ1xyo79VCY2MOjg5Hy9QA6Jee9zV527QtvP+lgkTM70PZMJdL8OipSds4BjzP1cDZyM0+psiIZubnnui49ocSmVwAK+LANn/iFz9Eo1y0vkksmeJQT3Hn2qUCUbOSA9FD6fR8mf6esramLycDdO1Dj67QEeqHRVoYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx7s8PvaUqtGzR68s0xOK90gy2Ly9j6n8ZkT9eCK8M0=;
 b=kriPSXdxuragxUb+fm6o8RV6iisldKm+4yIlNYc9x2dxDGwQg+clqJRRyP6Uw7G7PfNrjxU7Sdxr1BxqOp8FG2zXP/DpSoTMyvExEdoFYdck8SN/DnbhgsOnvGYLc942BDvSEqjyJGfLNYCYmfTn89H+P0uEk8BOcProbysopoKdUIT+BU+ZQPnyuejh/6DKad2j3KWPUwtxbBGvjQ5lNjj7XQnG963076y4NRmej1no11hw2O/aIiJ6qDev+D0N+E5iPlzE3XTgyrSuQvd+F4stg7uLeyaGUj208rEDnWOByUoej9eID8akWd+UC/uqg0n8HE1+sJRgS1qbIDADSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3878.namprd12.prod.outlook.com (52.132.245.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 03:49:06 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::4403:1c3c:efc8:6155]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::4403:1c3c:efc8:6155%3]) with mapi id 15.20.2408.025; Wed, 6 Nov 2019
 03:49:06 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Strawbridge, Michael"
 <Michael.Strawbridge@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole
 hive initialized
Thread-Topic: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole
 hive initialized
Thread-Index: AQHVk8MYT24KBLC33UeKj0lVihThZKd8xQIwgAACsgCAAABkwIAAAvbAgACcvlCAABA+AIAACeQA
Date: Wed, 6 Nov 2019 03:49:06 +0000
Message-ID: <CH2PR12MB3831E6D9F295D7E03C2F5BE385790@CH2PR12MB3831.namprd12.prod.outlook.com>
References: <20191105102310.16657-1-evan.quan@amd.com>
 <20191105102310.16657-2-evan.quan@amd.com>,
 <CH2PR12MB3831CEABDD4CBA2FEB8DEFEB857E0@CH2PR12MB3831.namprd12.prod.outlook.com>
 <DM5PR12MB248696FDB2D0E563221E7CDFE87E0@DM5PR12MB2486.namprd12.prod.outlook.com>
 <CH2PR12MB3831D16D352FA009002800CC857E0@CH2PR12MB3831.namprd12.prod.outlook.com>
 <CH2PR12MB3831868F2A7B4A8BCCBA24F7857E0@CH2PR12MB3831.namprd12.prod.outlook.com>
 <CH2PR12MB383150DB7FA13B7E5472A37085790@CH2PR12MB3831.namprd12.prod.outlook.com>
 <MN2PR12MB3344BF9A70FE63F2D5E4AE63E4790@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344BF9A70FE63F2D5E4AE63E4790@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:79f:f665:a0a0:3c13:f4f1:bd3e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b31c1187-3367-45c0-71dd-08d7626c45c8
x-ms-traffictypediagnostic: CH2PR12MB3878:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB38786C3F49802C9E299A28F885790@CH2PR12MB3878.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(13464003)(199004)(189003)(606006)(6506007)(6436002)(316002)(110136005)(966005)(6246003)(186003)(478600001)(2501003)(14454004)(446003)(71190400001)(21615005)(11346002)(86362001)(71200400001)(8936002)(46003)(486006)(74316002)(7736002)(8676002)(81166006)(476003)(25786009)(81156014)(52536014)(7696005)(5660300002)(6306002)(76176011)(53546011)(99286004)(256004)(14444005)(102836004)(33656002)(6116002)(790700001)(2906002)(66446008)(66946007)(64756008)(236005)(66476007)(66556008)(229853002)(9686003)(55016002)(76116006)(54896002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3878;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LHjf/woKJd6Ztv+4lU6652xt4h+5nsOCnV+nWnJmjH774ajF20irm3UW6FvmQV5DuncJdqF1Oyk7Q6krA3LEeE7dU6QrDsGGjwlzP3T5iZtakhHNKXn0PqXACk6bUiF+mnzzgIwfI8jfDeceLZhBzeuSqALKkXKStb74ZD+OqWpdPMgw07Av+kUysHJaOJHTj1TwFzaNdFUPoShNy23Mi/qKObKEF1M7q3CdAGTBUcjmvy12AdBpDvSVkoCP7K9pCU7FOQu7pHKO6TVY/nWseNZ6vh7x+txd/q3Dm2jsAiK8wl5bQ4U1liRbBDSM+Q8oBU9vZnPxSf2owXfaEOwrQVmXNTlRlPYR/fpVR7xk2yXv836u46s7Pf56XrEYh32/KTYJ44f65sYOgWZNhIlovsl4rlk3GpdOIrxvJrLpn5KFI/FqRGGX3jGmr2HtP5mbudV3TBUpZtyeRVJCPQlDq169veBVY38kSA0Xchqs7co=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31c1187-3367-45c0-71dd-08d7626c45c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 03:49:06.1269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/P027yjZXctqWWohAMOhObp6JNn8uSCmd6NdhmrX75PTWJKlOSMoWmjGZ/EbP+l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx7s8PvaUqtGzR68s0xOK90gy2Ly9j6n8ZkT9eCK8M0=;
 b=JqU2JV6NRFG4JFQpHNMxJ7zuz+9+zr8oWfbrBuzIV71TpDt/7dMILHbTC3HwkSwniaUGAZoJ6ipbnHMl7VQ/IP0CBu2m9U5i0AoqKHvfDif4iQAFx/iI+8t1EcXg5G7zv+n5BQw5CUMQhLawwnRui9aCwVi21sWhfzq8HbFN1LE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1040984902=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1040984902==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB3831E6D9F295D7E03C2F5BE385790CH2PR12MB3831namp_"

--_000_CH2PR12MB3831E6D9F295D7E03C2F5BE385790CH2PR12MB3831namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No problem.  With the incoming patch referenced below, this patch should be=
 ok since it doesn't break the build.

Reviewed-by:  Jonathan Kim <Jonathan.Kim@amd.com>

From: Quan, Evan <Evan.Quan@amd.com>
Sent: Tuesday, November 5, 2019 10:11 PM
To: Kim, Jonathan <Jonathan.Kim@amd.com>; Strawbridge, Michael <Michael.Str=
awbridge@amd.com>; amd-gfx@lists.freedesktop.org
Subject: RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole=
 hive initialized

Thanks Jon.
Per discussed in another mail thread, this should be applied after the patc=
h below
https://lists.freedesktop.org/archives/amd-gfx/2019-November/042160.html
Sorry for missing this important information.

Regards,
Evan
From: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>
Sent: Wednesday, November 6, 2019 10:18 AM
To: Strawbridge, Michael <Michael.Strawbridge@amd.com<mailto:Michael.Strawb=
ridge@amd.com>>; Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; =
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole=
 hive initialized

Taking a look at this again, it's not an indexing issue, it's a placement p=
roblem.  I don't think this solution will work if we expect to pstate switc=
h all gpus.

From amdgpu_kms.c,  amdgpu_register_gpu_instance comes after amdgpu_device_=
init.  This means we'll never reach mgpu_info.num_gpu =3D=3D adev->gmc.xgmi=
.num_physical_nodes until in this code path.

From: Kim, Jonathan
Sent: Tuesday, November 5, 2019 12:07 PM
To: Strawbridge, Michael <Michael.Strawbridge@amd.com<mailto:Michael.Strawb=
ridge@amd.com>>; Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; =
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole=
 hive initialized

+                       for (i =3D 0; i < mgpu_info.num_gpu; i++) {
Also while num_physical_nodes should be used here instead.  It doesn't make=
 sense to have a pre-condition check i.e. (if (mgpu_info.num_dgpu =3D=3D ad=
ev->gmc.xgmi.num_physical_nodes - 1) ) against the total number of nodes wh=
ile the loop checks for the current num gpus from mgpu_info.  This will fai=
l to set the last node to low pstate for the same 0-indexing issue once the=
 pre-condition passes.

+                               gpu_instance =3D &(mgpu_info.gpu_ins[i]);
+                               if (gpu_instance->adev->flags & AMD_IS_APU)
+                                       continue;
+

From: Kim, Jonathan
Sent: Tuesday, November 5, 2019 11:42 AM
To: Strawbridge, Michael <Michael.Strawbridge@amd.com<mailto:Michael.Strawb=
ridge@amd.com>>; Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; =
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole=
 hive initialized

Yes that's correct.  This should fix the issue.

Jon

From: Strawbridge, Michael <Michael.Strawbridge@amd.com<mailto:Michael.Stra=
wbridge@amd.com>>
Sent: Tuesday, November 5, 2019 11:40 AM
To: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>; Quan=
, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists.freedes=
ktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole=
 hive initialized

Hi Jon,

Does that mean we can simply use this instead?

+               if (mgpu_info.num_dgpu =3D=3D adev->gmc.xgmi.num_physical_n=
odes - 1) {

Thanks,
Michael
________________________________
From: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>
Sent: 05 November 2019 11:32 AM
To: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freed=
esktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Strawbridge, Michael <Michael.Strawbridge@amd.com<mailto:Michael.Strawb=
ridge@amd.com>>
Subject: RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole=
 hive initialized

Please see inline.

Jon

-----Original Message-----
From: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Sent: Tuesday, November 5, 2019 5:24 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>; Stra=
wbridge, Michael <Michael.Strawbridge@amd.com<mailto:Michael.Strawbridge@am=
d.com>>; Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole hiv=
e initialized

P-state switch should be performed after all devices from the hive get init=
ialized.

Change-Id: Ifc7cac9ef0cf250447d2a412da35d601e2ac79ec
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 47 ++++++++++++++++------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index e6ce949670e5..2d72d206cead 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2090,6 +2090,7 @@ static int amdgpu_device_enable_mgpu_fan_boost(void)
  */
 static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)  {
+       struct amdgpu_gpu_instance *gpu_instance;
         int i =3D 0, r;

         for (i =3D 0; i < adev->num_ip_blocks; i++) { @@ -2115,6 +2116,40 =
@@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
         if (r)
                 DRM_ERROR("enable mgpu fan boost failed (%d).\n", r);

+
+       if (adev->gmc.xgmi.num_physical_nodes > 1) {
+               mutex_lock(&mgpu_info.mutex);
+
+               /*
+                * Reset device p-state to low as this was booted with high=
.
+                *
+                * This should be performed only after all devices from the=
 same
+                * hive get initialized.
+                *
+                * However, it's unknown how many device in the hive in adv=
ance.
+                * As this is counted one by one during devices initializat=
ions.
+                *
+                * So, we wait for all XGMI interlinked devices initialized=
.
+                * This may bring some delays as those devices may come fro=
m
+                * different hives. But that should be OK.
+                */
+               if (mgpu_info.num_dgpu =3D=3D adev->gmc.xgmi.num_physical_n=
odes) {
[JK] This condition will never succeed.  mgpu_info.num_dgpu is 0-indexed wh=
ile num_physical_nodes give total nodes.

+                       for (i =3D 0; i < mgpu_info.num_gpu; i++) {
+                               gpu_instance =3D &(mgpu_info.gpu_ins[i]);
+                               if (gpu_instance->adev->flags & AMD_IS_APU)
+                                       continue;
+
+                               r =3D amdgpu_xgmi_set_pstate(gpu_instance->=
adev, 0);
+                               if (r) {
+                                       DRM_ERROR("pstate setting failed (%=
d).\n", r);
+                                       break;
+                               }
+                       }
+               }
+
+               mutex_unlock(&mgpu_info.mutex);
+       }
+
         return 0;
 }

@@ -2227,18 +2262,6 @@ static void amdgpu_device_delayed_init_work_handler(=
struct work_struct *work)
         r =3D amdgpu_ib_ring_tests(adev);
         if (r)
                 DRM_ERROR("ib ring test failed (%d).\n", r);
-
-       /*
-        * set to low pstate by default
-        * This should be performed after all devices from
-        * XGMI finish their initializations. Thus it's moved
-        * to here.
-        * The time delay is 2S. TODO: confirm whether that
-        * is enough for all possible XGMI setups.
-        */
-       r =3D amdgpu_xgmi_set_pstate(adev, 0);
-       if (r)
-               DRM_ERROR("pstate setting failed (%d).\n", r);
 }

 static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
--
2.23.0

--_000_CH2PR12MB3831E6D9F295D7E03C2F5BE385790CH2PR12MB3831namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle23
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle24
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">No problem. &nbsp;With the incoming patch referenced=
 below, this patch should be ok since it doesn&#8217;t break the build.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Reviewed-by:&nbsp; Jonathan Kim &lt;Jonathan.Kim@amd=
.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt; <b=
r>
<b>Sent:</b> Tuesday, November 5, 2019 10:11 PM<br>
<b>To:</b> Kim, Jonathan &lt;Jonathan.Kim@amd.com&gt;; Strawbridge, Michael=
 &lt;Michael.Strawbridge@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after th=
e whole hive initialized<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks Jon.<o:p></o:p></p>
<p class=3D"MsoNormal">Per discussed in another mail thread, this should be=
 applied after the patch below<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lists.freedesktop.org/archives/am=
d-gfx/2019-November/042160.html">https://lists.freedesktop.org/archives/amd=
-gfx/2019-November/042160.html</a><o:p></o:p></p>
<p class=3D"MsoNormal">Sorry for missing this important information.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Kim, Jonathan &lt;<a href=3D"mailto:Jon=
athan.Kim@amd.com">Jonathan.Kim@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, November 6, 2019 10:18 AM<br>
<b>To:</b> Strawbridge, Michael &lt;<a href=3D"mailto:Michael.Strawbridge@a=
md.com">Michael.Strawbridge@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mail=
to:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after th=
e whole hive initialized<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Taking a look at this again, it&#8217;s not an index=
ing issue, it&#8217;s a placement problem. &nbsp;I don&#8217;t think this s=
olution will work if we expect to pstate switch all gpus.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From amdgpu_kms.c,&nbsp; amdgpu_register_gpu_instanc=
e comes after amdgpu_device_init.&nbsp; This means we&#8217;ll never reach =
mgpu_info.num_gpu =3D=3D adev-&gt;gmc.xgmi.num_physical_nodes until in this=
 code path.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Kim, Jonathan <br>
<b>Sent:</b> Tuesday, November 5, 2019 12:07 PM<br>
<b>To:</b> Strawbridge, Michael &lt;<a href=3D"mailto:Michael.Strawbridge@a=
md.com">Michael.Strawbridge@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mail=
to:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after th=
e whole hive initialized<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; mgpu_info.num_gpu; i&#43;&#43;) {<o:p></o:p=
></p>
<p class=3D"MsoNormal">Also while num_physical_nodes should be used here in=
stead.&nbsp; It doesn&#8217;t make sense to have a pre-condition check i.e.=
 (<span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:black;ba=
ckground:white">if (mgpu_info.num_dgpu =3D=3D adev-&gt;gmc.xgmi.num_physica=
l_nodes<b>
 - 1</b>) ) </span>against the total number of nodes while the loop checks =
for the current num gpus from mgpu_info.&nbsp; This will fail to set the la=
st node to low pstate for the same 0-indexing issue once the pre-condition =
passes.
<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpu_instance =3D &amp;(mgpu_info.gpu_in=
s[i]);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gpu_instance-&gt;adev-&gt;flags &am=
p; AMD_IS_APU)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; continue;<br>
&#43;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Kim, Jonathan <br>
<b>Sent:</b> Tuesday, November 5, 2019 11:42 AM<br>
<b>To:</b> Strawbridge, Michael &lt;<a href=3D"mailto:Michael.Strawbridge@a=
md.com">Michael.Strawbridge@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mail=
to:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after th=
e whole hive initialized<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Yes that&#8217;s correct.&nbsp; This should fix the =
issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jon<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Strawbridge, Michael &lt;<a href=3D"mai=
lto:Michael.Strawbridge@amd.com">Michael.Strawbridge@amd.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, November 5, 2019 11:40 AM<br>
<b>To:</b> Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.com">Jonath=
an.Kim@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com"=
>Evan.Quan@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amdgpu: perform p-state switch after th=
e whole hive initialized<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Hi Jon,=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Does th=
at mean we can simply use this instead?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:black;background:white">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mgpu_info.num_dgpu =
=3D=3D adev-&gt;gmc.xgmi.num_physical_nodes<b> - 1</b>) {</span><span style=
=3D"font-size:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Thanks,<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Michael=
<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Kim, Jonathan &lt;</span><a href=3D"mailto:Jonathan=
.Kim@amd.com">Jonathan.Kim@amd.com</a><span style=3D"color:black">&gt;<br>
<b>Sent:</b> 05 November 2019 11:32 AM<br>
<b>To:</b> Quan, Evan &lt;</span><a href=3D"mailto:Evan.Quan@amd.com">Evan.=
Quan@amd.com</a><span style=3D"color:black">&gt;;
</span><a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freed=
esktop.org</a><span style=3D"color:black"> &lt;</span><a href=3D"mailto:amd=
-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><span style=3D=
"color:black">&gt;<br>
<b>Cc:</b> Strawbridge, Michael &lt;</span><a href=3D"mailto:Michael.Strawb=
ridge@amd.com">Michael.Strawbridge@amd.com</a><span style=3D"color:black">&=
gt;<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amdgpu: perform p-state switch after th=
e whole hive initialized</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Please see inline.<br=
>
<br>
Jon<br>
<br>
-----Original Message-----<br>
From: Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@amd.com=
</a>&gt; <br>
Sent: Tuesday, November 5, 2019 5:24 AM<br>
To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesk=
top.org</a><br>
Cc: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.com">Jonathan.Kim@=
amd.com</a>&gt;; Strawbridge, Michael &lt;<a href=3D"mailto:Michael.Strawbr=
idge@amd.com">Michael.Strawbridge@amd.com</a>&gt;; Quan, Evan &lt;<a href=
=3D"mailto:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;<br>
Subject: [PATCH 2/2] drm/amdgpu: perform p-state switch after the whole hiv=
e initialized<br>
<br>
P-state switch should be performed after all devices from the hive get init=
ialized.<br>
<br>
Change-Id: Ifc7cac9ef0cf250447d2a412da35d601e2ac79ec<br>
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 47 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------<br>
&nbsp;1 file changed, 35 insertions(&#43;), 12 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index e6ce949670e5..2d72d206cead 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -2090,6 &#43;2090,7 @@ static int amdgpu_device_enable_mgpu_fan_boost(vo=
id)<br>
&nbsp; */<br>
&nbsp;static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)&nbs=
p; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_gpu_instance *gpu_i=
nstance;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0, r;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-=
&gt;num_ip_blocks; i&#43;&#43;) { @@ -2115,6 &#43;2116,40 @@ static int amd=
gpu_device_ip_late_init(struct amdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;enable mgpu fan boost failed (%d).\n&=
quot;, r);<br>
&nbsp;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gmc.xgmi.num_physica=
l_nodes &gt; 1) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mutex_lock(&amp;mgpu_info.mutex);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /*<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * Reset device p-state to low as this was booted with =
high.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * This should be performed only after all devices from=
 the same<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * hive get initialized.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * However, it's unknown how many device in the hive in=
 advance.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * As this is counted one by one during devices initial=
izations.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * So, we wait for all XGMI interlinked devices initial=
ized.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * This may bring some delays as those devices may come=
 from<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * different hives. But that should be OK.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (mgpu_info.num_dgpu =3D=3D adev-&gt;gmc.xgmi.num_physical=
_nodes) {<br>
[JK] This condition will never succeed.&nbsp; mgpu_info.num_dgpu is 0-index=
ed while num_physical_nodes give total nodes.<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0=
; i &lt; mgpu_info.num_gpu; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpu_instance =3D &amp;(mgpu_info.gpu_in=
s[i]);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gpu_instance-&gt;adev-&gt;flags &am=
p; AMD_IS_APU)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; continue;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_xgmi_set_pstate(gpu_instan=
ce-&gt;adev, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; DRM_ERROR(&quot;pstate setting failed (%d).\n&quot;, r);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mutex_unlock(&amp;mgpu_info.mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
@@ -2227,18 &#43;2262,6 @@ static void amdgpu_device_delayed_init_work_hand=
ler(struct work_struct *work)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ib_ring_tests=
(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;ib ring test failed (%d).\n&quot;, r)=
;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * set to low pstate by default<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This should be performed afte=
r all devices from<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * XGMI finish their initializat=
ions. Thus it's moved<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to here.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The time delay is 2S. TODO: c=
onfirm whether that<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is enough for all possible XG=
MI setups.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_xgmi_set_pstate(adev, 0)=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_ERROR(&quot;pstate setting failed (%d).\n&quot;, r);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static void amdgpu_device_delay_enable_gfx_off(struct work_struct *wo=
rk)<br>
--<br>
2.23.0<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CH2PR12MB3831E6D9F295D7E03C2F5BE385790CH2PR12MB3831namp_--

--===============1040984902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1040984902==--
