Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AEF74A45
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 11:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0505D6E6B5;
	Thu, 25 Jul 2019 09:47:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C14C6E6B4
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:47:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPV6IlvlD7adSaLlI6afz1zLXFhZineK9lCGN8B8fU3rqQH3jS8ZGH4qDFC3WGfd5m8AcJ2hWQjI6Gcr3U6T0rc8BiNTG1rchCSDa9wjU9NRWCEINP9+V9n0OSW8Q2ne2p/eIm0g2ALmzi1CIM9lOyd8EKg8jp6tDpj0cDmigEGGlhXZ4WyoAmbmmV18rusWCBObzLHZFoTlQkOWLehzm8qTut5Jm25CjTBksX3SxqIez4wRge2mrxD97A27tE9y6p7dzuZ0+WjGtd7QKKI8Ux99f3qm+AQZHAFseFa6oCeIisPcUZRyI3YDkhSMg6jRVsARDogYTnuNv9mMChjJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEwfa75bMDKXLGaV2MeIY42SwbxKMIZuciq8DaUo3WE=;
 b=aAuic3OCmu7TFgioDskZTtrW8bvGAzw3NGZLKTJHfQp3WMwpW0crIE8CKf9ox4XaIBDUl1Of+g7s91J4bAI6/Pezz/QgniItaFJ7//65QbIDtmyiQX/lJW9pGGwgmliN3UTNCcwl5hs3FE7MlrLBXw2Q4e2coLydlZGskB7YIBaNa/Rn/j31DMSn49rl56YsM00Gom8UOBUzku3E9ISFSmYyXbEfPNI850refpOgVgCBFX2ZEpEKkkwoXwOO5QdKjt6TPI+yI4lkiT25jYTvotue2Wp/fdIbDnGR+9/lZdzVJqHs/NbnWa01a9P/SOqqgZvhJ4+WatIXgYSZZgtrow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3696.namprd12.prod.outlook.com (10.255.86.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 09:47:47 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 09:47:47 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/amd/powerplay: add smu feature name support
