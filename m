Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45E9A72E
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 07:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701566EBBA;
	Fri, 23 Aug 2019 05:38:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4890C89CDB
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 05:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLcDzZmMZsKLeW8sFi/kwe0OBjTjhRVHDsPMLFlle1wPhmtBIjbyiNxejWaXwlT6QPuTtAt9wbZu55z4tYagHYSVFjUaTCisJv1zmGcsX7nmSDazvseYW27sjUSyJEPSYhAM39UYJhd9IOIhDygf2uRo+GQejVD7nZPCJI6EXn8mHIwla7iefNFdFIJ9eFf6QJhMXkSD6LFFGH8ghHrbnE/acIj99J2oHRQbINQxEK8WG3iI07GWCOYgBRIcYns3tWrYkb5hpjTJGiS6SNRot1njcAOYqFcDpFe8xNdztgpNTZeIYMN23J7tNQJAanNGb8I9lIkcr0s1B42pH50TiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCg8O3dUgEN3YZHPOHjZpSt17boDko8dWrGSaIIivqA=;
 b=e5UgwG2qiiM5X39O41JGhUDOmUg+ww5C6ZEidLCY/lxwHZq3+Qz3ov8AzCFmgJPsOs/u2oFMfqEOChVZspiY0mqlBQzVWnBkdWWSgeNBiniIdfsV5yLPKFcRGhqmYP6sLbZfhztjpOhJryJLNBlAcvUmiHRB3UuXpwsTtmC6w+eEe6gojgjQQZU2USVsGwgodUK1GiBP1ffi3rCTxrrY+kAu7nEZT1vyFBG9vSOnPFqHGDKVT7b0gMka0dGdlgzINttoiDBPYhp2B+LPfB5375KvTQolKNSsZcL/D7J7sCScdLFEvLcwAm3AHOKJa54np78EtOQUDhOBBPpRnaGOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4064.namprd12.prod.outlook.com (52.135.48.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 05:38:29 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 05:38:29 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: update cached feature enablement
 status V2
Thread-Topic: [PATCH] drm/amd/powerplay: update cached feature enablement
 status V2
Thread-Index: AQHVWXPJ3igwnjMaREWZiIvuowS5m6cINq8w
Date: Fri, 23 Aug 2019 05:38:29 +0000
Message-ID: <MN2PR12MB3344F4BCEB15A0A817B9A6A0E4A40@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <MN2PR12MB32969ABC3F90939200C01E64A2A40@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB32969ABC3F90939200C01E64A2A40@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f79d918d-1d91-4c7f-b385-08d7278c20b4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4064; 
x-ms-traffictypediagnostic: MN2PR12MB4064:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4064BF0E4CD329466B26798DE4A40@MN2PR12MB4064.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(189003)(199004)(76116006)(2501003)(54896002)(9686003)(71200400001)(53936002)(102836004)(236005)(186003)(25786009)(71190400001)(6306002)(8676002)(81156014)(110136005)(81166006)(99286004)(8936002)(6246003)(55016002)(478600001)(229853002)(15650500001)(2420400007)(966005)(76176011)(606006)(486006)(790700001)(6116002)(53546011)(11346002)(3846002)(86362001)(446003)(33656002)(52536014)(64756008)(66556008)(66446008)(7696005)(66476007)(66066001)(66946007)(26005)(7736002)(316002)(256004)(6436002)(2906002)(5660300002)(14444005)(74316002)(14454004)(6506007)(7110500001)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4064;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lUaunR2MkGtGM7CMWOKcNNzqRC2TJAcZ1zR+cT9ODbUwFetzhJJUAaZy4KKVs4Gse/i/QLnk9GCZzvoY4cDRDDxtyGKipRvBiCe+H3Jj5q5la5GpcuYtFy6QnATV1Q+qVafNDJlIMpM9BAaqX3cPILDqWbm57HV/UrJrX054ONzc/gi5EYlWGHkk4aclQSrTeEXmKTaqRVsSm6Dh3bDcj8bM8qDl54BHwbVJPVyT421efYDASgTNxNxnnKIWQY66Qz6GKQ0QdZzdGvyHPXiGA4+Df6BHuOa0C8wPx3LxGtWXAl6RY43HDC6xpoL+rc4TtAn3DJLqVzPN7Y8y8UUCsvPCTOqBxKt3EBHtzU1xcH7Zn4MH0M6S/mmmaP5LMLQ0lxosyp9MiXqDk/6sRqiTvyf3QcajdpFoh5lAofX5uRs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79d918d-1d91-4c7f-b385-08d7278c20b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 05:38:29.2703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kuaWyJcXNPVm8aNCXrn2aKiTw9ANELAMEWB9XRR+/SAE5u8Ti4e85XUrhYC0tgh7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCg8O3dUgEN3YZHPOHjZpSt17boDko8dWrGSaIIivqA=;
 b=2r7QGQ3anAAjehGjmiWJeRJInoQeKhrXB4HU+Gi+wEoNABPfCsbSjyXTXllwpfDPWr7YCy9AcRqrUcezT+gZ5zSADELP4q6z0OA11AkJdK89WajWT8Eo+hk4cirZXqr0lWwbr7A+pBD6WhvOiCDWzs9BS0sf8EKC2SjZT4OR8j0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1577624429=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1577624429==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3344F4BCEB15A0A817B9A6A0E4A40MN2PR12MB3344namp_"

--_000_MN2PR12MB3344F4BCEB15A0A817B9A6A0E4A40MN2PR12MB3344namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

smu_feature_update_enable_state() is used only in amdgpu_smu.c.
As a common sense, these APIs should be declared as 'static'.

Regards,
Evan
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Friday, August 23, 2019 1:30 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/powerplay: update cached feature enablement st=
atus V2

comment inline
________________________________
From: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Sent: Friday, August 23, 2019 12:50 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>; am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@=
lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Subject: RE: [PATCH] drm/amd/powerplay: update cached feature enablement st=
atus V2


Comment inline



From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
Sent: Thursday, August 22, 2019 8:00 PM
To: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: update cached feature enablement st=
atus V2



comment inline.

________________________________

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Evan Quan <evan.quan@amd.com<mailto:e=
van.quan@amd.com>>
Sent: Thursday, August 22, 2019 6:18 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: [PATCH] drm/amd/powerplay: update cached feature enablement status=
 V2



Need to update in cache feature enablement status after pp_feature
settings. Another fix for the commit below:
drm/amd/powerplay: implment sysfs feature status function in smu

V2: update smu_feature_update_enable_state() and relates

Change-Id: I90e29b0d839df26825d5993212f6097c7ad4bebf

[kevin]: this information is not neccessary for public, please remove it.

git config gerrit.createchangeid=3Dfalse
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    | 104 +++++++++---------
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |   1 -
 2 files changed, 52 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 4df7fb6eaf3c..3e1cd5d9c29e 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -94,6 +94,55 @@ size_t smu_sys_get_pp_feature_mask(struct smu_context *s=
mu, char *buf)
         return size;
 }

