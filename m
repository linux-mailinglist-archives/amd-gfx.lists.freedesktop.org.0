Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622E700E6
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 15:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15CC89C6A;
	Mon, 22 Jul 2019 13:21:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720084.outbound.protection.outlook.com [40.107.72.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6270789C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 13:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpwo9WgNoA5pxADy742wCHToBRi66BJ0EIU1cuderpPAY3IjSUd2VH+cYZq4CkIUMQ8xtdU7FHmqG7ecJYkSAHcNvoaa7vsVLWc8hHabGhNFV1fJHzegiShLhd/FoZbonyxD57yy/G1lOqvwBKJIXoK37F9qUwvyP0VzBEHfIKLyVCHkS6yuysF8PbKERjotlmI++arz5ROZpUZxM0j8qCRfT3CiTDLBYRU1ziQXCIBZuUmV2ofRc8adO4oPScLacVj05PNDrDpmg2iiTiu6CY70DvLo+MPEg5pmRRyDMaTTyuBhfz9tJKtIYb6XkmOe5hkUtB1akOzk8HfZuItlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGIaZAPqtdHcjSJdQlL/2Ken8V8lVBoZyKQgdQeNwI0=;
 b=E6XTDpixDORJUsfM9eJkyWKH1IclWNnP9k2y8mL0+Ij9t4pnBAdzzKE9tqeWp6Xzu4jnfuom/wlGk8AJoElUaGxliTSQA7MUdPI5NY6Iy+LGXmVU3G0s1EH/1KxF6yh/V2ik0rMEMkFhwcbx3mK0kgip2m8mLZm7VlgMmmI7++UZfjJY52ybdrRhvZpwpYzbeDTHG+jrmF3y/NeVGBy+3cO15zEuNJtpGaim4AUah0w8l8NXExnUgwJKnj7OAHTwIzUc1xFRATaINSkQ6LQ7aIf1gc4UToC5Tzs7XIoP/aVfjR9ZpwoN8ffC9gBPKmX9PmWIWf+TfXTjEaArSG/rkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3216.namprd12.prod.outlook.com (20.179.82.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 13:21:01 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 13:21:01 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: correct confusing naming for
 smu_feature_set_enabled
Thread-Topic: [PATCH] drm/amd/powerplay: correct confusing naming for
 smu_feature_set_enabled
Thread-Index: AQHVQFeOpOl2Nj5fbkSPD1SQzBMuWqbWMsLpgAAHuICAAAnBRYAAUbSAgAADT1Q=
Date: Mon, 22 Jul 2019 13:21:01 +0000
Message-ID: <MN2PR12MB32968DC2D03AD32F447A729AA2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190722063426.19597-1-evan.quan@amd.com>
 <MN2PR12MB3296197F32A37621120B9709A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>,
 <MN2PR12MB3344C65D72C585B8104DDF5CE4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
 <MN2PR12MB3296FC663977D86111AB364FA2C40@MN2PR12MB3296.namprd12.prod.outlook.com>,
 <MN2PR12MB334479EDA123FEC9920F539DE4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB334479EDA123FEC9920F539DE4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.140.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6973bd8d-8c57-4d47-177b-08d70ea770f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3216; 
x-ms-traffictypediagnostic: MN2PR12MB3216:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3216A4BFA40ED32F4EC42DF8A2C40@MN2PR12MB3216.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(199004)(189003)(99286004)(19627405001)(33656002)(66066001)(14454004)(6606003)(9686003)(236005)(54896002)(81156014)(186003)(81166006)(6306002)(6436002)(74316002)(606006)(55016002)(110136005)(53936002)(53546011)(76176011)(7696005)(102836004)(316002)(6246003)(6506007)(486006)(8936002)(26005)(8676002)(476003)(478600001)(11346002)(6116002)(68736007)(3846002)(19627235002)(966005)(7736002)(2906002)(14444005)(25786009)(446003)(256004)(2501003)(76116006)(66946007)(66476007)(66556008)(66446008)(64756008)(71200400001)(71190400001)(30864003)(229853002)(5660300002)(52536014)(86362001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3216;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c/9h6MzZeX6JfS+OnbnnJ0jfTRhlvxw1w6OWIFp90fBROnNPlJuPts5kzIFWMexGTZqRrjYMz+sQxYEsx4EnBd7kOIeVZUsu9wiPXVVa2k6GjzXb7hGGKmNLfI1NV7tYs9kvA5jZoClPQJ4kYEUIBf3BBjpSmbhNXqa0JHJw6Cogkt7yAC0rKZTwl2MPjHTfuMhmxVJnZkBd189njc+kjOQYnQxBMa+LV5aWemh6dsMdLVdcWRyBnugN5UJ9F6CWuBdVy3XrlR/FEDpbSs+DZIukiS2O+RMvKOpmiesnVAVefOpxpRhtawdqwLb/t1gEtIyY4rX0hQhECE3RxXJyudZRREtBP1EYkyVM8C+tiDPsOehpw7agc+F5sVr/3HH8KhmMBrDck98thRzxSvgG0Y2aauHPbztDI1yv0NMzqhk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6973bd8d-8c57-4d47-177b-08d70ea770f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 13:21:01.1485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGIaZAPqtdHcjSJdQlL/2Ken8V8lVBoZyKQgdQeNwI0=;
 b=qKOt9sJqigv6ZyF+/emyh1AL35MQhCR4f2u8ursDI8f3QIJNbK9tAwydodaOdbgxKmzLhH/r17xy69NjY0m4qO83m2GL/r3BcJhkNoU42CmnS8g9Hb7zcXqYnAPCCJ3fiRMRTypGN5uVH78FhWpmOSXGw19n9juvgQha18euf8k=
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
Content-Type: multipart/mixed; boundary="===============1772901113=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1772901113==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32968DC2D03AD32F447A729AA2C40MN2PR12MB3296namp_"

--_000_MN2PR12MB32968DC2D03AD32F447A729AA2C40MN2PR12MB3296namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

it seems this feature is specific feature on some asic in smc firmware.

why not create a specific function to handle this case,


the apis of smu_feature_is_enabled and smu_feature_set_enabled is public ap=
i for all smu asic.
how can you be sure that message must have the same logic on other asics in=
 SMC firwamre.

may be this case not work on other smu or other asic.


if you still do, it means that when developer use smu_feature_is_enabled ap=
i,

the user must know the message detail information in smc firmware.


sw-bitmap and smc firwmare bitmap must be same in smu driver.

if not, this sw-bitmap is meaningless.


Best Regards,

Kevin

________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Monday, July 22, 2019 8:45:15 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: correct confusing naming for smu_fe=
ature_set_enabled


The implementation of SMU_MSG_PowerDown[UP]Vcn (in smu fw) already includes=
 the identical hardware enablement/disablement of SMU_FEATURE_VCN_PG_BIT.

Thus after that, only update the bitmask is enough. This is done on purpose=
.



Regards,

Evan

From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Monday, July 22, 2019 4:11 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/powerplay: correct confusing naming for smu_fe=
ature_set_enabled



in fact, the smu feature bitmap is cached of smc firmware hardware bitmap,

most of time, when driver want to check whether enable is available.

the driver should talk with smc to check featue enabled.

i think it is very low efficiency.

so the driver will provide a bitmap structure to store hardware feature sta=
tus.

every time, the driver update hardware feature state, also should be update=
 software bitmap to sync it.



if only update bitmap and don't set firmware feature enabled, the smu_featu=
re_is_enabeld is maybe not work correctly.



in your previous patch:

drm/amd/powerplay: correct Navi10 VCN powergate control.

after your patch,

the function smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)

will retrun true, but in the firmware, this feature maybe is not enabled.



so the function smu_feature_is_enabled is not work well.



and smu_feature_is_supported  is full software feature, this is helper func=
tion to set allowed feature mask when smu power on,

but this function is not used in smu driver, i want to remove them long lon=
g ago.



Best Regards,
Kevin



________________________________

From: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Sent: Monday, July 22, 2019 3:17:55 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>; am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@=
lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Subject: RE: [PATCH] drm/amd/powerplay: correct confusing naming for smu_fe=
ature_set_enabled



I cannot get your point. What do you mean =93pairs of functions=94?

Yes, this patch does not bring real changes.

But this helps for future maintain and fit common logic.

1. As in my previous patch(=93drm/amd/powerplay: correct Navi10 VCN powerga=
te control=94 ),  =93smu_feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, e=
nable);=94 was mistakenly used. I thought and expected smu_feature_set_enab=
led set the bitmask on only. I do not want it to enable or disable the feat=
ure.

2. smu_feature_set_enabled should in the same logic as smu_feature_set_supp=
orted. It updates only the saved bit mask. That=92s the expected behavior f=
or some APIs named as _set_enabled/supported.

3. The original callers who want feature enablement/disablement are updated=
 to use smu_enable_smc_feature(). I do not see any problem with that.



Regards,

Evan

From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
Sent: Monday, July 22, 2019 3:00 PM
To: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
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

--_000_MN2PR12MB32968DC2D03AD32F447A729AA2C40MN2PR12MB3296namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">it seems this feature is specific=
 feature on some asic in smc firmware.</p>
<p style=3D"margin-top:0;margin-bottom:0">why not create a specific functio=
n to handle this case,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">the apis of&nbsp;smu_feature_is_e=
nabled and smu_feature_set_enabled is public api for all smu asic.<br>
<span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quo=
t;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size=
: 16px;">how can you be sure that message must have the same logic on other
 asics&nbsp;in SMC firwamre.</span><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-size: 12pt;">=
may be this case not work on other smu or other asic.</span></p>
<div><br>
</div>
<p style=3D"margin-top:0;margin-bottom:0">if you still do, it means that&nb=
sp;when developer use smu_feature_is_enabled api,</p>
<p style=3D"margin-top:0;margin-bottom:0">the user must know the message <s=
pan>detail</span> information in smc firmware.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">sw-bitmap and smc firwmare bitmap=
 must be same in smu driver.</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>if not,&nbsp;this sw-bitmap is meaningless.</div>
<div><br>
</div>
<p style=3D"margin-top:0;margin-bottom:0">Best Regards,</p>
<p style=3D"margin-top:0;margin-bottom:0">Kevin</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 8:45:15 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: correct confusing naming for=
 smu_feature_set_enabled</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:SimSun}
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:SimSun}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.x_MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p.x_msonormal0, li.x_msonormal0, div.x_msonormal0
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_xmsonormal, li.x_xmsonormal, div.x_xmsonormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_xmsonormal0, li.x_xmsonormal0, div.x_xmsonormal0
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_xmsochpdefault, li.x_xmsochpdefault, div.x_xmsochpdefault
	{margin-right:0in;
	margin-left:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif}
