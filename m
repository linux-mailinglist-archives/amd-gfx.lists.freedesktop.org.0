Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18636F9DB
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 08:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413F389AEE;
	Mon, 22 Jul 2019 06:59:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174289ACD
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 06:59:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkTUHrzJzROXfSrc63vZX45cdVs5XyGJoTAMkXc0Xl6GRMeqyvW7/qrH/kTioCTjbkjsmcUBSPhDzkheDTxpCTj0G5mMP8PcGmZbnWcw8YZXi4rp52TJQj5gtZwKmxSGKH3WtX3fJ4NnGdDHankusYenCbNSf5jzPoDOFcTU0/96KcMkgX3xRxZiBha5xPzuC5w1vxYwePTVF6H4JwGUWLOPB2gAuYDGajOgGt8PpshLIK+aj869Bt0KQdAqyw9dZrySYyNl9MxMqLjz6pEuqaHJ/+0W63dB9cn07RwE0oLnz8S1tKDo2LBZiT+RIdg+L2hNFGrMQSDj54AHozvD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJM9HsTdSfMJSMNTiR/yy0xLjWnwAMqO6f0Tx0TNCOc=;
 b=CwNTc1/U3gT2gNREzJkNFr1K5O03/96zblcwGQmVmnRqs5/ehg7vXKpTtkP87f1zGWZNkKR3uk71HxEGhT+rPSIT+fec581CuhFIpLcbOtfmEypzkRFdAdJvW5DDvV2qf3vy7LBJkRuelBBNR/QZdWt+9vMP6GnYqJ5VOnO7gHGGEoAB3N7yBJSBwDmzw2x1YfhYVtZ9MAQuqpA1aCEqYeoB9b5bxpd1uN9N3gmLonJ3+//uc+ubpXJU9liEtIAaj/zvDgEib3ieLAMQMkVM96D/BZ7jrvrxktB+JKLW4FwbOBTDyqOHD6Wqv7ZPHnsgAXxMhEi5YT3SoS1ojwWgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2925.namprd12.prod.outlook.com (20.179.81.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 06:59:52 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 06:59:52 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: correct confusing naming for
 smu_feature_set_enabled
Thread-Topic: [PATCH] drm/amd/powerplay: correct confusing naming for
 smu_feature_set_enabled
Thread-Index: AQHVQFeOpOl2Nj5fbkSPD1SQzBMuWqbWMsLp
Date: Mon, 22 Jul 2019 06:59:52 +0000
Message-ID: <MN2PR12MB3296197F32A37621120B9709A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190722063426.19597-1-evan.quan@amd.com>
In-Reply-To: <20190722063426.19597-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 643ee86e-b73e-404e-86e5-08d70e72320b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2925; 
x-ms-traffictypediagnostic: MN2PR12MB2925:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB2925FE795981FA7F89681C4FA2C40@MN2PR12MB2925.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(199004)(189003)(52536014)(66446008)(7696005)(6506007)(53546011)(86362001)(64756008)(66476007)(66556008)(102836004)(76176011)(186003)(5660300002)(14444005)(256004)(26005)(53936002)(19627405001)(6246003)(55016002)(6306002)(54896002)(9686003)(236005)(66946007)(76116006)(11346002)(446003)(476003)(2906002)(486006)(14454004)(966005)(606006)(478600001)(68736007)(2501003)(81156014)(81166006)(6436002)(8936002)(74316002)(25786009)(66066001)(7736002)(6606003)(6116002)(3846002)(229853002)(8676002)(33656002)(316002)(110136005)(99286004)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2925;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s5mZQ/xWvzNlVVrP/m3PJVhd6XQmL6MX/xtm+diVGpQzQRQvydiZVsq8moF7VV8lHobXeVdIHLd13C4PmSWJf3NrnLUvBb0DE+d2oAJHdtOrqBoOhoOjwvz9ZwRZHFyVvHccwt5zFL7ZRBj82uCfATsG4GKwiAp+XATqAGC5Ilt/7VthNu5F3aD/50Q+I1eBucKgLsfFeNPdgrxvrcUuDsdbrY6FzZKX3y9vEfPk+hfSpDlH2wezb7g5Yom0YawiRScihlp7ohsE8yzvaI4QaD7WcxtIiUE0ZYvz4KMJM2TSEJGsblRcmPxyNoEYYNiSLLmyqQJPhlYQoB7KzXzYlNxig0Q/BGBeGl3AMHRc9bv2XfqXx9q+cMXd053IYNNMzbbJcExiDLLaygs7gzJkOLiKHwv4qtfw+MYLcA/KisY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643ee86e-b73e-404e-86e5-08d70e72320b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 06:59:52.4131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJM9HsTdSfMJSMNTiR/yy0xLjWnwAMqO6f0Tx0TNCOc=;
 b=Je6g9274BSmkyrKXoN21IXeIkmODN1X1T1iPy/q5hLzcvpQiuVEIih5kUjphDdmuJ75yEAtCPliNTXjQ2KeSEpOTvmxApcc1wVtbSGlcTzm8qoovGB9Pbmk36Es/PaLaQjcDLf1LsB90EpxyFdcC9qrx2BbJPLNorxcWJAL9i/4=
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
Content-Type: multipart/mixed; boundary="===============1111384964=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1111384964==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296197F32A37621120B9709A2C40MN2PR12MB3296namp_"

