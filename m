Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12054048F0
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Sep 2021 13:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEE46E4B0;
	Thu,  9 Sep 2021 11:09:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF646E4B0
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 11:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3c4wUZ/gltWqApzHZqoLCCxP1UEV14BhmrOQqCd76L7zeGBcWSkgdZBOrQyD5uJpOpO8Tt3K90VGKow1IFHK7E1kXXVC+sP2Ui+6oPJXv2YyvH4V+c93tFyOM1GCbCmA00SbZA/r5DoeVh26jh9UstnLHKdwb9WreXNpBEQ3x0mH/P1XZK2A0yrmAuJUu/XR9bfvWNpdObAfQfYDG+L2rTrhruA6/2JAAWGhHXoC2/cvMk7QoY/t3Dno2Vwv9t8pWsaeHijw5/RIfCzmTNa/4vVWy/OFeNyO8TPmFnV0ugD2Bk3+yEchJSGdYZmBGrknJJOIZXwrUfk3UafKMbkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Ep5uvd6oMKxcJG4bNhy6jJSjmiAgvrCt8YvDp9/xVOE=;
 b=EexQ8Fpk3LScaOwcIEaan6x9HT0dwRIMIFPddRuPJonvfrtUHjiGZX2K6FA2xr8IQicpvJuWym8PMBGdbcYJEU6PpcoPHDxo6l2Ju9PP5ZRR5jBYlFtQXUdxHtOi1aX1aK0iMAlI5/RzDU+9HWapmJD8Q+nSjGB+Aw41N/2U8E88awKjmCisiiohItXPejApDbShscsYaQySgftNGbP5m4vYN68q3Ee19mcUX3ET933UQcsDYg44cfsuat688Cc7OcBkF/ozquQsWuADZtsu97RsakGoKFY8lX0UTBajZ68w9OI8ykYhZQuouQYtifHDJeLlinmxCfYhollLV66Q8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep5uvd6oMKxcJG4bNhy6jJSjmiAgvrCt8YvDp9/xVOE=;
 b=rtHGtkxBauZPH3sKsgXk0aays97WRLUEXXm/v+Q3X5uaoWnJVqbMZJDQMj6feozH6/Vr+krCzy6UuWJSwOxNgM+JWkK9+ilrJXIOGvYamVg1NT0k5wo272HuGHY2jCMtjmN6pwHCR92lCwyFI5NNcOyEyNDmn00D6HoaRGPRTEs=
