Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF621CF82
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2020 08:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E9B6E176;
	Mon, 13 Jul 2020 06:18:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBFC6E176
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2020 06:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJLxsZotKoCuMkrY92NxOkzugwkOj6NmIiiTqlBqpjnkI9nu8i+eC0KfbEx4xZ8wWYmfZPj9WUsK5o2OzcwoHIqwAwO6zT2dfIU7L8DgYxJ8djAIytK6qr1rPT5P5XcbCv4ODvkFO1dU8mE3cUsHX20JsatTqmVbfxwNbwg4d8ZHBQEqHd0YPwE35TS009BL2ajNg9HmT9PggjLO3pTkjlu6KhtXkRIL/rCDNPvDTEigVMiMQqXhN6/5GQ87/EhH5jyT7zrwYBXprJDgPAECR69KZMS4oq/7wgMYZsFlKtSHDew0JwyY3N1kfi7kgdX0+zRNsWjyVPjjTNiMn5mpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMj+vEalwBzUCPdcYDbOtSknVUnzgtO5a/r++ibMxR4=;
 b=ZX/nuqz0SSiebE4ItHRGgW3sXiK52nYSJ9yvCx6WPq9cZDSvXGqvZmfdrOUzoiTcyTDSUgTo92FIMp/ViMNCici0nu4FFT+bUI4LjQ2iYcf6H95SIjfMOQdCdxeEtm80VOCRJuJC13DoHH1eqo6miYaL1pXCNb4D1dgI/4xVeHFCJMV1wISMjZt0I9WTDO8CXXJqs2aRtmAIdJwgTAxxxFRPLZNLFXmz9F82jd7HPGwIt1/LuFJzJvEpViTLMy8/IpeSczOnp8YiOHP7rwEF5KoPM2okDrYh2FbjwEDEPv57TjRs3G4RaHY4MTOcw3Epmwrl5C3v6zj89Rz7ge1cyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMj+vEalwBzUCPdcYDbOtSknVUnzgtO5a/r++ibMxR4=;
 b=ozvdaKhh/gW+r1GANrOSB8G/wawKv8sNQe44DkHUl2hMRTn2JIMbns80760kXTGqSA0YEwqlOrAL8IDTEkZKFmDq0NMGS+Yp5CzJ93rOIewezl+YwLKdmsK01q9u2sKFxkG1/Fkr1MDLQqhhdKeFAyXExgoaujcCYblj05MYv+c=
