Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE437617D
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 11:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D66ECBE;
	Fri, 26 Jul 2019 09:05:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680045.outbound.protection.outlook.com [40.107.68.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8501E6ECBE
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 09:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE+wo0AMVi4KfKmP175LktSooAybCprvArffrA6bRxvjJKHTw0sV8m4kCPD8EngaFrG07vdkugAYd4pGPKtamCzuVViTQIulOsW6sreyNm9gocQ0BAr/9h1rntNZJf/PSuxOkWC0YONtrmumpEGtYNzRRV/xpMK62Rhqb7+wm0e7N7VR33lnJQ8zSiiB7GuiPLdOuBBEZrFUr0hczUqaEnnL8Ql9Mpw9igL+KGVoy5/TBEj70WdnvvMVLXHcU6xhgbaiD9j4WWTijibTHQ4H4BeVxv5ruxxtFfeIshKZPWpqY7/Zqda6ucml3UL8Usm8rpQ1VU8ynBNXkjXYlOhoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+dR80OchFOPI8LJb4FN3DDi50cUuUomeBzQJ+PAzuM=;
 b=hAFVHAWnX4zrSXZkAmVGdwKtk48E9Gtgnsbph1uD6SMM/gO5JtBrDSyP95mAxGLrRZdHeLbOFPt2FFXMAwrrzUiDTtelg3AV157t/EEpnbIv1CbZwc/u67FNf/scNA1491MZAw3sdgpl2jk0YGb+WNHHfglfRUSil5+tgzD0LsF5b5LJmrL17gF+m6MaITWfo8MCEiEKWHProxZubUmNmPhs7M0zzAzH4LxcUBt7GAQk+Mfcjxu0Gn2tKSgYHu8ZvwRbk/NO39eNf7BrcHa+x685k8d+bQQnZHfZnG5ENvKxSrvbvOqoLu4duy/f5XTaSPJC3yAirSnlQ3OcP1NxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB3506.namprd12.prod.outlook.com (20.179.65.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 09:05:12 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 09:05:12 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature status
 function in smu
Thread-Topic: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature status
 function in smu
Thread-Index: AQHVQqdlvxR6tq1kZ0WTe8k349UFQKba+raggAAGUwCAAAKxeYAAApYAgABGiYCAAAOqAIABS0xP
Date: Fri, 26 Jul 2019 09:05:12 +0000
Message-ID: <BN8PR12MB3283A9239266F64A93F2E3DDA2C00@BN8PR12MB3283.namprd12.prod.outlook.com>
References: <20190725051057.28862-1-kevin1.wang@amd.com>
 <20190725051057.28862-5-kevin1.wang@amd.com>
 <MN2PR12MB32966C19A3EF83A1E868B25CA2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
 <MN2PR12MB334476A964852FD3B092B385E4C10@MN2PR12MB3344.namprd12.prod.outlook.com>
 <MN2PR12MB32968D539CA68CCE3E4AFFB6A2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
 <MN2PR12MB33098222156F946AA7EABB26ECC10@MN2PR12MB3309.namprd12.prod.outlook.com>
 <BN6PR12MB1809E62D6BFE3224637F25D9F7C10@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <f76aeb2d-01be-d629-72e9-a96f702a73e0@amd.com>
In-Reply-To: <f76aeb2d-01be-d629-72e9-a96f702a73e0@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 242d689b-4934-4305-fc73-08d711a85def
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3506; 
x-ms-traffictypediagnostic: BN8PR12MB3506:
x-microsoft-antispam-prvs: <BN8PR12MB350696944214507A1F610161A2C00@BN8PR12MB3506.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(189003)(199004)(53546011)(6506007)(25786009)(66066001)(7696005)(30864003)(5660300002)(102836004)(476003)(6116002)(52536014)(486006)(186003)(6636002)(26005)(99286004)(76176011)(316002)(55016002)(446003)(68736007)(54896002)(19627405001)(9686003)(86362001)(7736002)(11346002)(4326008)(8936002)(53946003)(229853002)(110136005)(8676002)(256004)(14444005)(76116006)(2906002)(71190400001)(71200400001)(66446008)(14454004)(81166006)(64756008)(66556008)(2501003)(66476007)(66946007)(6246003)(81156014)(236005)(53936002)(105004)(74316002)(33656002)(3846002)(478600001)(6436002)(921003)(1121003)(559001)(579004)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3506;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uWoEqfpJcVHCq9JTbH1P5dec5/gzrZOSt7wGvF+gzzAuLsrtdM9SW8jAObf/DfcHhtnh7xvJLYYUr1JFRpn46Ac3mh0AjxE9z4NGLvWe1O/fC687NnZncohwYew4gQ0pq1zRagVcW4XLHx/2a34G4KXcRFW6ORAbyxDaU4PbMzN7ZPpAcFwyYfs5bnPo/xvXZOndM2gceQuck381kUKl23LsmKRkmjfhZMKD9MTCEmBDQVH4Ip3zMGywT9jMwJT8zcrJptNCNKSIDALfT4Igfd1CkVYjALnc+RUTpTx1Whzo55gT+5yP7dUiZkZX2p0nDbRHm0nnepASDGrB2N685xD6OJg1IFWAqV699w0n2Pvgcd8JzN0Ax8ltdwLXRuMNCRpmBnFY/aQ/y8mXNWlV2iUJNUW4Vzn8wsXqm/M4jlY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242d689b-4934-4305-fc73-08d711a85def
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 09:05:12.3211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3506
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+dR80OchFOPI8LJb4FN3DDi50cUuUomeBzQJ+PAzuM=;
 b=E+IudNbkaFCLPLvrVgJDPYgvkiiqmi2BPRjRxk/4MIeOwWBtezFFhPMzP/Rh1PIMLtrLMUGY4+K6S19FT+mXBaLTzc12TGRsIB7Ks/mqgCehcxG1D0UWIsKuWhs/72ZsHDSEi0MGv0MUxilj1NQIOz7nFOYd/4nwXb5rn4L/3vQ=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0153340806=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0153340806==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3283A9239266F64A93F2E3DDA2C00BN8PR12MB3283namp_"

--_000_BN8PR12MB3283A9239266F64A93F2E3DDA2C00BN8PR12MB3283namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

@Deucher, Alexander<mailto:Alexander.Deucher@amd.com>

Hi Alex,

it seems not application will use this sysfs, can we rename it from "ppfeat=
ures" to "pp_features"?
this patch sets is pending.

Best Regards,
Kevin
________________________________
From: StDenis, Tom <Tom.StDenis@amd.com>
Sent: Thursday, July 25, 2019 9:14 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Huang, Ray <Ray.Huang@a=
md.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Quan, Evan <Evan.Quan@amd=
.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zhang=
, Hawking <Hawking.Zhang@amd.com>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature status f=
unction in smu

No it doesn't.  We get clocks for --top from the sensors interface.


On 2019-07-25 9:01 a.m., Deucher, Alexander wrote:
> Tom, does umr use it?
>
> Alex
> ------------------------------------------------------------------------
> *From:* Huang, Ray <Ray.Huang@amd.com>
> *Sent:* Thursday, July 25, 2019 4:49 AM
> *To:* Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Quan, Evan
> <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
> <amd-gfx@lists.freedesktop.org>; Zhang, Hawking
> <Hawking.Zhang@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
> *Cc:* Feng, Kenneth <Kenneth.Feng@amd.com>
> *Subject:* RE: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature
> status function in smu
>
> Any other user mode tool use the =93ppfeature=94 sysfs interface?
>
> Thanks,
>
> Ray
>
> *From:* Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> *Sent:* Thursday, July 25, 2019 4:44 PM
> *To:* Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org;
> Zhang, Hawking <Hawking.Zhang@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> *Cc:* Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com=
>
> *Subject:* Re: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature
> status function in smu
>
> in fact, i don't want to change this sysfs name from "ppfeatures" to
> "pp_features",
>
> but it seems that don't have same name format with other pp sysfs node.
>
> the other powerplay sysfs name have "pp_" prefix, i think we'd better
> to change it name to "pp_features"
>
> eg:
>
> pp_cur_state    pp_dpm_fclk  pp_dpm_pcie  pp_dpm_socclk
>  pp_force_state  pp_num_states  pp_sclk_od
> pp_dpm_dcefclk  pp_dpm_mclk  pp_dpm_sclk  pp_features    pp_mclk_od
>    pp_power_profile_mode  pp_table
>
> @Deucher, Alexander <mailto:Alexander.Deucher@amd.com> @Zhang, Hawking
> <mailto:Hawking.Zhang@amd.com>
>
> Could you give us some idea about it,
>
> Thanks.
>
> Best Regards,
> Kevin
>
> ------------------------------------------------------------------------
>
> *From:*Quan, Evan <Evan.Quan@amd.com <mailto:Evan.Quan@amd.com>>
> *Sent:* Thursday, July 25, 2019 4:30 PM
> *To:* Wang, Kevin(Yang) <Kevin1.Wang@amd.com
> <mailto:Kevin1.Wang@amd.com>>; amd-gfx@lists.freedesktop.org
> <mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org
> <mailto:amd-gfx@lists.freedesktop.org>>
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com
> <mailto:Alexander.Deucher@amd.com>>; Huang, Ray <Ray.Huang@amd.com
> <mailto:Ray.Huang@amd.com>>; Feng, Kenneth <Kenneth.Feng@amd.com
> <mailto:Kenneth.Feng@amd.com>>
> *Subject:* RE: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature
> status function in smu
>
> To keep backward compatibility, we cannot change the sysfs file naming.
>
> But it=92s a good idea to summarize these as common APIs.
>
> Regards,
>
> Evan
>
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org
> <mailto:amd-gfx-bounces@lists.freedesktop.org>> *On Behalf Of *Wang,
> Kevin(Yang)
> *Sent:* Thursday, July 25, 2019 4:10 PM
> *To:* amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org=
>
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com
> <mailto:Alexander.Deucher@amd.com>>; Huang, Ray <Ray.Huang@amd.com
> <mailto:Ray.Huang@amd.com>>; Feng, Kenneth <Kenneth.Feng@amd.com
> <mailto:Kenneth.Feng@amd.com>>
> *Subject:* Re: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature
> status function in smu
>
> add sample data from sysfs pp_features with this patch.
>
> print format:
>
> index. feature name (Hardware Message ID): state
>
> /sudo find /sys -name "pp_features" -exec cat {} \;/
>
> features high: 0x00000623 low: 0xb3cdaffb
>
> 00. DPM_PREFETCHER       ( 0) : enabeld
>
> 01. DPM_GFXCLK           ( 1) : enabeld
>
> 02. DPM_UCLK             ( 3) : enabeld
>
> 03. DPM_SOCCLK           ( 4) : enabeld
>
> 04. DPM_MP0CLK           ( 5) : enabeld
>
> 05. DPM_LINK             ( 6) : enabeld
>
> 06. DPM_DCEFCLK          ( 7) : enabeld
>
> 07. DS_GFXCLK            (10) : enabeld
>
> 08. DS_SOCCLK            (11) : enabeld
>
> 09. DS_LCLK              (12) : disabled
>
> 10. PPT                (23) : enabeld
>
> 11. TDC                (24) : enabeld
>
> 12. THERMAL              (33) : enabeld
>
> 13. RM                 (35) : disabled
>
> 14. DS_DCEFCLK           (13) : enabeld
>
> 15. ACDC                 (28) : enabeld
>
> 16. VR0HOT               (29) : enabeld
>
> 17. VR1HOT               (30) : disabled
>
> 18. FW_CTF               (31) : enabeld
>
> 19. LED_DISPLAY          (36) : disabled
>
> 20. FAN_CONTROL          (32) : enabeld
>
> 21. GFX_EDC              (25) : enabeld
>
> 22. GFXOFF               (17) : disabled
>
> 23. DPM_GFX_PACE         ( 2) : disabled
>
> 24. MEM_VDDCI_SCALING    ( 8) : enabeld
>
> 25. MEM_MVDD_SCALING     ( 9) : enabeld
>
> 26. DS_UCLK              (14) : disabled
>
> 27. GFX_ULV              (15) : enabeld
>
> 28. FW_DSTATE            (16) : enabeld
>
> 29. BACO                 (18) : enabeld
>
> 30. VCN_PG               (19) : enabeld
>
> 31. JPEG_PG              (20) : disabled
>
> 32. USB_PG               (21) : disabled
>
> 33. RSMU_SMN_CG          (22) : enabeld
>
> 34. APCC_PLUS            (26) : disabled
>
> 35. GTHR                 (27) : disabled
>
> 36. GFX_DCS              (34) : disabled
>
> 37. GFX_SS               (37) : enabeld
>
> 38. OUT_OF_BAND_MONITOR  (38) : disabled
>
> 39. TEMP_DEPENDENT_VMIN  (39) : disabled
>
> 40. MMHUB_PG             (40) : disabled
>
> 41. ATHUB_PG             (41) : enabeld
>
> ------------------------------------------------------------------------
>
> *From:*Wang, Kevin(Yang) <Kevin1.Wang@amd.com
> <mailto:Kevin1.Wang@amd.com>>
> *Sent:* Thursday, July 25, 2019 1:11 PM
> *To:* amd-gfx@lists.freedesktop.org
> <mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org
> <mailto:amd-gfx@lists.freedesktop.org>>
> *Cc:* Feng, Kenneth <Kenneth.Feng@amd.com
> <mailto:Kenneth.Feng@amd.com>>; Huang, Ray <Ray.Huang@amd.com
> <mailto:Ray.Huang@amd.com>>; Deucher, Alexander
> <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>; Wang,
> Kevin(Yang) <Kevin1.Wang@amd.com <mailto:Kevin1.Wang@amd.com>>
> *Subject:* [PATCH 5/5] drm/amd/powerplay: implment sysfs feature
> status function in smu
>
> 1. Unified feature enable status format in sysfs
> 2. Rename ppfeature to pp_features to adapt other pp sysfs node name
> 3. this function support all asic, not asic related function.
>
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com
> <mailto:kevin1.wang@amd.com>>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c |  24 +--
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c |  61 +++++++
>  .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h |   8 +-
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c    | 165 ------------------
>  drivers/gpu/drm/amd/powerplay/vega20_ppt.c    | 153 ----------------
>  5 files changed, 75 insertions(+), 336 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> index 866097d5cf26..9e8e8a65d9bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -788,10 +788,10 @@ static ssize_t
> amdgpu_get_pp_od_clk_voltage(struct device *dev,
>  }
>
>  /**
> - * DOC: ppfeatures
> + * DOC: pp_features
>   *
>   * The amdgpu driver provides a sysfs API for adjusting what powerplay
> - * features to be enabled. The file ppfeatures is used for this. And
> + * features to be enabled. The file pp_features is used for this. And
>   * this is only available for Vega10 and later dGPUs.
>   *
>   * Reading back the file will show you the followings:
> @@ -803,7 +803,7 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct
> device *dev,
>   * the corresponding bit from original ppfeature masks and input the
>   * new ppfeature masks.
>   */
> -static ssize_t amdgpu_set_ppfeature_status(struct device *dev,
> +static ssize_t amdgpu_set_pp_feature_status(struct device *dev,
>                  struct device_attribute *attr,
>                  const char *buf,
>                  size_t count)
> @@ -820,7 +820,7 @@ static ssize_t amdgpu_set_ppfeature_status(struct
> device *dev,
>          pr_debug("featuremask =3D 0x%llx\n", featuremask);
>
>          if (is_support_sw_smu(adev)) {
> -               ret =3D smu_set_ppfeature_status(&adev->smu, featuremask)=
;
> +               ret =3D smu_sys_set_pp_feature_mask(&adev->smu,
> featuremask);
>                  if (ret)
>                          return -EINVAL;
>          } else if (adev->powerplay.pp_funcs->set_ppfeature_status) {
> @@ -832,7 +832,7 @@ static ssize_t amdgpu_set_ppfeature_status(struct
> device *dev,
>          return count;
>  }
>
> -static ssize_t amdgpu_get_ppfeature_status(struct device *dev,
> +static ssize_t amdgpu_get_pp_feature_status(struct device *dev,
>                  struct device_attribute *attr,
>                  char *buf)
>  {
> @@ -840,7 +840,7 @@ static ssize_t amdgpu_get_ppfeature_status(struct
> device *dev,
>          struct amdgpu_device *adev =3D ddev->dev_private;
>
>          if (is_support_sw_smu(adev)) {
> -               return smu_get_ppfeature_status(&adev->smu, buf);
> +               return smu_sys_get_pp_feature_mask(&adev->smu, buf);
>          } else if (adev->powerplay.pp_funcs->get_ppfeature_status)
>                  return amdgpu_dpm_get_ppfeature_status(adev, buf);
>
> @@ -1500,9 +1500,9 @@ static DEVICE_ATTR(gpu_busy_percent, S_IRUGO,
>  static DEVICE_ATTR(mem_busy_percent, S_IRUGO,
>                  amdgpu_get_memory_busy_percent, NULL);
>  static DEVICE_ATTR(pcie_bw, S_IRUGO, amdgpu_get_pcie_bw, NULL);
> -static DEVICE_ATTR(ppfeatures, S_IRUGO | S_IWUSR,
> -               amdgpu_get_ppfeature_status,
> -               amdgpu_set_ppfeature_status);
> +static DEVICE_ATTR(pp_features, S_IRUGO | S_IWUSR,
> +               amdgpu_get_pp_feature_status,
> +               amdgpu_set_pp_feature_status);
>  static DEVICE_ATTR(unique_id, S_IRUGO, amdgpu_get_unique_id, NULL);
>
>  static ssize_t amdgpu_hwmon_show_temp(struct device *dev,
> @@ -2960,10 +2960,10 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device
> *adev)
>          if ((adev->asic_type >=3D CHIP_VEGA10) &&
>              !(adev->flags & AMD_IS_APU)) {
>                  ret =3D device_create_file(adev->dev,
> - &dev_attr_ppfeatures);
> + &dev_attr_pp_features);
>                  if (ret) {
>                          DRM_ERROR("failed to create device file "
> - "ppfeatures\n");
> + "pp_features\n");
>                          return ret;
>                  }
>          }
> @@ -3017,7 +3017,7 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_device
> *adev)
> device_remove_file(adev->dev, &dev_attr_unique_id);
>          if ((adev->asic_type >=3D CHIP_VEGA10) &&
>              !(adev->flags & AMD_IS_APU))
> -               device_remove_file(adev->dev, &dev_attr_ppfeatures);
> +               device_remove_file(adev->dev, &dev_attr_pp_features);
>  }
>
>  void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index e881de955388..90833ff2fe00 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -55,6 +55,67 @@ const char *smu_get_feature_name(struct smu_context
> *smu, enum smu_feature_mask
>          return __smu_feature_names[feature];
>  }
>
> +size_t smu_sys_get_pp_feature_mask(struct smu_context *smu, char *buf)
> +{
> +       size_t size =3D 0;
> +       int ret =3D 0, i =3D 0;
> +       uint32_t feature_mask[2] =3D { 0 };
> +       int32_t feature_index =3D 0;
> +       uint32_t count =3D 0;
> +
> +       ret =3D smu_feature_get_enabled_mask(smu, feature_mask, 2);
> +       if (ret)
> +               goto failed;
> +
> +       size =3D  sprintf(buf + size, "features high: 0x%08x low: 0x%08x\=
n",
> +                       feature_mask[1], feature_mask[0]);
> +
> +       for (i =3D 0; i < SMU_FEATURE_COUNT; i++) {
> +               feature_index =3D smu_feature_get_index(smu, i);
> +               if (feature_index < 0)
> +                       continue;
> +               size +=3D sprintf(buf + size, "%02d. %-20s (%2d) : %s\n",
> +                              count++,
> + smu_get_feature_name(smu, i),
> +                              feature_index,
> + !!smu_feature_is_enabled(smu, i) ? "enabeld" : "disabled");
> +       }
> +
> +failed:
> +       return size;
> +}
> +
> +int smu_sys_set_pp_feature_mask(struct smu_context *smu, uint64_t
> new_mask)
> +{
> +       int ret =3D 0;
> +       uint32_t feature_mask[2] =3D { 0 };
> +       uint64_t feature_2_enabled =3D 0;
> +       uint64_t feature_2_disabled =3D 0;
> +       uint64_t feature_enables =3D 0;
> +
> +       ret =3D smu_feature_get_enabled_mask(smu, feature_mask, 2);
> +       if (ret)
> +               return ret;
> +
> +       feature_enables =3D ((uint64_t)feature_mask[1] << 32 |
> (uint64_t)feature_mask[0]);
> +
> +       feature_2_enabled  =3D ~feature_enables & new_mask;
> +       feature_2_disabled =3D feature_enables & ~new_mask;
> +
> +       if (feature_2_enabled) {
> +               ret =3D smu_feature_update_enable_state(smu,
> feature_2_enabled, true);
> +               if (ret)
> +                       ret;
> +       }
> +       if (feature_2_disabled) {
> +               ret =3D smu_feature_update_enable_state(smu,
> feature_2_disabled, false);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return ret;
> +}
> +
>  int smu_get_smc_version(struct smu_context *smu, uint32_t
> *if_version, uint32_t *smu_version)
>  {
>          int ret =3D 0;
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> index abc2644b4c07..ac9e9d5d8a5c 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> @@ -432,8 +432,6 @@ struct pptable_funcs {
>                                        uint32_t *mclk_mask,
>                                        uint32_t *soc_mask);
>          int (*set_cpu_power_state)(struct smu_context *smu);
> -       int (*set_ppfeature_status)(struct smu_context *smu, uint64_t
> ppfeatures);
> -       int (*get_ppfeature_status)(struct smu_context *smu, char *buf);
>          bool (*is_dpm_running)(struct smu_context *smu);
>          int (*tables_init)(struct smu_context *smu, struct smu_table
> *tables);
>          int (*set_thermal_fan_table)(struct smu_context *smu);
> @@ -713,10 +711,6 @@ struct smu_funcs
> ((smu)->ppt_funcs->dpm_set_vce_enable ?
> (smu)->ppt_funcs->dpm_set_vce_enable((smu), (enable)) : 0)
>  #define smu_set_xgmi_pstate(smu, pstate) \
> ((smu)->funcs->set_xgmi_pstate ? (smu)->funcs->set_xgmi_pstate((smu),
> (pstate)) : 0)
> -#define smu_set_ppfeature_status(smu, ppfeatures) \
> - ((smu)->ppt_funcs->set_ppfeature_status ?
> (smu)->ppt_funcs->set_ppfeature_status((smu), (ppfeatures)) : -EINVAL)
> -#define smu_get_ppfeature_status(smu, buf) \
> - ((smu)->ppt_funcs->get_ppfeature_status ?
> (smu)->ppt_funcs->get_ppfeature_status((smu), (buf)) : -EINVAL)
>  #define smu_set_watermarks_table(smu, tab, clock_ranges) \
> ((smu)->ppt_funcs->set_watermarks_table ?
> (smu)->ppt_funcs->set_watermarks_table((smu), (tab), (clock_ranges)) : 0)
>  #define smu_get_current_clk_freq_by_table(smu, clk_type, value) \
> @@ -804,5 +798,7 @@ bool smu_clk_dpm_is_enabled(struct smu_context
> *smu, enum smu_clk_type clk_type)
>  int smu_feature_update_enable_state(struct smu_context *smu, uint64_t
> feature_mask, bool enabled);
>  const char *smu_get_message_name(struct smu_context *smu, enum
> smu_message_type type);
>  const char *smu_get_feature_name(struct smu_context *smu, enum
> smu_feature_mask feature);
> +size_t smu_sys_get_pp_feature_mask(struct smu_context *smu, char *buf);
> +int smu_sys_set_pp_feature_mask(struct smu_context *smu, uint64_t
> new_mask);
>
>  #endif
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index c873228bf05f..cd0920093a5e 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1422,169 +1422,6 @@ static int navi10_get_uclk_dpm_states(struct
> smu_context *smu, uint32_t *clocks_
>          return 0;
>  }
>
> -static int navi10_get_ppfeature_status(struct smu_context *smu,
> -                                      char *buf)
> -{
> -       static const char *ppfeature_name[] =3D {
> - "DPM_PREFETCHER",
> -                               "DPM_GFXCLK",
> -                               "DPM_GFX_PACE",
> -                               "DPM_UCLK",
> -                               "DPM_SOCCLK",
> -                               "DPM_MP0CLK",
> -                               "DPM_LINK",
> -                               "DPM_DCEFCLK",
> - "MEM_VDDCI_SCALING",
> - "MEM_MVDD_SCALING",
> -                               "DS_GFXCLK",
> -                               "DS_SOCCLK",
> -                               "DS_LCLK",
> -                               "DS_DCEFCLK",
> -                               "DS_UCLK",
> -                               "GFX_ULV",
> -                               "FW_DSTATE",
> -                               "GFXOFF",
> -                               "BACO",
> -                               "VCN_PG",
> -                               "JPEG_PG",
> -                               "USB_PG",
> -                               "RSMU_SMN_CG",
> -                               "PPT",
> -                               "TDC",
> -                               "GFX_EDC",
> -                               "APCC_PLUS",
> -                               "GTHR",
> -                               "ACDC",
> -                               "VR0HOT",
> -                               "VR1HOT",
> -                               "FW_CTF",
> -                               "FAN_CONTROL",
> -                               "THERMAL",
> -                               "GFX_DCS",
> -                               "RM",
> -                               "LED_DISPLAY",
> -                               "GFX_SS",
> - "OUT_OF_BAND_MONITOR",
> - "TEMP_DEPENDENT_VMIN",
> -                               "MMHUB_PG",
> -                               "ATHUB_PG"};
> -       static const char *output_title[] =3D {
> -                               "FEATURES",
> -                               "BITMASK",
> -                               "ENABLEMENT"};
> -       uint64_t features_enabled;
> -       uint32_t feature_mask[2];
> -       int i;
> -       int ret =3D 0;
> -       int size =3D 0;
> -
> -       ret =3D smu_feature_get_enabled_mask(smu, feature_mask, 2);
> -       PP_ASSERT_WITH_CODE(!ret,
> -                       "[GetPPfeatureStatus] Failed to get enabled
> smc features!",
> -                       return ret);
> -       features_enabled =3D (uint64_t)feature_mask[0] |
> - (uint64_t)feature_mask[1] << 32;
> -
> -       size +=3D sprintf(buf + size, "Current ppfeatures: 0x%016llx\n",
> features_enabled);
> -       size +=3D sprintf(buf + size, "%-19s %-22s %s\n",
> -                               output_title[0],
> -                               output_title[1],
> - output_title[2]);
> -       for (i =3D 0; i < (sizeof(ppfeature_name) /
> sizeof(ppfeature_name[0])); i++) {
> -               size +=3D sprintf(buf + size, "%-19s 0x%016llx %6s\n",
> - ppfeature_name[i],
> -                                       1ULL << i,
> - (features_enabled & (1ULL << i)) ? "Y" : "N");
> -       }
> -
> -       return size;
> -}
> -
> -static int navi10_enable_smc_features(struct smu_context *smu,
> -                                     bool enabled,
> -                                     uint64_t feature_masks)
> -{
> -       struct smu_feature *feature =3D &smu->smu_feature;
> -       uint32_t feature_low, feature_high;
> -       uint32_t feature_mask[2];
> -       int ret =3D 0;
> -
> -       feature_low =3D (uint32_t)(feature_masks & 0xFFFFFFFF);
> -       feature_high =3D (uint32_t)((feature_masks &
> 0xFFFFFFFF00000000ULL) >> 32);
> -
> -       if (enabled) {
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_EnableSmuFeaturesLow,
> -                                                 feature_low);
> -               if (ret)
> -                       return ret;
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_EnableSmuFeaturesHigh,
> -                                                 feature_high);
> -               if (ret)
> -                       return ret;
> -       } else {
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_DisableSmuFeaturesLow,
> -                                                 feature_low);
> -               if (ret)
> -                       return ret;
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_DisableSmuFeaturesHigh,
> -                                                 feature_high);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       ret =3D smu_feature_get_enabled_mask(smu, feature_mask, 2);
> -       if (ret)
> -               return ret;
> -
> -       mutex_lock(&feature->mutex);
> -       bitmap_copy(feature->enabled, (unsigned long *)&feature_mask,
> -                   feature->feature_num);
> -       mutex_unlock(&feature->mutex);
> -
> -       return 0;
> -}
> -
> -static int navi10_set_ppfeature_status(struct smu_context *smu,
> -                                      uint64_t new_ppfeature_masks)
> -{
> -       uint64_t features_enabled;
> -       uint32_t feature_mask[2];
> -       uint64_t features_to_enable;
> -       uint64_t features_to_disable;
> -       int ret =3D 0;
> -
> -       ret =3D smu_feature_get_enabled_mask(smu, feature_mask, 2);
> -       PP_ASSERT_WITH_CODE(!ret,
> -                       "[SetPPfeatureStatus] Failed to get enabled
> smc features!",
> -                       return ret);
> -       features_enabled =3D (uint64_t)feature_mask[0] |
> - (uint64_t)feature_mask[1] << 32;
> -
> -       features_to_disable =3D
> -               features_enabled & ~new_ppfeature_masks;
> -       features_to_enable =3D
> -               ~features_enabled & new_ppfeature_masks;
> -
> -       pr_debug("features_to_disable 0x%llx\n", features_to_disable);
> -       pr_debug("features_to_enable 0x%llx\n", features_to_enable);
> -
> -       if (features_to_disable) {
> -               ret =3D navi10_enable_smc_features(smu, false,
> features_to_disable);
> -               PP_ASSERT_WITH_CODE(!ret,
> - "[SetPPfeatureStatus] Failed to disable smc features!",
> -                               return ret);
> -       }
> -
> -       if (features_to_enable) {
> -               ret =3D navi10_enable_smc_features(smu, true,
> features_to_enable);
> -               PP_ASSERT_WITH_CODE(!ret,
> - "[SetPPfeatureStatus] Failed to enable smc features!",
> -                               return ret);
> -       }
> -
> -       return 0;
> -}
> -
>  static int navi10_set_peak_clock_by_device(struct smu_context *smu)
>  {
>          struct amdgpu_device *adev =3D smu->adev;
> @@ -1689,8 +1526,6 @@ static const struct pptable_funcs
> navi10_ppt_funcs =3D {
>          .set_watermarks_table =3D navi10_set_watermarks_table,
>          .read_sensor =3D navi10_read_sensor,
>          .get_uclk_dpm_states =3D navi10_get_uclk_dpm_states,
> -       .get_ppfeature_status =3D navi10_get_ppfeature_status,
> -       .set_ppfeature_status =3D navi10_set_ppfeature_status,
>          .set_performance_level =3D navi10_set_performance_level,
>          .get_thermal_temperature_range =3D
> navi10_get_thermal_temperature_range,
>  };
> diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> index c06a9472c3b2..52c8fc9f1ff4 100644
> --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> @@ -2858,157 +2858,6 @@ static int vega20_dpm_set_vce_enable(struct
> smu_context *smu, bool enable)
>          return smu_feature_set_enabled(smu, SMU_FEATURE_DPM_VCE_BIT,
> enable);
>  }
>
> -static int vega20_get_enabled_smc_features(struct smu_context *smu,
> -               uint64_t *features_enabled)
> -{
> -       uint32_t feature_mask[2] =3D {0, 0};
> -       int ret =3D 0;
> -
> -       ret =3D smu_feature_get_enabled_mask(smu, feature_mask, 2);
> -       if (ret)
> -               return ret;
> -
> -       *features_enabled =3D ((((uint64_t)feature_mask[0] <<
> SMU_FEATURES_LOW_SHIFT) & SMU_FEATURES_LOW_MASK) |
> - (((uint64_t)feature_mask[1] << SMU_FEATURES_HIGH_SHIFT) &
> SMU_FEATURES_HIGH_MASK));
> -
> -       return ret;
> -}
> -
> -static int vega20_enable_smc_features(struct smu_context *smu,
> -               bool enable, uint64_t feature_mask)
> -{
> -       uint32_t smu_features_low, smu_features_high;
> -       int ret =3D 0;
> -
> -       smu_features_low =3D (uint32_t)((feature_mask &
> SMU_FEATURES_LOW_MASK) >> SMU_FEATURES_LOW_SHIFT);
> -       smu_features_high =3D (uint32_t)((feature_mask &
> SMU_FEATURES_HIGH_MASK) >> SMU_FEATURES_HIGH_SHIFT);
> -
> -       if (enable) {
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_EnableSmuFeaturesLow,
> -                                                 smu_features_low);
> -               if (ret)
> -                       return ret;
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_EnableSmuFeaturesHigh,
> -                                                 smu_features_high);
> -               if (ret)
> -                       return ret;
> -       } else {
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_DisableSmuFeaturesLow,
> -                                                 smu_features_low);
> -               if (ret)
> -                       return ret;
> -               ret =3D smu_send_smc_msg_with_param(smu,
> SMU_MSG_DisableSmuFeaturesHigh,
> -                                                 smu_features_high);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> -
> -}
> -
> -static int vega20_get_ppfeature_status(struct smu_context *smu, char
> *buf)
> -{
> -       static const char *ppfeature_name[] =3D {
> - "DPM_PREFETCHER",
> -                               "GFXCLK_DPM",
> -                               "UCLK_DPM",
> -                               "SOCCLK_DPM",
> -                               "UVD_DPM",
> -                               "VCE_DPM",
> -                               "ULV",
> -                               "MP0CLK_DPM",
> -                               "LINK_DPM",
> -                               "DCEFCLK_DPM",
> -                               "GFXCLK_DS",
> -                               "SOCCLK_DS",
> -                               "LCLK_DS",
> -                               "PPT",
> -                               "TDC",
> -                               "THERMAL",
> -                               "GFX_PER_CU_CG",
> -                               "RM",
> -                               "DCEFCLK_DS",
> -                               "ACDC",
> -                               "VR0HOT",
> -                               "VR1HOT",
> -                               "FW_CTF",
> -                               "LED_DISPLAY",
> -                               "FAN_CONTROL",
> -                               "GFX_EDC",
> -                               "GFXOFF",
> -                               "CG",
> -                               "FCLK_DPM",
> -                               "FCLK_DS",
> -                               "MP1CLK_DS",
> -                               "MP0CLK_DS",
> -                               "XGMI",
> -                               "ECC"};
> -       static const char *output_title[] =3D {
> -                               "FEATURES",
> -                               "BITMASK",
> -                               "ENABLEMENT"};
> -       uint64_t features_enabled;
> -       int i;
> -       int ret =3D 0;
> -       int size =3D 0;
> -
> -       ret =3D vega20_get_enabled_smc_features(smu, &features_enabled);
> -       if (ret)
> -               return ret;
> -
> -       size +=3D sprintf(buf + size, "Current ppfeatures: 0x%016llx\n",
> features_enabled);
> -       size +=3D sprintf(buf + size, "%-19s %-22s %s\n",
> -                               output_title[0],
> -                               output_title[1],
> - output_title[2]);
> -       for (i =3D 0; i < GNLD_FEATURES_MAX; i++) {
> -               size +=3D sprintf(buf + size, "%-19s 0x%016llx %6s\n",
> - ppfeature_name[i],
> -                                       1ULL << i,
> - (features_enabled & (1ULL << i)) ? "Y" : "N");
> -       }
> -
> -       return size;
> -}
> -
> -static int vega20_set_ppfeature_status(struct smu_context *smu,
> uint64_t new_ppfeature_masks)
> -{
> -       uint64_t features_enabled;
> -       uint64_t features_to_enable;
> -       uint64_t features_to_disable;
> -       int ret =3D 0;
> -
> -       if (new_ppfeature_masks >=3D (1ULL << GNLD_FEATURES_MAX))
> -               return -EINVAL;
> -
> -       ret =3D vega20_get_enabled_smc_features(smu, &features_enabled);
> -       if (ret)
> -               return ret;
> -
> -       features_to_disable =3D
> -               features_enabled & ~new_ppfeature_masks;
> -       features_to_enable =3D
> -               ~features_enabled & new_ppfeature_masks;
> -
> -       pr_debug("features_to_disable 0x%llx\n", features_to_disable);
> -       pr_debug("features_to_enable 0x%llx\n", features_to_enable);
> -
> -       if (features_to_disable) {
> -               ret =3D vega20_enable_smc_features(smu, false,
> features_to_disable);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       if (features_to_enable) {
> -               ret =3D vega20_enable_smc_features(smu, true,
> features_to_enable);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  static bool vega20_is_dpm_running(struct smu_context *smu)
>  {
>          int ret =3D 0;
> @@ -3311,8 +3160,6 @@ static const struct pptable_funcs
> vega20_ppt_funcs =3D {
>          .force_dpm_limit_value =3D vega20_force_dpm_limit_value,
>          .unforce_dpm_levels =3D vega20_unforce_dpm_levels,
>          .get_profiling_clk_mask =3D vega20_get_profiling_clk_mask,
> -       .set_ppfeature_status =3D vega20_set_ppfeature_status,
> -       .get_ppfeature_status =3D vega20_get_ppfeature_status,
>          .is_dpm_running =3D vega20_is_dpm_running,
>          .set_thermal_fan_table =3D vega20_set_thermal_fan_table,
>          .get_fan_speed_percent =3D vega20_get_fan_speed_percent,
> --
> 2.22.0
>

--_000_BN8PR12MB3283A9239266F64A93F2E3DDA2C00BN8PR12MB3283namp_
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
<a id=3D"OWAAM237161" class=3D"_1OtrSZdhKXVv3UhaivrdJ4 mention ms-bgc-nlr m=
s-fcl-b" href=3D"mailto:Alexander.Deucher@amd.com">@Deucher, Alexander</a><=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Alex,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
it seems not application will use this sysfs, can we rename it from &quot;p=
pfeatures&quot; to &quot;pp_features&quot;?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">this patch sets is pending.</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> StDenis, Tom &lt;Tom.=
StDenis@amd.com&gt;<br>
<b>Sent:</b> Thursday, July 25, 2019 9:14 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Huang, Ray=
 &lt;Ray.Huang@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; =
Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd=
-gfx@lists.freedesktop.org&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt=
;<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature s=
tatus function in smu</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">No it doesn't.&nbsp; We get clocks for --top from =
the sensors interface.<br>
<br>
<br>
On 2019-07-25 9:01 a.m., Deucher, Alexander wrote:<br>
&gt; Tom, does umr use it?<br>
&gt;<br>
&gt; Alex<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *From:* Huang, Ray &lt;Ray.Huang@amd.com&gt;<br>
&gt; *Sent:* Thursday, July 25, 2019 4:49 AM<br>
&gt; *To:* Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Quan, Evan <br>
&gt; &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.org <br>
&gt; &lt;amd-gfx@lists.freedesktop.org&gt;; Zhang, Hawking <br>
&gt; &lt;Hawking.Zhang@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt;<br>
&gt; *Cc:* Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
&gt; *Subject:* RE: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature <=
br>
&gt; status function in smu<br>
&gt;<br>
&gt; Any other user mode tool use the =93ppfeature=94 sysfs interface?<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Ray<br>
&gt;<br>
&gt; *From:* Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; *Sent:* Thursday, July 25, 2019 4:44 PM<br>
&gt; *To:* Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org; <br>
&gt; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Deucher, Alexander <br>
&gt; &lt;Alexander.Deucher@amd.com&gt;<br>
&gt; *Cc:* Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.=
Feng@amd.com&gt;<br>
&gt; *Subject:* Re: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature <=
br>
&gt; status function in smu<br>
&gt;<br>
&gt; in fact, i don't want to change this sysfs name from &quot;ppfeatures&=
quot; to <br>
&gt; &quot;pp_features&quot;,<br>
&gt;<br>
&gt; but it seems that don't have same name format with other pp sysfs node=
.<br>
&gt;<br>
&gt; the other powerplay sysfs name have &quot;pp_&quot; prefix, i think we=
'd&nbsp;better <br>
&gt; to change it name to &quot;pp_features&quot;<br>
&gt;<br>
&gt; eg:<br>
&gt;<br>
&gt; pp_cur_state &nbsp; &nbsp;pp_dpm_fclk &nbsp;pp_dpm_pcie &nbsp;pp_dpm_s=
occlk <br>
&gt; &nbsp;pp_force_state &nbsp;pp_num_states &nbsp;pp_sclk_od<br>
&gt; pp_dpm_dcefclk &nbsp;pp_dpm_mclk &nbsp;pp_dpm_sclk &nbsp;pp_features &=
nbsp; &nbsp;pp_mclk_od &nbsp; <br>
&gt; &nbsp; &nbsp;pp_power_profile_mode &nbsp;pp_table<br>
&gt;<br>
&gt; @Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">m=
ailto:Alexander.Deucher@amd.com</a>&gt; @Zhang, Hawking
<br>
&gt; &lt;<a href=3D"mailto:Hawking.Zhang@amd.com">mailto:Hawking.Zhang@amd.=
com</a>&gt;<br>
&gt;<br>
&gt; Could you give us some idea about it,<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt; Best Regards,<br>
&gt; Kevin<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt;<br>
&gt; *From:*Quan, Evan &lt;Evan.Quan@amd.com &lt;<a href=3D"mailto:Evan.Qua=
n@amd.com">mailto:Evan.Quan@amd.com</a>&gt;&gt;<br>
&gt; *Sent:* Thursday, July 25, 2019 4:30 PM<br>
&gt; *To:* Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com <br>
&gt; &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">mailto:Kevin1.Wang@amd.com<=
/a>&gt;&gt;; amd-gfx@lists.freedesktop.org
<br>
&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">mailto:amd-gfx@li=
sts.freedesktop.org</a>&gt; &lt;amd-gfx@lists.freedesktop.org
<br>
&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">mailto:amd-gfx@li=
sts.freedesktop.org</a>&gt;&gt;<br>
&gt; *Cc:* Deucher, Alexander &lt;Alexander.Deucher@amd.com <br>
&gt; &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">mailto:Alexander.Deuc=
her@amd.com</a>&gt;&gt;; Huang, Ray &lt;Ray.Huang@amd.com
<br>
&gt; &lt;<a href=3D"mailto:Ray.Huang@amd.com">mailto:Ray.Huang@amd.com</a>&=
gt;&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com
<br>
&gt; &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">mailto:Kenneth.Feng@amd.co=
m</a>&gt;&gt;<br>
&gt; *Subject:* RE: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature <=
br>
&gt; status function in smu<br>
&gt;<br>
&gt; To keep backward compatibility, we cannot change the sysfs file naming=
.<br>
&gt;<br>
&gt; But it=92s a good idea to summarize these as common APIs.<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Evan<br>
&gt;<br>
&gt; *From:* amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org <br>
&gt; &lt;<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">mailto:am=
d-gfx-bounces@lists.freedesktop.org</a>&gt;&gt; *On Behalf Of *Wang,
<br>
&gt; Kevin(Yang)<br>
&gt; *Sent:* Thursday, July 25, 2019 4:10 PM<br>
&gt; *To:* amd-gfx@lists.freedesktop.org &lt;<a href=3D"mailto:amd-gfx@list=
s.freedesktop.org">mailto:amd-gfx@lists.freedesktop.org</a>&gt;<br>
&gt; *Cc:* Deucher, Alexander &lt;Alexander.Deucher@amd.com <br>
&gt; &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">mailto:Alexander.Deuc=
her@amd.com</a>&gt;&gt;; Huang, Ray &lt;Ray.Huang@amd.com
<br>
&gt; &lt;<a href=3D"mailto:Ray.Huang@amd.com">mailto:Ray.Huang@amd.com</a>&=
gt;&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com
<br>
&gt; &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">mailto:Kenneth.Feng@amd.co=
m</a>&gt;&gt;<br>
&gt; *Subject:* Re: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature <=
br>
&gt; status function in smu<br>
&gt;<br>
&gt; add sample data from sysfs pp_features with this patch.<br>
&gt;<br>
&gt; print format:<br>
&gt;<br>
&gt; index. feature name (Hardware Message ID): state<br>
&gt;<br>
&gt; /sudo find /sys -name &quot;pp_features&quot; -exec cat {} \;/<br>
&gt;<br>
&gt; features high: 0x00000623 low: 0xb3cdaffb<br>
&gt;<br>
&gt; 00. DPM_PREFETCHER &nbsp; &nbsp; &nbsp; ( 0) : enabeld<br>
&gt;<br>
&gt; 01. DPM_GFXCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ( 1) : enabeld<br>
&gt;<br>
&gt; 02. DPM_UCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ( 3) : enabeld<=
br>
&gt;<br>
&gt; 03. DPM_SOCCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ( 4) : enabeld<br>
&gt;<br>
&gt; 04. DPM_MP0CLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ( 5) : enabeld<br>
&gt;<br>
&gt; 05. DPM_LINK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ( 6) : enabeld<=
br>
&gt;<br>
&gt; 06. DPM_DCEFCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;( 7) : enabeld<br>
&gt;<br>
&gt; 07. DS_GFXCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(10) : enabeld<=
br>
&gt;<br>
&gt; 08. DS_SOCCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(11) : enabeld<=
br>
&gt;<br>
&gt; 09. DS_LCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(12) : dis=
abled<br>
&gt;<br>
&gt; 10. PPT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(23) : =
enabeld<br>
&gt;<br>
&gt; 11. TDC &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(24) : =
enabeld<br>
&gt;<br>
&gt; 12. THERMAL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(33) : ena=
beld<br>
&gt;<br>
&gt; 13. RM &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (35) : =
disabled<br>
&gt;<br>
&gt; 14. DS_DCEFCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (13) : enabeld<br>
&gt;<br>
&gt; 15. ACDC &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (28) =
: enabeld<br>
&gt;<br>
&gt; 16. VR0HOT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (29) : ena=
beld<br>
&gt;<br>
&gt; 17. VR1HOT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (30) : dis=
abled<br>
&gt;<br>
&gt; 18. FW_CTF &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (31) : ena=
beld<br>
&gt;<br>
&gt; 19. LED_DISPLAY &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(36) : disabled<br>
&gt;<br>
&gt; 20. FAN_CONTROL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(32) : enabeld<br>
&gt;<br>
&gt; 21. GFX_EDC &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(25) : ena=
beld<br>
&gt;<br>
&gt; 22. GFXOFF &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (17) : dis=
abled<br>
&gt;<br>
&gt; 23. DPM_GFX_PACE &nbsp; &nbsp; &nbsp; &nbsp; ( 2) : disabled<br>
&gt;<br>
&gt; 24. MEM_VDDCI_SCALING &nbsp; &nbsp;( 8) : enabeld<br>
&gt;<br>
&gt; 25. MEM_MVDD_SCALING &nbsp; &nbsp; ( 9) : enabeld<br>
&gt;<br>
&gt; 26. DS_UCLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(14) : dis=
abled<br>
&gt;<br>
&gt; 27. GFX_ULV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(15) : ena=
beld<br>
&gt;<br>
&gt; 28. FW_DSTATE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(16) : enabeld<=
br>
&gt;<br>
&gt; 29. BACO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (18) =
: enabeld<br>
&gt;<br>
&gt; 30. VCN_PG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (19) : ena=
beld<br>
&gt;<br>
&gt; 31. JPEG_PG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(20) : dis=
abled<br>
&gt;<br>
&gt; 32. USB_PG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (21) : dis=
abled<br>
&gt;<br>
&gt; 33. RSMU_SMN_CG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(22) : enabeld<br>
&gt;<br>
&gt; 34. APCC_PLUS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(26) : disabled=
<br>
&gt;<br>
&gt; 35. GTHR &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (27) =
: disabled<br>
&gt;<br>
&gt; 36. GFX_DCS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(34) : dis=
abled<br>
&gt;<br>
&gt; 37. GFX_SS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (37) : ena=
beld<br>
&gt;<br>
&gt; 38. OUT_OF_BAND_MONITOR &nbsp;(38) : disabled<br>
&gt;<br>
&gt; 39. TEMP_DEPENDENT_VMIN &nbsp;(39) : disabled<br>
&gt;<br>
&gt; 40. MMHUB_PG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (40) : disabled=
<br>
&gt;<br>
&gt; 41. ATHUB_PG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (41) : enabeld<=
br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt;<br>
&gt; *From:*Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com <br>
&gt; &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">mailto:Kevin1.Wang@amd.com<=
/a>&gt;&gt;<br>
&gt; *Sent:* Thursday, July 25, 2019 1:11 PM<br>
&gt; *To:* amd-gfx@lists.freedesktop.org <br>
&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">mailto:amd-gfx@li=
sts.freedesktop.org</a>&gt; &lt;amd-gfx@lists.freedesktop.org
<br>
&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">mailto:amd-gfx@li=
sts.freedesktop.org</a>&gt;&gt;<br>
&gt; *Cc:* Feng, Kenneth &lt;Kenneth.Feng@amd.com <br>
&gt; &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">mailto:Kenneth.Feng@amd.co=
m</a>&gt;&gt;; Huang, Ray &lt;Ray.Huang@amd.com
<br>
&gt; &lt;<a href=3D"mailto:Ray.Huang@amd.com">mailto:Ray.Huang@amd.com</a>&=
gt;&gt;; Deucher, Alexander
<br>
&gt; &lt;Alexander.Deucher@amd.com &lt;<a href=3D"mailto:Alexander.Deucher@=
amd.com">mailto:Alexander.Deucher@amd.com</a>&gt;&gt;; Wang,
<br>
&gt; Kevin(Yang) &lt;Kevin1.Wang@amd.com &lt;<a href=3D"mailto:Kevin1.Wang@=
amd.com">mailto:Kevin1.Wang@amd.com</a>&gt;&gt;<br>
&gt; *Subject:* [PATCH 5/5] drm/amd/powerplay: implment sysfs feature <br>
&gt; status function in smu<br>
&gt;<br>
&gt; 1. Unified feature enable status format in sysfs<br>
&gt; 2. Rename ppfeature to pp_features to adapt other pp sysfs node name<b=
r>
&gt; 3. this function support all asic, not asic related function.<br>
&gt;<br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com <br>
&gt; &lt;<a href=3D"mailto:kevin1.wang@amd.com">mailto:kevin1.wang@amd.com<=
/a>&gt;&gt;<br>
&gt; ---<br>
&gt; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c |&nbsp; 24 &#43;--<br>
&gt; &nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c |&nbsp; 61 &#43;&#43;=
&#43;&#43;&#43;&#43;&#43;<br>
&gt; &nbsp;.../gpu/drm/amd/powerplay/inc/amdgpu_smu.h |&nbsp;&nbsp; 8 &#43;=
-<br>
&gt; &nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp; | 1=
65 ------------------<br>
&gt; &nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp; | 1=
53 ----------------<br>
&gt; &nbsp;5 files changed, 75 insertions(&#43;), 336 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c <br>
&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt; index 866097d5cf26..9e8e8a65d9bf 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt; @@ -788,10 &#43;788,10 @@ static ssize_t <br>
&gt; amdgpu_get_pp_od_clk_voltage(struct device *dev,<br>
&gt; &nbsp;}<br>
&gt;<br>
&gt; &nbsp;/**<br>
&gt; - * DOC: ppfeatures<br>
&gt; &#43; * DOC: pp_features<br>
&gt; &nbsp; *<br>
&gt; &nbsp; * The amdgpu driver provides a sysfs API for adjusting what pow=
erplay<br>
&gt; - * features to be enabled. The file ppfeatures is used for this. And<=
br>
&gt; &#43; * features to be enabled. The file pp_features is used for this.=
 And<br>
&gt; &nbsp; * this is only available for Vega10 and later dGPUs.<br>
&gt; &nbsp; *<br>
&gt; &nbsp; * Reading back the file will show you the followings:<br>
&gt; @@ -803,7 &#43;803,7 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(st=
ruct <br>
&gt; device *dev,<br>
&gt; &nbsp; * the corresponding bit from original ppfeature masks and input=
 the<br>
&gt; &nbsp; * new ppfeature masks.<br>
&gt; &nbsp; */<br>
&gt; -static ssize_t amdgpu_set_ppfeature_status(struct device *dev,<br>
&gt; &#43;static ssize_t amdgpu_set_pp_feature_status(struct device *dev,<b=
r>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; struct device_attribute *attr,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; const char *buf,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; size_t count)<br>
&gt; @@ -820,7 &#43;820,7 @@ static ssize_t amdgpu_set_ppfeature_status(str=
uct <br>
&gt; device *dev,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;featur=
emask =3D 0x%llx\n&quot;, featuremask);<br>
&gt;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu=
(adev)) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_set_ppfeature_status(&amp;adev-&gt;smu, feature=
mask);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_sys_set_pp_feature_mask(&amp;adev-&gt;smu, =
<br>
&gt; featuremask);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
return -EINVAL;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (adev-&gt;p=
owerplay.pp_funcs-&gt;set_ppfeature_status) {<br>
&gt; @@ -832,7 &#43;832,7 @@ static ssize_t amdgpu_set_ppfeature_status(str=
uct <br>
&gt; device *dev,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return count;<br>
&gt; &nbsp;}<br>
&gt;<br>
&gt; -static ssize_t amdgpu_get_ppfeature_status(struct device *dev,<br>
&gt; &#43;static ssize_t amdgpu_get_pp_feature_status(struct device *dev,<b=
r>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; struct device_attribute *attr,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; char *buf)<br>
&gt; &nbsp;{<br>
&gt; @@ -840,7 &#43;840,7 @@ static ssize_t amdgpu_get_ppfeature_status(str=
uct <br>
&gt; device *dev,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device =
*adev =3D ddev-&gt;dev_private;<br>
&gt;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu=
(adev)) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return smu_get_ppfeature_status(&amp;adev-&gt;smu, buf);<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return smu_sys_get_pp_feature_mask(&amp;adev-&gt;smu, b=
uf);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (adev-&gt;p=
owerplay.pp_funcs-&gt;get_ppfeature_status)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; return amdgpu_dpm_get_ppfeature_status(adev, buf=
);<br>
&gt;<br>
&gt; @@ -1500,9 &#43;1500,9 @@ static DEVICE_ATTR(gpu_busy_percent, S_IRUGO=
,<br>
&gt; &nbsp;static DEVICE_ATTR(mem_busy_percent, S_IRUGO,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_get_memory_busy_percent, NULL);<br>
&gt; &nbsp;static DEVICE_ATTR(pcie_bw, S_IRUGO, amdgpu_get_pcie_bw, NULL);<=
br>
&gt; -static DEVICE_ATTR(ppfeatures, S_IRUGO | S_IWUSR,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; amdgpu_get_ppfeature_status,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; amdgpu_set_ppfeature_status);<br>
&gt; &#43;static DEVICE_ATTR(pp_features, S_IRUGO | S_IWUSR,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; amdgpu_get_pp_feature_status,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; amdgpu_set_pp_feature_status);<br>
&gt; &nbsp;static DEVICE_ATTR(unique_id, S_IRUGO, amdgpu_get_unique_id, NUL=
L);<br>
&gt;<br>
&gt; &nbsp;static ssize_t amdgpu_hwmon_show_temp(struct device *dev,<br>
&gt; @@ -2960,10 &#43;2960,10 @@ int amdgpu_pm_sysfs_init(struct amdgpu_dev=
ice <br>
&gt; *adev)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((adev-&gt;asic_ty=
pe &gt;=3D CHIP_VEGA10) &amp;&amp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; !(adev-&gt;flags &amp; AMD_IS_APU)) {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D device_create_file(adev-&gt;dev,<br>
&gt; - &amp;dev_attr_ppfeatures);<br>
&gt; &#43; &amp;dev_attr_pp_features);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
DRM_ERROR(&quot;failed to create device file &quot;<br>
&gt; - &quot;ppfeatures\n&quot;);<br>
&gt; &#43; &quot;pp_features\n&quot;);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
return ret;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; @@ -3017,7 &#43;3017,7 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_devi=
ce <br>
&gt; *adev)<br>
&gt; device_remove_file(adev-&gt;dev, &amp;dev_attr_unique_id);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((adev-&gt;asic_ty=
pe &gt;=3D CHIP_VEGA10) &amp;&amp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; !(adev-&gt;flags &amp; AMD_IS_APU))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_ppfeatures);=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_pp_featu=
res);<br>
&gt; &nbsp;}<br>
&gt;<br>
&gt; &nbsp;void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c <br>
&gt; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; index e881de955388..90833ff2fe00 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; @@ -55,6 &#43;55,67 @@ const char *smu_get_feature_name(struct smu_con=
text <br>
&gt; *smu, enum smu_feature_mask<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __smu_feature_=
names[feature];<br>
&gt; &nbsp;}<br>
&gt;<br>
&gt; &#43;size_t smu_sys_get_pp_feature_mask(struct smu_context *smu, char =
*buf)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t size =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0, i =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_mask[2] =3D=
 { 0 };<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int32_t feature_index =3D 0;=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t count =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_get_enab=
led_mask(smu, feature_mask, 2);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto failed;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D&nbsp; sprintf(buf &=
#43; size, &quot;features high: 0x%08x low: 0x%08x\n&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature=
_mask[1], feature_mask[0]);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; SMU_FEA=
TURE_COUNT; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; feature_index =3D smu_feature_get_index(smu, i);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (feature_index &lt; 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; size, &quot;%02d. %-20s=
 (%2d) : %s\n&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count&#43;&#43;,<br>
&gt; &#43; smu_get_feature_name(smu, i),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_index,<br>
&gt; &#43; !!smu_feature_is_enabled(smu, i) ? &quot;enabeld&quot; : &quot;d=
isabled&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;failed:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;int smu_sys_set_pp_feature_mask(struct smu_context *smu, uint64_t=
 <br>
&gt; new_mask)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_mask[2] =3D=
 { 0 };<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t feature_2_enabled =
=3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t feature_2_disabled =
=3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t feature_enables =3D=
 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_get_enab=
led_mask(smu, feature_mask, 2);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_enables =3D ((uint64=
_t)feature_mask[1] &lt;&lt; 32 | <br>
&gt; (uint64_t)feature_mask[0]);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_2_enabled&nbsp; =3D =
~feature_enables &amp; new_mask;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_2_disabled =3D featu=
re_enables &amp; ~new_mask;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (feature_2_enabled) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_update_enable_state(smu, <br>
&gt; feature_2_enabled, true);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret;<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (feature_2_disabled) {<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_update_enable_state(smu, <br>
&gt; feature_2_disabled, false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &nbsp;int smu_get_smc_version(struct smu_context *smu, uint32_t <br>
&gt; *if_version, uint32_t *smu_version)<br>
&gt; &nbsp;{<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h <br>
&gt; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; index abc2644b4c07..ac9e9d5d8a5c 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; @@ -432,8 &#43;432,6 @@ struct pptable_funcs {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; uint32_t *mclk_mask,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; uint32_t *soc_mask);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*set_cpu_power_s=
tate)(struct smu_context *smu);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*set_ppfeature_status)(stru=
ct smu_context *smu, uint64_t <br>
&gt; ppfeatures);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_ppfeature_status)(stru=
ct smu_context *smu, char *buf);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool (*is_dpm_running=
)(struct smu_context *smu);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*tables_init)(st=
ruct smu_context *smu, struct smu_table <br>
&gt; *tables);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*set_thermal_fan=
_table)(struct smu_context *smu);<br>
&gt; @@ -713,10 &#43;711,6 @@ struct smu_funcs<br>
&gt; ((smu)-&gt;ppt_funcs-&gt;dpm_set_vce_enable ? <br>
&gt; (smu)-&gt;ppt_funcs-&gt;dpm_set_vce_enable((smu), (enable)) : 0)<br>
&gt; &nbsp;#define smu_set_xgmi_pstate(smu, pstate) \<br>
&gt; ((smu)-&gt;funcs-&gt;set_xgmi_pstate ? (smu)-&gt;funcs-&gt;set_xgmi_ps=
tate((smu), <br>
&gt; (pstate)) : 0)<br>
&gt; -#define smu_set_ppfeature_status(smu, ppfeatures) \<br>
&gt; - ((smu)-&gt;ppt_funcs-&gt;set_ppfeature_status ? <br>
&gt; (smu)-&gt;ppt_funcs-&gt;set_ppfeature_status((smu), (ppfeatures)) : -E=
INVAL)<br>
&gt; -#define smu_get_ppfeature_status(smu, buf) \<br>
&gt; - ((smu)-&gt;ppt_funcs-&gt;get_ppfeature_status ? <br>
&gt; (smu)-&gt;ppt_funcs-&gt;get_ppfeature_status((smu), (buf)) : -EINVAL)<=
br>
&gt; &nbsp;#define smu_set_watermarks_table(smu, tab, clock_ranges) \<br>
&gt; ((smu)-&gt;ppt_funcs-&gt;set_watermarks_table ? <br>
&gt; (smu)-&gt;ppt_funcs-&gt;set_watermarks_table((smu), (tab), (clock_rang=
es)) : 0)<br>
&gt; &nbsp;#define smu_get_current_clk_freq_by_table(smu, clk_type, value) =
\<br>
&gt; @@ -804,5 &#43;798,7 @@ bool smu_clk_dpm_is_enabled(struct smu_context=
 <br>