+static int smu_feature_update_enable_state(struct smu_context *smu,
+                                          uint64_t feature_mask,
+                                          bool enabled)
+{
+       struct smu_feature *feature =3D &smu->smu_feature;
+       uint32_t feature_low =3D 0, feature_high =3D 0;
+       uint64_t feature_id;
+       int ret =3D 0;
+
+       if (!smu->pm_enabled)
+               return ret;
+
+       feature_low =3D (feature_mask >> 0 ) & 0xffffffff;
+       feature_high =3D (feature_mask >> 32) & 0xffffffff;
+
+       if (enabled) {
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuF=
eaturesLow,
+                                                 feature_low);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuF=
eaturesHigh,
+                                                 feature_high);
+               if (ret)
+                       return ret;
+       } else {
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmu=
FeaturesLow,
+                                                 feature_low);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmu=
FeaturesHigh,
+                                                 feature_high);
+               if (ret)
+                       return ret;
+       }
+
+       mutex_lock(&feature->mutex);
+       for (feature_id =3D 0; feature_id < 64; feature_id++) {
+               if (feature_mask & (1ULL << feature_id)) {
+                       if (enabled)
+                               test_and_set_bit(feature_id, feature->enabl=
ed);
+                       else
+                               test_and_clear_bit(feature_id, feature->ena=
bled);
+               }
+       }



