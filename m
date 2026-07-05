Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UWAYKFksSmoi/AAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 05 Jul 2026 12:05:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CC709AAE
	for <lists+amd-gfx@lfdr.de>; Sun, 05 Jul 2026 12:05:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shift-computing.de header.s=dkim header.b=dwRgHEb8;
	dmarc=pass (policy=reject) header.from=shift-computing.de;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B86D10E189;
	Sun,  5 Jul 2026 10:05:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.teamster.cloud (mail.teamster.cloud [213.136.73.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F9910E189;
 Sun,  5 Jul 2026 10:05:10 +0000 (UTC)
From: Oz Tiram <oz@shift-computing.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shift-computing.de;
 s=dkim; t=1783245908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7EJhZdscjisekpdqgSaSUGhkO3QFbBPTc4PoNhhHsQ=;
 b=dwRgHEb8ozO7WxvzoFBDf9QqBGiW6IlhxENAaBTn1sLeAeb9ut98qtQ5NCgALUYn/v24df
 YSH0Ycf9jSf5UXDF5t5zpHfTmp6wB8RHMtuoi4ZjR79JKNLc2NkpxdSojn3CNjntwEpOey
 jqHNhkzgERKeLtzVVNtLfJqjisnmggtm1xNxtri5+TWgt5X58AdOdoMtiZep8ZYHp73JsQ
 6JTYLvMAIemGQ35zSpfrIy56d409zrjMk+0RdsPCb0ZcaP4lgP1y9nvuzjXfHQ3bxaMX8B
 WHzcwetZiUregKgVovpzbYHA7bnTBfIVj5uJZ96mZtqJPXkA3Bus/dhNb6lDSg==
To: amd-gfx@lists.freedesktop.org
Cc: oz@shift-computing.de, mario.limonciello@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd/amdgpu: add firmware file fallback for APU VBIOS
 discovery
Date: Sun,  5 Jul 2026 10:04:36 +0000
Message-ID: <20260705100436.6877-1-oz@shift-computing.de>
In-Reply-To: <716a31c5-0484-4ef9-b49e-b71310f92d86@amd.com>
References: <716a31c5-0484-4ef9-b49e-b71310f92d86@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: -
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
	R_DKIM_ALLOW(-0.20)[shift-computing.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[shift-computing.de,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[shift-computing.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[oz@shift-computing.de,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,shift-computing.de:from_mime,shift-computing.de:email,shift-computing.de:mid,shift-computing.de:dkim,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 107CC709AAE

APUs (e.g. AMD Radeon 780M / HawkPoint, PCI 1002:1900) have no
dedicated VBIOS ROM chip.  amdgpu_get_bios_apu() attempts four paths
before giving up:

  1. ACPI VFCT table
  2. VRAM BAR read
  3. ROM BAR read
  4. platform BIOS

On some systems all four fail.  The specific case motivating this patch
is a hybrid graphics machine (dGPU + APU) where:

  - The VFCT table contains the iGPU entry but with a stale PCIBus value
    from BIOS POST time (0x6A).  When the kernel boots with
    pci=realloc,assign-busses, PCI bus numbers are reassigned dynamically
    and the iGPU lands on bus 0x0B at runtime.  amdgpu_acpi_vfct_bios()
    matches entries by bus number, so the entry is never found.
  - The VRAM BAR is unmapped at probe time.
  - The ROM BAR is zero (PCI firmware did not assign it).
  - No platform BIOS mapping exists.

The UEFI GOP driver initialises the iGPU successfully for early display,
confirming the hardware is functional.  The VBIOS image data embedded in
the VFCT is also valid; only the PCIBus metadata is wrong.  The firmware
file can be extracted directly from the VFCT using dd:

  dd if=/sys/firmware/acpi/tables/VFCT bs=1 skip=$((0x68)) count=16896 \
     of=/lib/firmware/amdgpu/1002_1900.bin

(0x68 is the byte offset of the VBIOS image after the ACPI table header
and VFCT_IMAGE_HEADER; the image length 16896 comes from the ImageLength
field in VFCT_IMAGE_HEADER.)

The driver then prints "Unable to locate a BIOS ROM" and refuses to
bind, leaving the APU completely unusable under Linux.

Add a fifth fallback: request a firmware file named
"amdgpu/<vendor>_<device>.bin" (e.g. "amdgpu/1002_1900.bin") via
request_firmware().  This allows a VBIOS image extracted as above to be
placed in /lib/firmware/ and makes the binding succeed without patching
ACPI tables or BIOS.

The fallback is only reached if all existing paths have already failed,
so there is no regression risk for boards where VFCT or ROM BAR work.

Signed-off-by: Oz Tiram <oz@shift-computing.de>
---
v2: Fix commit message: clarify that VFCT contains the iGPU entry but
    with a stale PCIBus from BIOS POST that mismatches the runtime bus
    number assigned by pci=realloc,assign-busses.  Explain that the VBIOS
    image data is valid and document the dd extraction command and byte
    offsets.  Note that the UEFI GOP driver initialises the iGPU
    successfully, confirming the hardware is functional.

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