&gt; *smu, enum smu_clk_type clk_type)<br>
&gt; &nbsp;int smu_feature_update_enable_state(struct smu_context *smu, uin=
t64_t <br>
&gt; feature_mask, bool enabled);<br>
&gt; &nbsp;const char *smu_get_message_name(struct smu_context *smu, enum <=
br>
&gt; smu_message_type type);<br>
&gt; &nbsp;const char *smu_get_feature_name(struct smu_context *smu, enum <=
br>
&gt; smu_feature_mask feature);<br>
&gt; &#43;size_t smu_sys_get_pp_feature_mask(struct smu_context *smu, char =
*buf);<br>
&gt; &#43;int smu_sys_set_pp_feature_mask(struct smu_context *smu, uint64_t=
 <br>
&gt; new_mask);<br>
&gt;<br>
&gt; &nbsp;#endif<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c <br>
&gt; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; index c873228bf05f..cd0920093a5e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -1422,169 &#43;1422,6 @@ static int navi10_get_uclk_dpm_states(stru=
ct <br>
&gt; smu_context *smu, uint32_t *clocks_<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &nbsp;}<br>
&gt;<br>
&gt; -static int navi10_get_ppfeature_status(struct smu_context *smu,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char *buf)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const char *ppfeature_nam=
e[] =3D {<br>
&gt; - &quot;DPM_PREFETCHER&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DPM_GFXCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DPM_GFX_PACE&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DPM_UCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DPM_SOCCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DPM_MP0CLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DPM_LINK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DPM_DCEFCLK&quot;,<br>
&gt; - &quot;MEM_VDDCI_SCALING&quot;,<br>
&gt; - &quot;MEM_MVDD_SCALING&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DS_GFXCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DS_SOCCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DS_LCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DS_DCEFCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DS_UCLK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFX_ULV&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FW_DSTATE&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFXOFF&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;BACO&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VCN_PG&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;JPEG_PG&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;USB_PG&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RSMU_SMN_CG&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PPT&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;TDC&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFX_EDC&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;APCC_PLUS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GTHR&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ACDC&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VR0HOT&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VR1HOT&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FW_CTF&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAN_CONTROL&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;THERMAL&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFX_DCS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;LED_DISPLAY&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFX_SS&quot;,<br>
&gt; - &quot;OUT_OF_BAND_MONITOR&quot;,<br>
&gt; - &quot;TEMP_DEPENDENT_VMIN&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MMHUB_PG&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ATHUB_PG&quot;};<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const char *output_title[=
] =3D {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FEATURES&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;BITMASK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ENABLEMENT&quot;};<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_enabled;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_mask[2];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int size =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_get_enabled_=
mask(smu, feature_mask, 2);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[GetP=
PfeatureStatus] Failed to get enabled <br>
&gt; smc features!&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret)=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features_enabled =3D (uint64_t)f=
eature_mask[0] |<br>
&gt; - (uint64_t)feature_mask[1] &lt;&lt; 32;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; =
size, &quot;Current ppfeatures: 0x%016llx\n&quot;, <br>
&gt; features_enabled);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; =
size, &quot;%-19s %-22s %s\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_title[0],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_title[1],<br>
&gt; - output_title[2]);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; (sizeof(ppf=
eature_name) / <br>
&gt; sizeof(ppfeature_name[0])); i&#43;&#43;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; size, &quot;%-19s 0x%016llx=
 %6s\n&quot;,<br>
