Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3603D847C
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Jul 2021 02:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BD76E2D5;
	Wed, 28 Jul 2021 00:11:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043646E321;
 Wed, 28 Jul 2021 00:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iULFZOGIATtd27oOlMDtwPPU3U6boJLZSjbJpJaWwIZC7W8hp+TPA7dz34QtES9+bfW10GWN1edNc+WyhaA20/YuEMkjxCouE8/s38+sVN6GGsqP5l2tCaQIyZSxjmZ1/tD+9y+CJolEaHwiNMPIAzo/uKkPsylV5AwFLK8cv9aF8yBRt2yLDNAneOl1vVBtZFnhRArqnWgA0WO1PznyQa7YbhIYbNI3dwvMpiDOVvENzTO9z1jBMldsVWu7UwSq/6QVBxZdIKkJKELpVStBjNug/f4QZ++2ZmbfjduxxFqfW35KhC/U98zXP5gn9m/E9EtU5cM/KXg6HhNJIEux6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4W1/y9phc5P6vcuf4rLGPoso5HpFWy2KRM/9s2n8GZQ=;
 b=iJ6gLDyMDGIBEuQ2IRy82qhTM/s1ZbeagbbWXBVg/t9c7sJ4u0Mtkq4waCbPKqGpumz7TKiHX/5kqfCyW8gD2G9mDz5eyNS0OaBsn4RWZPBHsxHhlTeiY5NnppgVuEEeECWt2EAwRCpGii5b6JEAbkyBUnoJo743J/G2FKMylpomxFqOGCvPnXqYoP0uEQEEU+0Z57+oaFytFrCq8paPta6EnB8bcTuvlgfz8PFO4vU7+Tmts3lc7FMRvZEE0Hi3pfTvGs+WO5q4MNMhJ6xawC5YgEvo5OekXeNuQrUj2b9vCObeWS8E2rDwswhEh4LNb33F4I4kfdaQp/QoLUhNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4W1/y9phc5P6vcuf4rLGPoso5HpFWy2KRM/9s2n8GZQ=;
 b=bJ++dGU/F93AWbSFI9xVh06V8jEAP66eBgT53y9HzvTxV3Lw5lfbG3tjKDlwVzXEkwYvtiogFm6Dvo8IAZ7Ou1fc+lhNr447MSq8Ia07Maq3hxGcde+PeGVpp7VduFWuhrUnKJp07ymaMAK2+z/nT0geyzDqCk4JYa3dakV/LDU=
Received: from DM6PR13CA0068.namprd13.prod.outlook.com (2603:10b6:5:134::45)
 by MN2PR12MB2959.namprd12.prod.outlook.com (2603:10b6:208:ae::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 00:11:39 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::6f) by DM6PR13CA0068.outlook.office365.com
 (2603:10b6:5:134::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Wed, 28 Jul 2021 00:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 00:11:39 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 27 Jul
 2021 19:11:38 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v4)
Date: Tue, 27 Jul 2021 17:11:17 -0700
Message-ID: <20210728001119.12807-2-Ryan.Taylor@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728001119.12807-1-Ryan.Taylor@amd.com>
References: <20210728001119.12807-1-Ryan.Taylor@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ed7b9c4-0ef5-4a09-7394-08d9515c456b
X-MS-TrafficTypeDiagnostic: MN2PR12MB2959:
X-Microsoft-Antispam-PRVS: <MN2PR12MB2959127437CA82679F2B5070EAEA9@MN2PR12MB2959.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XENkgakr5D6X/wiR1xpb2uN0o7FCp/TLyMqNT5sYboMwfCAILqE8u14Herzufq55RGTcdYP7L4bCcSDEfIyHOdcTophlGkbubeElN3zbirEehIuAm/RsRVbOOTFpUdrxQNHHbX69oHuXU53lkKf/HUcFIvKo1kmfC5xfeZXQjb3Trkpm5pae6WW8tSvjZ1LNyEEFKQH4jTHBI3omeYHuLJ4mGM0HYm/owyjIeb6R4azK8Nii8Jj4bjyCNcJhBuyy7dppwrMQLEchkiuWMftoMXPW3qG297d3HKKrFiZ1kQu/fdj+L/R3hC+0xclSvr+VcAa2WKPT+2cy3/zN9RE/urXGQ4ZYBN4n3dN6VRHIfMyY0zMddvhEiGu0rusnb7OH9+0wUcJzyz2eEm2sZg6/e9dsi8UzmFBlKGXJyc/6bmvRHD6JOGoMicCWhxWi7DnXrYySTmrzExrWc64Amk7X4hJc/Udn6CtCp4+dg2WOv0daCeXBYB/mBbzQjKDdVhVXd2QeiyND7nCTjF8IBGHnmtW6rmm6Z/hE2ocifYay0QPhHh2OBHplStLkZ5v5t2rNe9ETvfeV2PqmLABd2C8wdEstLhB7yUErM/wSinEeFL/ELQnZpNvf1muVUCGvJgZWfuUVV9x0EbxMJxxtA0DWPXUwI7Dx8dP1OcCb6PzHgljC1Az5Haawh6q41+iUzTRpVdc+izFkLh3InVAa51ccpB8Eg/nWKYlVR3jrSXBSxng=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(316002)(36756003)(7696005)(83380400001)(8676002)(4326008)(1076003)(478600001)(186003)(16526019)(110136005)(426003)(86362001)(2616005)(2906002)(82740400003)(47076005)(336012)(30864003)(70206006)(81166007)(26005)(54906003)(70586007)(8936002)(36860700001)(6666004)(356005)(5660300002)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 00:11:39.2117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed7b9c4-0ef5-4a09-7394-08d9515c456b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2959
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
Cc: kernel test
 robot <lkp@intel.com>, daniel.vetter@ffwll.ch, rodrigo.siqueira@amd.com,
 Ryan Taylor <Ryan.Taylor@amd.com>, melissa.srw@gmail.com,
 Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Modify the VKMS driver into an api that dce_virtual can use to create
