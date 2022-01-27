Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90649DCDD
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jan 2022 09:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C944710ED86;
	Thu, 27 Jan 2022 08:47:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 07:00:32 UTC
Received: from qq.com (smtpbg473.qq.com [59.36.132.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6ED10E49B;
 Thu, 27 Jan 2022 07:00:32 +0000 (UTC)
X-QQ-mid: bizesmtp40t1643266335tamrph7a
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 27 Jan 2022 14:52:03 +0800 (CST)
X-QQ-SSF: 0140000000000080E000B00A0000000
X-QQ-FEAT: 2vDQexJ/FkbCPcVh34DJWyrqgJQoXftLpjju8zpJmmDl16S8eciDAUOBgkzJs
 T0aHwbB9ziLqNdKp9VMj0JoTTIvRHImMNXznEqlHYXEBIZgEtTp/KKfiY+Ss+euBgx6+lmj
 4uVa1TI234Y+B9BmTy4UkxETxCAg0rjnCVfiJMJesXgQkDxkYDKdMLqyqUhFKJSNIetFQsX
 RqdZ9Y4UxL4RK2o/dQZKYbHmI4SjcgTxDvWjDfsgRiQwXzq4S3gSdi9w17/6/xJcBxO4emV
 aehgVXdLlYiEGorA+WUUrcccSwMtZS3JIN5Xxv5Uw4QY8fJS8LMsu8oLVtjPvwMLqYueXDv
 7mnW0bvsnn001uVx7w=
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, jsarha@ti.com, tomi.valkeinen@ti.com,
 linux@dominikbrodowski.net, Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] drivers: Fix typo in comment
Date: Thu, 27 Jan 2022 14:51:56 +0800
Message-Id: <20220127065156.22372-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:47:29 +0000
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
Cc: tangmeng <tangmeng@uniontech.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Replace disbale with disable and replace unavaibale with unavailable.

Signed-off-by: tangmeng <tangmeng@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c  | 2 +-
 drivers/pcmcia/rsrc_nonstatic.c       | 2 +-
 drivers/usb/chipidea/udc.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index aef9d059ae52..a642c04cf17d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -544,7 +544,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
 {
 	int r;
 
-	/* trigger gpu-reset by hypervisor only if TDR disbaled */
+	/* trigger gpu-reset by hypervisor only if TDR disabled */
 	if (!amdgpu_gpu_recovery) {
 		/* see what event we get */
 		r = xgpu_vi_mailbox_rcv_msg(adev, IDH_FLR_NOTIFICATION);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 29890d704cb4..b986946b3b10 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -996,7 +996,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 	if (stat & LCDC_FRAME_DONE) {
 		tilcdc_crtc->frame_done = true;
 		wake_up(&tilcdc_crtc->frame_done_wq);
-		/* rev 1 lcdc appears to hang if irq is not disbaled here */
+		/* rev 1 lcdc appears to hang if irq is not disabled here */
 		if (priv->rev == 1)
 			tilcdc_clear(dev, LCDC_RASTER_CTRL_REG,
 				     LCDC_V1_FRAME_DONE_INT_ENA);
diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index 6b6c578b5f92..ad1141fddb4c 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -394,7 +394,7 @@ static int do_validate_mem(struct pcmcia_socket *s,
  * do_mem_probe() checks a memory region for use by the PCMCIA subsystem.
  * To do so, the area is split up into sensible parts, and then passed
  * into the @validate() function. Only if @validate() and @fallback() fail,
- * the area is marked as unavaibale for use by the PCMCIA subsystem. The
+ * the area is marked as unavailable for use by the PCMCIA subsystem. The
  * function returns the size of the usable memory area.
  */
 static int do_mem_probe(struct pcmcia_socket *s, u_long base, u_long num,
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index f9ca5010f65b..dc6c96e04bcf 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2152,7 +2152,7 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
 {
 	/*
 	 * host doesn't care B_SESSION_VALID event
-	 * so clear and disbale BSV irq
+	 * so clear and disable BSV irq
 	 */
 	if (ci->is_otg)
 		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, OTGSC_BSVIS);
-- 
2.20.1