&gt; - ppfeature_name[i],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 1ULL &lt;&lt; i,<br>
&gt; - (features_enabled &amp; (1ULL &lt;&lt; i)) ? &quot;Y&quot; : &quot;N=
&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int navi10_enable_smc_features(struct smu_context *smu,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo=
ol enabled,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ui=
nt64_t feature_masks)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_feature *feature =3D =
&amp;smu-&gt;smu_feature;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_low, feature_hi=
gh;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_mask[2];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_low =3D (uint32_t)(featu=
re_masks &amp; 0xFFFFFFFF);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_high =3D (uint32_t)((fea=
ture_masks &amp; <br>
&gt; 0xFFFFFFFF00000000ULL) &gt;&gt; 32);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enabled) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_EnableSmuFeaturesLow,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featu=
re_low);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_EnableSmuFeaturesHigh,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featu=
re_high);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_DisableSmuFeaturesLow,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featu=
re_low);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_DisableSmuFeaturesHigh,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; featu=
re_high);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_get_enabled_=
mask(smu, feature_mask, 2);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;feature-&gt;mute=
x);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitmap_copy(feature-&gt;enabled,=
 (unsigned long *)&amp;feature_mask,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature-&gt;feature_num);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;feature-&gt;mu=
tex);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int navi10_set_ppfeature_status(struct smu_context *smu,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint64_t new_ppfeature_masks)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_enabled;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_mask[2];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_to_enable;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_to_disable;<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_get_enabled_=
mask(smu, feature_mask, 2);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[SetP=
PfeatureStatus] Failed to get enabled <br>
&gt; smc features!&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret)=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features_enabled =3D (uint64_t)f=
eature_mask[0] |<br>
&gt; - (uint64_t)feature_mask[1] &lt;&lt; 32;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features_to_disable =3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; features_enabled &amp; ~new_ppfeature_masks;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features_to_enable =3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ~features_enabled &amp; new_ppfeature_masks;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;features_to_disab=
le 0x%llx\n&quot;, features_to_disable);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;features_to_enabl=
e 0x%llx\n&quot;, features_to_enable);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (features_to_disable) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D navi10_enable_smc_features(smu, false, <br>
&gt; features_to_disable);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br>
&gt; - &quot;[SetPPfeatureStatus] Failed to disable smc features!&quot;,<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (features_to_enable) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D navi10_enable_smc_features(smu, true, <br>
&gt; features_to_enable);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br>
&gt; - &quot;[SetPPfeatureStatus] Failed to enable smc features!&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; &nbsp;static int navi10_set_peak_clock_by_device(struct smu_context *s=
mu)<br>
&gt; &nbsp;{<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device =
*adev =3D smu-&gt;adev;<br>
&gt; @@ -1689,8 &#43;1526,6 @@ static const struct pptable_funcs <br>
&gt; navi10_ppt_funcs =3D {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_watermarks_table=
 =3D navi10_set_watermarks_table,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .read_sensor =3D navi=
10_read_sensor,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_uclk_dpm_states =
=3D navi10_get_uclk_dpm_states,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_ppfeature_status =3D navi10=
_get_ppfeature_status,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_ppfeature_status =3D navi10=
_set_ppfeature_status,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_performance_leve=
l =3D navi10_set_performance_level,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_thermal_temperat=
ure_range =3D <br>
&gt; navi10_get_thermal_temperature_range,<br>
&gt; &nbsp;};<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c <br>
&gt; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; index c06a9472c3b2..52c8fc9f1ff4 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; @@ -2858,157 &#43;2858,6 @@ static int vega20_dpm_set_vce_enable(struc=
t <br>
&gt; smu_context *smu, bool enable)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_feature_se=
t_enabled(smu, SMU_FEATURE_DPM_VCE_BIT, <br>
&gt; enable);<br>
&gt; &nbsp;}<br>
&gt;<br>
&gt; -static int vega20_get_enabled_smc_features(struct smu_context *smu,<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; uint64_t *features_enabled)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_mask[2] =3D {0,=
 0};<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_get_enabled_=
