Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0474C6FA2B
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 09:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222E889B45;
	Mon, 22 Jul 2019 07:17:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279089B45
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 07:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccmPFDEExyCuozPaix/t37MYlETLW/QQHMv/0KOf3F6yFIfM46vjW8rzzsO2zOt38ydIViLHs3wW6QsnwBfFD2oN25jwsdC4LrT48jjixFTy+42LNu0sjOb+VIVDYzqHtF4OmIKTKjRLLt2rRqsu/wYgrdZNlKnebxlKhEDS41TTOgf8bI87AfwgcBqCsIz7VcE8DzjKNzD1bZtrH9afB4n64Rt57IwsARuicDIsofKu34j+3PRtq6OzDJ1mFQ+JmL/HyxD1txnkFkrajU66tZLiLYFQ5AfRiUVS2AfYY43x3RSuxI2JEnsWShV3yHl9hD/c7v3JSGsJ+x72XOgZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42qK2jyvhmcqFtbK8HSuix0iXqeeaAXGmHuzhWjWLoQ=;
 b=jNtGEzuufiSgZi+mEwbqC9mQoPrh6PeMC1ZIHEaveYqozgkBDmqjgRDpFGLHFMNyj/lq1OJgqPfUx2XGzz2cDj/lqau7CCifcbKHehtRG+JrTvmBBUi/VKkejl11R1mWdCW8/+lxpEIFhijP0UMgJu1FOvv5CtviyCiaaxxx26J/znPa1qupNErht9nfQOeDhklZ7xUgt2UYRqIkPnef5eFBPigrr9zAsmIImzkacUNclnVU4V3j9oD43ciOysP/nyXLhY2R48UU8P5JiC37W9GCt7vO+DiTh+7FAi2N59Jr7BTO7E/JlvJNA5B+EoB+eF89l5quBscepAVSPEDwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3439.namprd12.prod.outlook.com (20.178.243.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 07:17:55 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 07:17:55 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: correct confusing naming for
 smu_feature_set_enabled
Thread-Topic: [PATCH] drm/amd/powerplay: correct confusing naming for
 smu_feature_set_enabled
Thread-Index: AQHVQFeajqJkvpfFiUCIF4HCdRAfk6bWNW8AgAABOMA=
Date: Mon, 22 Jul 2019 07:17:55 +0000
Message-ID: <MN2PR12MB3344C65D72C585B8104DDF5CE4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190722063426.19597-1-evan.quan@amd.com>
 <MN2PR12MB3296197F32A37621120B9709A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296197F32A37621120B9709A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f9dd77e-4f19-422d-46bd-08d70e74b7a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3439; 
x-ms-traffictypediagnostic: MN2PR12MB3439:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR12MB34393D508F613F8052663600E4C40@MN2PR12MB3439.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(606006)(6436002)(478600001)(86362001)(110136005)(8676002)(7696005)(99286004)(76176011)(3846002)(6116002)(790700001)(486006)(316002)(68736007)(33656002)(66066001)(14454004)(2906002)(2501003)(236005)(25786009)(9686003)(55016002)(53936002)(6306002)(14444005)(256004)(229853002)(6246003)(52536014)(966005)(5660300002)(102836004)(66476007)(66556008)(64756008)(66446008)(26005)(8936002)(446003)(186003)(7736002)(11346002)(74316002)(81166006)(81156014)(6506007)(71200400001)(53546011)(71190400001)(54896002)(476003)(76116006)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3439;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b3BKNLNINXK0rVEnnUzYKR8DXjFgpeqs0DYmXeV0djHF07lzdKj/1CnHBpmHWIvKqXjAAe9tZBhCms9wmS8bxCtOEki7YQpPWoYsVpVAg20XLQLXFusKpidSxg1ryzCgl4g/qw8hxBM0FtRFV8t+meTnosUD6HoSWQm7pWAEBbE4aLK8AsMk3M1Idn1qehoJZOy846RuMvFDKKiS6gPCNZ4Yr1PMee0PBtglsKcMlDACgwxF8HBpOvEpECdjrzKqZHx9AAyWeTTC+GkW1Smmd3pvgV5jWddN27nGbEEoOKL67YKWMaEIxxToZBLhDHdk815rsI4m7ijMU6GC2XnfPialWOKCzWKBLaQl3KCgvMhhrOLLir86guL/H3hf+ZW9X/r4YjdSfhNERsoC+u1ND/L4gxdmv5m6xeAb9u9KKoM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9dd77e-4f19-422d-46bd-08d70e74b7a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 07:17:55.4256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3439
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42qK2jyvhmcqFtbK8HSuix0iXqeeaAXGmHuzhWjWLoQ=;
 b=x8xOvCvAWgHqCxhwtsYlcdelvwvZHbD9hiFpSDb4PNG9ivzWqCejleT10OGQCWYdRl4eOnNxtgI/nh9WNdf8m+Z6H6PjvBlFjFrV2JPLnIxvRJ6EjqElWtIoynh6sX7IpqFlnpZJ6ktGxdqataN/2zEJ/620YCdPyZrHcbEcUx8=
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
Content-Type: multipart/mixed; boundary="===============0092529385=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0092529385==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3344C65D72C585B8104DDF5CE4C40MN2PR12MB3344namp_"

--_000_MN2PR12MB3344C65D72C585B8104DDF5CE4C40MN2PR12MB3344namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I cannot get your point. What do you mean "pairs of functions"?
Yes, this patch does not bring real changes.
But this helps for future maintain and fit common logic.
1. As in my previous patch("drm/amd/powerplay: correct Navi10 VCN powergate=
 control" ),  "smu_feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, enable)=
;" was mistakenly used. I thought and expected smu_feature_set_enabled set =
the bitmask on only. I do not want it to enable or disable the feature.
2. smu_feature_set_enabled should in the same logic as smu_feature_set_supp=
orted. It updates only the saved bit mask. That's the expected behavior for=
 some APIs named as _set_enabled/supported.
3. The original callers who want feature enablement/disablement are updated=
 to use smu_enable_smc_feature(). I do not see any problem with that.

Regards,
Evan
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Monday, July 22, 2019 3:00 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/powerplay: correct confusing naming for smu_fe=
ature_set_enabled

before this patch, we have 4 apis to manage smu feature bits.
the patch add a new one in them, but it is not add any feature in smu.

before your patch:
smu_feature_is_enabled and smu_feature_set_enabled is pair of functions,
after your patch:
smu_feature_is_enabled and smu_enable_smc_feature is pair of functions;

so the driver don't have scenario needs to use smu_feature_set_enabeld,
do you agree it?

most of the time we update SMC feature, we must update software bitmap in s=
mu_feature structure.
if not, the smu_feature_is_enabled funciton is not work well.

extern int smu_feature_init_dpm(struct smu_context *smu);
extern int smu_feature_is_enabled(struct smu_context *smu,
  enum smu_feature_mask mask);
extern int smu_feature_set_enabled(struct smu_context *smu,
   enum smu_feature_mask mask, bool enable);
extern int smu_feature_is_supported(struct smu_context *smu,
    enum smu_feature_mask mask);
extern int smu_feature_set_supported(struct smu_context *smu,
     enum smu_feature_mask mask, bool enable);

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Evan Quan <evan.quan@amd.com<mailto:e=
van.quan@amd.com>>
Sent: Monday, July 22, 2019 2:34:26 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: [PATCH] drm/amd/powerplay: correct confusing naming for smu_featur=
e_set_enabled

It does more than updating the bitmask. In fact it enables also the
feature. That's confusing. As for this, a new API is added for the
feature enablement job. And smu_feature_set_enabled is updated to
setting the bitmask only(as smu_feature_set_supported).

Change-Id: I758e4461be34c0fcbdf19448e34180a5251926c4
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    | 29 +++++++++++++------
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |  2 ++
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     |  2 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c    |  4 +--
 4 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 4e18f33a1bab..9262883d4031 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -511,28 +511,39 @@ int smu_feature_set_enabled(struct smu_context *smu, =
enum smu_feature_mask mask,
 {
         struct smu_feature *feature =3D &smu->smu_feature;
         int feature_id;
-       int ret =3D 0;

         feature_id =3D smu_feature_get_index(smu, mask);
         if (feature_id < 0)
                 return -EINVAL;

-       WARN_ON(feature_id > feature->feature_num);
-
         mutex_lock(&feature->mutex);
-       ret =3D smu_feature_update_enable_state(smu, feature_id, enable);
-       if (ret)
-               goto failed;

         if (enable)
                 test_and_set_bit(feature_id, feature->enabled);
         else
                 test_and_clear_bit(feature_id, feature->enabled);

-failed:
         mutex_unlock(&feature->mutex);

-       return ret;
+       return 0;
+}
+
+int smu_enable_smc_feature(struct smu_context *smu,
+                          enum smu_feature_mask mask,
+                          bool enable)
+{
+       int feature_id;
+       int ret =3D 0;
+
+       feature_id =3D smu_feature_get_index(smu, mask);
+       if (feature_id < 0)
+               return -EINVAL;
+
+       ret =3D smu_feature_update_enable_state(smu, feature_id, enable);
+       if (ret)
+               return ret;
+
+       return smu_feature_set_enabled(smu, mask, enable);
 }

 int smu_feature_is_supported(struct smu_context *smu, enum smu_feature_mas=
k mask)
@@ -1186,7 +1197,7 @@ static int smu_suspend(void *handle)
                 return ret;

         if (adev->in_gpu_reset && baco_feature_is_enabled) {
-               ret =3D smu_feature_set_enabled(smu, SMU_FEATURE_BACO_BIT, =
true);
+               ret =3D smu_enable_smc_feature(smu, SMU_FEATURE_BACO_BIT, t=
rue);
                 if (ret) {
                         pr_warn("set BACO feature enabled failed, return %=
d\n", ret);
                         return ret;
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index b702c9ee975f..267b879796f9 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -946,6 +946,8 @@ extern int smu_feature_is_enabled(struct smu_context *s=
mu,
                                   enum smu_feature_mask mask);
 extern int smu_feature_set_enabled(struct smu_context *smu,
                                    enum smu_feature_mask mask, bool enable=
);
+extern int smu_enable_smc_feature(struct smu_context *smu,
+                                  enum smu_feature_mask mask, bool enable)=
;
 extern int smu_feature_is_supported(struct smu_context *smu,
                                     enum smu_feature_mask mask);
 extern int smu_feature_set_supported(struct smu_context *smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index e3a178403546..0f59d2178d01 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1419,7 +1419,7 @@ smu_v11_0_smc_fan_control(struct smu_context *smu, bo=
ol start)
         if (smu_feature_is_supported(smu, SMU_FEATURE_FAN_CONTROL_BIT))
                 return 0;

-       ret =3D smu_feature_set_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT, s=
tart);
+       ret =3D smu_enable_smc_feature(smu, SMU_FEATURE_FAN_CONTROL_BIT, st=
art);
         if (ret)
                 pr_err("[%s]%s smc FAN CONTROL feature failed!",
                        __func__, (start ? "Start" : "Stop"));
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index 9ead36192787..536ff884ddca 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -2845,7 +2845,7 @@ static int vega20_dpm_set_uvd_enable(struct smu_conte=
xt *smu, bool enable)
         if (enable =3D=3D smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UVD_=
BIT))
                 return 0;

-       return smu_feature_set_enabled(smu, SMU_FEATURE_DPM_UVD_BIT, enable=
);
+       return smu_enable_smc_feature(smu, SMU_FEATURE_DPM_UVD_BIT, enable)=
;
 }

 static int vega20_dpm_set_vce_enable(struct smu_context *smu, bool enable)
@@ -2856,7 +2856,7 @@ static int vega20_dpm_set_vce_enable(struct smu_conte=
xt *smu, bool enable)
         if (enable =3D=3D smu_feature_is_enabled(smu, SMU_FEATURE_DPM_VCE_=
BIT))
                 return 0;

-       return smu_feature_set_enabled(smu, SMU_FEATURE_DPM_VCE_BIT, enable=
);
+       return smu_enable_smc_feature(smu, SMU_FEATURE_DPM_VCE_BIT, enable)=
;
 }

 static int vega20_get_enabled_smc_features(struct smu_context *smu,
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3344C65D72C585B8104DDF5CE4C40MN2PR12MB3344namp_
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
span.EmailStyle18
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
<p class=3D"MsoNormal">I cannot get your point. What do you mean &#8220;pai=
rs of functions&#8221;?<o:p></o:p></p>
<p class=3D"MsoNormal">Yes, this patch does not bring real changes.<o:p></o=
:p></p>
<p class=3D"MsoNormal">But this helps for future maintain and fit common lo=
gic.<o:p></o:p></p>
<p class=3D"MsoNormal">1. As in my previous patch(&#8220;drm/amd/powerplay:=
 correct Navi10 VCN powergate control&#8221; ), &nbsp;&#8220;smu_feature_se=
t_enabled(smu, SMU_FEATURE_VCN_PG_BIT, enable);&#8221; was mistakenly used.=
 I thought and expected smu_feature_set_enabled set the bitmask
 on only. I do not want it to enable or disable the feature.<o:p></o:p></p>
<p class=3D"MsoNormal">2. smu_feature_set_enabled should in the same logic =
as smu_feature_set_supported. It updates only the saved bit mask. That&#821=
7;s the expected behavior for some APIs named as _<i>set</i>_enabled/suppor=
ted.<o:p></o:p></p>
<p class=3D"MsoNormal">3. The original callers who want feature enablement/=
disablement are updated to use smu_enable_smc_feature(). I do not see any p=
roblem with that.<o:p></o:p></p>
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
<b>Sent:</b> Monday, July 22, 2019 3:00 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: correct confusing naming for=
 smu_feature_set_enabled<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"divtagdefaultwrapper">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">before =
this patch, we have 4 apis to manage smu feature bits.
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">the pat=
ch add a new one in them, but it is not add any feature in smu.<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">before =
your patch:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">smu_fea=
ture_is_enabled and smu_feature_set_enabled is pair of functions,<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">after y=
our patch:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">smu_fea=
ture_is_enabled and smu_enable_smc_feature is pair of functions;<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">so the =
driver don't have&nbsp;scenario needs to use smu_feature_set_enabeld,&nbsp;=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">do you =
agree it?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">most of=
 the time we update SMC feature, we must update software bitmap in smu_feat=
ure structure.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">if not,=
 the smu_feature_is_enabled funciton is not work well.<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">extern i=
nt smu_feature_init_dpm(struct smu_context *smu);</span><span style=3D"font=
-size:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">extern i=
nt smu_feature_is_enabled(struct smu_context *smu,</span><span style=3D"fon=
t-size:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">&nbsp; e=
num smu_feature_mask mask);</span><span style=3D"font-size:12.0pt;color:bla=
ck"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">extern i=
nt smu_feature_set_enabled(struct smu_context *smu,</span><span style=3D"fo=
nt-size:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">&nbsp; &=
nbsp;enum smu_feature_mask mask, bool enable);</span><span style=3D"font-si=
ze:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">extern i=
nt smu_feature_is_supported(struct smu_context *smu,</span><span style=3D"f=
ont-size:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">&nbsp; &=
nbsp; enum smu_feature_mask mask);</span><span style=3D"font-size:12.0pt;co=
lor:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">extern i=
nt smu_feature_set_supported(struct smu_context *smu,</span><span style=3D"=
font-size:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black">&nbsp; &=
nbsp; &nbsp;enum smu_feature_mask mask, bool enable);</span><span style=3D"=
font-size:12.0pt;color:black"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Best Re=
gards,<br>
Kevin<o:p></o:p></span></p>
</div>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;</span><a href=3D"mailto:amd-gfx-bounce=
s@lists.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a><span sty=
le=3D"color:black">&gt; on behalf of Evan Quan &lt;</span><a href=3D"mailto=
:evan.quan@amd.com">evan.quan@amd.com</a><span style=3D"color:black">&gt;<b=
r>
<b>Sent:</b> Monday, July 22, 2019 2:34:26 PM<br>
<b>To:</b> </span><a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@=
lists.freedesktop.org</a><span style=3D"color:black"> &lt;</span><a href=3D=
"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><sp=
an style=3D"color:black">&gt;<br>
<b>Cc:</b> Quan, Evan &lt;</span><a href=3D"mailto:Evan.Quan@amd.com">Evan.=
Quan@amd.com</a><span style=3D"color:black">&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: correct confusing naming for smu=
_feature_set_enabled</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">It does more than updating the bitmask. In fact it e=
nables also the<br>
feature. That's confusing. As for this, a new API is added for the<br>
feature enablement job. And smu_feature_set_enabled is updated to<br>
setting the bitmask only(as smu_feature_set_supported).<br>
<br>
Change-Id: I758e4461be34c0fcbdf19448e34180a5251926c4<br>
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp; | 29 &#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------<br>
&nbsp;.../gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp; |&nbsp; =
2 &#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp; |&nbsp; =
4 &#43;--<br>
&nbsp;4 files changed, 25 insertions(&#43;), 12 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 4e18f33a1bab..9262883d4031 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -511,28 &#43;511,39 @@ int smu_feature_set_enabled(struct smu_context *s=
mu, enum smu_feature_mask mask,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_feature *featur=
e =3D &amp;smu-&gt;smu_feature;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int feature_id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_id =3D smu_feature=
_get_index(smu, mask);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (feature_id &lt; 0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(feature_id &gt; feature-&gt;f=
eature_num);<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;feature-&g=
t;mutex);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_update_enable_sta=
te(smu, feature_id, enable);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto failed;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_and_set_bit(feature_id, feature-&gt;enabled);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_and_clear_bit(feature_id, feature-&gt;enabled);<=
br>
&nbsp;<br>
-failed:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;feature-=
&gt;mutex);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&#43;int smu_enable_smc_feature(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; enum smu_feature_mask mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; bool enable)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int feature_id;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_id =3D smu_feature_get_in=
dex(smu, mask);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (feature_id &lt; 0)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_update_enable=
_state(smu, feature_id, enable);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_feature_set_enabled(sm=
u, mask, enable);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;int smu_feature_is_supported(struct smu_context *smu, enum smu_featur=
e_mask mask)<br>
@@ -1186,7 &#43;1197,7 @@ static int smu_suspend(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;in_gpu_reset =
&amp;&amp; baco_feature_is_enabled) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_feature_set_enabled(smu, SMU_FEATURE_BACO_BIT, true)=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_enable_smc_feature(smu, SMU_FEATURE_BACO_BIT, tr=
ue);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_wa=
rn(&quot;set BACO feature enabled failed, return %d\n&quot;, ret);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n ret;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index b702c9ee975f..267b879796f9 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -946,6 &#43;946,8 @@ extern int smu_feature_is_enabled(struct smu_contex=
t *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_feature_mas=
k mask);<br>
&nbsp;extern int smu_feature_set_enabled(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_featu=
re_mask mask, bool enable);<br>
&#43;extern int smu_enable_smc_feature(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_feature_mask=
 mask, bool enable);<br>
&nbsp;extern int smu_feature_is_supported(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu=
_feature_mask mask);<br>
&nbsp;extern int smu_feature_set_supported(struct smu_context *smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index e3a178403546..0f59d2178d01 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -1419,7 &#43;1419,7 @@ smu_v11_0_smc_fan_control(struct smu_context *smu=
, bool start)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_feature_is_support=
ed(smu, SMU_FEATURE_FAN_CONTROL_BIT))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_set_enabled(smu, =
SMU_FEATURE_FAN_CONTROL_BIT, start);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_enable_smc_feature(sm=
u, SMU_FEATURE_FAN_CONTROL_BIT, start);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;[%s]%s smc FAN CONTROL feature failed!&q=
uot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __func__, (=
start ? &quot;Start&quot; : &quot;Stop&quot;));<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index 9ead36192787..536ff884ddca 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -2845,7 &#43;2845,7 @@ static int vega20_dpm_set_uvd_enable(struct smu_c=
ontext *smu, bool enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable =3D=3D smu_feat=
ure_is_enabled(smu, SMU_FEATURE_DPM_UVD_BIT))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_feature_set_enabled(smu, S=
MU_FEATURE_DPM_UVD_BIT, enable);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_enable_smc_feature(smu=
, SMU_FEATURE_DPM_UVD_BIT, enable);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int vega20_dpm_set_vce_enable(struct smu_context *smu, bool en=
able)<br>
@@ -2856,7 &#43;2856,7 @@ static int vega20_dpm_set_vce_enable(struct smu_c=
ontext *smu, bool enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable =3D=3D smu_feat=
ure_is_enabled(smu, SMU_FEATURE_DPM_VCE_BIT))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_feature_set_enabled(smu, S=
MU_FEATURE_DPM_VCE_BIT, enable);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_enable_smc_feature(smu=
, SMU_FEATURE_DPM_VCE_BIT, enable);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int vega20_get_enabled_smc_features(struct smu_context *smu,<b=
r>
-- <br>
2.22.0<br>
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
</body>
</html>

--_000_MN2PR12MB3344C65D72C585B8104DDF5CE4C40MN2PR12MB3344namp_--

--===============0092529385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0092529385==--
