Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8311A8D9
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Dec 2019 11:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62B16EAF3;
	Wed, 11 Dec 2019 10:27:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 10:27:15 UTC
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2656EAF3
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Dec 2019 10:27:15 +0000 (UTC)
Date: Wed, 11 Dec 2019 10:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1576059665;
 bh=MB9qzFETuH+dvOBsYAODBg1oWyqswPFdtMae5ZQ7tf8=;
 h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
 b=OPECLPbkaZEPAOGwedIsXV9WuZ11XSPolsyDp1WHfT0F3rJ4Mn7JzM6mPX2vgQEhh
 vPszYJEMZ0CRqXL01ZnWhYQ91+JEknkbXkdoKXY9p7Nc0hYdOkcbeJWCp0qE/IW9FJ
 qYDZcd68MYcpIsuRnVf7oKkQA6aw8LTLFLNwD0QE=
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/amdgpu: log when amdgpu.dc=1 but ASIC is unsupported
Message-ID: <UPyARDn3GLmg4q9nl7gAuUjBHqg6GfvZOTyyRlyU1U-X-I1HD4Bo2AxZmmXWbRS3g35B_bD8Hm5WcJAqlwAsd-jcAz4Dij4AO0iA0Jpnjv8=@emersion.fr>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This makes it easier to figure out whether the kernel parameter has been
taken into account.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7a6c837c0a85..10618353383f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2525,6 +2525,9 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 		return amdgpu_dc != 0;
 #endif
 	default:
+		if (amdgpu_dc > 0)
+			DRM_INFO("Display Core has been requested via kernel parameter "
+					 "but isn't supported by ASIC, ignoring\n");
 		return false;
 	}
 }
--
2.24.0


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