Thread-Topic: [PATCH 3/5] drm/amd/powerplay: add smu feature name support
Thread-Index: AQHVQqdivVW7YjiD6UGydXCZkTj2p6bbE0UAgAABmbA=
Date: Thu, 25 Jul 2019 09:47:47 +0000
Message-ID: <MN2PR12MB32963955CC23B8A70C82B291A2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190725051057.28862-1-kevin1.wang@amd.com>
 <20190725051057.28862-3-kevin1.wang@amd.com>,
 <MN2PR12MB3344FF4A8126C0263C3D2E7CE4C10@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344FF4A8126C0263C3D2E7CE4C10@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69e95982-a532-4286-6a7c-08d710e52682
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3696; 
x-ms-traffictypediagnostic: MN2PR12MB3696:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3696B62CA1C37970F77C7FF5A2C10@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(13464003)(189003)(199004)(966005)(2501003)(486006)(446003)(229853002)(5660300002)(8676002)(256004)(6306002)(3846002)(14454004)(26005)(54906003)(55016002)(66446008)(33656002)(6436002)(110136005)(25786009)(476003)(52536014)(99286004)(9686003)(74316002)(7736002)(81166006)(66946007)(4326008)(71190400001)(66556008)(86362001)(76116006)(81156014)(68736007)(11346002)(54896002)(236005)(6246003)(53546011)(7696005)(66066001)(66476007)(105004)(478600001)(2906002)(76176011)(186003)(102836004)(8936002)(53936002)(71200400001)(6506007)(6116002)(606006)(316002)(64756008)(19627405001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3696;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qltfOK++hL1YgCX6zvj54qDHTvgJy62BaPTksvXYO7Jyk7deb7itSujeGVhIyWZVQrBITE48fkCPzkGHfpEZ5OsnV1rgYa1PybPOGLEA999VAgOZqY+pJhqe44BaGfDzQibVURDc88HSqtpz+WVFXJ+DxgNvRLxL3Lu86/6UvcFXmTXPxzxILY83lSEoO1uTi9VBwjFii/wJ6wR5KANCCOv8pgZenozPbjGMoYleFYTaR4TRLbqcyZhTaYWAft8/q1c6X6lIHPwyRBEHHd1iWRAhBN+lb3o6HgtlUSkzqIkzlwVDjbL1RUmj5Zi0L6LC0l1lRnrgOBu++FumuZRuIrtk5N+zLJ24T2uRfuSBzO7LsXI2TjtSLAtG6RnLzWMBApC0AHEJu3lEZmWPkjiciwjL/jvgZR5fKdfS3C3vHyo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e95982-a532-4286-6a7c-08d710e52682
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 09:47:47.4141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEwfa75bMDKXLGaV2MeIY42SwbxKMIZuciq8DaUo3WE=;
 b=XtJuyp6mZE8gBzNA6PcdzY3vOXTCu6LOwO0k3VlejARVjynGSMqvbgCWmg40RYycjFtQPXrA+3kOAbOGP77CLYNBaOtMB9l/hC33JI4Ln0wKRyaNlJg206xoqgGUSixjN0Y7Y2YEfTpqOrW5tDcLs5lQxor2+/4txJ/M9gO1rD8=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0442250180=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0442250180==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32963955CC23B8A70C82B291A2C10MN2PR12MB3296namp_"

--_000_MN2PR12MB32963955CC23B8A70C82B291A2C10MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

this is my intention,
i think we should to keep the  macro name of __SMU_DUMMY_MAP.
the smu driver code will use macro SMU_MESSAGE_TYPES and SMU_FEATURE_MASKS.
the __SMU_DUMMY_MAP just a placeholder, the driver shouldn't add more one.

Best Regards,
Kevin
________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Thursday, July 25, 2019 5:35 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Huang, Ray <Ray.Huang@a=
md.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; Wang, Kevin(Yang) <Kevin1.Wa=
ng@amd.com>
Subject: RE: [PATCH 3/5] drm/amd/powerplay: add smu feature name support

For patch2 and patch3, __SMU_DUMMY_MAP has several different defines.
It's not sure what it is defined as and that's why you need "#undef __SMU_D=
UMMY_MAP" before each use.
Please give them separate names and avoid this confusing.

Regards,
Evan
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Wang, Kevin(Yang)
> Sent: Thursday, July 25, 2019 1:11 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Huang, Ray
> <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; Wang,
> Kevin(Yang) <Kevin1.Wang@amd.com>
> Subject: [PATCH 3/5] drm/amd/powerplay: add smu feature name support
>
> add smu_get_feature_name support in smu.
>
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    |  13 +++
>  .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |   1 +
>  drivers/gpu/drm/amd/powerplay/inc/smu_types.h | 109 +++++++++--------
> -
>  3 files changed, 71 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 4604b6af56bb..8563f9083f4e 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -42,6 +42,19 @@ const char *smu_get_message_name(struct
> smu_context *smu, enum smu_message_type
>        return __smu_message_names[type];
>  }
>
> +#undef __SMU_DUMMY_MAP
> +#define __SMU_DUMMY_MAP(fea) #fea
> +static const char* __smu_feature_names[] =3D {
> +     SMU_FEATURE_MASKS
> +};
> +
> +const char *smu_get_feature_name(struct smu_context *smu, enum
> +smu_feature_mask feature) {
> +     if (feature < 0 || feature > SMU_FEATURE_COUNT)
> +             return "unknow smu feature";
> +     return __smu_feature_names[feature];
> +}
> +
>  int smu_get_smc_version(struct smu_context *smu, uint32_t *if_version,
> uint32_t *smu_version)  {
>        int ret =3D 0;
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> index 035f857922ec..ba2385026b89 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> @@ -805,5 +805,6 @@ int smu_force_performance_level(struct
> smu_context *smu, enum amd_dpm_forced_lev  int
> smu_set_display_count(struct smu_context *smu, uint32_t count);  bool
> smu_clk_dpm_is_enabled(struct smu_context *smu, enum smu_clk_type
> clk_type);  const char *smu_get_message_name(struct smu_context *smu,
> enum smu_message_type type);
> +const char *smu_get_feature_name(struct smu_context *smu, enum
> +smu_feature_mask feature);
>
>  #endif
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> index d42e3424e704..8793c8d0dc52 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
> @@ -154,59 +154,64 @@ enum smu_clk_type {
>        SMU_CLK_COUNT,
>  };
>
> +#define SMU_FEATURE_MASKS                            \
> +       __SMU_DUMMY_MAP(DPM_PREFETCHER),                      \
> +       __SMU_DUMMY_MAP(DPM_GFXCLK),                           \
> +       __SMU_DUMMY_MAP(DPM_UCLK),                             \
> +       __SMU_DUMMY_MAP(DPM_SOCCLK),                           \
> +       __SMU_DUMMY_MAP(DPM_UVD),                              \
> +       __SMU_DUMMY_MAP(DPM_VCE),                              \
> +       __SMU_DUMMY_MAP(ULV),                                  \
> +       __SMU_DUMMY_MAP(DPM_MP0CLK),                           \
> +       __SMU_DUMMY_MAP(DPM_LINK),                             \
> +       __SMU_DUMMY_MAP(DPM_DCEFCLK),                          \
> +       __SMU_DUMMY_MAP(DS_GFXCLK),                            \
> +       __SMU_DUMMY_MAP(DS_SOCCLK),                            \
> +       __SMU_DUMMY_MAP(DS_LCLK),                              \
> +       __SMU_DUMMY_MAP(PPT),                                  \
> +       __SMU_DUMMY_MAP(TDC),                                  \
> +       __SMU_DUMMY_MAP(THERMAL),                              \
> +       __SMU_DUMMY_MAP(GFX_PER_CU_CG),                        \
> +       __SMU_DUMMY_MAP(RM),                                   \
> +       __SMU_DUMMY_MAP(DS_DCEFCLK),                           \
> +       __SMU_DUMMY_MAP(ACDC),                                 \
> +       __SMU_DUMMY_MAP(VR0HOT),                               \
> +       __SMU_DUMMY_MAP(VR1HOT),                               \
> +       __SMU_DUMMY_MAP(FW_CTF),                               \
> +       __SMU_DUMMY_MAP(LED_DISPLAY),                          \
> +       __SMU_DUMMY_MAP(FAN_CONTROL),                          \
> +       __SMU_DUMMY_MAP(GFX_EDC),                              \
> +       __SMU_DUMMY_MAP(GFXOFF),                               \
> +       __SMU_DUMMY_MAP(CG),                                   \
> +       __SMU_DUMMY_MAP(DPM_FCLK),                             \
> +       __SMU_DUMMY_MAP(DS_FCLK),                              \
> +       __SMU_DUMMY_MAP(DS_MP1CLK),                            \
> +       __SMU_DUMMY_MAP(DS_MP0CLK),                            \
> +       __SMU_DUMMY_MAP(XGMI),                                 \
> +       __SMU_DUMMY_MAP(DPM_GFX_PACE),                         \
> +       __SMU_DUMMY_MAP(MEM_VDDCI_SCALING),                    \
> +       __SMU_DUMMY_MAP(MEM_MVDD_SCALING),                     \
> +       __SMU_DUMMY_MAP(DS_UCLK),                              \
> +       __SMU_DUMMY_MAP(GFX_ULV),                              \
> +       __SMU_DUMMY_MAP(FW_DSTATE),                            \
> +       __SMU_DUMMY_MAP(BACO),                                 \
> +       __SMU_DUMMY_MAP(VCN_PG),                               \
> +       __SMU_DUMMY_MAP(JPEG_PG),                              \
> +       __SMU_DUMMY_MAP(USB_PG),                               \
> +       __SMU_DUMMY_MAP(RSMU_SMN_CG),                          \
> +       __SMU_DUMMY_MAP(APCC_PLUS),                            \
> +       __SMU_DUMMY_MAP(GTHR),                                 \
> +       __SMU_DUMMY_MAP(GFX_DCS),                              \
> +       __SMU_DUMMY_MAP(GFX_SS),                               \
> +       __SMU_DUMMY_MAP(OUT_OF_BAND_MONITOR),                  \
> +       __SMU_DUMMY_MAP(TEMP_DEPENDENT_VMIN),                  \
> +       __SMU_DUMMY_MAP(MMHUB_PG),                             \
> +       __SMU_DUMMY_MAP(ATHUB_PG),                             \
> +
> +#undef __SMU_DUMMY_MAP
> +#define __SMU_DUMMY_MAP(feature)
>        SMU_FEATURE_##feature##_BIT
>  enum smu_feature_mask {
> -     SMU_FEATURE_DPM_PREFETCHER_BIT,
> -     SMU_FEATURE_DPM_GFXCLK_BIT,
> -     SMU_FEATURE_DPM_UCLK_BIT,
> -     SMU_FEATURE_DPM_SOCCLK_BIT,
> -     SMU_FEATURE_DPM_UVD_BIT,
> -     SMU_FEATURE_DPM_VCE_BIT,
> -     SMU_FEATURE_ULV_BIT,
> -     SMU_FEATURE_DPM_MP0CLK_BIT,
> -     SMU_FEATURE_DPM_LINK_BIT,
> -     SMU_FEATURE_DPM_DCEFCLK_BIT,
> -     SMU_FEATURE_DS_GFXCLK_BIT,
> -     SMU_FEATURE_DS_SOCCLK_BIT,
> -     SMU_FEATURE_DS_LCLK_BIT,
> -     SMU_FEATURE_PPT_BIT,
> -     SMU_FEATURE_TDC_BIT,
> -     SMU_FEATURE_THERMAL_BIT,
> -     SMU_FEATURE_GFX_PER_CU_CG_BIT,
> -     SMU_FEATURE_RM_BIT,
> -     SMU_FEATURE_DS_DCEFCLK_BIT,
> -     SMU_FEATURE_ACDC_BIT,
> -     SMU_FEATURE_VR0HOT_BIT,
> -     SMU_FEATURE_VR1HOT_BIT,
> -     SMU_FEATURE_FW_CTF_BIT,
> -     SMU_FEATURE_LED_DISPLAY_BIT,
> -     SMU_FEATURE_FAN_CONTROL_BIT,
> -     SMU_FEATURE_GFX_EDC_BIT,
> -     SMU_FEATURE_GFXOFF_BIT,
> -     SMU_FEATURE_CG_BIT,
> -     SMU_FEATURE_DPM_FCLK_BIT,
> -     SMU_FEATURE_DS_FCLK_BIT,
> -     SMU_FEATURE_DS_MP1CLK_BIT,
> -     SMU_FEATURE_DS_MP0CLK_BIT,
> -     SMU_FEATURE_XGMI_BIT,
> -     SMU_FEATURE_DPM_GFX_PACE_BIT,
> -     SMU_FEATURE_MEM_VDDCI_SCALING_BIT,
> -     SMU_FEATURE_MEM_MVDD_SCALING_BIT,
> -     SMU_FEATURE_DS_UCLK_BIT,
> -     SMU_FEATURE_GFX_ULV_BIT,
> -     SMU_FEATURE_FW_DSTATE_BIT,
> -     SMU_FEATURE_BACO_BIT,
> -     SMU_FEATURE_VCN_PG_BIT,
> -     SMU_FEATURE_JPEG_PG_BIT,
> -     SMU_FEATURE_USB_PG_BIT,
> -     SMU_FEATURE_RSMU_SMN_CG_BIT,
> -     SMU_FEATURE_APCC_PLUS_BIT,
> -     SMU_FEATURE_GTHR_BIT,
> -     SMU_FEATURE_GFX_DCS_BIT,
> -     SMU_FEATURE_GFX_SS_BIT,
> -     SMU_FEATURE_OUT_OF_BAND_MONITOR_BIT,
> -     SMU_FEATURE_TEMP_DEPENDENT_VMIN_BIT,
> -     SMU_FEATURE_MMHUB_PG_BIT,
> -     SMU_FEATURE_ATHUB_PG_BIT,
> +     SMU_FEATURE_MASKS
>        SMU_FEATURE_COUNT,
>  };
>
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32963955CC23B8A70C82B291A2C10MN2PR12MB3296namp_
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
<span>this is my intention,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>i think we should to keep the&nbsp; macro name of __SMU_DUMMY_MAP.</s=
pan></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the smu driver code will use macro SMU_MESSAGE_TYPES and SMU_FEATURE_MASKS.=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the __SMU_DUMMY_MAP just a placeholder, the driver shouldn't add more one.<=
/div>
<span></span>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Thursday, July 25, 2019 5:35 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Huang, Ray=
 &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Wan=
g, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 3/5] drm/amd/powerplay: add smu feature name sup=
port</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">For patch2 and patch3, __SMU_DUMMY_MAP has several=
 different defines.<br>
It's not sure what it is defined as and that's why you need &quot;#undef __=
SMU_DUMMY_MAP&quot; before each use.<br>
Please give them separate names and avoid this confusing.<br>
<br>
Regards,<br>
Evan<br>
&gt; -----Original Message-----<br>
&gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf =
Of<br>
&gt; Wang, Kevin(Yang)<br>
&gt; Sent: Thursday, July 25, 2019 1:11 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Huang, Ray<b=
r>
&gt; &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;;=
 Wang,<br>
&gt; Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Subject: [PATCH 3/5] drm/amd/powerplay: add smu feature name support<b=
r>
&gt; <br>
&gt; add smu_get_feature_name support in smu.<br>
&gt; <br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp; |&n=
bsp; 13 &#43;&#43;&#43;<br>
&gt;&nbsp; .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 1 &#43;<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/inc/smu_types.h | 109 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;--------<br>
&gt; -<br>
&gt;&nbsp; 3 files changed, 71 insertions(&#43;), 52 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; index 4604b6af56bb..8563f9083f4e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; @@ -42,6 &#43;42,19 @@ const char *smu_get_message_name(struct<br>
&gt; smu_context *smu, enum smu_message_type<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __smu_message_names[t=
ype];<br>
&gt;&nbsp; }<br>
&gt; <br>
&gt; &#43;#undef __SMU_DUMMY_MAP<br>
&gt; &#43;#define __SMU_DUMMY_MAP(fea) #fea<br>
&gt; &#43;static const char* __smu_feature_names[] =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_MASKS<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;const char *smu_get_feature_name(struct smu_context *smu, enum<br=
>
&gt; &#43;smu_feature_mask feature) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (feature &lt; 0 || feature &gt; SMU_F=
EATURE_COUNT)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return &quot;unknow smu feature&quot;;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return __smu_feature_names[feature];<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; int smu_get_smc_version(struct smu_context *smu, uint32_t *if_ve=
rsion,<br>
&gt; uint32_t *smu_version)&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; index 035f857922ec..ba2385026b89 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; @@ -805,5 &#43;805,6 @@ int smu_force_performance_level(struct<br>
&gt; smu_context *smu, enum amd_dpm_forced_lev&nbsp; int<br>
&gt; smu_set_display_count(struct smu_context *smu, uint32_t count);&nbsp; =
bool<br>
&gt; smu_clk_dpm_is_enabled(struct smu_context *smu, enum smu_clk_type<br>
&gt; clk_type);&nbsp; const char *smu_get_message_name(struct smu_context *=
smu,<br>
&gt; enum smu_message_type type);<br>
&gt; &#43;const char *smu_get_feature_name(struct smu_context *smu, enum<br=
>
&gt; &#43;smu_feature_mask feature);<br>
&gt; <br>
&gt;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; index d42e3424e704..8793c8d0dc52 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&gt; @@ -154,59 &#43;154,64 @@ enum smu_clk_type {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_CLK_COUNT,<br>
&gt;&nbsp; };<br>
&gt; <br>
&gt; &#43;#define SMU_FEATURE_MASKS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_PREFETCH=
ER),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_GFXCLK),=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_UCLK),&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_SOCCLK),=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_UVD),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_VCE),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(ULV),&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_MP0CLK),=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_LINK),&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_DCEFCLK)=
,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_GFXCLK),&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_SOCCLK),&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_LCLK),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(PPT),&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(TDC),&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(THERMAL),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(GFX_PER_CU_C=
G),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(RM),&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_DCEFCLK),=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(ACDC),&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(VR0HOT),&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(VR1HOT),&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(FW_CTF),&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(LED_DISPLAY)=
,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(FAN_CONTROL)=
,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(GFX_EDC),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(GFXOFF),&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(CG),&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_FCLK),&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_FCLK),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_MP1CLK),&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_MP0CLK),&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(XGMI),&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DPM_GFX_PACE=
),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(MEM_VDDCI_SC=
ALING),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(MEM_MVDD_SCA=
LING),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(DS_UCLK),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(GFX_ULV),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(FW_DSTATE),&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(BACO),&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(VCN_PG),&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(JPEG_PG),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(USB_PG),&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(RSMU_SMN_CG)=
,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(APCC_PLUS),&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(GTHR),&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(GFX_DCS),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(GFX_SS),&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(OUT_OF_BAND_=
MONITOR),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(TEMP_DEPENDE=
NT_VMIN),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(MMHUB_PG),&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(ATHUB_PG),&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; \<br>
&gt; &#43;<br>
&gt; &#43;#undef __SMU_DUMMY_MAP<br>
&gt; &#43;#define __SMU_DUMMY_MAP(feature)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_##feature##_BIT<=
br>
&gt;&nbsp; enum smu_feature_mask {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_PREFETCHER_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_GFXCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_UCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_SOCCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_UVD_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_VCE_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_ULV_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_MP0CLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_LINK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_DCEFCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_GFXCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_SOCCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_LCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_PPT_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_TDC_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_THERMAL_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_GFX_PER_CU_CG_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_RM_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_DCEFCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_ACDC_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_VR0HOT_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_VR1HOT_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_FW_CTF_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_LED_DISPLAY_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_FAN_CONTROL_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_GFX_EDC_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_GFXOFF_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_CG_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_FCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_FCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_MP1CLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_MP0CLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_XGMI_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DPM_GFX_PACE_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_MEM_VDDCI_SCALING_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_MEM_MVDD_SCALING_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_DS_UCLK_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_GFX_ULV_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_FW_DSTATE_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_BACO_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_VCN_PG_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_JPEG_PG_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_USB_PG_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_RSMU_SMN_CG_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_APCC_PLUS_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_GTHR_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_GFX_DCS_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_GFX_SS_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_OUT_OF_BAND_MONITOR_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_TEMP_DEPENDENT_VMIN_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_MMHUB_PG_BIT,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_ATHUB_PG_BIT,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_MASKS<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_FEATURE_COUNT,<br>
&gt;&nbsp; };<br>
&gt; <br>
&gt; --<br>
&gt; 2.22.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32963955CC23B8A70C82B291A2C10MN2PR12MB3296namp_--

--===============0442250180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0442250180==--
