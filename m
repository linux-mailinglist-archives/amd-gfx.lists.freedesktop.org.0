Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C5BFD37
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 04:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1629A6EE41;
	Fri, 27 Sep 2019 02:38:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820057.outbound.protection.outlook.com [40.107.82.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2476EE41
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 02:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZHHboSLukuTjD3Ji8oqsu1QRUbDC+gTzrGj/Ps3RH2UBpfVGogHaIkMcR3t23R34avOKD0RIYW/z/Yw1i8gk2/jz2qch4SrNFD504p4kdbdV8LvS1Qgiyiv4ojpp09tOhOhrxOikw/93MGPT6XU+IwJgaKIzm27zplTLH1okqge7WIsYMn0Ajjgn8n0Z8Qh9cffEqKrQglSa0RqUS+AuWqIt0GUqgRHVoim5sStUANoPC5hP1ebbRKzxLMORmV6wOPNBK8wnk/CNvrExG+sXwfzZeGuDIwy4NuUdyWp0Nq7DtKG2PLmZ7yWvj2p9KU6oMuMiwoxzSXadkc4uYXfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BXmekts9tpVJG5BS0ZCi1fKWz2OaXDrmagpbOQD1Ss=;
 b=gquO1RzdTtKkYj59KD7qQ5WKXQl9BuYBXqgnMgflwyFfnnb1npsGNjaC2vrAff7zIWckvFAbSKumf8XlLriBdhncvP041v9Bh4ShsGy7jTrjmgnHQSpcJQnOx6QCvt8fuUw6TgCyjKhPIRPEYQKqph/vVJSUcOlScXfrxPwrWJkESLXLb5s6bTHfqZoqVAK7GCldddvvut2X2b2vxcQNDp48xF4lUGInaA1Ql2UdUoXrlEiM32YbB+FBrH2WVqBCXOwdIY1ThWNqPMGziu/brzSyKn0OmcQBqMKgsodM3US9/Q9rpG2GipeOahNqT8miP+82jqgh3q87thTynB77GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3965.namprd12.prod.outlook.com (10.255.238.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 27 Sep 2019 02:38:43 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 02:38:43 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Index: AQHVdEhGCFYYQbGscE2mazw/bqW7iKc94XiAgAAHOt2AACaiAIAAqxYAgAAVV+4=
Date: Fri, 27 Sep 2019 02:38:43 +0000
Message-ID: <MN2PR12MB32963278B8715406994B4E82A2810@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190926085607.2510-1-kevin1.wang@amd.com>
 <20190926085607.2510-2-kevin1.wang@amd.com>,
 <MN2PR12MB334488D05D2FAEF84C6D550EE4860@MN2PR12MB3344.namprd12.prod.outlook.com>,
 <MN2PR12MB3296504F830A8D72700D11B1A2860@MN2PR12MB3296.namprd12.prod.outlook.com>
 <BN6PR12MB180969DC3D8DCB2FBE655DB8F7860@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <MN2PR12MB334452EBB72B75C0B7A0E870E4810@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB334452EBB72B75C0B7A0E870E4810@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41aed14c-2382-4b7a-4ad7-08d742f3d04d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3965:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB396544733F998FCE716A0F64A2810@MN2PR12MB3965.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(13464003)(199004)(189003)(64756008)(6116002)(66446008)(66476007)(91956017)(66556008)(66946007)(55016002)(19627405001)(76116006)(6246003)(74316002)(26005)(54906003)(2501003)(25786009)(478600001)(186003)(99286004)(966005)(2906002)(33656002)(236005)(14454004)(9686003)(54896002)(6306002)(76176011)(3846002)(66066001)(476003)(8676002)(7696005)(81156014)(11346002)(446003)(81166006)(8936002)(6506007)(53546011)(4326008)(5660300002)(52536014)(102836004)(7736002)(105004)(486006)(71200400001)(71190400001)(316002)(6436002)(606006)(86362001)(229853002)(19627235002)(14444005)(110136005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3965;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sEDdYHyYiTvvKAQ2xtyYUZ9QXpYoPhEmcTkUcMH/2AvDkW/ERswMLxznjq6IHDGI8fo83aCaKG3xC9NhQO43KrXQ+apMMwo3ZE4UOJuhwyn8ggeGYD4WNAaXznSsUag7Ba53ejQq1nlE1C5hw4MQ7Nv5tWGmHnMU1PN5uGD3cWAjL4zOg3tGXvsJ/PUfWE1xhE3KMaPG6xqPQPhEds0y2LMNdK+f5NFG7jDrkeqWE19unWWkTwMsLKe6siY5cMIFb2sEUOPeJ3c9ecZwQ82pQ7ojbcEHrkibkWBboYdmsfySYe26LShmCjK0h85nWddzFmm9pQx9GpoIrPr6439VQHTNJj2rdz7fc+ZN9BFOe3k278ORhYIPLh5jADStYDBGWzt30QH/xE9Wd9tttvuAsQ+oK/2tM9dmlgGD4VCpTgBfBV+c0hTSll00KrjrRLwnLIQ5mbIewVuL2ic3Ywo3/Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aed14c-2382-4b7a-4ad7-08d742f3d04d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 02:38:43.3688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+MHji6xykFRefMGyIqKuWPVxRhSu4aF4LzXVByCuM3PkSbOXsPGvpAIFj7xwKxs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3965
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BXmekts9tpVJG5BS0ZCi1fKWz2OaXDrmagpbOQD1Ss=;
 b=INy8J+NeDjYKN/G03S83SEuM4BOn5SN+s4qgQRb0LlM8wqMSIk1+6ifNBmb8Wvg9rtmQiC3SrKHVNKBgMWayQeGPpJld6MeOkZWUZI7oKprJLFiCyHKILcP5EaZL0RUBN+4qta2ctXktx1GFfBO2sWjzbcER4qchl/LJ4MGzZM8=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0393329711=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0393329711==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32963278B8715406994B4E82A2810MN2PR12MB3296namp_"

--_000_MN2PR12MB32963278B8715406994B4E82A2810MN2PR12MB3296namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

the smu driver need to split and optimize "smu->mutex"  first,
because this lock is used on most scene.
after this lock clearly, we can define more fine-grained lock resource in s=
mu driver.

Best Regards,
Kevin

________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Friday, September 27, 2019 9:18 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Wang, Kevin(Yang) <Kevi=
n1.Wang@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.=
org>
Cc: Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu


There should be no issue with old powerplay routines.

As there is API lock(hwmgr->smu_lock) in amd_powerplay.c.

It=92s quite coarse-grained but working.



In fact, I=92m considering whether we need to take the same way in swSMU ro=
utine.

Since for now it=92s hard to define what we are protecting for and thus fin=
d a better fine-grained mutex.



Regards,

Evan

From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Thursday, September 26, 2019 11:06 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Quan, Evan <Evan.Quan@amd.com>=
; amd-gfx@lists.freedesktop.org
Cc: Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu



Does the older powerplay code need a similar fix?



Alex

________________________________

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Wang, Kevin(Yang) <Kevin1.Wang@amd.co=
m<mailto:Kevin1.Wang@amd.com>>
Sent: Thursday, September 26, 2019 9:06 AM
To: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freed=
esktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Huang, Ray <Ray.Huang@amd.com<mailto:Ray.Huang@amd.com>>; Feng, Kenneth=
 <Kenneth.Feng@amd.com<mailto:Kenneth.Feng@amd.com>>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu



sure, you are right, the origin design should be add this lock into these f=
unctions,

but only add these functions can't fix this issue.

eg:

"watch -n 0 /sys/kenel/debug/dri0/amdgpu_pm_info"

16 threads run this command will cause smu error.



so this is workaound fix about sensor interface.

in fact, the smu driver need more lock to protect smu resource.

but too many locks can easily lead to deadlocks in smu driver.
solve the problem temporarily first and optimize this part later

  1.  Message + Param =3D=3D> message param lock
  2.  Message + Message Result =3D=3D> message result lock
  3.  Message1 + Message2 =3D=3D> message pair lock (eg: SetFeatureLow and =
SetFeatureHigh)



Best Regars,
Kevin

________________________________

From: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Sent: Thursday, September 26, 2019 8:22 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>; am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@=
lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Huang, Ray <Ray.Huang@amd.com<mailto:Ray.Huang@amd.com>>; Feng, Kenneth=
 <Kenneth.Feng@amd.com<mailto:Kenneth.Feng@amd.com>>; Wang, Kevin(Yang) <Ke=
vin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu



How about adding the mutex protection in smu_v11_0_send_msg_with_param and =
smu_v11_0_send_msg?
That seems able to simplify the code.

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> On Behalf Of Wang, Kevin(Yang)
Sent: Thursday, September 26, 2019 4:56 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Huang, Ray <Ray.Huang@amd.com<mailto:Ray.Huang@amd.com>>; Feng, Kenneth=
 <Kenneth.Feng@amd.com<mailto:Kenneth.Feng@amd.com>>; Wang, Kevin(Yang) <Ke=
vin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
Subject: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu

when multithreading access sysfs of amdgpu_pm_info at the sametime.
the swsmu driver cause smu firmware hang.

eg:
single thread access:
Message A + Param A =3D=3D> right
Message B + Param B =3D=3D> right
Message C + Param C =3D=3D> right
multithreading access:
Message A + Param B =3D=3D> error
Message B + Param A =3D=3D> error
Message C + Param C =3D=3D> right

the patch will add sensor lock(mutex) to avoid this error.

Signed-off-by: Kevin Wang <kevin1.wang@amd.com<mailto:kevin1.wang@amd.com>>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c     | 2 ++
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c   | 2 ++
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 1 +
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c     | 2 ++
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c     | 2 ++
 5 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 23293e15636b..df510cb86da5 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -840,6 +840,8 @@ static int smu_sw_init(void *handle)
         smu->smu_baco.state =3D SMU_BACO_STATE_EXIT;
         smu->smu_baco.platform_support =3D false;

+       mutex_init(&smu->sensor_lock);
+
         smu->watermarks_bitmap =3D 0;
         smu->power_profile_mode =3D PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
         smu->default_power_profile_mode =3D PP_SMC_POWER_PROFILE_BOOTUP_DE=
FAULT;
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c
index a047a7ec3698..b9b7b73354a0 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -1025,6 +1025,7 @@ static int arcturus_read_sensor(struct smu_context *s=
mu,
         if (!data || !size)
                 return -EINVAL;

+       mutex_lock(&smu->sensor_lock);
         switch (sensor) {
         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
                 *(uint32_t *)data =3D pptable->FanMaximumRpm; @@ -1051,6 +=
1052,7 @@ static int arcturus_read_sensor(struct smu_context *smu,
         default:
                 ret =3D smu_smc_read_sensor(smu, sensor, data, size);
         }
+       mutex_unlock(&smu->sensor_lock);

         return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index 5c898444ff97..bc4b73e0718e 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -350,6 +350,7 @@ struct smu_context
         const struct smu_funcs          *funcs;
         const struct pptable_funcs      *ppt_funcs;
         struct mutex                    mutex;
+       struct mutex                    sensor_lock;
         uint64_t pool_size;

         struct smu_table_context        smu_table;
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index db2e181ba45a..c0b640d8d9e1 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1387,6 +1387,7 @@ static int navi10_read_sensor(struct smu_context *smu=
,
         if(!data || !size)
                 return -EINVAL;

+       mutex_lock(&smu->sensor_lock);
         switch (sensor) {
         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
                 *(uint32_t *)data =3D pptable->FanMaximumRpm; @@ -1410,6 +=
1411,7 @@ static int navi10_read_sensor(struct smu_context *smu,
         default:
                 ret =3D smu_smc_read_sensor(smu, sensor, data, size);
         }
+       mutex_unlock(&smu->sensor_lock);

         return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index 9082da1578d1..f655ebd9ba22 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3017,6 +3017,7 @@ static int vega20_read_sensor(struct smu_context *smu=
,
         if(!data || !size)
                 return -EINVAL;

+       mutex_lock(&smu->sensor_lock);
         switch (sensor) {
         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
                 *(uint32_t *)data =3D pptable->FanMaximumRpm; @@ -3042,6 +=
3043,7 @@ static int vega20_read_sensor(struct smu_context *smu,
         default:
                 ret =3D smu_smc_read_sensor(smu, sensor, data, size);
         }
+       mutex_unlock(&smu->sensor_lock);

         return ret;
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32963278B8715406994B4E82A2810MN2PR12MB3296namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the smu driver need to split and optimize &quot;smu-&gt;mutex&quot;&nbsp; f=
irst,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>because this lock is used on most&nbsp;scene.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>after this lock clearly, we can define more fine-grained lock resourc=
e in smu driver.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Best Regards,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Kevin<br>
</span>
<div><br>
</div>
<span></span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Friday, September 27, 2019 9:18 AM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Wang, Kevi=
n(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-=
gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.=
Feng@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support =
for smu</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:DengXian}
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
span.x_EmailStyle20
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
div.x_WordSection1
	{}
ol
	{margin-bottom:0in}
ul
	{margin-bottom:0in}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">There should be no issue with old powerplay routin=
es. </p>
<p class=3D"x_MsoNormal">As there is API lock(hwmgr-&gt;smu_lock) in amd_po=
werplay.c.</p>
<p class=3D"x_MsoNormal">It=92s quite coarse-grained but working.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">In fact, I=92m considering whether we need to take=
 the same way in swSMU routine.</p>
<p class=3D"x_MsoNormal">Since for now it=92s hard to define what we are pr=
otecting for and thus find a better fine-grained mutex.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Regards,</p>
<p class=3D"x_MsoNormal">Evan</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuc=
her@amd.com&gt;
<br>
<b>Sent:</b> Thursday, September 26, 2019 11:06 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Quan, Evan &lt;Ev=
an.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.=
Feng@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: add sensor lock support =
for smu</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Does=
 the older powerplay code need a similar fix?</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Alex=
</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lis=
ts.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf=
 of Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kevin1.Wan=
g@amd.com</a>&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 9:06 AM<br>
<b>To:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Huang, Ray &lt;<a href=3D"mailto:Ray.Huang@amd.com">Ray.Huang@am=
d.com</a>&gt;; Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Ke=
nneth.Feng@amd.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: add sensor lock support =
for smu</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">sure=
, you are right, the origin design should be add this lock into these funct=
ions,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">but =
only add these functions can't fix this issue.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">eg:<=
/span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><i><span style=3D"font-size:12.0pt; color:black; b=
ackground:white">&quot;watch -n 0 /sys/kenel/debug/dri0/amdgpu_pm_info&quot=
;</span></i><span style=3D"font-size:12.0pt; color:black"></span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><i><span style=3D"font-size:12.0pt; color:black; b=
ackground:white">16 threads run this command will cause smu error.</span></=
i><span style=3D"font-size:12.0pt; color:black"></span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">so t=
his is workaound fix about sensor interface.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">in f=
act, the smu driver need more lock to protect smu resource.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">but =
too many locks can easily lead to deadlocks in smu driver.<br>
solve the problem temporarily first and optimize this part later</span></p>
</div>
<div>
<ol start=3D"1" type=3D"1">
<li class=3D"x_MsoNormal" style=3D"color:black"><span style=3D"font-size:12=
.0pt">Message &#43; Param =3D=3D&gt; message param lock</span></li><li clas=
s=3D"x_MsoNormal" style=3D"color:black"><span style=3D"font-size:12.0pt">Me=
ssage &#43; Message Result =3D=3D&gt; message result lock</span></li><li cl=
ass=3D"x_MsoNormal" style=3D"color:black"><span style=3D"font-size:12.0pt">=
Message1 &#43; Message2 =3D=3D&gt; message pair lock (eg: SetFeatureLow and=
 SetFeatureHigh)</span></li></ol>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Best=
 Regars,<br>
Kevin</span></p>
</div>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.co=
m">Evan.Quan@amd.com</a>&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 8:22 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kev=
in1.Wang@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Huang, Ray &lt;<a href=3D"mailto:Ray.Huang@amd.com">Ray.Huang@am=
d.com</a>&gt;; Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Ke=
nneth.Feng@amd.com</a>&gt;; Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.=
Wang@amd.com">Kevin1.Wang@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support =
for smu</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal">How about adding the mutex protection in smu_v11_0=
_send_msg_with_param and smu_v11_0_send_msg?<br>
That seems able to simplify the code.<br>
<br>
-----Original Message-----<br>
From: amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">=
amd-gfx-bounces@lists.freedesktop.org</a>&gt; On Behalf Of Wang, Kevin(Yang=
)<br>
Sent: Thursday, September 26, 2019 4:56 PM<br>
To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesk=
top.org</a><br>
Cc: Huang, Ray &lt;<a href=3D"mailto:Ray.Huang@amd.com">Ray.Huang@amd.com</=
a>&gt;; Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.F=
eng@amd.com</a>&gt;; Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@am=
d.com">Kevin1.Wang@amd.com</a>&gt;<br>
Subject: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu<br>
<br>
when multithreading access sysfs of amdgpu_pm_info at the sametime.<br>
the swsmu driver cause smu firmware hang.<br>
<br>
eg:<br>
single thread access:<br>
Message A &#43; Param A =3D=3D&gt; right<br>
Message B &#43; Param B =3D=3D&gt; right<br>
Message C &#43; Param C =3D=3D&gt; right<br>
multithreading access:<br>
Message A &#43; Param B =3D=3D&gt; error<br>
Message B &#43; Param A =3D=3D&gt; error<br>
Message C &#43; Param C =3D=3D&gt; right<br>
<br>
the patch will add sensor lock(mutex) to avoid this error.<br>
<br>
Signed-off-by: Kevin Wang &lt;<a href=3D"mailto:kevin1.wang@amd.com">kevin1=
.wang@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp;&nbsp; | =
2 &#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/arcturus_ppt.c&nbsp;&nbsp; | 2 &#43;&#4=
3;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp;&nbsp; | =
2 &#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp; | =
2 &#43;&#43;<br>
&nbsp;5 files changed, 9 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 23293e15636b..df510cb86da5 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -840,6 &#43;840,8 @@ static int smu_sw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smu_baco.state =3D=
 SMU_BACO_STATE_EXIT;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smu_baco.platform_=
support =3D false;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_init(&amp;smu-&gt;sensor_lo=
ck);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;watermarks_bitmap =
=3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;power_profile_mode=
 =3D PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;default_power_prof=
ile_mode =3D PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c<br>
index a047a7ec3698..b9b7b73354a0 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
@@ -1025,6 &#43;1025,7 @@ static int arcturus_read_sensor(struct smu_contex=
t *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!data || !size)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;sensor_lo=
ck);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MAX_=
FAN_RPM:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm; @@ -=
1051,6 &#43;1052,7 @@ static int arcturus_read_sensor(struct smu_context *s=
mu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_read_sensor(smu, sensor, data, size);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;smu-&gt;sensor_=
lock);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index 5c898444ff97..bc4b73e0718e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -350,6 &#43;350,7 @@ struct smu_context<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct smu_funcs&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *funcs;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct pptable_funcs=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *ppt_funcs;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; mutex;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; sensor_lock;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t pool_size;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index db2e181ba45a..c0b640d8d9e1 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1387,6 &#43;1387,7 @@ static int navi10_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!data || !size)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;sensor_lo=
ck);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MAX_=
FAN_RPM:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm; @@ -=
1410,6 &#43;1411,7 @@ static int navi10_read_sensor(struct smu_context *smu=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_read_sensor(smu, sensor, data, size);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;smu-&gt;sensor_=
lock);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index 9082da1578d1..f655ebd9ba22 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -3017,6 &#43;3017,7 @@ static int vega20_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!data || !size)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;sensor_lo=
ck);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MAX_=
FAN_RPM:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm; @@ -=
3042,6 &#43;3043,7 @@ static int vega20_read_sensor(struct smu_context *smu=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_read_sensor(smu, sensor, data, size);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;smu-&gt;sensor_=
lock);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
--<br>
2.17.1<br>
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
</body>
</html>

--_000_MN2PR12MB32963278B8715406994B4E82A2810MN2PR12MB3296namp_--

--===============0393329711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0393329711==--
