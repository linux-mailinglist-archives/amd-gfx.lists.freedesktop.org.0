Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OYQuHv8mOGqcYwcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 20:01:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311426AB655
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 20:01:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shift-computing.de header.s=dkim header.b=k2ccOVTV;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=shift-computing.de
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E34110E3CE;
	Sun, 21 Jun 2026 18:01:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.teamster.cloud (mail.teamster.cloud [213.136.73.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8E710E20F;
 Sun, 21 Jun 2026 18:01:26 +0000 (UTC)
From: Oz Tiram <oz@shift-computing.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shift-computing.de;
 s=dkim; t=1782064884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZdQl6cpDNRleiDk+rgSJQzCixdRfIPpLBTexba67Bo=;
 b=k2ccOVTVDodeVJG9fAUFOGaIbxTredjTz6VwC6zmy+WlwUtG4+sZEw4ALXvIvypcZzhz0J
 IK3wFL2+Giw2FMC9a2hxxpUOIKWqcnh23xw7Yj5k5ozRDfmjU7lIm8jMSMbnT4p/LOyQ17
 6UGNGEDz0qp2k15LfVXNfGgaH6pRCJH2OvGwkEvx4WpzKi3z0X6HyGDixxG2RHL8ETZTxE
 9aRyon+d6hYXEQXLaHEZULxv8yP9IVvXeiL6hrw4esCcwqx+alKyAuomLeFrAvWm/s/wIg
 BDtp3glKU0WJ3QU7r1TEd0xIxYJ926vEuCa1Ty8+glOlkbEfV4pn4+MUqpU/DQ==
To: amd-gfx@lists.freedesktop.org
Cc: Oz Tiram <oz@shift-computing.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/amd/amdgpu: add firmware file fallback for APU VBIOS
 discovery
Date: Sun, 21 Jun 2026 18:01:54 +0000
Message-ID: <20260621180154.30421-1-oz@shift-computing.de>
In-Reply-To: <20260621173211.28443-1-oz@shift-computing.de>
References: <20260621173211.28443-1-oz@shift-computing.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: -----
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[shift-computing.de,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[shift-computing.de:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[shift-computing.de,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[oz@shift-computing.de,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[shift-computing.de:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 311426AB655

APUs (e.g. AMD Radeon 780M / HawkPoint, PCI 1002:1900) have no
dedicated VBIOS ROM chip.  amdgpu_get_bios_apu() attempts four paths
before giving up:

  1. ACPI VFCT table
  2. VRAM BAR read
  3. ROM BAR read
  4. platform BIOS

On some systems all four fail:

  - The VFCT table is absent or contains only the discrete GPU entry
    (e.g. when a custom ACPI override is present for the dGPU only).
  - The VRAM BAR is unmapped at probe time.
  - The ROM BAR is zero (PCI firmware did not assign it; observed even
    with pci=realloc,assign-busses).
  - No platform BIOS mapping exists.

The driver then prints "Unable to locate a BIOS ROM" and refuses to
bind, leaving the APU completely unusable under Linux even though the
hardware is functional.

Add a fifth fallback: request a firmware file named
"amdgpu/<vendor>_<device>.bin" (e.g. "amdgpu/1002_1900.bin") via
request_firmware().  This allows a VBIOS image extracted from the
running hardware to be shipped as a firmware blob in /lib/firmware/ and
makes the binding succeed without any change to the ACPI tables.

The fallback is only reached if all existing paths have already failed,
so there is no regression risk for boards where VFCT or ROM BAR work.

Signed-off-by: Oz Tiram <oz@shift-computing.de>
---
v2: Validate the fetched firmware with check_atom_bios() before accepting
    it, consistent with all other VBIOS discovery paths.  Save fw->size
    before release_firmware() so it remains valid for the size check.
    Release the buffer via amdgpu_bios_release() if validation fails.

 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index aa039e148a5e..86064c753b09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -26,6 +26,7 @@
  *          Jerome Glisse
  */
 
+#include <linux/firmware.h>
 #include "amdgpu.h"
 #include "atom.h"
 
@@ -457,6 +458,28 @@ static bool amdgpu_get_bios_apu(struct amdgpu_device *adev)
 		goto success;
 	}
 
+	{
+		const struct firmware *fw;
+		char fw_name[32];
+		size_t fw_size;
+
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%04x_%04x.bin",
+			 adev->pdev->vendor, adev->pdev->device);
+		if (request_firmware(&fw, fw_name, adev->dev) == 0) {
+			adev->bios = kmemdup(fw->data, fw->size, GFP_KERNEL);
+			fw_size = fw->size;
+			release_firmware(fw);
+			if (!adev->bios || !check_atom_bios(adev, fw_size)) {
+				amdgpu_bios_release(adev);
+			} else {
+				adev->bios_size = fw_size;
+				dev_info(adev->dev, "Fetched VBIOS from firmware file %s\n",
+					 fw_name);
+				goto success;
+			}
+		}
+	}
+
 	dev_err(adev->dev, "Unable to locate a BIOS ROM\n");
 	return false;
 
-- 
2.53.0

