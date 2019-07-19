Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779036E85C
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 18:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C086C6E849;
	Fri, 19 Jul 2019 16:01:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810042.outbound.protection.outlook.com [40.107.81.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672D66E849
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 16:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYN9s3snX3XhqiHMcGNVlJcdwNlplIzLCufvrthBZhai79Ac4JNT/QobjbsrFSn7VkF1xWufQw8GmOtmOOgwrOc/hkDeo2RXLplZkDzOyp2yW4kMQnOLG0v1PTG2NceyncIPLS0vd7x4idGr12bZ+5mOkNrnuoOkDYhBPm0plpdgkjTS2PkJWTAXy724pqzR5bs7IyKt6VNf6Cn44+xwQhmcyE2oRCGQGIa5+fWeDmdxsPYc/lrPTcQJVke90nxiCDoS6BrV5ZAVVasOVrRgGbu2drHVHXCEcmgH/+xuSOpOf9CN6vjeCkz9CuBigxnUX/0x2Iow97tPIN+VK+r9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtFidVuSS8Os/jORJccReeUZKlnER09X8ioAxjPIwNw=;
 b=RmKJPlBYSVVtzePouCHZoLk8x9e9lVk6tdCnRflh+tfMdJazkiK05MUQEwv+5Yc4Er82g4h6a6mqeMCTMSsi7+11Qj/7nF8tPbCnh9YWuHMbOHtPR0G7DRaQmskBwIs/qBgRb/ls5+mNTKIPQeJVk0/3pzpUhw99eRzgA8OjyUp8mdyXZ3ht/rIBaOLJvNqfXOVVrbsLu3wEWUvvOAaSRZ3Ip095xhbchpIfE9ERAzYSV95FraVMe2mTANvSoVhQWofpKNLr2zzxgiduuD5zEWTVe9lRNZYBdiKvb+M3BJmsl1LC5RwoIuIk4NwiHiQL3gygomOQNOnrL0V29W1NNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2SPR01MB0018.namprd12.prod.outlook.com (52.132.175.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 16:01:19 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 16:01:19 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu
Thread-Topic: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu
Thread-Index: AQHVPiRSk9MGWtLBPEK88r6x15MBV6bSDcOAgAAG1fY=
Date: Fri, 19 Jul 2019 16:01:18 +0000
Message-ID: <MN2PR12MB329684D6E227BE0132F67A8EA2CB0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190719112232.28485-1-kevin1.wang@amd.com>,
 <CADnq5_P2UVmm4P1myih0UOQ2nvLDB01zdaFN9v7p423QeLASKg@mail.gmail.com>
In-Reply-To: <CADnq5_P2UVmm4P1myih0UOQ2nvLDB01zdaFN9v7p423QeLASKg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bc149fe-73e1-442d-e327-08d70c625654
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2SPR01MB0018; 
x-ms-traffictypediagnostic: MN2SPR01MB0018:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2SPR01MB00183C13F73C036834251F00A2CB0@MN2SPR01MB0018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(189003)(199004)(1015004)(478600001)(966005)(14454004)(76176011)(7696005)(66946007)(229853002)(66476007)(66556008)(99286004)(476003)(5660300002)(25786009)(76116006)(14444005)(256004)(66446008)(7736002)(64756008)(102836004)(6606003)(33656002)(81156014)(8936002)(74316002)(186003)(6916009)(26005)(81166006)(446003)(66066001)(486006)(4326008)(11346002)(53546011)(6506007)(52536014)(54896002)(86362001)(9686003)(6436002)(6116002)(316002)(19627405001)(606006)(8676002)(3846002)(68736007)(53936002)(2906002)(6306002)(6246003)(236005)(1411001)(54906003)(71200400001)(71190400001)(55016002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0018;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gxzpJO4nVjXlPi/J+qpFg9dzzaQD8W7WeoThVCKDK29vgzQQ96GPHLSFAHRAMcx8w2eOOOo2fe1jP5Bz+HNJiyGxw3ZzmKPO5d3ZReF1qr/PiCHOWsT3aI/SqUrqzWrHYUuVRZ7yhhFZ0kmjGmlK9pVGXW4syjidT+Qxu4+44tncUdK/EdUWB6h5h7BAMFLdbOWCAqPIZGfspQAN+tNRjbYEdeX7n/jR0KTEasg35JA5qdYOW7DfyDeBtn3Pcaq4iNrC4LQg4fH11irckgAss4uTtpjtb7HJfUgv12QmqYJqfFM6TOF3KQKR0JYhrMRxaANPCWtzPNLjsgIiVcY7dtXkdGRvEMbmtNdPSNShsN7ZToUDS5jXaN9vFpsuZ/OjTHvkZeveYBowK30yApvQhymtKxfa+7zBW53NE4hE9k0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc149fe-73e1-442d-e327-08d70c625654
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 16:01:18.9587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtFidVuSS8Os/jORJccReeUZKlnER09X8ioAxjPIwNw=;
 b=Ud7TJ5c4T+9YkzSJOseJUXWUDe0E99ZeFVIyMMUPeU1BDIsrEj5IdJjckCPldLepnhEFAftvpJpPFZL6H8+HFOvFGE1CKBvR55OVm8qNNkpfouyUwwXckuz0Uym/1DJJ9qS4iV/KUHbs4uSkPvsLOuirFblvJtOgsmaTDaOOXxU=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0380522149=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0380522149==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329684D6E227BE0132F67A8EA2CB0MN2PR12MB3296namp_"

--_000_MN2PR12MB329684D6E227BE0132F67A8EA2CB0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Friday, July 19, 2019 11:17 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Huang, R=
ay <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in =
smu

On Fri, Jul 19, 2019 at 7:23 AM Wang, Kevin(Yang) <Kevin1.Wang@amd.com> wro=
te:
>
> each asic maybe has different read sensor method.
> so change read sensor sequence in smu.
>
> read sensor sequence:
> asic sensor --> smc sensor (smu 11...) --> default_sensor (common)

I think this makes sense.  That said, the current swSMU callback
structures are really confusing.  I think we should switch to a single
set of per asic callbacks and then add common helpers.  Then for asics
where it makes sense we can just use the helper as the callback for
all relevant asics.  If they need something asic specific, use the
asic specific function.  That should avoid the current mix of
callbacks and make it clearer what code gets used when.

Alex

[kevin]:

thanks review, in current code, the read sensor related function is not ver=
y clear, so i want to refine them.
but I'm not sure which way to write good code logic.

way 1:

provide a puiblic function named smu_read_sensor as public smu api for othe=
r kenel module, like this patch.
this function will try to get value from asic or smu ip level or common, ca=
ll them in turn according to the rules.

way 2:

define a maco named smu_read_sensor as public api, implement it in xxx_ppt.=
c file,
if can't handle sensor type in xxx_ppt.c, then call helper in smu_v11_0.c, =
 then call amdgpu_smu.c helper.

in this way, it means we must implement this callback function in xxx_ppt.c=
.
if need to support new asic, we should add some dulicated code in xxx_ppt.c=
, if not the smu_read_sensor api is not work well.
in smu module, use many macros as module public api, it is impossible to te=
ll at what level these macros implement specific code logic.
so i want to refine them.

do you think which way is good for this case?
thanks.

>
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    | 26 +++++++++++++++++--
>  .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |  9 ++++---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c    |  3 +++
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c     | 10 +++----
>  drivers/gpu/drm/amd/powerplay/vega20_ppt.c    |  3 +++
>  5 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm=
/amd/powerplay/amdgpu_smu.c
> index 05b91bc5054c..85269f86cae2 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -284,11 +284,14 @@ int smu_get_power_num_states(struct smu_context *sm=
u,
>         return 0;
>  }
>
> -int smu_common_read_sensor(struct smu_context *smu, enum amd_pp_sensors =
sensor,
> -                          void *data, uint32_t *size)
> +int smu_default_read_sensor(struct smu_context *smu, enum amd_pp_sensors=
 sensor,
> +                           void *data, uint32_t *size)
>  {
>         int ret =3D 0;
>
> +       if (!data || !size)
> +               return -EINVAL;
> +
>         switch (sensor) {
>         case AMDGPU_PP_SENSOR_STABLE_PSTATE_SCLK:
>                 *((uint32_t *)data) =3D smu->pstate_sclk;
> @@ -321,6 +324,25 @@ int smu_common_read_sensor(struct smu_context *smu, =
enum amd_pp_sensors sensor,
>         return ret;
>  }
>
> +int smu_read_sensor(struct smu_context *smu, enum amd_pp_sensors sensor,
> +                   void *data, uint32_t *size)
> +{
> +       int ret =3D 0;
> +
> +       if (!data || !size)
> +               return -EINVAL;
> +
> +       /* handle sensor sequence: asic --> ip level -->  default */
> +       ret =3D smu_asic_read_sensor(smu, sensor, data, size);
> +       if (ret) {
> +               ret =3D smu_smc_read_sensor(smu, sensor, data, size);
> +               if (ret)
> +                       ret =3D smu_default_read_sensor(smu, sensor, data=
, size);
> +       }
> +
> +       return ret;
> +}
> +
>  int smu_update_table(struct smu_context *smu, enum smu_table_id table_in=
dex, int argument,
>                      void *table_data, bool drv2smu)
>  {
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu=
/drm/amd/powerplay/inc/amdgpu_smu.h
> index 34093ddca105..462bae8d62aa 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> @@ -820,10 +820,10 @@ struct smu_funcs
>         ((smu)->ppt_funcs->set_thermal_fan_table ? (smu)->ppt_funcs->set_=
thermal_fan_table((smu)) : 0)
>  #define smu_start_thermal_control(smu) \
>         ((smu)->funcs->start_thermal_control? (smu)->funcs->start_thermal=
_control((smu)) : 0)
> -#define smu_read_sensor(smu, sensor, data, size) \
> -       ((smu)->funcs->read_sensor? (smu)->funcs->read_sensor((smu), (sen=
sor), (data), (size)) : 0)
> +#define smu_smc_read_sensor(smu, sensor, data, size) \
> +       ((smu)->funcs->read_sensor? (smu)->funcs->read_sensor((smu), (sen=
sor), (data), (size)) : -EINVAL)
>  #define smu_asic_read_sensor(smu, sensor, data, size) \
> -       ((smu)->ppt_funcs->read_sensor? (smu)->ppt_funcs->read_sensor((sm=
u), (sensor), (data), (size)) : 0)
> +       ((smu)->ppt_funcs->read_sensor? (smu)->ppt_funcs->read_sensor((sm=
u), (sensor), (data), (size)) : -EINVAL)
>  #define smu_get_power_profile_mode(smu, buf) \
>         ((smu)->ppt_funcs->get_power_profile_mode ? (smu)->ppt_funcs->get=
_power_profile_mode((smu), buf) : 0)
>  #define smu_set_power_profile_mode(smu, param, param_size) \
> @@ -989,5 +989,6 @@ enum amd_dpm_forced_level smu_get_performance_level(s=
truct smu_context *smu);
>  int smu_force_performance_level(struct smu_context *smu, enum amd_dpm_fo=
rced_level level);
>  int smu_set_display_count(struct smu_context *smu, uint32_t count);
>  bool smu_clk_dpm_is_enabled(struct smu_context *smu, enum smu_clk_type c=
lk_type);
> -
> +int smu_read_sensor(struct smu_context *smu, enum amd_pp_sensors sensor,
> +                   void *data, uint32_t *size);
>  #endif
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm=
/amd/powerplay/navi10_ppt.c
> index 46e2913e4af4..0a53695785b6 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1365,6 +1365,9 @@ static int navi10_read_sensor(struct smu_context *s=
mu,
>         struct smu_table_context *table_context =3D &smu->smu_table;
>         PPTable_t *pptable =3D table_context->driver_pptable;
>
> +       if (!data || !size)
> +               return -EINVAL;
> +
>         switch (sensor) {
>         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
>                 *(uint32_t *)data =3D pptable->FanMaximumRpm;
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/=
amd/powerplay/smu_v11_0.c
> index 76bc157525d0..2679b6ff6ca3 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -1267,6 +1267,10 @@ static int smu_v11_0_read_sensor(struct smu_contex=
t *smu,
>                                  void *data, uint32_t *size)
>  {
>         int ret =3D 0;
> +
> +       if (!data || !size)
> +               return -EINVAL;
> +
>         switch (sensor) {
>         case AMDGPU_PP_SENSOR_GFX_MCLK:
>                 ret =3D smu_get_current_clk_freq(smu, SMU_UCLK, (uint32_t=
 *)data);
> @@ -1285,14 +1289,10 @@ static int smu_v11_0_read_sensor(struct smu_conte=
xt *smu,
>                 *size =3D 4;
>                 break;
>         default:
> -               ret =3D smu_common_read_sensor(smu, sensor, data, size);
> +               ret =3D -EINVAL;
>                 break;
>         }
>
> -       /* try get sensor data by asic */
> -       if (ret)
> -               ret =3D smu_asic_read_sensor(smu, sensor, data, size);
> -
>         if (ret)
>                 *size =3D 0;
>
> diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm=
/amd/powerplay/vega20_ppt.c
> index bcd0efaf7bbd..b44ec7c670c5 100644
> --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> @@ -3146,6 +3146,9 @@ static int vega20_read_sensor(struct smu_context *s=
mu,
>         struct smu_table_context *table_context =3D &smu->smu_table;
>         PPTable_t *pptable =3D table_context->driver_pptable;
>
> +       if (!data || !size)
> +               return -EINVAL;
> +
>         switch (sensor) {
>         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
>                 *(uint32_t *)data =3D pptable->FanMaximumRpm;
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB329684D6E227BE0132F67A8EA2CB0MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Friday, July 19, 2019 11:17 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@a=
md.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: change smu_read_sensor seque=
nce in smu</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Jul 19, 2019 at 7:23 AM Wang, Kevin(Yang) =
&lt;Kevin1.Wang@amd.com&gt; wrote:<br>
&gt;<br>
&gt; each asic maybe has different read sensor method.<br>
&gt; so change read sensor sequence in smu.<br>
&gt;<br>
&gt; read sensor sequence:<br>
&gt; asic sensor --&gt; smc sensor (smu 11...) --&gt; default_sensor (commo=
n)<br>
<br>
I think this makes sense.&nbsp; That said, the current swSMU callback<br>
structures are really confusing.&nbsp; I think we should switch to a single=
<br>
set of per asic callbacks and then add common helpers.&nbsp; Then for asics=
<br>
where it makes sense we can just use the helper as the callback for<br>
all relevant asics.&nbsp; If they need something asic specific, use the<br>
asic specific function.&nbsp; That should avoid the current mix of<br>
callbacks and make it clearer what code gets used when.<br>
<br>
Alex</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">thanks review, in current code, the read sensor re=
lated function is not very clear, so i want to refine them.</div>
<div class=3D"PlainText"></div>
<div>but&nbsp;I'm not sure which way to write good code logic.</div>
<div><br>
</div>
<div>way 1:</div>
<div><br>
</div>
<div>provide a puiblic function named smu_read_sensor as public smu api for=
 other kenel module, like this patch.</div>
<div>this function will try to get value from asic or smu ip level or commo=
n,&nbsp;c<span style=3D"font-size: 11pt;">all them in turn according to the=
 rules.</span></div>
<div><br>
</div>
<div>way 2:</div>
<div><br>
</div>
<div>define a maco named smu_read_sensor as public api, implement it in xxx=
_ppt.c file,&nbsp;</div>
<div>if can't handle sensor type&nbsp;in xxx_ppt.c, then call helper in smu=
_v11_0.c,&nbsp; then call amdgpu_smu.c helper.</div>
<div><br>
</div>
<div>in this way, it means we must implement this callback function in xxx_=
ppt.c.</div>
<div>if need to support new asic, we should add some dulicated code in xxx_=
ppt.c,&nbsp;<span style=3D"font-family: Calibri, Helvetica, sans-serif, Emo=
jiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColo=
rEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbol=
s; font-size: 14.6667px;">if
 not the smu_read_sensor api is not work well.</span><span></span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji,=
 &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font=
-size: 14.6667px;">in smu module, use many macros as module public api, it<=
/span>&nbsp;is
 impossible to tell at what level these macros implement specific code logi=
c.</div>
<div>so i want to refine them.</div>
<div><br>
</div>
<div>do you think which way is good for this case?&nbsp;</div>
<div>thanks.</div>
<div class=3D"PlainText"><br>
&gt;<br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp; | 2=
6 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;--<br>
&gt;&nbsp; .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp; |&n=
bsp; 9 &#43;&#43;&#43;&#43;---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp; |&n=
bsp; 3 &#43;&#43;&#43;<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp=
; | 10 &#43;&#43;&#43;----<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp; |&n=
bsp; 3 &#43;&#43;&#43;<br>
&gt;&nbsp; 5 files changed, 40 insertions(&#43;), 11 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/=
drm/amd/powerplay/amdgpu_smu.c<br>
&gt; index 05b91bc5054c..85269f86cae2 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; @@ -284,11 &#43;284,14 @@ int smu_get_power_num_states(struct smu_cont=
ext *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; -int smu_common_read_sensor(struct smu_context *smu, enum amd_pp_senso=
rs sensor,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; void *data, uint32_t *size)<br>
&gt; &#43;int smu_default_read_sensor(struct smu_context *smu, enum amd_pp_=
sensors sensor,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; void *data, uint32_t *size)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!data || !size)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_=
STABLE_PSTATE_SCLK:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *((uint32_t *)data) =3D smu-&gt;pstate_sclk;<br>
&gt; @@ -321,6 &#43;324,25 @@ int smu_common_read_sensor(struct smu_context=
 *smu, enum amd_pp_sensors sensor,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; &#43;int smu_read_sensor(struct smu_context *smu, enum amd_pp_sensors =
sensor,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data, uint32_t *size)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!data || !size)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* handle sensor sequence: a=
sic --&gt; ip level --&gt;&nbsp; default */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_asic_read_sensor=
(smu, sensor, data, size);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_read_sensor(smu, sensor, data, size);<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D=
 smu_default_read_sensor(smu, sensor, data, size);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; int smu_update_table(struct smu_context *smu, enum smu_table_id =
table_index, int argument,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *table_data, b=
ool drv2smu)<br>
&gt;&nbsp; {<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/=
gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; index 34093ddca105..462bae8d62aa 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; @@ -820,10 &#43;820,10 @@ struct smu_funcs<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&=
gt;set_thermal_fan_table ? (smu)-&gt;ppt_funcs-&gt;set_thermal_fan_table((s=
mu)) : 0)<br>
&gt;&nbsp; #define smu_start_thermal_control(smu) \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;s=
tart_thermal_control? (smu)-&gt;funcs-&gt;start_thermal_control((smu)) : 0)=
<br>
&gt; -#define smu_read_sensor(smu, sensor, data, size) \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;read_sensor=
? (smu)-&gt;funcs-&gt;read_sensor((smu), (sensor), (data), (size)) : 0)<br>
&gt; &#43;#define smu_smc_read_sensor(smu, sensor, data, size) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;read_se=
nsor? (smu)-&gt;funcs-&gt;read_sensor((smu), (sensor), (data), (size)) : -E=
INVAL)<br>
&gt;&nbsp; #define smu_asic_read_sensor(smu, sensor, data, size) \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&gt;read_se=
nsor? (smu)-&gt;ppt_funcs-&gt;read_sensor((smu), (sensor), (data), (size)) =
: 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&gt;rea=
d_sensor? (smu)-&gt;ppt_funcs-&gt;read_sensor((smu), (sensor), (data), (siz=
e)) : -EINVAL)<br>
&gt;&nbsp; #define smu_get_power_profile_mode(smu, buf) \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&=
gt;get_power_profile_mode ? (smu)-&gt;ppt_funcs-&gt;get_power_profile_mode(=
(smu), buf) : 0)<br>
&gt;&nbsp; #define smu_set_power_profile_mode(smu, param, param_size) \<br>
&gt; @@ -989,5 &#43;989,6 @@ enum amd_dpm_forced_level smu_get_performance_=
level(struct smu_context *smu);<br>
&gt;&nbsp; int smu_force_performance_level(struct smu_context *smu, enum am=
d_dpm_forced_level level);<br>
&gt;&nbsp; int smu_set_display_count(struct smu_context *smu, uint32_t coun=
t);<br>
&gt;&nbsp; bool smu_clk_dpm_is_enabled(struct smu_context *smu, enum smu_cl=
k_type clk_type);<br>
&gt; -<br>
&gt; &#43;int smu_read_sensor(struct smu_context *smu, enum amd_pp_sensors =
sensor,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data, uint32_t *size);<br=
>
&gt;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/=
drm/amd/powerplay/navi10_ppt.c<br>
&gt; index 46e2913e4af4..0a53695785b6 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -1365,6 &#43;1365,9 @@ static int navi10_read_sensor(struct smu_con=
text *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_conte=
xt *table_context =3D &amp;smu-&gt;smu_table;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D=
 table_context-&gt;driver_pptable;<br>
&gt;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!data || !size)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_=
MAX_FAN_RPM:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm;<=
br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/d=
rm/amd/powerplay/smu_v11_0.c<br>
&gt; index 76bc157525d0..2679b6ff6ca3 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; @@ -1267,6 &#43;1267,10 @@ static int smu_v11_0_read_sensor(struct smu=
_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data, uint32_t *=
size)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!data || !size)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_=
GFX_MCLK:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_current_clk_freq(smu, SMU_UCLK, (=
uint32_t *)data);<br>
&gt; @@ -1285,14 &#43;1289,10 @@ static int smu_v11_0_read_sensor(struct sm=
u_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_common_read_sensor(smu, sensor, data, size);<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* try get sensor data by asic *=
/<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_asic_read_sensor(smu, sensor, data, size);<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *size =3D 0;<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/=
drm/amd/powerplay/vega20_ppt.c<br>
&gt; index bcd0efaf7bbd..b44ec7c670c5 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; @@ -3146,6 &#43;3146,9 @@ static int vega20_read_sensor(struct smu_con=
text *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_conte=
xt *table_context =3D &amp;smu-&gt;smu_table;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D=
 table_context-&gt;driver_pptable;<br>
&gt;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!data || !size)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_=
MAX_FAN_RPM:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm;<=
br>
&gt; --<br>
&gt; 2.22.0<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" id=
=3D"LPlnk239629" class=3D"OWAAutoLink" previewremoved=3D"true">
https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB329684D6E227BE0132F67A8EA2CB0MN2PR12MB3296namp_--

--===============0380522149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0380522149==--