span.x_xmsohyperlink
	{color:blue;
	text-decoration:underline}
span.x_xmsohyperlinkfollowed
	{color:purple;
	text-decoration:underline}
span.x_xemailstyle18
	{font-family:"Calibri",sans-serif;
	color:windowtext}
span.x_EmailStyle26
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">The implementation of SMU_MSG_PowerDown[UP]Vcn (in=
 smu fw) already includes the identical hardware enablement/disablement of =
SMU_FEATURE_VCN_PG_BIT.</p>
<p class=3D"x_MsoNormal">Thus after that, only update the bitmask is enough=
. This is done on purpose.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Regards,</p>
<p class=3D"x_MsoNormal">Evan</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd=
.com&gt; <br>
<b>Sent:</b> Monday, July 22, 2019 4:11 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: correct confusing naming for=
 smu_feature_set_enabled</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div id=3D"x_divtagdefaultwrapper">
<p><span style=3D"font-size:12.0pt; color:black">in fact, the smu feature b=
itmap is cached of smc firmware hardware&nbsp;bitmap,</span></p>
<p><span style=3D"font-size:12.0pt; color:black">most of time, when driver =
want to check whether enable is available.</span></p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">the =
driver should talk with smc to check featue enabled.&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">i th=
ink it is very low efficiency.</span></p>
</div>
<p><span style=3D"font-size:12.0pt; color:black">so the driver will provide=
 a bitmap structure to store hardware&nbsp;feature status.</span></p>