--_000_MN2PR12MB3296197F32A37621120B9709A2C40MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Monday, July 22, 2019 2:34:26 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH] drm/amd/powerplay: correct confusing naming for smu_featur=
e_set_enabled

It does more than updating the bitmask. In fact it enables also the
feature. That's confusing. As for this, a new API is added for the
feature enablement job. And smu_feature_set_enabled is updated to
setting the bitmask only(as smu_feature_set_supported).

Change-Id: I758e4461be34c0fcbdf19448e34180a5251926c4
Signed-off-by: Evan Quan <evan.quan@amd.com>
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
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296197F32A37621120B9709A2C40MN2PR12MB3296namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
before this patch, we have 4 apis to manage smu feature bits.
<div>the patch add a new one in them, but it is not add any feature in smu.=
</div>
<div><br>
</div>
<div>before your patch:</div>
<div>smu_feature_is_enabled and smu_feature_set_enabled is pair of function=
s,</div>
<div>after your patch:</div>
<div>smu_feature_is_enabled and smu_enable_smc_feature is pair of functions=
<span style=3D"font-size: 12pt;">;</span></div>
<div><span style=3D"font-size: 12pt;"><br>
</span></div>
<div><span style=3D"font-size: 12pt;"></span></div>
<div>so the driver don't have&nbsp;scenario needs to use smu_feature_set_en=
abeld,&nbsp;</div>
<div>do you agree it?</div>
<div><br>
</div>
<div>m<span style=3D"font-size: 12pt;">ost of the time we update SMC featur=
e, we must update software bitmap in smu_feature structure.</span></div>
<div>if not, the smu_feature_is_enabled funciton is not work well.</div>
<div><br>
</div>
<div>
<div></div>
<div><span style=3D"font-size: 9pt;">extern int smu_feature_init_dpm(struct=
 smu_context *smu);</span></div>
<div><span style=3D"font-size: 9pt;">extern int smu_feature_is_enabled(stru=
ct smu_context *smu,</span></div>
<div><span style=3D"white-space: pre; font-size: 9pt;"></span><span style=
=3D"font-size: 9pt;">&nbsp; enum smu_feature_mask mask);</span></div>
<div><span style=3D"font-size: 9pt;">extern int smu_feature_set_enabled(str=
uct smu_context *smu,</span></div>
<div><span style=3D"white-space: pre; font-size: 9pt;"></span><span style=
=3D"font-size: 9pt;">&nbsp; &nbsp;enum smu_feature_mask mask, bool enable);=
</span></div>
<div><span style=3D"font-size: 9pt;">extern int smu_feature_is_supported(st=
ruct smu_context *smu,</span></div>
<div><span style=3D"white-space: pre; font-size: 9pt;"></span><span style=
=3D"font-size: 9pt;">&nbsp; &nbsp; enum smu_feature_mask mask);</span></div=
>
<div><span style=3D"font-size: 9pt;">extern int smu_feature_set_supported(s=
truct smu_context *smu,</span></div>
<div><span style=3D"white-space: pre; font-size: 9pt;"></span><span style=
=3D"font-size: 9pt;">&nbsp; &nbsp; &nbsp;enum smu_feature_mask mask, bool e=
nable);</span></div>
<br>
</div>
<div>Best Regards,<br>
Kevin</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 2:34:26 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: correct confusing naming for smu=
_feature_set_enabled</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">It does more than updating the bitmask. In fact it=
 enables also the<br>
feature. That's confusing. As for this, a new API is added for the<br>
feature enablement job. And smu_feature_set_enabled is updated to<br>
setting the bitmask only(as smu_feature_set_supported).<br>
<br>
Change-Id: I758e4461be34c0fcbdf19448e34180a5251926c4<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
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
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296197F32A37621120B9709A2C40MN2PR12MB3296namp_--

--===============1111384964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1111384964==--