mask(smu, feature_mask, 2);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *features_enabled =3D ((((uint64=
_t)feature_mask[0] &lt;&lt; <br>
&gt; SMU_FEATURES_LOW_SHIFT) &amp; SMU_FEATURES_LOW_MASK) |<br>
&gt; - (((uint64_t)feature_mask[1] &lt;&lt; SMU_FEATURES_HIGH_SHIFT) &amp; =
<br>
&gt; SMU_FEATURES_HIGH_MASK));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int vega20_enable_smc_features(struct smu_context *smu,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; bool enable, uint64_t feature_mask)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t smu_features_low, smu_f=
eatures_high;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_features_low =3D (uint32_t)(=
(feature_mask &amp; <br>
&gt; SMU_FEATURES_LOW_MASK) &gt;&gt; SMU_FEATURES_LOW_SHIFT);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_features_high =3D (uint32_t)=
((feature_mask &amp; <br>
&gt; SMU_FEATURES_HIGH_MASK) &gt;&gt; SMU_FEATURES_HIGH_SHIFT);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_EnableSmuFeaturesLow,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_f=
eatures_low);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_EnableSmuFeaturesHigh,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_f=
eatures_high);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_DisableSmuFeaturesLow,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_f=
eatures_low);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, <br>
&gt; SMU_MSG_DisableSmuFeaturesHigh,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_f=
eatures_high);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int vega20_get_ppfeature_status(struct smu_context *smu, char =
<br>
&gt; *buf)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const char *ppfeature_nam=
e[] =3D {<br>
&gt; - &quot;DPM_PREFETCHER&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFXCLK_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;UCLK_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SOCCLK_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;UVD_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VCE_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ULV&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MP0CLK_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;LINK_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DCEFCLK_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFXCLK_DS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SOCCLK_DS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;LCLK_DS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PPT&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;TDC&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;THERMAL&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFX_PER_CU_CG&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DCEFCLK_DS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ACDC&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VR0HOT&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VR1HOT&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FW_CTF&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;LED_DISPLAY&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAN_CONTROL&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFX_EDC&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GFXOFF&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CG&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FCLK_DPM&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FCLK_DS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MP1CLK_DS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MP0CLK_DS&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;XGMI&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ECC&quot;};<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const char *output_title[=
] =3D {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FEATURES&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;BITMASK&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ENABLEMENT&quot;};<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_enabled;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int size =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_get_enabled_smc_f=
eatures(smu, &amp;features_enabled);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; =
size, &quot;Current ppfeatures: 0x%016llx\n&quot;, <br>
&gt; features_enabled);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; =
size, &quot;%-19s %-22s %s\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_title[0],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_title[1],<br>
&gt; - output_title[2]);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; GNLD_FEATUR=
ES_MAX; i&#43;&#43;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; size, &quot;%-19s 0x%016llx=
 %6s\n&quot;,<br>