<p><span style=3D"font-size:12.0pt; color:black">every time, the driver upd=
ate hardware feature state, also should be update software bitmap to sync i=
t.</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">if only update bitmap and =
don't set firmware feature enabled, the smu_feature_is_enabeld is maybe not=
 work correctly.</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">in your previous patch:</s=
pan></p>
<p><span style=3D"color:#212121">drm/amd/powerplay: correct Navi10 VCN powe=
rgate control.</span><span style=3D"font-size:12.0pt; color:black"></span><=
/p>
<p><span style=3D"font-size:12.0pt; color:black">after your patch,&nbsp;</s=
pan></p>
<p><span style=3D"font-size:12.0pt; color:black">the function&nbsp;smu_feat=
ure_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)</span></p>
<p><span style=3D"font-size:12.0pt; color:black">will retrun true, but in t=
he firmware, this feature maybe is not enabled.</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">so the function&nbsp;smu_f=
eature_is_enabled is not work well.</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">and smu_feature_is_support=
ed&nbsp;&nbsp;is full software&nbsp;feature, this is helper function to set=
 allowed feature mask when smu power on,</span></p>
<p><span style=3D"font-size:12.0pt; color:black">but this function is not u=
sed in smu driver,&nbsp;i want to remove them long long ago.</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">Best Regards,<br>
Kevin</span></p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.co=
m">Evan.Quan@amd.com</a>&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 3:17:55 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kev=
in1.Wang@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: correct confusing naming for=
 smu_feature_set_enabled</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_xmsonormal">I cannot get your point. What do you mean =93pair=
