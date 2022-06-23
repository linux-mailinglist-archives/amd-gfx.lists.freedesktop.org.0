Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C05557D7D
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Jun 2022 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DB810EBD1;
	Thu, 23 Jun 2022 14:07:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 443 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jun 2022 10:22:30 UTC
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2E210EF81
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Jun 2022 10:22:29 +0000 (UTC)
X-QQ-mid: bizesmtp80t1655979295tq1gavlg
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Jun 2022 18:14:50 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000B00A0000000
X-QQ-FEAT: qpGeUh0uYB9S1TzaUBc1+BFLhEgoP88Y8lak3PyjSnXOH66GM4RrMOqIgHykO
 ErGJfCB20o+zSjTY6lHkeKoiYQlLIL66dJ3AeJivoSvBmbp/e0rkw5VGOxBpo8vvj/9bHGR
 qvyJGXa0RKmx6iFqjkZu/hQ/ICSBWpTPCbBhUW37n6/lPKzYKAZp3V1XQ7uxx4Nom/wLn9Q
 AXC3ZzzqoRWdpPvil9xcdqtenONfOn/JVgK/Z7dqT/tsI7ObL1kQrBdDOCYwNzcEv9PUmMu
 QIfsjn0Pv+TS9efMQaiFBCjZvhnvUQisgGSDWxmQr2+C0ca5EqWAo8vhORlIh6xgYYqEQWP
 FhzDiVza4CtcfJ5k5TBrIxVtT4uqA==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: drop unexpected word 'for' in comments
Date: Thu, 23 Jun 2022 18:14:48 +0800
Message-Id: <20220623101448.30188-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-Mailman-Approved-At: Thu, 23 Jun 2022 14:07:15 +0000
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
Cc: Philip.Yang@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jiang Jian <jiangjian@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

there is an unexpected word 'for' in the comments that need to be dropped

file - drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
line - 245

 * position and also advance the position for for Vega10

changed to:

 * position and also advance the position for Vega10

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
index 3df146579ad9..1d5af50331e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
@@ -242,7 +242,7 @@ int amdgpu_ih_process(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih)
  * @entry: IV entry
  *
  * Decodes the interrupt vector at the current rptr
- * position and also advance the position for for Vega10
+ * position and also advance the position for Vega10
  * and later GPUs.
  */
 void amdgpu_ih_decode_iv_helper(struct amdgpu_device *adev,
-- 
2.17.1