&gt; - ppfeature_name[i],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 1ULL &lt;&lt; i,<br>
&gt; - (features_enabled &amp; (1ULL &lt;&lt; i)) ? &quot;Y&quot; : &quot;N=
&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int vega20_set_ppfeature_status(struct smu_context *smu, <br>
&gt; uint64_t new_ppfeature_masks)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_enabled;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_to_enable;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t features_to_disable;<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_ppfeature_masks &gt;=3D =
(1ULL &lt;&lt; GNLD_FEATURES_MAX))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_get_enabled_smc_f=
eatures(smu, &amp;features_enabled);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features_to_disable =3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; features_enabled &amp; ~new_ppfeature_masks;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features_to_enable =3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ~features_enabled &amp; new_ppfeature_masks;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;features_to_disab=
le 0x%llx\n&quot;, features_to_disable);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;features_to_enabl=
e 0x%llx\n&quot;, features_to_enable);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (features_to_disable) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D vega20_enable_smc_features(smu, false, <br>
&gt; features_to_disable);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (features_to_enable) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D vega20_enable_smc_features(smu, true, <br>
&gt; features_to_enable);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; &nbsp;static bool vega20_is_dpm_running(struct smu_context *smu)<br>
&gt; &nbsp;{<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; @@ -3311,8 &#43;3160,6 @@ static const struct pptable_funcs <br>
&gt; vega20_ppt_funcs =3D {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_dpm_limit_valu=
e =3D vega20_force_dpm_limit_value,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unforce_dpm_levels =
=3D vega20_unforce_dpm_levels,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_profiling_clk_ma=
sk =3D vega20_get_profiling_clk_mask,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_ppfeature_status =3D vega20=
_set_ppfeature_status,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_ppfeature_status =3D vega20=
_get_ppfeature_status,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_dpm_running =3D v=
ega20_is_dpm_running,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_thermal_fan_tabl=
e =3D vega20_set_thermal_fan_table,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_fan_speed_percen=
t =3D vega20_get_fan_speed_percent,<br>
&gt; -- <br>
&gt; 2.22.0<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB3283A9239266F64A93F2E3DDA2C00BN8PR12MB3283namp_--

--===============0153340806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0153340806==--