Received: from MWHPR08CA0038.namprd08.prod.outlook.com (2603:10b6:300:c0::12)
 by DM6PR12MB2953.namprd12.prod.outlook.com (2603:10b6:5:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 11:09:22 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::e7) by MWHPR08CA0038.outlook.office365.com
 (2603:10b6:300:c0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Thu, 9 Sep 2021 11:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 11:09:21 +0000
Received: from hr-amd (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 9 Sep 2021
 06:09:19 -0500
Date: Thu, 9 Sep 2021 19:08:24 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Yu, Lang" <Lang.Yu@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix sysfs_emit/sysfs_emit_at warnings(v2)
Message-ID: <20210909110824.GF3702717@hr-amd>
References: <20210909080005.297716-1-lang.yu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210909080005.297716-1-lang.yu@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8516fa4a-dca2-453b-fae3-08d9738246c5
X-MS-TrafficTypeDiagnostic: DM6PR12MB2953:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2953483C107F53061DC9A1CEECD59@DM6PR12MB2953.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gn2EA3+cDz72HL4EdPjQweYY62+QNp44CcLTSX9Ur6n0Uy0AZQ34Y7Zyqtni38fBKB0MwSQJ9wQs1KmN9d+EO7T7svmAoIW3UQdpesAaXYwo6ALZjdQot+L0Umq2WoOiKgC4BBGVyxHoWqT3W9IMAqsYX0WkPN0jU+r0i5+WGthL97TIDbC4Qb0IPvu6CL1deNKDRGFpzQKjjlGSvbE469FegWVxzKDJA7dS2fHMI6ECVpgV4bL5Gi85YUJbjWcaCew9gdSQ3JB1fmuiuqTA/qPt8YaVAtuw10ksuPlSXWDpMB/enaPTpWMiQPSOU9aW4T8qYbHMLB4qYC4DW/qSIoF44EkohQJRlKR2FWSpwXeiRIdxdxfl/WtEf29zoJtkUXKD7nRS31PXyJ2+5oqeaAItqxve+e3yHezzV0A5xlSbswZOz8vOfiRwKKV2SaWlFu++tb2tgiA9TGCvtWtnvs2APzEVi0EmBjfuZwSOpcnPXUFeZMxP1CoGOPtO/P+NX8iJkv+ONvx0wnsXs+d+rIncl8Kwf/A7ESLQPhBF7zPqFkn3AQKhEzvDNRZ2ad7HfsJAVN9IXYCVbcvjjqMfOzjuFlm3imG2qwvNdh3tWuksbkEoduKMWnogjG1EnQdhCM+dTVDtjGu5rIS9Y70opn/fBx7cxk7cwxSMq+VwIBNx1ZbDiafphI8x2DSslz9rjd3jK64p8YpsHIXQxhLNDcpx/xy1zscQLk4Rpitrgao=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(46966006)(478600001)(26005)(2906002)(30864003)(33716001)(82310400003)(33656002)(4326008)(47076005)(316002)(70206006)(6666004)(16526019)(186003)(55016002)(8676002)(6862004)(86362001)(426003)(36860700001)(5660300002)(6636002)(83380400001)(54906003)(81166007)(8936002)(82740400003)(336012)(70586007)(356005)(9686003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 11:09:21.8419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8516fa4a-dca2-453b-fae3-08d9738246c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2953
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Sep 09, 2021 at 04:00:05PM +0800, Yu, Lang wrote:
> sysfs_emit and sysfs_emit_at requrie a page boundary
> aligned buf address. Make them happy!
> 
> v2: use an inline function
> 
> Warning Log:
> [  492.545174] invalid sysfs_emit_at: buf:00000000f19bdfde at:0
> [  492.546416] WARNING: CPU: 7 PID: 1304 at fs/sysfs/file.c:765 sysfs_emit_at+0x4a/0xa0
> [  492.654805] Call Trace:
> [  492.655353]  ? smu_cmn_get_metrics_table+0x40/0x50 [amdgpu]
> [  492.656780]  vangogh_print_clk_levels+0x369/0x410 [amdgpu]
> [  492.658245]  vangogh_common_print_clk_levels+0x77/0x80 [amdgpu]
> [  492.659733]  ? preempt_schedule_common+0x18/0x30
> [  492.660713]  smu_print_ppclk_levels+0x65/0x90 [amdgpu]
> [  492.662107]  amdgpu_get_pp_od_clk_voltage+0x13d/0x190 [amdgpu]
> [  492.663620]  dev_attr_show+0x1d/0x40
> 
> Signed-off-by: Lang Yu <lang.yu@amd.com>

Looks OK for me. Although it's not perfect, the legacy design impact a lot
of ASICs and it's hard to change it one by one, so this solution is OK with
minimal impact at this moment.

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c    |  8 ++++++--
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c  |  4 +++-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c  |  4 +++-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 16 ++++++++++------
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c  |  2 ++
>  .../gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c   | 12 ++++++++----
>  .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c |  6 ++++--
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h           | 13 +++++++++++++
>  8 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index e343cc218990..2e5a362aa06b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -771,8 +771,12 @@ static int arcturus_print_clk_levels(struct smu_context *smu,
>  	struct smu_11_0_dpm_context *dpm_context = NULL;
>  	uint32_t gen_speed, lane_width;
>  
> -	if (amdgpu_ras_intr_triggered())
> -		return sysfs_emit(buf, "unavailable\n");
> +	smu_cmn_get_sysfs_buf(&buf, size);
> +
> +	if (amdgpu_ras_intr_triggered()) {
> +		size += sysfs_emit_at(buf, size, "unavailable\n");
> +		return size;
> +	}
>  
>  	dpm_context = smu_dpm->dpm_context;
>  
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 4c81989b8162..63e1f0db579c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -1279,6 +1279,8 @@ static int navi10_print_clk_levels(struct smu_context *smu,
>  	struct smu_11_0_overdrive_table *od_settings = smu->od_settings;
>  	uint32_t min_value, max_value;
>  
> +	smu_cmn_get_sysfs_buf(&buf, &size);
> +
>  	switch (clk_type) {
>  	case SMU_GFXCLK:
>  	case SMU_SCLK:
> @@ -1392,7 +1394,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
>  	case SMU_OD_RANGE:
>  		if (!smu->od_enabled || !od_table || !od_settings)
>  			break;
> -		size = sysfs_emit(buf, "%s:\n", "OD_RANGE");
> +		size += sysfs_emit_at(buf, size, "%s:\n", "OD_RANGE");
>  
>  		if (navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_LIMITS)) {
>  			navi10_od_setting_get_range(od_settings, SMU_11_0_ODSETTING_GFXCLKFMIN,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index 5e292c3f5050..d7519688065f 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -1058,6 +1058,8 @@ static int sienna_cichlid_print_clk_levels(struct smu_context *smu,
>  	uint32_t min_value, max_value;
>  	uint32_t smu_version;
>  
> +	smu_cmn_get_sysfs_buf(&buf, &size);
> +
>  	switch (clk_type) {
>  	case SMU_GFXCLK:
>  	case SMU_SCLK:
> @@ -1180,7 +1182,7 @@ static int sienna_cichlid_print_clk_levels(struct smu_context *smu,
>  		if (!smu->od_enabled || !od_table || !od_settings)
>  			break;
>  
> -		size = sysfs_emit(buf, "%s:\n", "OD_RANGE");
> +		size += sysfs_emit_at(buf, size, "%s:\n", "OD_RANGE");
>  
>  		if (sienna_cichlid_is_od_feature_supported(od_settings, SMU_11_0_7_ODCAP_GFXCLK_LIMITS)) {
>  			sienna_cichlid_get_od_setting_range(od_settings, SMU_11_0_7_ODSETTING_GFXCLKFMIN,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 3a3421452e57..f6ef0ce6e9e2 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -589,10 +589,12 @@ static int vangogh_print_legacy_clk_levels(struct smu_context *smu,
>  	if (ret)
>  		return ret;
>  
> +	smu_cmn_get_sysfs_buf(&buf, &size);
> +
>  	switch (clk_type) {
>  	case SMU_OD_SCLK:
>  		if (smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL) {
> -			size = sysfs_emit(buf, "%s:\n", "OD_SCLK");
> +			size += sysfs_emit_at(buf, size, "%s:\n", "OD_SCLK");
>  			size += sysfs_emit_at(buf, size, "0: %10uMhz\n",
>  			(smu->gfx_actual_hard_min_freq > 0) ? smu->gfx_actual_hard_min_freq : smu->gfx_default_hard_min_freq);
>  			size += sysfs_emit_at(buf, size, "1: %10uMhz\n",
> @@ -601,7 +603,7 @@ static int vangogh_print_legacy_clk_levels(struct smu_context *smu,
>  		break;
>  	case SMU_OD_CCLK:
>  		if (smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL) {
> -			size = sysfs_emit(buf, "CCLK_RANGE in Core%d:\n",  smu->cpu_core_id_select);
> +			size += sysfs_emit_at(buf, size, "CCLK_RANGE in Core%d:\n",  smu->cpu_core_id_select);
>  			size += sysfs_emit_at(buf, size, "0: %10uMhz\n",
>  			(smu->cpu_actual_soft_min_freq > 0) ? smu->cpu_actual_soft_min_freq : smu->cpu_default_soft_min_freq);
>  			size += sysfs_emit_at(buf, size, "1: %10uMhz\n",
> @@ -610,7 +612,7 @@ static int vangogh_print_legacy_clk_levels(struct smu_context *smu,
>  		break;
>  	case SMU_OD_RANGE:
>  		if (smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL) {
> -			size = sysfs_emit(buf, "%s:\n", "OD_RANGE");
> +			size += sysfs_emit_at(buf, size, "%s:\n", "OD_RANGE");
>  			size += sysfs_emit_at(buf, size, "SCLK: %7uMhz %10uMhz\n",
>  				smu->gfx_default_hard_min_freq, smu->gfx_default_soft_max_freq);
>  			size += sysfs_emit_at(buf, size, "CCLK: %7uMhz %10uMhz\n",
> @@ -688,10 +690,12 @@ static int vangogh_print_clk_levels(struct smu_context *smu,
>  	if (ret)
>  		return ret;
>  
> +	smu_cmn_get_sysfs_buf(&buf, &size);
> +
>  	switch (clk_type) {
>  	case SMU_OD_SCLK:
>  		if (smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL) {
> -			size = sysfs_emit(buf, "%s:\n", "OD_SCLK");
> +			size += sysfs_emit_at(buf, size, "%s:\n", "OD_SCLK");
>  			size += sysfs_emit_at(buf, size, "0: %10uMhz\n",
>  			(smu->gfx_actual_hard_min_freq > 0) ? smu->gfx_actual_hard_min_freq : smu->gfx_default_hard_min_freq);
>  			size += sysfs_emit_at(buf, size, "1: %10uMhz\n",
> @@ -700,7 +704,7 @@ static int vangogh_print_clk_levels(struct smu_context *smu,
>  		break;
>  	case SMU_OD_CCLK:
>  		if (smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL) {
> -			size = sysfs_emit(buf, "CCLK_RANGE in Core%d:\n",  smu->cpu_core_id_select);
> +			size += sysfs_emit_at(buf, size, "CCLK_RANGE in Core%d:\n",  smu->cpu_core_id_select);
>  			size += sysfs_emit_at(buf, size, "0: %10uMhz\n",
>  			(smu->cpu_actual_soft_min_freq > 0) ? smu->cpu_actual_soft_min_freq : smu->cpu_default_soft_min_freq);
>  			size += sysfs_emit_at(buf, size, "1: %10uMhz\n",
> @@ -709,7 +713,7 @@ static int vangogh_print_clk_levels(struct smu_context *smu,
>  		break;
>  	case SMU_OD_RANGE:
>  		if (smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL) {
> -			size = sysfs_emit(buf, "%s:\n", "OD_RANGE");
> +			size += sysfs_emit_at(buf, size, "%s:\n", "OD_RANGE");
>  			size += sysfs_emit_at(buf, size, "SCLK: %7uMhz %10uMhz\n",
>  				smu->gfx_default_hard_min_freq, smu->gfx_default_soft_max_freq);
>  			size += sysfs_emit_at(buf, size, "CCLK: %7uMhz %10uMhz\n",
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> index 5aa175e12a78..145f13b8c977 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> @@ -497,6 +497,8 @@ static int renoir_print_clk_levels(struct smu_context *smu,
>  	if (ret)
>  		return ret;
>  
> +	smu_cmn_get_sysfs_buf(&buf, &size);
> +
>  	switch (clk_type) {
>  	case SMU_OD_RANGE:
>  		if (smu_dpm_ctx->dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL) {
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index ab652028e003..5019903db492 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -733,15 +733,19 @@ static int aldebaran_print_clk_levels(struct smu_context *smu,
>  	uint32_t freq_values[3] = {0};
>  	uint32_t min_clk, max_clk;
>  
> -	if (amdgpu_ras_intr_triggered())
> -		return sysfs_emit(buf, "unavailable\n");
> +	smu_cmn_get_sysfs_buf(&buf, &size);
> +
> +	if (amdgpu_ras_intr_triggered()) {
> +		size += sysfs_emit_at(buf, size, "unavailable\n");
> +		return size;
> +	}
>  
>  	dpm_context = smu_dpm->dpm_context;
>  
>  	switch (type) {
>  
>  	case SMU_OD_SCLK:
> -		size = sysfs_emit(buf, "%s:\n", "GFXCLK");
> +		size += sysfs_emit_at(buf, size, "%s:\n", "GFXCLK");
>  		fallthrough;
>  	case SMU_SCLK:
>  		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_GFXCLK, &now);
> @@ -795,7 +799,7 @@ static int aldebaran_print_clk_levels(struct smu_context *smu,
>  		break;
>  
>  	case SMU_OD_MCLK:
> -		size = sysfs_emit(buf, "%s:\n", "MCLK");
> +		size += sysfs_emit_at(buf, size, "%s:\n", "MCLK");
>  		fallthrough;
>  	case SMU_MCLK:
>  		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_UCLK, &now);
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
> index 627ba2eec7fd..a403657151ba 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
> @@ -1052,16 +1052,18 @@ static int yellow_carp_print_clk_levels(struct smu_context *smu,
>  	int i, size = 0, ret = 0;
>  	uint32_t cur_value = 0, value = 0, count = 0;
>  
> +	smu_cmn_get_sysfs_buf(&buf, &size);
> +
>  	switch (clk_type) {
>  	case SMU_OD_SCLK:
> -		size = sysfs_emit(buf, "%s:\n", "OD_SCLK");
> +		size += sysfs_emit_at(buf, size, "%s:\n", "OD_SCLK");
>  		size += sysfs_emit_at(buf, size, "0: %10uMhz\n",
>  		(smu->gfx_actual_hard_min_freq > 0) ? smu->gfx_actual_hard_min_freq : smu->gfx_default_hard_min_freq);
>  		size += sysfs_emit_at(buf, size, "1: %10uMhz\n",
>  		(smu->gfx_actual_soft_max_freq > 0) ? smu->gfx_actual_soft_max_freq : smu->gfx_default_soft_max_freq);
>  		break;
>  	case SMU_OD_RANGE:
> -		size = sysfs_emit(buf, "%s:\n", "OD_RANGE");
> +		size += sysfs_emit_at(buf, size, "%s:\n", "OD_RANGE");
>  		size += sysfs_emit_at(buf, size, "SCLK: %7uMhz %10uMhz\n",
>  						smu->gfx_default_hard_min_freq, smu->gfx_default_soft_max_freq);
>  		break;
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
> index 16993daa2ae0..4054d9493e77 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
> @@ -110,5 +110,18 @@ void smu_cmn_init_soft_gpu_metrics(void *table, uint8_t frev, uint8_t crev);
>  int smu_cmn_set_mp1_state(struct smu_context *smu,
>  			  enum pp_mp1_state mp1_state);
>  
> +/*
> + * Helper function to make sysfs_emit_at() happy. Align buf to
> + * the current page boundary and record the offset.
> + */
> +static inline void smu_cmn_get_sysfs_buf(char **buf, int *offset)
> +{
> +	if (!*buf || !offset)
> +		return;
> +
> +	*offset = offset_in_page(*buf);
> +	*buf -= *offset;
> +}
> +
>  #endif
>  #endif
> -- 
> 2.25.1
> 
