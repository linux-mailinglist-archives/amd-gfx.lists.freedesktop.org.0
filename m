Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HuiIGWIjIWpR/gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:04:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1536D63D7E4
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:04:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xry111.site header.s=default header.b=ZKDdm41J;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=xry111.site
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DD2113CFF;
	Thu,  4 Jun 2026 07:04:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF077112090
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 15:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1780501243;
 bh=hGsMTYHoeQ0TOkj6e86i0hzrq9+4umeDk9Y0LdQv/5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZKDdm41JXXyDawQMScsfatT63ChPDSp9PKjXnZoYJzrkFL0XtCpHyPyAmsi6mkhPZ
 EXPivz8nvMRG0e9GLjfsuHkd91rC2DuKe9cye3Fwv8+306Os/mC13mYKFWsgcjR+fe
 MCjrdf7Fz0quWyxy+zpcR6rq/+T7O9noMm98CHGI=
Received: from stargazer (unknown
 [IPv6:2408:824e:307:6541:546a:40ae:5851:c0ef])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id 1109065EC3;
 Wed,  3 Jun 2026 11:40:39 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Rafal Ostrowski <rafal.ostrowski@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v7.0.y v2 8/8] drm/amd/display: Move dml2_destroy to non-FPU
 compilation unit
Date: Wed,  3 Jun 2026 23:39:20 +0800
Message-ID: <20260603153920.249671-9-xry111@xry111.site>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603153920.249671-1-xry111@xry111.site>
References: <20260603153920.249671-1-xry111@xry111.site>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Jun 2026 07:03:56 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[xry111.site,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[xry111.site:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:sashal@kernel.org,m:rafal.ostrowski@amd.com,m:dillon.varone@amd.com,m:chen-yu.chen@amd.com,m:alexander.deucher@amd.com,m:xry111@xry111.site,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xry111.site:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1536D63D7E4

From: Rafal Ostrowski <rafal.ostrowski@amd.com>

[ Upstream commit 8bf0cb97edb697dba2515e6452c17c5245111448 ]

On PREEMPT_RT kernels, vfree() can sleep because spin_lock is
converted to rt_mutex. dml2_destroy() calls vfree() while inside
an FPU-guarded region (preempt_count=2), which is illegal.

dml2_wrapper_fpu.c is compiled with CC_FLAGS_FPU which defines
_LINUX_FPU_COMPILATION_UNIT, making DC_RUN_WITH_PREEMPTION_ENABLED()
resolve to a no-op. This prevents the macro from cycling FPU
context off/on around vfree().

Move dml2_destroy() to dml2_wrapper.c (non-FPU compilation unit)
where DC_RUN_WITH_PREEMPTION_ENABLED() properly cycles DC_FP_END/
DC_FP_START around vfree(). This pairs it with dml2_allocate_memory()
which already lives there.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Rafal Ostrowski <rafal.ostrowski@amd.com>
Signed-off-by: Chenyu Chen <chen-yu.chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 .../drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c   |  4 ++--
 drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c  | 11 +++++++++++
 .../gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c  | 10 ----------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c
index 7398f8b69adb..8bed59e976d1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c
@@ -58,8 +58,8 @@ bool dml21_create(const struct dc *in_dc, struct dml2_context **dml_ctx, const s
 
 void dml21_destroy(struct dml2_context *dml2)
 {
-	vfree(dml2->v21.dml_init.dml2_instance);
-	vfree(dml2->v21.mode_programming.programming);
+	DC_RUN_WITH_PREEMPTION_ENABLED(vfree(dml2->v21.dml_init.dml2_instance));
+	DC_RUN_WITH_PREEMPTION_ENABLED(vfree(dml2->v21.mode_programming.programming));
 }
 
 void dml21_copy(struct dml2_context *dst_dml_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c
index f4d45875d0be..6e3611a05c83 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c
@@ -107,6 +107,17 @@ bool dml2_create(const struct dc *in_dc, const struct dml2_configuration_options
 	return true;
 }
 
+void dml2_destroy(struct dml2_context *dml2)
+{
+	if (!dml2)
+		return;
+
+	if (dml2->architecture == dml2_architecture_21)
+		dml21_destroy(dml2);
+
+	DC_RUN_WITH_PREEMPTION_ENABLED(vfree(dml2));
+}
+
 void dml2_reinit(const struct dc *in_dc,
 				 const struct dml2_configuration_options *config,
 				 struct dml2_context **dml2)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c
index 66624cfc27b1..a14e3004a7b7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c
@@ -548,16 +548,6 @@ void dml2_apply_debug_options(const struct dc *dc, struct dml2_context *dml2)
 	}
 }
 
-void dml2_destroy(struct dml2_context *dml2)
-{
-	if (!dml2)
-		return;
-
-	if (dml2->architecture == dml2_architecture_21)
-		dml21_destroy(dml2);
-	vfree(dml2);
-}
-
 void dml2_extract_dram_and_fclk_change_support(struct dml2_context *dml2,
 	unsigned int *fclk_change_support, unsigned int *dram_clk_change_support)
 {
-- 
2.54.0

