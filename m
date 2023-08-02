Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30176C650
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26951890EA;
	Wed,  2 Aug 2023 07:20:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7B510E375
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Aug 2023 09:32:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5C24614CF;
 Tue,  1 Aug 2023 09:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9821C433C8;
 Tue,  1 Aug 2023 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1690882327;
 bh=1rDH38Fe9oXo2eELUsDo4U+VpucVbyz4LiiLWYXx2II=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0+yBh58FNmlbW3XUsnEDoBneQ7lRax+sbI/sO1//xrLLtHM8epR1uzZrCa+1tqxXC
 BlvUQvLONWC6L2idWhahm1e1RY4LjnbcrYIAs8AmKFEyj/UgFdCo8CRXtl+EMCGv8P
 GGfmx2HB8bC5o5cyY9uJfYw9jmy8gEh9qS5BQADA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 066/228] drm/amd/display: fix dc/core/dc.c kernel-doc
Date: Tue,  1 Aug 2023 11:18:44 +0200
Message-ID: <20230801091925.222236760@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801091922.799813980@linuxfoundation.org>
References: <20230801091922.799813980@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:20:04 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit db4107e92a817502ad19fdd30250f87dcb6f6331 ]

Fix all kernel-doc warnings in dc/core/dc.c:

dc.c:385: warning: missing initial short description on line:
 *  dc_stream_adjust_vmin_vmax:
dc.c:392: warning: contents before sections
dc.c:399: warning: No description found for return value of 'dc_stream_adjust_vmin_vmax'
dc.c:434: warning: Excess function parameter 'adjust' description in 'dc_stream_get_last_used_drr_vtotal'
dc.c:434: warning: No description found for return value of 'dc_stream_get_last_used_drr_vtotal'
dc.c:574: warning: No description found for return value of 'dc_stream_configure_crc'
dc.c:1746: warning: No description found for return value of 'dc_commit_state_no_check'
dc.c:4991: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * dc_extended_blank_supported 0 Decide whether extended blank is supported
dc.c:4991: warning: missing initial short description on line:
 * dc_extended_blank_supported 0 Decide whether extended blank is supported
dc.c:4723: warning: Function parameter or member 'dc' not described in 'dc_enable_dmub_outbox'
dc.c:4926: warning: Function parameter or member 'dc' not described in 'dc_process_dmub_dpia_hpd_int_enable'
dc.c:4926: warning: Function parameter or member 'hpd_int_enable' not described in 'dc_process_dmub_dpia_hpd_int_enable'
12 warnings

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Stable-dep-of: 2a9482e55968 ("drm/amd/display: Prevent vtotal from being set to 0")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 40 +++++++++++++++---------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 85ed1c7cdeaa9..6e2220e2e5ba3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -382,16 +382,18 @@ static void dc_perf_trace_destroy(struct dc_perf_trace **perf_trace)
 }
 
 /**
- *  dc_stream_adjust_vmin_vmax:
+ *  dc_stream_adjust_vmin_vmax - look up pipe context & update parts of DRR
+ *  @dc:     dc reference
+ *  @stream: Initial dc stream state
+ *  @adjust: Updated parameters for vertical_total_min and vertical_total_max
  *
  *  Looks up the pipe context of dc_stream_state and updates the
  *  vertical_total_min and vertical_total_max of the DRR, Dynamic Refresh
  *  Rate, which is a power-saving feature that targets reducing panel
  *  refresh rate while the screen is static
  *
- *  @dc:     dc reference
- *  @stream: Initial dc stream state
- *  @adjust: Updated parameters for vertical_total_min and vertical_total_max
+ *  Return: %true if the pipe context is found and adjusted;
+ *          %false if the pipe context is not found.
  */
 bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 		struct dc_stream_state *stream,
