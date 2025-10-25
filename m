Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223F0C087C4
	for <lists+amd-gfx@lfdr.de>; Sat, 25 Oct 2025 03:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9E710E068;
	Sat, 25 Oct 2025 01:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jTL8UsKW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE63B10E068
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Oct 2025 01:01:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B36DB6022F;
 Sat, 25 Oct 2025 01:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22B6C4CEF1;
 Sat, 25 Oct 2025 01:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761354071;
 bh=c+ZpQvjae2c/AAdqSJlETeMLaKJkgZzOK5+wS4XXx/o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jTL8UsKWoovipVFWA/oyYkuWqKA7BhhalF0vb15+d5BcHviMHcj5buYRLUA9p6xGw
 pySDCDgcJmYP6aRHz3aK2dIwRgBeuEm/kOo9k+foc1k6WgzDzpzXmMDKS7Yqu31M7M
 LmXcn9PCpa1/hiB6vrn2mxK+FeN3aldGr+HV0OrzSeEWu9F/OlK0JQBK5/b8+Gq94a
 s2S3S8OtfluaaOeQiXQPsu79s1gFscBZzqxrXVsJD6cLHN4219BS/4xQTEiPpsgTGT
 6fFvKK3sN/JVQAGjqe1isjQkErRlOhwaMFSN7YYwb7HL+Wqmcu09GnImVcuJmkx1m6
 y82yRPl/8ucqQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), 
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: [PATCH v2 2/2] drm/amd: Manage frozen state internally
Date: Fri, 24 Oct 2025 20:00:58 -0500
Message-ID: <20251025010058.2417352-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025010058.2417352-1-superm1@kernel.org>
References: <20251025010058.2417352-1-superm1@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

[Why]
On a normal hibernate sequence amdgpu will skip the thaw step due to
commit 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for
normal hibernation").

If the hibernate sequence has been aborted however after this thawed
step runs the PM core will think the device is suspended and will skip
the restore() sequence for amdgpu.  This leads to accessing the device
while in a low power state and will freeze the system.

[How]
Set `dev->power.is_frozen` to indicate to the PM core that an error
code will be returned for thaw() callback because driver managed the
frozen state.  If the restore() callback is called by the PM core the
driver will resume the device.

Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v2:
 * add tag
 * rebase on linux-pm/bleeding-edge
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3d032c4e2dce1..693347eb6861b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5247,6 +5247,11 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	if (r)
 		return r;
 
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+	if (adev->in_s4)
+		dev->dev->power.is_frozen = 1;
+#endif
+
 	return 0;
 }
 
@@ -5385,6 +5390,11 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	if (amdgpu_acpi_smart_shift_update(adev, AMDGPU_SS_DEV_D0))
 		dev_warn(adev->dev, "smart shift update failed\n");
 
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+	if (adev->in_s4)
+		dev->dev->power.is_frozen = 0;
+#endif
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 61268aa82df4d..d40af069f24dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *dev)
 
 	/* do not resume device if it's normal hibernation */
 	if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
-		return 0;
+		return -EBUSY;
 
 	return amdgpu_device_resume(drm_dev, true);
 }
-- 
2.43.0