//[kevin]: the code logic is a little redundant.

could you use bellow macro to replace that?

header : linux/bitmap.h

 *  bitmap_and(dst, src1, src2, nbits)          *dst =3D *src1 & *src2

 *  bitmap_or(dst, src1, src2, nbits)           *dst =3D *src1 | *src2

 *  bitmap_xor(dst, src1, src2, nbits)          *dst =3D *src1 ^ *src2

 *  bitmap_andnot(dst, src1, src2, nbits)       *dst =3D *src1 & ~(*src2)



+       mutex_unlock(&feature->mutex);
+
+       return ret;
+}
+



[Quan, Evan] updated in v3.

 int smu_sys_set_pp_feature_mask(struct smu_context *smu, uint64_t new_mask=
)
 {
         int ret =3D 0;
@@ -591,41 +640,7 @@ int smu_feature_init_dpm(struct smu_context *smu)

         return ret;
 }



[kevin]:

in this patch, i know you only want to fix not cached feature cache issue,

but in v2 patch,

the patch adjust the order of code functions, it seems that this is a brand=
 new function,

I don't think it is necessary,

could you just reflect the modified content in the patch, which can facilit=
ate us to trace problems and review.

thanks.



[Quan, Evan] Move the API before the place it's called. No problem here.



[kevin]: in this patch, you don't need to adjust function order in this fil=
e,

because the driver is already export this function in amdgpu_smu.h.

int smu_feature_update_enable_state(struct smu_context *smu, uint64_t featu=
re_mask, bool enabled);

and in this patch, it make it is static function, but the declaration secti=
on remains in the amdgpu_smu.h file.

so i don't want to you adjust the function order and make it is static funt=
ion in this patch.

except you have other reason for it.