Received: from CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 by CH2PR12MB4024.namprd12.prod.outlook.com (2603:10b6:610:2a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Mon, 13 Jul
 2020 06:18:52 +0000
Received: from CH2PR12MB4101.namprd12.prod.outlook.com
 ([fe80::b9c2:5b76:382a:c5d]) by CH2PR12MB4101.namprd12.prod.outlook.com
 ([fe80::b9c2:5b76:382a:c5d%8]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 06:18:52 +0000
From: "Sheng, Wenhui" <Wenhui.Sheng@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/amdgpu: enable mode1 reset
Thread-Topic: [PATCH 2/3] drm/amdgpu: enable mode1 reset
Thread-Index: AQHWVsTIptFqK5V1qUS/L+nedG82pqkFAOQAgAABjACAAAm7YA==
Date: Mon, 13 Jul 2020 06:18:52 +0000
Message-ID: <CH2PR12MB410134E1C3A37569B7A9A09C8C600@CH2PR12MB4101.namprd12.prod.outlook.com>
References: <20200710141644.1601-1-Wenhui.Sheng@amd.com>
 <20200710141644.1601-2-Wenhui.Sheng@amd.com>
 <DM6PR12MB4075C3BFA9392B51C2370243FC600@DM6PR12MB4075.namprd12.prod.outlook.com>
 <DM6PR12MB4075D7702154ED79FDBAEA60FC600@DM6PR12MB4075.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4075D7702154ED79FDBAEA60FC600@DM6PR12MB4075.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-07-13T05:33:34Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=2a2b8b8b-d092-457a-83e4-0000ad3f0125;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-07-13T06:18:49Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 84d15b4f-13fa-48e4-b3fe-0000902e1f9c
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 54f619b0-72b5-4392-2308-08d826f49d3e
x-ms-traffictypediagnostic: CH2PR12MB4024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4024664AEC7157D448259F7D8C600@CH2PR12MB4024.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vxbtv8QJFJgygTU+WkrOnh7KrO1evJ0O5gXFRzZGjroCfSQXQRj89MnfUfNpCQ4w6rRy/grp1/MrRYFxeeDpPJ4ImrHcMaqRJdLQKGTX0IaKUtK7Q4WA7/GwWGvnmTaMgWK0QHxQmfTkCWwsHVUurj+DmwaIuBMkuPPfZ//y+YVIiUyGpQfRltou+f2WFOrECa7atBF81rXIJMxQoSLG3coIzm7J0/kQRYTroMbGWEn59iXkKea5m/mM7jYwWBZHsSC9YXxrDZDYPswNExKzZY3UkscNBWJDXwj706AIWC7sre2X/gyBvZUbBJz0y4IGXwbzK5GzZa+NMA2VDIxuP0olh0Na6+ACM/HPRHJ2EPk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(66446008)(76116006)(64756008)(9686003)(86362001)(55016002)(8936002)(66946007)(52536014)(83380400001)(4326008)(110136005)(316002)(2906002)(5660300002)(33656002)(8676002)(966005)(66556008)(66476007)(7696005)(26005)(71200400001)(6506007)(45080400002)(478600001)(186003)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: YRGr7mzjGFxB+MiS+xPXZatFmuG7/WZtLDB4NrjgNIlzW7CLVNuJNw8HdRKGOcCnCCT6UlKjtvDaydJfKDInxXeyvJk4/+aRBsiSmEvL/99EYm3C4AHSB7D/3DXTNyQl4ckEkZqnGdrjUHQHrzTH1ntBvaueIyNfmEOiivztjUvhjMwpQoXRlW0A/wbTsByLBTH8wExHLDh/Px4vDklwhYGlFyWMtrgTdIu3TfZ3kC+SfO7bSBOTuEiN1eQgCgtvjubfM34nCoMvOr3MuoJFqWAa5zA1zp0XRSE4/dKWpBuzXBEo2/24QLwz+hAyeIhNCo6nmPD1g+N1xx00bUFm9gDqM27OY3cmbVwTisuM+43N9sbFvpibdCSHD9Sru/0lLbeKBloiPlVP549ZHWC51kII9qIx+VsCJEdCS0gznSYsAeLKJJSFeLHLmQEKXpv7K32IWGFbVLc9Jc5TRl4r5AKu87IH+hNX7VAX9imy8/dM8zJZ4166Bl5lG8OOl3u9
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f619b0-72b5-4392-2308-08d826f49d3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 06:18:52.3621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uM29DrgAnEUosrBB7hwXkXolz5+Z/pd/oWBju2BiLDPOD+2MKuW04Us45hno/71LIhDCeRDN0aTm8a5kcSDcEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4024
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
Cc: "Gao, Likun" <Likun.Gao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Public Use]

HI Hawking

I have merged in_ras_intr & use_baco to  the function amdgpu_ras_need_emergency_restart, If I also move the check of reboot logic code to the new added function, variable need_emergency_restart Couldn't be used for the following if check in function amdgpu_device_gpu_recover.

Brs
Wenhui

-----Original Message-----
From: Zhang, Hawking <Hawking.Zhang@amd.com> 
Sent: Monday, July 13, 2020 1:40 PM
To: Zhang, Hawking <Hawking.Zhang@amd.com>; Sheng, Wenhui <Wenhui.Sheng@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Gao, Likun <Likun.Gao@amd.com>
Subject: RE: [PATCH 2/3] drm/amdgpu: enable mode1 reset

[AMD Public Use]

So first make a patch to refine need_emergency_resetart logic in amdgpu_device_gpu_recover function. Then apply you next series to add new mode1 reset support

Regards,
Hawking

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Zhang, Hawking
Sent: Monday, July 13, 2020 13:34
To: Sheng, Wenhui <Wenhui.Sheng@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Gao, Likun <Likun.Gao@amd.com>
Subject: RE: [PATCH 2/3] drm/amdgpu: enable mode1 reset

[AMD Public Use]

V2 looks good to me expect for the following that can be improved

+	if (need_emergency_restart && amdgpu_ras_get_context(adev)->reboot) {

The check of reboot could be centralized to the new function amdgpu_ras_need_emergency_restart you added in amdgpu_ras.c. And it would be better you can make amdgpu_ras_need_emergency_restart related as a separated patch so that it helps to isolate ras recovery related issue from general gpu reset issue. 

Regards,
Hawking
-----Original Message-----
From: Sheng, Wenhui <Wenhui.Sheng@amd.com> 
Sent: Friday, July 10, 2020 22:17
To: amd-gfx@lists.freedesktop.org
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Sheng, Wenhui <Wenhui.Sheng@amd.com>; Gao, Likun <Likun.Gao@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: enable mode1 reset

For sienna cichlid, add mode1 reset path for sGPU.
And fix some corner cases about mode1 mode reuse.

v2: hiding MP0/MP1 mode1 reset under AMD_RESET_METHOD_MODE1

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Wenhui Sheng <Wenhui.Sheng@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 +++++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/nv.c            | 19 +++++++++++-------
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c |  2 +-
 5 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index fec6cf3f0c8a..6ce6e6bb8b50 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4274,18 +4274,19 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	struct amdgpu_hive_info *hive = NULL;
 	struct amdgpu_device *tmp_adev = NULL;
 	int i, r = 0;
-	bool in_ras_intr = amdgpu_ras_intr_triggered();
-	bool use_baco =
-		(amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) ?
-		true : false;
+	bool need_emergency_restart = false;
 	bool audio_suspended = false;
 
+	/**
+	 * Special case: RAS triggered and full reset isn't supported
+	 */
+	need_emergency_restart = amdgpu_ras_need_emergency_restart(adev);
+
 	/*
 	 * Flush RAM to disk so that after reboot
 	 * the user can read log and see why the system rebooted.
 	 */
-	if (in_ras_intr && !use_baco && amdgpu_ras_get_context(adev)->reboot) {
-
+	if (need_emergency_restart && amdgpu_ras_get_context(adev)->reboot) {
 		DRM_WARN("Emergency reboot.");
 
 		ksys_sync_helper();
@@ -4293,7 +4294,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	}
 
 	dev_info(adev->dev, "GPU %s begin!\n",
-		(in_ras_intr && !use_baco) ? "jobs stop":"reset");
+		need_emergency_restart ? "jobs stop":"reset");
 
 	/*
 	 * Here we trylock to avoid chain of resets executing from @@ -4365,7 +4366,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		amdgpu_fbdev_set_suspend(tmp_adev, 1);
 
 		/* disable ras on ALL IPs */
-		if (!(in_ras_intr && !use_baco) &&
+		if (!need_emergency_restart &&
 		      amdgpu_device_ip_need_full_reset(tmp_adev))
 			amdgpu_ras_suspend(tmp_adev);
 
@@ -4377,12 +4378,12 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
 
-			if (in_ras_intr && !use_baco)
+			if (need_emergency_restart)
 				amdgpu_job_stop_all_jobs_on_sched(&ring->sched);
 		}
 	}
 
-	if (in_ras_intr && !use_baco)
+	if (need_emergency_restart)
 		goto skip_sched_resume;
 
 	/*
@@ -4459,7 +4460,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 skip_sched_resume:
 	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
 		/*unlock kfd: SRIOV would do it separately */
-		if (!(in_ras_intr && !use_baco) && !amdgpu_sriov_vf(tmp_adev))
+		if (!need_emergency_restart && !amdgpu_sriov_vf(tmp_adev))
 	                amdgpu_amdkfd_post_reset(tmp_adev);
 		if (audio_suspended)
 			amdgpu_device_resume_display_audio(tmp_adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 3a3fa8567c94..6f06e1214622 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2135,3 +2135,14 @@ void amdgpu_ras_global_ras_isr(struct amdgpu_device *adev)
 		amdgpu_ras_reset_gpu(adev);
 	}
 }