s of functions=94?</p>
<p class=3D"x_xmsonormal">Yes, this patch does not bring real changes.</p>
<p class=3D"x_xmsonormal">But this helps for future maintain and fit common=
 logic.</p>
<p class=3D"x_xmsonormal">1. As in my previous patch(=93drm/amd/powerplay: =
correct Navi10 VCN powergate control=94 ), &nbsp;=93smu_feature_set_enabled=
(smu, SMU_FEATURE_VCN_PG_BIT, enable);=94 was mistakenly used. I thought an=
d expected smu_feature_set_enabled set the bitmask
 on only. I do not want it to enable or disable the feature.</p>
<p class=3D"x_xmsonormal">2. smu_feature_set_enabled should in the same log=
ic as smu_feature_set_supported. It updates only the saved bit mask. That=
=92s the expected behavior for some APIs named as _<i>set</i>_enabled/suppo=
rted.</p>
<p class=3D"x_xmsonormal">3. The original callers who want feature enableme=
nt/disablement are updated to use smu_enable_smc_feature(). I do not see an=
y problem with that.</p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<p class=3D"x_xmsonormal">Regards,</p>
<p class=3D"x_xmsonormal">Evan</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_xmsonormal"><b>From:</b> Wang, Kevin(Yang) &lt;<a href=3D"mai=
lto:Kevin1.Wang@amd.com">Kevin1.Wang@amd.com</a>&gt;
<br>
<b>Sent:</b> Monday, July 22, 2019 3:00 PM<br>
<b>To:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: correct confusing naming for=
 smu_feature_set_enabled</p>
</div>
</div>
<p class=3D"x_xmsonormal">&nbsp;</p>
<div id=3D"x_x_divtagdefaultwrapper">
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">bef=
ore this patch, we have 4 apis to manage smu feature bits.
</span></p>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">the=
 patch add a new one in them, but it is not add any feature in smu.</span><=
/p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">&nb=
sp;</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">bef=
ore your patch:</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">smu=
_feature_is_enabled and smu_feature_set_enabled is pair of functions,</span=
></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">aft=
er your patch:</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">smu=
_feature_is_enabled and smu_enable_smc_feature is pair of functions;</span>=
</p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">&nb=
sp;</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">so =
the driver don't have&nbsp;scenario needs to use smu_feature_set_enabeld,&n=
bsp;</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">do =
you agree it?</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">&nb=
sp;</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">mos=
t of the time we update SMC feature, we must update software bitmap in smu_=
feature structure.</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">if =
not, the smu_feature_is_enabled funciton is not work well.</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">&nb=
sp;</span></p>
</div>
<div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">exte=
rn int smu_feature_init_dpm(struct smu_context *smu);</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">exte=
rn int smu_feature_is_enabled(struct smu_context *smu,</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">&nbs=
p; enum smu_feature_mask mask);</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">exte=
rn int smu_feature_set_enabled(struct smu_context *smu,</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">&nbs=
p; &nbsp;enum smu_feature_mask mask, bool enable);</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">exte=
rn int smu_feature_is_supported(struct smu_context *smu,</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">&nbs=
p; &nbsp; enum smu_feature_mask mask);</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">exte=
rn int smu_feature_set_supported(struct smu_context *smu,</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:9.0pt; color:black">&nbs=
p; &nbsp; &nbsp;enum smu_feature_mask mask, bool enable);</span></p>
</div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">&nb=
sp;</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">Bes=
t Regards,<br>
Kevin</span></p>
</div>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_xmsonormal"><b><span style=3D"color:black">From:</span></b><s=
pan style=3D"color:black"> amd-gfx &lt;</span><a href=3D"mailto:amd-gfx-bou=
nces@lists.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a><span =
style=3D"color:black">&gt; on behalf of Evan Quan
 &lt;</span><a href=3D"mailto:evan.quan@amd.com">evan.quan@amd.com</a><span=
 style=3D"color:black">&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 2:34:26 PM<br>
<b>To:</b> </span><a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@=
lists.freedesktop.org</a><span style=3D"color:black"> &lt;</span><a href=3D=
"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><sp=
an style=3D"color:black">&gt;<br>
<b>Cc:</b> Quan, Evan &lt;</span><a href=3D"mailto:Evan.Quan@amd.com">Evan.=
Quan@amd.com</a><span style=3D"color:black">&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: correct confusing naming for smu=
_feature_set_enabled</span>
</p>
<div>
<p class=3D"x_xmsonormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_xmsonormal">It does more than updating the bitmask. In fact i=
t enables also the<br>
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
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB32968DC2D03AD32F447A729AA2C40MN2PR12MB3296namp_--

--===============1772901113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1772901113==--