-int smu_feature_update_enable_state(struct smu_context *smu, uint64_t feat=
ure_mask, bool enabled)
-{
-       uint32_t feature_low =3D 0, feature_high =3D 0;
-       int ret =3D 0;

-       if (!smu->pm_enabled)
-               return ret;
-
-       feature_low =3D (feature_mask >> 0 ) & 0xffffffff;
-       feature_high =3D (feature_mask >> 32) & 0xffffffff;
-
-       if (enabled) {
-               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuF=
eaturesLow,
-                                                 feature_low);
-               if (ret)
-                       return ret;
-               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuF=
eaturesHigh,
-                                                 feature_high);
-               if (ret)
-                       return ret;
-
-       } else {
-               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmu=
FeaturesLow,
-                                                 feature_low);
-               if (ret)
-                       return ret;
-               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmu=
FeaturesHigh,
-                                                 feature_high);
-               if (ret)
-                       return ret;
-
-       }
-
-       return ret;
-}

 int smu_feature_is_enabled(struct smu_context *smu, enum smu_feature_mask =
mask)
 {
@@ -651,8 +666,6 @@ int smu_feature_set_enabled(struct smu_context *smu, en=
um smu_feature_mask mask,
 {
         struct smu_feature *feature =3D &smu->smu_feature;
         int feature_id;
-       uint64_t feature_mask =3D 0;
-       int ret =3D 0;

         feature_id =3D smu_feature_get_index(smu, mask);
         if (feature_id < 0)
@@ -660,22 +673,9 @@ int smu_feature_set_enabled(struct smu_context *smu, e=
num smu_feature_mask mask,

         WARN_ON(feature_id > feature->feature_num);

-       feature_mask =3D 1ULL << feature_id;
-
-       mutex_lock(&feature->mutex);
-       ret =3D smu_feature_update_enable_state(smu, feature_mask, enable);
-       if (ret)
-               goto failed;
-
-       if (enable)
-               test_and_set_bit(feature_id, feature->enabled);
-       else
-               test_and_clear_bit(feature_id, feature->enabled);
-
-failed:
-       mutex_unlock(&feature->mutex);
-
-       return ret;
+       return smu_feature_update_enable_state(smu,
+                                              1ULL << feature_id,
+                                              enable);
 }

 int smu_feature_is_supported(struct smu_context *smu, enum smu_feature_mas=
k mask)
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index e80c81552d29..fbf68fd42b93 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -807,7 +807,6 @@ enum amd_dpm_forced_level smu_get_performance_level(str=
uct smu_context *smu);
 int smu_force_performance_level(struct smu_context *smu, enum amd_dpm_forc=
ed_level level);
 int smu_set_display_count(struct smu_context *smu, uint32_t count);
 bool smu_clk_dpm_is_enabled(struct smu_context *smu, enum smu_clk_type clk=
_type);
-int smu_feature_update_enable_state(struct smu_context *smu, uint64_t feat=
ure_mask, bool enabled);
 const char *smu_get_message_name(struct smu_context *smu, enum smu_message=
_type type);
 const char *smu_get_feature_name(struct smu_context *smu, enum smu_feature=
_mask feature);
 size_t smu_sys_get_pp_feature_mask(struct smu_context *smu, char *buf);
--
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3344F4BCEB15A0A817B9A6A0E4A40MN2PR12MB3344namp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">smu_feature_update_enable_state() is used only in am=
dgpu_smu.c.
<o:p></o:p></p>
<p class=3D"MsoNormal">As a common sense, these APIs should be declared as =
&#8216;static&#8217;.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.c=
om&gt; <br>
<b>Sent:</b> Friday, August 23, 2019 1:30 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: update cached feature enable=
ment status V2<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">comment=
 inline<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com"=
>Evan.Quan@amd.com</a>&gt;<br>
<b>Sent:</b> Friday, August 23, 2019 12:50 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kev=
in1.Wang@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: update cached feature enable=
ment status V2</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal">Comment inline<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"xmsonormal"><b>From:</b> Wang, Kevin(Yang) &lt;<a href=3D"mailt=
o:Kevin1.Wang@amd.com">Kevin1.Wang@amd.com</a>&gt;
<br>
<b>Sent:</b> Thursday, August 22, 2019 8:00 PM<br>
<b>To:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: update cached feature enable=
ment status V2<o:p></o:p></p>
</div>
</div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">commen=
t inline.</span><o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"xmsonormal"><b><span style=3D"color:black">From:</span></b><spa=
n style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@list=
s.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf =
of Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan@amd.com</a>=
&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 6:18 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: update cached feature enablement=
 status V2</span>
<o:p></o:p></p>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal">Need to update in cache feature enablement status a=
fter pp_feature<br>
settings. Another fix for the commit below:<br>
drm/amd/powerplay: implment sysfs feature status function in smu<br>
<br>
V2: update smu_feature_update_enable_state() and relates<br>
<br>
<b>Change-Id: I90e29b0d839df26825d5993212f6097c7ad4bebf&nbsp;</b><o:p></o:p=
></p>
</div>
<div>
<p class=3D"xmsonormal"><b>[kevin]: this information is not neccessary for =
public, please remove it.</b><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><b>git config gerrit.createchangeid=3Dfalse<br>
</b>Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.=
quan@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp; | 104 &#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---------<br>
&nbsp;.../gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 -<br>
&nbsp;2 files changed, 52 insertions(&#43;), 53 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 4df7fb6eaf3c..3e1cd5d9c29e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -94,6 &#43;94,55 @@ size_t smu_sys_get_pp_feature_mask(struct smu_contex=
t *smu, char *buf)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;<b>static</b> int smu_feature_update_enable_state(struct smu_context *=
smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t feature_mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; bool enabled)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_feature *feature =3D &=
amp;smu-&gt;smu_feature;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_low =3D 0, featu=
re_high =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t feature_id;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_low =3D (feature_mask &gt=
;&gt; 0 ) &amp; 0xffffffff;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_high =3D (feature_mask &g=
t;&gt; 32) &amp; 0xffffffff;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enabled) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFe=
aturesLow,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featur=
e_low);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFe=
aturesHigh,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featur=
e_high);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuF=
eaturesLow,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featur=
e_low);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuF=
eaturesHigh,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featur=
e_high);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;feature-&gt;mutex=
);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (feature_id =3D 0; feature_id=
 &lt; 64; feature_id&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (feature_mask &amp; (1ULL &lt;&lt; feature_id)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enabled)=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_and_set_bit(feature_id, feature-&g=
t;enabled);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_and_clear_bit(feature_id, feature-=
&gt;enabled);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">//[kevin]: the code logic is a little redundant.<o:=
p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">could you use bellow macro to replace that?<o:p></o=
:p></p>
</div>
<div>
<p class=3D"xmsonormal">header :&nbsp;<span style=3D"font-family:&quot;Sego=
e UI&quot;,sans-serif;color:black;background:white">linux/bitmap.h</span><o=
:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">&nbsp;* &nbsp;bitmap_and(dst, src1, src2, nbits) &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;*dst =3D *src1 &amp; *src2<o:p></o:p></p>
<div>
<p class=3D"xmsonormal">&nbsp;* &nbsp;<b>bitmap_or</b>(dst, src1, src2, nbi=
ts) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *dst =3D *src1 | *src2<o:p></o:p></p=
>
</div>
<div>
<p class=3D"xmsonormal">&nbsp;* &nbsp;bitmap_xor(dst, src1, src2, nbits) &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;*dst =3D *src1 ^ *src2<o:p></o:p></p>
</div>
<p class=3D"xmsonormal">&nbsp;* &nbsp;<b>bitmap_andnot</b>(dst, src1, src2,=
 nbits) &nbsp; &nbsp; &nbsp; *dst =3D *src1 &amp; ~(*src2)<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unl=
ock(&amp;feature-&gt;mutex);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal"><b><i>[Quan, Evan] updated in v3.</i></b><o:p></o:p=
></p>
<p class=3D"xmsonormal"><br>
&nbsp;int smu_sys_set_pp_feature_mask(struct smu_context *smu, uint64_t new=
_mask)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
@@ -591,41 &#43;640,7 @@ int smu_feature_init_dpm(struct smu_context *smu)<=
br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">[kevin]:<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">in this patch, i know you only want to fix not cach=
ed feature cache issue,<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">but in v2 patch,<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">the patch adjust the order of code functions, it se=
ems that this is a brand new function,<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">I don't think it is necessary,<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">could you just reflect the <b>modified content</b> =
in the patch, which can facilitate us to trace
<b>problems </b>and <b>review</b>.<o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal">thanks.<o:p></o:p></p>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal"><b><i>[Quan, Evan] Move the API before the place it=
&#8217;s called. No problem here.</i></b><o:p></o:p></p>
<p class=3D"xmsonormal"><o:p>&nbsp;</o:p></p>
<p class=3D"xmsonormal"><b><i>[kevin]: in this patch, you don't need to adj=
ust function order in this file,</i></b><o:p></o:p></p>
<p class=3D"xmsonormal"><b><i>because the driver is already export this fun=
ction in amdgpu_smu.h.</i></b><o:p></o:p></p>
<p class=3D"xmsonormal"><b><i>int smu_feature_update_enable_state(struct sm=
u_context *smu, uint64_t feature_mask, bool enabled);</i></b><o:p></o:p></p=
>
<p class=3D"xmsonormal"><b><i>and in this patch, it make it is static funct=
ion, but&nbsp;the declaration section remains in the amdgpu_smu.h file.</i>=
</b><o:p></o:p></p>
<p class=3D"xmsonormal"><b><i>so i don't want to you adjust the function or=
der and make it is static funtion in this patch.</i></b><o:p></o:p></p>
<p class=3D"xmsonormal"><b><i>except you have other reason for it.<o:p></o:=
p></i></b></p>
<div>
<p class=3D"MsoNormal"><b><i><o:p>&nbsp;</o:p></i></b></p>
</div>
</div>
<p class=3D"xmsonormal">-int smu_feature_update_enable_state(struct smu_con=
text *smu, uint64_t feature_mask, bool enabled)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_low =3D 0, feature_h=
igh =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return ret;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_low =3D (feature_mask &gt;&gt=
; 0 ) &amp; 0xffffffff;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_high =3D (feature_mask &gt;&g=
t; 32) &amp; 0xffffffff;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enabled) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFeatur=
esLow,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_lo=
w);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFeatur=
esHigh,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_hi=
gh);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuFeatu=
resLow,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_lo=
w);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuFeatu=
resHigh,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_hi=
gh);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-}<br>
&nbsp;<br>
&nbsp;int smu_feature_is_enabled(struct smu_context *smu, enum smu_feature_=
mask mask)<br>
&nbsp;{<br>
@@ -651,8 &#43;666,6 @@ int smu_feature_set_enabled(struct smu_context *smu=
, enum smu_feature_mask mask,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_feature *featur=
e =3D &amp;smu-&gt;smu_feature;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int feature_id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t feature_mask =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_id =3D smu_feature=
_get_index(smu, mask);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (<span style=3D"font-fa=
mily:&quot;Arial&quot;,sans-serif">feature_id </span>&lt; 0)<br>
@@ -660,22 &#43;673,9 @@ int smu_feature_set_enabled(struct smu_context *sm=
u, enum smu_feature_mask mask,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(feature_id &gt; fe=
ature-&gt;feature_num);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_mask =3D 1ULL &lt;&lt; featur=
e_id;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;feature-&gt;mutex);<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_update_enable_sta=
te(smu, feature_mask, enable);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto failed;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_and_set_bit(feature_id, feature-&gt;enabled);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_and_clear_bit(feature_id, feature-&gt;enabled);<br>
-<br>
-failed:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;feature-&gt;mutex);=
<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_feature_update_enable_=
state(smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1ULL &lt;&lt; feature_id=
,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enable);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;int smu_feature_is_supported(struct smu_context *smu, enum smu_featur=
e_mask mask)<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index e80c81552d29..fbf68fd42b93 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -807,7 &#43;807,6 @@ enum amd_dpm_forced_level smu_get_performance_level=
(struct smu_context *smu);<br>
&nbsp;int smu_force_performance_level(struct smu_context *smu, enum amd_dpm=
_forced_level level);<br>
&nbsp;int smu_set_display_count(struct smu_context *smu, uint32_t count);<b=
r>
&nbsp;bool smu_clk_dpm_is_enabled(struct smu_context *smu, enum smu_clk_typ=
e clk_type);<br>
-int smu_feature_update_enable_state(struct smu_context *smu, uint64_t feat=
ure_mask, bool enabled);<br>
&nbsp;const char *smu_get_message_name(struct smu_context *smu, enum smu_me=
ssage_type type);<br>
&nbsp;const char *smu_get_feature_name(struct smu_context *smu, enum smu_fe=
ature_mask feature);<br>
&nbsp;size_t smu_sys_get_pp_feature_mask(struct smu_context *smu, char *buf=
);<br>
-- <br>
2.23.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3344F4BCEB15A0A817B9A6A0E4A40MN2PR12MB3344namp_--

--===============1577624429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1577624429==--