+
+bool amdgpu_ras_need_emergency_restart(struct amdgpu_device *adev) {
+	if (adev->asic_type == CHIP_VEGA20 &&
+	    adev->pm.fw_version <= 0x283400) {
+		return !(amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) &&
+				amdgpu_ras_intr_triggered();
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index e7df5d8429f8..b2667342cf67 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -633,4 +633,5 @@ void amdgpu_ras_global_ras_isr(struct amdgpu_device *adev);
 
 void amdgpu_ras_set_error_query_ready(struct amdgpu_device *adev, bool ready);
 
+bool amdgpu_ras_need_emergency_restart(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c index 356849136d1d..9f1240bd0310 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -265,17 +265,21 @@ static int nv_asic_mode1_reset(struct amdgpu_device *adev)
 
 	amdgpu_atombios_scratch_regs_engine_hung(adev, true);
 
-	dev_info(adev->dev, "GPU mode1 reset\n");
-
 	/* disable BM */
 	pci_clear_master(adev->pdev);
 
 	pci_save_state(adev->pdev);
 
-	ret = psp_gpu_reset(adev);
+	if (amdgpu_dpm_is_mode1_reset_supported(adev)) {
+		dev_info(adev->dev, "GPU smu mode1 reset\n");
+		ret = amdgpu_dpm_mode1_reset(adev);
+	} else {
+		dev_info(adev->dev, "GPU psp mode1 reset\n");
+		ret = psp_gpu_reset(adev);
+	}
+
 	if (ret)
 		dev_err(adev->dev, "GPU mode1 reset failed\n");
-
 	pci_restore_state(adev->pdev);
 
 	/* wait for asic to come out of reset */ @@ -307,7 +311,7 @@ nv_asic_reset_method(struct amdgpu_device *adev)  {
 	struct smu_context *smu = &adev->smu;
 
-	if (!amdgpu_sriov_vf(adev) && smu_baco_is_support(smu))
+	if (smu_baco_is_support(smu))
 		return AMD_RESET_METHOD_BACO;
 	else
 		return AMD_RESET_METHOD_MODE1;
@@ -319,15 +323,16 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 	struct smu_context *smu = &adev->smu;
 
 	if (nv_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
+		dev_info(adev->dev, "GPU BACO reset\n");
+
 		ret = smu_baco_enter(smu);
 		if (ret)
 			return ret;
 		ret = smu_baco_exit(smu);
 		if (ret)
 			return ret;
-	} else {
+	} else
 		ret = nv_asic_mode1_reset(adev);
-	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 4f7d064e16e4..014815bcae93 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -2039,7 +2039,7 @@ static bool navi10_is_baco_supported(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	uint32_t val;
 
-	if (!smu_v11_0_baco_is_support(smu))
+	if (amdgpu_sriov_vf(adev) || (!smu_v11_0_baco_is_support(smu)))
 		return false;
 
 	val = RREG32_SOC15(NBIO, 0, mmRCC_BIF_STRAP0);
--
2.17.1
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Chawking.zhang%40amd.com%7Cba02ce03c500432b668108d826ee5cd6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637302152493471927&amp;sdata=1Kn2Q6DqkrGj2hgmT6jBHibeDPCmc%2BytqGz3Bma0fv0%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