@@ -427,14 +429,17 @@ bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 }
 
 /**
- * dc_stream_get_last_used_drr_vtotal - dc_stream_get_last_vrr_vtotal
+ * dc_stream_get_last_used_drr_vtotal - Looks up the pipe context of
+ * dc_stream_state and gets the last VTOTAL used by DRR (Dynamic Refresh Rate)
  *
  * @dc: [in] dc reference
  * @stream: [in] Initial dc stream state
- * @adjust: [in] Updated parameters for vertical_total_min and
+ * @refresh_rate: [in] new refresh_rate
  *
- * Looks up the pipe context of dc_stream_state and gets the last VTOTAL used
- * by DRR (Dynamic Refresh Rate)
+ * Return: %true if the pipe context is found and there is an associated
+ *         timing_generator for the DC;
+ *         %false if the pipe context is not found or there is no
+ *         timing_generator for the DC.
  */
 bool dc_stream_get_last_used_drr_vtotal(struct dc *dc,
 		struct dc_stream_state *stream,
@@ -581,7 +586,10 @@ bool dc_stream_stop_dmcu_crc_win_update(struct dc *dc, struct dc_stream_state *s
  *              once.
  *
  * By default, only CRC0 is configured, and the entire frame is used to
- * calculate the crc.
+ * calculate the CRC.
+ *
+ * Return: %false if the stream is not found or CRC capture is not supported;
+ *         %true if the stream has been configured.
  */
 bool dc_stream_configure_crc(struct dc *dc, struct dc_stream_state *stream,
 			     struct crc_params *crc_window, bool enable, bool continuous)
@@ -650,7 +658,7 @@ bool dc_stream_configure_crc(struct dc *dc, struct dc_stream_state *stream,
  * dc_stream_configure_crc needs to be called beforehand to enable CRCs.
  *
  * Return:
- * false if stream is not found, or if CRCs are not enabled.
+ * %false if stream is not found, or if CRCs are not enabled.
  */
 bool dc_stream_get_crc(struct dc *dc, struct dc_stream_state *stream,
 		       uint32_t *r_cr, uint32_t *g_y, uint32_t *b_cb)
@@ -1739,6 +1747,8 @@ void dc_z10_save_init(struct dc *dc)
 /*
  * Applies given context to HW and copy it into current context.
  * It's up to the user to release the src context afterwards.
+ *
+ * Return: an enum dc_status result code for the operation
  */
 static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *context)
 {
@@ -4600,7 +4610,7 @@ bool dc_enable_dmub_notifications(struct dc *dc)
 /**
  * dc_enable_dmub_outbox - Enables DMUB unsolicited notification
  *
- * dc: [in] dc structure
+ * @dc: [in] dc structure
  *
  * Enables DMUB unsolicited notifications to x86 via outbox.
  */
@@ -4801,8 +4811,8 @@ enum dc_status dc_process_dmub_set_mst_slots(const struct dc *dc,
 /**
  * dc_process_dmub_dpia_hpd_int_enable - Submits DPIA DPD interruption
  *
- * @dc [in]: dc structure
- * @hpd_int_enable [in]: 1 for hpd int enable, 0 to disable
+ * @dc: [in] dc structure
+ * @hpd_int_enable: [in] 1 for hpd int enable, 0 to disable
  *
  * Submits dpia hpd int enable command to dmub via inbox message
  */
@@ -4883,7 +4893,7 @@ void dc_notify_vsync_int_state(struct dc *dc, struct dc_stream_state *stream, bo
 }
 
 /**
- * dc_extended_blank_supported 0 Decide whether extended blank is supported
+ * dc_extended_blank_supported - Decide whether extended blank is supported
  *
  * @dc: [in] Current DC state
  *
@@ -4892,7 +4902,7 @@ void dc_notify_vsync_int_state(struct dc *dc, struct dc_stream_state *stream, bo
  * ability to enter z9/z10.
  *
  * Return:
- * Indicate whether extended blank is supported (true or false)
+ * Indicate whether extended blank is supported (%true or %false)
  */
 bool dc_extended_blank_supported(struct dc *dc)
 {
-- 
2.39.2



