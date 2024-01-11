Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CB82AA2B
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jan 2024 10:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C02910E876;
	Thu, 11 Jan 2024 09:04:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4ABD310E0A5;
 Thu, 11 Jan 2024 03:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=dshx51HI40zA1xqVFX
 zADg2VlgDAFrz0WnOsTKSvvUw=; b=lhO/sXbpD8kmL5Zy69zMbiyZgZP82WkN2I
 xhZb4hC4o2O9faM+D8P/ckSD8YzOBHCUx1KeyYUY584dTO3iTDMFh7kkT9plwwg1
 XJ3VJVpL8uwd07wtJVmruQW4ZGxhzK7iF9iqF5sGG7+TFD3nXlrJzvL6Rbf9A0pk
 eBN63YPl4=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3X4UwX59lAvWdAA--.60309S2;
 Thu, 11 Jan 2024 11:23:28 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in dimgrey_cavefish_ip_offset.h
Date: Thu, 11 Jan 2024 03:23:27 +0000
Message-Id: <20240111032327.7402-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X4UwX59lAvWdAA--.60309S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48KF4ftF17Kr45ZFb_yoWfAFX_Ca
 43Xr1fW347ZFnrtF17Zanru3yj9w1kuFs7Xw15tr15trZrCr18W3y5Gr47ZrWruFZxKFnr
 C3WkXFZ8XrnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRK9atUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGAdixWVLZWQS9AABsw
X-Mailman-Approved-At: Thu, 11 Jan 2024 09:04:24 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h b/drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h
index f84996a73de9..53cb4296df88 100644
--- a/drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h
@@ -25,13 +25,11 @@
 #define MAX_SEGMENT                                         6
 
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 } __maybe_unused;
 
-- 
2.17.1

