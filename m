Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002642B333C
	for <lists+amd-gfx@lfdr.de>; Sun, 15 Nov 2020 10:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BDB6E995;
	Sun, 15 Nov 2020 09:39:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448A26E995
 for <amd-gfx@lists.freedesktop.org>; Sun, 15 Nov 2020 09:39:51 +0000 (UTC)
Date: Sun, 15 Nov 2020 09:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605433188;
 bh=xrubJ7Cjo24zJmxh/QBdfGo4FGIbvY6c4jf8U+IuwrA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=DgVpZUSR+CBkQojhjQD4I6HDVvHyOFO9G1UwHnZN+e5orFUCQpB8Gm96UhFP0hwPj
 cjBPHRzv2hWwSQZPOtMvU1AlDlKllegij3ZWkWf12YjopcyAmJOlqzokKI//o8B4ZD
 /GlWXOG92gvnfA3/Hir7mfAi8pGyzJ3vsBLkLJfeUM+JpI8ivH4crPQt4w+UCPo7M8
 Cen9NAybsVGUP+a4ytBcSiQ4pCnpjSdmgktQbCR7O5zKEOk6BQQEodAiDsbcF3xZat
 neea7z4UAKPphl7F/iJFPXlQTS0/cLqAuTyDGdJwNM6u4o+nhLFZM56ZZwxpiYrxyW
 XOXaTnn9qClmA==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/fourcc: fix AMD modifiers PACKERS field doc
Message-ID: <6NXsveJa7IUiRftZcOguXi1dj0UifPcrDRtR1oOgrU@cp3-web-009.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This field doesn't alias with BANK_XOR_BITS: PACKERS is bits 26:28 while
BANK_XOR_BITS is bits 23:25.

Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/uapi/drm/drm_fourcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index ca48ed0e6bc1..29c7a8694479 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1196,7 +1196,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
 #define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 23
 #define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
-#define AMD_FMT_MOD_PACKERS_SHIFT 26 /* aliases with BANK_XOR_BITS */
+#define AMD_FMT_MOD_PACKERS_SHIFT 26
 #define AMD_FMT_MOD_PACKERS_MASK 0x7
 #define AMD_FMT_MOD_RB_SHIFT 29
 #define AMD_FMT_MOD_RB_MASK 0x7
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
