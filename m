Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9119D9F3
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Apr 2020 17:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB08C6E159;
	Fri,  3 Apr 2020 15:18:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F566EBFB;
 Fri,  3 Apr 2020 14:35:49 +0000 (UTC)
Received: from [123.118.214.4] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <aaron.ma@canonical.com>)
 id 1jKNQ8-0003KD-Dj; Fri, 03 Apr 2020 14:35:47 +0000
From: Aaron Ma <aaron.ma@canonical.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 xiaojie.yuan@amd.com, Felix.Kuehling@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aaron.ma@canonical.com
Subject: [PATCH] drm/amdgpu: Fix oops when pp_funcs is unset in ACPI event
Date: Fri,  3 Apr 2020 22:34:19 +0800
Message-Id: <20200403143419.155503-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 03 Apr 2020 15:18:42 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On ARCTURUS and RENOIR, powerplay is not supported yet.
When plug in or unplug power jack, ACPI event will issue.
Then kernel NULL pointer BUG will be triggered.
Check for NULL pointers before calling.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index f197f1be0969..611de69f9d48 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -89,7 +89,8 @@ void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
 			adev->pm.ac_power = true;
 		else
 			adev->pm.ac_power = false;
-		if (adev->powerplay.pp_funcs->enable_bapm)
+		if (adev->powerplay.pp_funcs &&
+				adev->powerplay.pp_funcs->enable_bapm)
 			amdgpu_dpm_enable_bapm(adev, adev->pm.ac_power);
 		mutex_unlock(&adev->pm.mutex);
 
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