virtual displays that obey drm's atomic modesetting api.

v2: Made local functions static.

v3: Switched vkms_output kzalloc for kcalloc.
    Cleanup patches by moving display mode fixes to this patch.

v4: Update atomic_check and atomic_update to comply with new kms api.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Alex Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 446 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |  29 ++
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c |  23 +-
 7 files changed, 493 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index f089794bbdd5..30cbcd5ce1cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -120,6 +120,7 @@ amdgpu-y += \
 amdgpu-y += \
 	dce_v10_0.o \
 	dce_v11_0.o \
+	amdgpu_vkms.o \
 	dce_virtual.o
 
 # add GFX block
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d10baa3338bc..96e895d6be35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -916,6 +916,7 @@ struct amdgpu_device {
 
 	/* display */
 	bool				enable_virtual_display;
+	struct amdgpu_vkms_output       *amdgpu_vkms_output;
 	struct amdgpu_mode_info		mode_info;
 	/* For pre-DCE11. DCE11 and later are in "struct amdgpu_device->dm" */
 	struct work_struct		hotplug_work;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bbc6bfadafd6..06e2a461f610 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1230,7 +1230,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	int ret, retry = 0;
 	bool supports_atomic = false;
 
-	if (!amdgpu_virtual_display &&
+	if (amdgpu_virtual_display ||
 	    amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
 		supports_atomic = true;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 09b048647523..5a143ca02cf9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 	}
 
 	/* disable all the possible outputs/crtcs before entering KMS mode */
-	if (!amdgpu_device_has_dc_support(adev))
+	if (!amdgpu_device_has_dc_support(adev) && !amdgpu_virtual_display)
 		drm_helper_disable_unused_functions(adev_to_drm(adev));
 
 	drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
new file mode 100644
index 000000000000..e2810b22bb43
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "amdgpu.h"
+#include "amdgpu_vkms.h"
+#include "amdgpu_display.h"
+
+/**
+ * DOC: amdgpu_vkms
+ *
+ * The amdgpu vkms interface provides a virtual KMS interface for several use
+ * cases: devices without display hardware, platforms where the actual display
+ * hardware is not useful (e.g., servers), SR-IOV virtual functions, device
+ * emulation/simulation, and device bring up prior to display hardware being
+ * usable. We previously emulated a legacy KMS interface, but there was a desire
+ * to move to the atomic KMS interface. The vkms driver did everything we
+ * needed, but we wanted KMS support natively in the driver without buffer
+ * sharing and the ability to support an instance of VKMS per device. We first
+ * looked at splitting vkms into a stub driver and a helper module that other
+ * drivers could use to implement a virtual display, but this strategy ended up
+ * being messy due to driver specific callbacks needed for buffer management.
+ * Ultimately, it proved easier to import the vkms code as it mostly used core
+ * drm helpers anyway.
+ */
+
+static const u32 amdgpu_vkms_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct hrtimer *timer)
+{
+	struct amdgpu_vkms_output *output = container_of(timer,
+							 struct amdgpu_vkms_output,
+							 vblank_hrtimer);
+	struct drm_crtc *crtc = &output->crtc;
+	u64 ret_overrun;
+	bool ret;
+
+	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
+					  output->period_ns);
+	WARN_ON(ret_overrun != 1);
+
+	ret = drm_crtc_handle_vblank(crtc);
+	if (!ret)
+		DRM_ERROR("amdgpu_vkms failure on handling vblank");
+
+	return HRTIMER_RESTART;
+}
+
+static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
+
+	drm_calc_timestamping_constants(crtc, &crtc->mode);
+
+	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	out->vblank_hrtimer.function = &amdgpu_vkms_vblank_simulate;
+	out->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+
+	return 0;
+}
+
+static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
+
+	hrtimer_cancel(&out->vblank_hrtimer);
+}
+
+static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
+					     int *max_error,
+					     ktime_t *vblank_time,
+					     bool in_vblank_irq)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+	struct amdgpu_vkms_output *output = drm_crtc_to_amdgpu_vkms_output(crtc);
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return true;
+	}
+
+	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+
+	if (WARN_ON(*vblank_time == vblank->time))
+		return true;
+
+	/*
+	 * To prevent races we roll the hrtimer forward before we do any
+	 * interrupt processing - this is how real hw works (the interrupt is
+	 * only generated after all the vblank registers are updated) and what
+	 * the vblank core expects. Therefore we need to always correct the
+	 * timestampe by one frame.
+	 */
+	*vblank_time -= output->period_ns;
+
+	return true;
+}
+
+static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs = {
+	.set_config             = drm_atomic_helper_set_config,
+	.destroy                = drm_crtc_cleanup,
+	.page_flip              = drm_atomic_helper_page_flip,
+	.reset                  = drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= amdgpu_vkms_enable_vblank,
+	.disable_vblank		= amdgpu_vkms_disable_vblank,
+	.get_vblank_timestamp	= amdgpu_vkms_get_vblank_timestamp,
+};
+
+static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_on(crtc);
+}
+
+static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_off(crtc);
+}
+
+static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	if (crtc->state->event) {
+		spin_lock(&crtc->dev->event_lock);
+
+		if (drm_crtc_vblank_get(crtc) != 0)
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		else
+			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
+
+		spin_unlock(&crtc->dev->event_lock);
+
+		crtc->state->event = NULL;
+	}
+}
+
+static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_helper_funcs = {
+	.atomic_flush	= amdgpu_vkms_crtc_atomic_flush,
+	.atomic_enable	= amdgpu_vkms_crtc_atomic_enable,
+	.atomic_disable	= amdgpu_vkms_crtc_atomic_disable,
+};
+
+static int amdgpu_vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
+			  struct drm_plane *primary, struct drm_plane *cursor)
+{
+	int ret;
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
+					&amdgpu_vkms_crtc_funcs, NULL);
+	if (ret) {
+		DRM_ERROR("Failed to init CRTC\n");
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &amdgpu_vkms_crtc_helper_funcs);
+
+	return ret;
+}
+
+static const struct drm_connector_funcs amdgpu_vkms_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int amdgpu_vkms_conn_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_display_mode *mode = NULL;
+	unsigned i;
+	static const struct mode_size {
+		int w;
+		int h;
+	} common_modes[] = {
+		{ 640,  480},
+		{ 720,  480},
+		{ 800,  600},
+		{ 848,  480},
+		{1024,  768},
+		{1152,  768},
+		{1280,  720},
+		{1280,  800},
+		{1280,  854},
+		{1280,  960},
+		{1280, 1024},
+		{1440,  900},
+		{1400, 1050},
+		{1680, 1050},
+		{1600, 1200},
+		{1920, 1080},
+		{1920, 1200},
+		{2560, 1440},
+		{4096, 3112},
+		{3656, 2664},
+		{3840, 2160},
+		{4096, 2160},
+	};
+
+	for (i = 0; i < ARRAY_SIZE(common_modes); i++) {
+		mode = drm_cvt_mode(dev, common_modes[i].w, common_modes[i].h, 60, false, false, false);
+		drm_mode_probed_add(connector, mode);
+	}
+
+	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+
+	return ARRAY_SIZE(common_modes);
+}
+
+static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper_funcs = {
+	.get_modes    = amdgpu_vkms_conn_get_modes,
+};
+
+static const struct drm_plane_funcs amdgpu_vkms_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static void amdgpu_vkms_plane_atomic_update(struct drm_plane *plane,
+					    struct drm_atomic_state *old_state)
+{
+	return;
+}
+
+static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plane,
+					  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
+		return 0;
+
+	crtc_state = drm_atomic_get_crtc_state(state,
+					       new_plane_state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  false, true);
+	if (ret != 0)
+		return ret;
+
+	/* for now primary plane must be visible and full screen */
+	if (!new_plane_state->visible)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
+				  struct drm_plane_state *new_state)
+{
+	struct amdgpu_framebuffer *afb;
+	struct drm_gem_object *obj;
+	struct amdgpu_device *adev;
+	struct amdgpu_bo *rbo;
+	struct list_head list;
+	struct ttm_validate_buffer tv;
+	struct ww_acquire_ctx ticket;
+	uint32_t domain;
+	int r;
+
+	if (!new_state->fb) {
+		DRM_DEBUG_KMS("No FB bound\n");
+		return 0;
+	}
+	afb = to_amdgpu_framebuffer(new_state->fb);
+	obj = new_state->fb->obj[0];
+	rbo = gem_to_amdgpu_bo(obj);
+	adev = amdgpu_ttm_adev(rbo->tbo.bdev);
+	INIT_LIST_HEAD(&list);
+
+	tv.bo = &rbo->tbo;
+	tv.num_shared = 1;
+	list_add(&tv.head, &list);
+
+	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
+	if (r) {
+		dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
+		return r;
+	}
+
+	if (plane->type != DRM_PLANE_TYPE_CURSOR)
+		domain = amdgpu_display_supported_domains(adev, rbo->flags);
+	else
+		domain = AMDGPU_GEM_DOMAIN_VRAM;
+
+	r = amdgpu_bo_pin(rbo, domain);
+	if (unlikely(r != 0)) {
+		if (r != -ERESTARTSYS)
+			DRM_ERROR("Failed to pin framebuffer with error %d\n", r);
+		ttm_eu_backoff_reservation(&ticket, &list);
+		return r;
+	}
+
+	r = amdgpu_ttm_alloc_gart(&rbo->tbo);
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unpin(rbo);
+		ttm_eu_backoff_reservation(&ticket, &list);
+		DRM_ERROR("%p bind failed\n", rbo);
+		return r;
+	}
+
+	ttm_eu_backoff_reservation(&ticket, &list);
+
+	afb->address = amdgpu_bo_gpu_offset(rbo);
+
+	amdgpu_bo_ref(rbo);
+
+	return 0;
+}
+
+static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,
+				   struct drm_plane_state *old_state)
+{
+	struct amdgpu_bo *rbo;
+	int r;
+
+	if (!old_state->fb)
+		return;
+
+	rbo = gem_to_amdgpu_bo(old_state->fb->obj[0]);
+	r = amdgpu_bo_reserve(rbo, false);
+	if (unlikely(r)) {
+		DRM_ERROR("failed to reserve rbo before unpin\n");
+		return;
+	}
+
+	amdgpu_bo_unpin(rbo);
+	amdgpu_bo_unreserve(rbo);
+	amdgpu_bo_unref(&rbo);
+}
+
+static const struct drm_plane_helper_funcs amdgpu_vkms_primary_helper_funcs = {
+	.atomic_update		= amdgpu_vkms_plane_atomic_update,
+	.atomic_check		= amdgpu_vkms_plane_atomic_check,
+	.prepare_fb		= amdgpu_vkms_prepare_fb,
+	.cleanup_fb		= amdgpu_vkms_cleanup_fb,
+};
+
+static struct drm_plane *amdgpu_vkms_plane_init(struct drm_device *dev,
+						enum drm_plane_type type,
+						int index)
+{
+	struct drm_plane *plane;
+	int ret;
+
+	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_universal_plane_init(dev, plane, 1 << index,
+				       &amdgpu_vkms_plane_funcs,
+				       amdgpu_vkms_formats,
+				       ARRAY_SIZE(amdgpu_vkms_formats),
+				       NULL, type, NULL);
+	if (ret) {
+		kfree(plane);
+		return ERR_PTR(ret);
+	}
+
+	drm_plane_helper_add(plane, &amdgpu_vkms_primary_helper_funcs);
+
+	return plane;
+}
+
+int amdgpu_vkms_output_init(struct drm_device *dev,
+			    struct amdgpu_vkms_output *output, int index)
+{
+	struct drm_connector *connector = &output->connector;
+	struct drm_encoder *encoder = &output->encoder;
+	struct drm_crtc *crtc = &output->crtc;
+	struct drm_plane *primary, *cursor = NULL;
+	int ret;
+
+	primary = amdgpu_vkms_plane_init(dev, DRM_PLANE_TYPE_PRIMARY, index);
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
+
+	ret = amdgpu_vkms_crtc_init(dev, crtc, primary, cursor);
+	if (ret)
+		goto err_crtc;
+
+	ret = drm_connector_init(dev, connector, &amdgpu_vkms_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret) {
+		DRM_ERROR("Failed to init connector\n");
+		goto err_connector;
+	}
+
+	drm_connector_helper_add(connector, &amdgpu_vkms_conn_helper_funcs);
+
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	if (ret) {
+		DRM_ERROR("Failed to init encoder\n");
+		goto err_encoder;
+	}
+	encoder->possible_crtcs = 1 << index;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		DRM_ERROR("Failed to attach connector to encoder\n");
+		goto err_attach;
+	}
+
+	drm_mode_config_reset(dev);
+
+	return 0;
+
+err_attach:
+	drm_encoder_cleanup(encoder);
+
+err_encoder:
+	drm_connector_cleanup(connector);
+
+err_connector:
+	drm_crtc_cleanup(crtc);
+
+err_crtc:
+	drm_plane_cleanup(primary);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
new file mode 100644
index 000000000000..251881b60048
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _AMDGPU_VKMS_H_
+#define _AMDGPU_VKMS_H_
+
+#define XRES_DEF  1024
+#define YRES_DEF   768
+
+#define XRES_MAX  16384
+#define YRES_MAX  16384
+
+#define drm_crtc_to_amdgpu_vkms_output(target) \
+	container_of(target, struct amdgpu_vkms_output, crtc)
+
+extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_block;
+
+struct amdgpu_vkms_output {
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct hrtimer vblank_hrtimer;
+	ktime_t period_ns;
+	struct drm_pending_vblank_event *event;
+};
+
+int amdgpu_vkms_output_init(struct drm_device *dev,
+			    struct amdgpu_vkms_output *output, int index);
+
+#endif /* _AMDGPU_VKMS_H_ */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 7e0d8c092c7e..f940be9d4f69 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -22,6 +22,7 @@
  */
 
 #include <drm/drm_vblank.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
