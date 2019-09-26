Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DADBF3A9
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 15:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51AD6ED0E;
	Thu, 26 Sep 2019 13:06:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547D96ED0E
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 13:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrhVZlu/Nyo2QfyqZChVG8rCsuLqSvClQwyqbO5GmwR0Psu3tfxND9igSfBqHkf99BT3/+C5EI+DpID2BTMjRFi41ABPKxAhdEA7CGbtcsqB4MoZUQHBoJjYNk84qxxQkbpvyhM6s+AK9bYipkwlhgZdVanOS79j38jIELJbvi+FHrmZmQoSZgDTukoJG1FZKgm3VwqBX4+kzf2XKJnGBrS35iBW2y/gOC/+jWsneJhnjE8LHcvDYXQesOIz19zruwfrdFAs8HGtHdly5A06iZ1M/qPOJlVQt5fsL7gcV2CXvVGIzOziq+gDVMxOgXQPixa54rKFeMPXD4GEJawDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76j/91bN3ivV9d7zgnfHcH413LeRFBDOAuG4u3nCyuU=;
 b=fCT5AcCNXVn9ybb27lB06FtZaZ+x5ERr7ypKnrcr5SztgXtCBvPjKo+NRJ3NCqL2BOiQNsab00M2/hfzcqAPjCgn9G/rQxAggKSmIYAchQLmTS7L1rxooaX8Y1R8xHJAkWEbOSaZFd+kULalGtkU9CtnSAK89NOmkrEa57tq5/v9nhAKydmJZ/SUNFrrJeHDDZJNbsQeZFw1z+3pSTSPwnSk6LZUOg3QSMB+OGOatWUQX+njC20Ex0ZESV5UG8qFjn0QNi/FbrIOcnnPZf1jUGvMYcVd0YRYzbBFYC0AlvLDgohfqANj2tl/VuUQlyQ8v0xL1cQUacQxcG6f2vw1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3999.namprd12.prod.outlook.com (10.255.239.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 13:06:00 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 13:06:00 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Index: AQHVdEhGCFYYQbGscE2mazw/bqW7iKc94XiAgAAHOt0=
Date: Thu, 26 Sep 2019 13:06:00 +0000
Message-ID: <MN2PR12MB3296504F830A8D72700D11B1A2860@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190926085607.2510-1-kevin1.wang@amd.com>
 <20190926085607.2510-2-kevin1.wang@amd.com>,
 <MN2PR12MB334488D05D2FAEF84C6D550EE4860@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB334488D05D2FAEF84C6D550EE4860@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.227]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 104b2fb1-cb5e-42b0-ab8b-08d742824771
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3999:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB399901F2ED65929275D3CF2AA2860@MN2PR12MB3999.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(199004)(189003)(13464003)(25786009)(91956017)(7736002)(229853002)(26005)(186003)(446003)(33656002)(74316002)(11346002)(486006)(71200400001)(476003)(105004)(2906002)(6116002)(110136005)(6506007)(102836004)(19627405001)(76176011)(14454004)(54906003)(53546011)(478600001)(99286004)(7696005)(966005)(71190400001)(3846002)(606006)(86362001)(66476007)(66946007)(64756008)(66446008)(316002)(8936002)(66556008)(6246003)(2501003)(81156014)(4326008)(9686003)(76116006)(8676002)(6306002)(55016002)(54896002)(81166006)(5660300002)(66066001)(52536014)(14444005)(6436002)(236005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3999;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eQ7nd3B+s4XMKrhKXK1gHVzUc7pJj3AOaG19tixndtyaZxikfrpqHELp62pylQGDJO367j0O7WCQGfogVB0yhrWfyrTzWRh7XGbxRyC4qf6pMsyRP4Q8s3AFNv6VpgpgfXunxgVIQzDWfckrVv54esIeL2FDQmsbYYcjbyrQUhcM9pHMCjdmXuInOnAlKUdK7Gait//acuo2YA9eTBs9K8cU7m0cYk9E/7cCb8gbWc0/WyacQRwMRmT7CadTfsSrs59OKoZnvo+Vdkux0zjlmgmI8hP5X7JQNhmkrG8sZZxb55MrCDaHH7S8fZR4O3JX+LKrfBz9QUAfQj7lJdHQ+dvmg5D+55/W5llooQvWJvK7oRSznO7BXP6WbKGPLDWdMaLHOy1KimahHiLODeuuswRk/Dzj+fcY1dyEUuWRBZNuusWXOKZa9vLbgzq5Rok7itv9hmXccOffpM/VP0vioQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104b2fb1-cb5e-42b0-ab8b-08d742824771
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 13:06:00.6988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnbQLuhGGh+JANn5gRPR7p/9GyFHbZtOo3hSjovut1MvvEavb27gwnGtYPj42lFc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76j/91bN3ivV9d7zgnfHcH413LeRFBDOAuG4u3nCyuU=;
 b=kd/gd9i/4GAk1W635cwIFAZu58jr0mzlApPJqq74shVZPtIRwTSygLeuz5zsBP3nMeYiE7EidyMfAXJgy6klh7B+aDFL8Gr8jcpJAFa+JHSpBIFOfaNcbnOkhPtiA2P8jJk0L033OswYeAwyYr/7ZvuYQW8TPUJf8/YUGfmDQOQ=
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
Content-Type: multipart/mixed; boundary="===============1332670733=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1332670733==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296504F830A8D72700D11B1A2860MN2PR12MB3296namp_"

--_000_MN2PR12MB3296504F830A8D72700D11B1A2860MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Thursday, September 26, 2019 8:22 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; W=
ang, Kevin(Yang) <Kevin1.Wang@amd.com>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu

How about adding the mutex protection in smu_v11_0_send_msg_with_param and =
smu_v11_0_send_msg?
That seems able to simplify the code.

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Wang, Ke=
vin(Yang)
Sent: Thursday, September 26, 2019 4:56 PM
To: amd-gfx@lists.freedesktop.org
Cc: Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; W=
ang, Kevin(Yang) <Kevin1.Wang@amd.com>
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

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
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
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296504F830A8D72700D11B1A2860MN2PR12MB3296namp_
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
sure, you are right, the origin design should be add this lock into these f=
unctions,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
but only add these functions can't fix this issue.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
eg:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, H=
elvetica, sans-serif; background-color: rgb(255, 255, 255)"><i>&quot;watch =
-n 0 /sys/kenel/debug/dri0/amdgpu_pm_info&quot;</i></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, H=
elvetica, sans-serif; background-color: rgb(255, 255, 255)"><i>16 threads r=
un this command will cause smu error.</i></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
so this is workaound fix about sensor interface.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>in fact, the smu driver need more lock to protect smu resource.</span=
></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span>but too many locks can easily lead to deadlocks in smu driver.<=
br>
<span>solve the problem temporarily first and optimize this part later</spa=
n><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol>
<li>Message &#43; Param =3D=3D&gt; message param lock</li><li>Message &#43;=
 Message Result =3D=3D&gt; message result lock</li><li>Message1 &#43; Messa=
ge2 =3D=3D&gt; message pair lock (eg: SetFeatureLow and SetFeatureHigh)</li=
></ol>
<div><br>
</div>
<div>Best Regars,<br>
Kevin</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 8:22 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.=
Feng@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support =
for smu</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">How about adding the mutex protection in smu_v11_0=
_send_msg_with_param and smu_v11_0_send_msg?<br>
That seems able to simplify the code.<br>
<br>
-----Original Message-----<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf Of Wa=
ng, Kevin(Yang)<br>
Sent: Thursday, September 26, 2019 4:56 PM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@am=
d.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
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
Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
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
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296504F830A8D72700D11B1A2860MN2PR12MB3296namp_--

--===============1332670733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1332670733==--
