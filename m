Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4BB1F6EFE
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2020 22:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF076E948;
	Thu, 11 Jun 2020 20:49:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 2153 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jun 2020 20:47:17 UTC
Received: from mx.dolansoft.org (s2.dolansoft.org [212.51.146.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562B3892A1
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2020 20:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
 s=s1; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:To:From:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fnBrLEjoTE5uDYt3hhefeL69sWELjKjTVA2g1r9IbTE=; b=Su8myYJeBbBRr80LcigZrzAEGi
 z7HqBtcagnhuc0cclIZhn24JiSUybYsxFlSYURBAa5Tz/B3eFh+3REnbCdXAamY8gpyQkhNsxHhyr
 9KHvl44J/ZGpgmOdnzEtHi7ejvgEK6XkdkrverMF2wvKZtLIC98znd0qFhNzJr5LfsWJCPwPaSy2u
 mD0cqSvymPIWFq6ZOoEyfncO12NvSMPmM16QM9ooyLJfnj4zAmaNDxjswQceBtnhwcUD0KA/zFOcw
 xzeWKo2D7CrhThiGW5snQz+VRak7DTimepWKOoGAY0EmyVJG+yrDB/TyVZyYyKcc7SgJcevXs7wrP
 NBTlW8+g==;
Received: from [212.51.153.77] (helo=localhost.localdomain)
 by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <lorenz@dolansoft.org>)
 id 1jjTXl-0004Hr-W8; Thu, 11 Jun 2020 20:11:21 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: Use correct major in devcgroup check
Date: Thu, 11 Jun 2020 22:11:21 +0200
Message-Id: <20200611201121.317165-1-lorenz@brun.one>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jun 2020 20:49:24 +0000
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

The existing code used the major version number of the DRM driver
instead of the device major number of the DRM subsystem for
validating access for a devices cgroup.

This meant that accesses allowed by the devices cgroup weren't
permitted and certain accesses denied by the devices cgroup were
permitted (if they matched the wrong major device number).

Signed-off-by: Lorenz Brun <lorenz@brun.one>
Fixes: 6b855f7b83d2f ("drm/amdkfd: Check against device cgroup")
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index f0587d94294d..fee60921fccf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -40,6 +40,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_device.h>
+#include <drm/drm_ioctl.h>
 #include <kgd_kfd_interface.h>
 #include <linux/swap.h>
 
@@ -1076,7 +1077,7 @@ static inline int kfd_devcgroup_check_permission(struct kfd_dev *kfd)
 #if defined(CONFIG_CGROUP_DEVICE) || defined(CONFIG_CGROUP_BPF)
 	struct drm_device *ddev = kfd->ddev;
 
-	return devcgroup_check_permission(DEVCG_DEV_CHAR, ddev->driver->major,
+	return devcgroup_check_permission(DEVCG_DEV_CHAR, DRM_MAJOR,
 					  ddev->render->index,
 					  DEVCG_ACC_WRITE | DEVCG_ACC_READ);
 #else
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