@@ -40,6 +41,7 @@
 #include "dce_virtual.h"
 #include "ivsrcid/ivsrcid_vislands30.h"
 #include "amdgpu_display.h"
+#include "amdgpu_vkms.h"
 
 #define DCE_VIRTUAL_VBLANK_PERIOD 16666666
 
@@ -374,6 +376,12 @@ static const struct drm_connector_funcs dce_virtual_connector_funcs = {
 	.force = dce_virtual_force,
 };
 
+const struct drm_mode_config_funcs dce_virtual_mode_funcs = {
+	.fb_create = amdgpu_display_user_framebuffer_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
 static int dce_virtual_sw_init(void *handle)
 {
 	int r, i;
@@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *handle)
 
 	adev_to_drm(adev)->max_vblank_count = 0;
 
-	adev_to_drm(adev)->mode_config.funcs = &amdgpu_mode_funcs;
+	adev_to_drm(adev)->mode_config.funcs = &dce_virtual_mode_funcs;
 
-	adev_to_drm(adev)->mode_config.max_width = 16384;
-	adev_to_drm(adev)->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = XRES_MAX;
+	adev_to_drm(adev)->mode_config.max_height = YRES_MAX;
 
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
@@ -399,15 +407,11 @@ static int dce_virtual_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev_to_drm(adev)->mode_config.max_width = 16384;
-	adev_to_drm(adev)->mode_config.max_height = 16384;
+	adev->amdgpu_vkms_output = kcalloc(adev->mode_info.num_crtc, sizeof(struct amdgpu_vkms_output), GFP_KERNEL);
 
 	/* allocate crtcs, encoders, connectors */
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		r = dce_virtual_crtc_init(adev, i);
-		if (r)
-			return r;
-		r = dce_virtual_connector_encoder_init(adev, i);
+		r = amdgpu_vkms_output_init(adev_to_drm(adev), &adev->amdgpu_vkms_output[i], i);
 		if (r)
 			return r;
 	}
@@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *handle)
 			hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
+	kfree(adev->amdgpu_vkms_output);
 
 	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
-- 
2.32.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
