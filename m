Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHgZN+vuF2q4WAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2026 09:29:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66395EDB56
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2026 09:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752710ED26;
	Thu, 28 May 2026 07:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.b="fPyDtgQV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA6610E0E5
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 May 2026 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1779893111;
 bh=Vfi7WkAkaKzQjlq2t3CxNnq4sW/XikH4X4sc46sN0qY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPyDtgQVBb2AV/X6T3E9jpB/SCgIWIQzJ4EA3LlPMgy238hg08VMtZzqMeOtWVmiW
 +1YKJNi34pn0r0zAU12Xy9ds9tXtCtw4dMdX6RPpTPp8L24WIZZ3jZ530UWCfTmaY3
 KAl8W5vQ8cTNp4VwDcHUzxztE80Y2GIqE4Sn73PI=
Received: from stargazer (unknown
 [IPv6:2409:8a4c:e1b:e231:5a6e:b99e:242d:222b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id 94C62659C8;
 Wed, 27 May 2026 10:45:09 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: stable@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v7.0.y 2/8] drm/amd/display: Backport dml21
 DC_RUN_WITH_PREEMPTION_ENABLED addition from DC 3.2.373
Date: Wed, 27 May 2026 22:44:22 +0800
Message-ID: <20260527144428.1095001-3-xry111@xry111.site>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527144428.1095001-1-xry111@xry111.site>
References: <20260527144428.1095001-1-xry111@xry111.site>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 May 2026 07:29:41 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[xry111.site,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[xry111.site:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:xry111@xry111.site,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[xry111.site:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xry111.site:email,xry111.site:mid,xry111.site:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: B66395EDB56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's a part of the upstream commit e56e3cff2a1b ("drm/amd/display: Sync
dcn42 with DC 3.2.373") needed for the following backports moving FPU
guards from DML to DC.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 .../amd/display/dc/dml2_0/dml21/dml21_wrapper.c    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c
index 96c62bd6a37b..2623e917ec28 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.c
@@ -9,16 +9,21 @@
 #include "dml21_utils.h"
 #include "dml21_translation_helper.h"
 #include "dml2_dc_resource_mgmt.h"
+#include "dc_fpu.h"
+
+#if !defined(DC_RUN_WITH_PREEMPTION_ENABLED)
+#define DC_RUN_WITH_PREEMPTION_ENABLED(code) code
+#endif // !DC_RUN_WITH_PREEMPTION_ENABLED
 
 #define INVALID -1
 
 static bool dml21_allocate_memory(struct dml2_context **dml_ctx)
 {
-	*dml_ctx = vzalloc(sizeof(struct dml2_context));
+	DC_RUN_WITH_PREEMPTION_ENABLED(*dml_ctx = vzalloc(sizeof(struct dml2_context)));
 	if (!(*dml_ctx))
 		return false;
 
-	(*dml_ctx)->v21.dml_init.dml2_instance = vzalloc(sizeof(struct dml2_instance));
+	DC_RUN_WITH_PREEMPTION_ENABLED((*dml_ctx)->v21.dml_init.dml2_instance = vzalloc(sizeof(struct dml2_instance)));
 	if (!((*dml_ctx)->v21.dml_init.dml2_instance))
 		return false;
 
@@ -28,7 +33,7 @@ static bool dml21_allocate_memory(struct dml2_context **dml_ctx)
 	(*dml_ctx)->v21.mode_support.display_config = &(*dml_ctx)->v21.display_config;
 	(*dml_ctx)->v21.mode_programming.display_config = (*dml_ctx)->v21.mode_support.display_config;
 
-	(*dml_ctx)->v21.mode_programming.programming = vzalloc(sizeof(struct dml2_display_cfg_programming));
+	DC_RUN_WITH_PREEMPTION_ENABLED((*dml_ctx)->v21.mode_programming.programming = vzalloc(sizeof(struct dml2_display_cfg_programming)));
 	if (!((*dml_ctx)->v21.mode_programming.programming))
 		return false;
 
@@ -70,8 +75,9 @@ static void dml21_init(const struct dc *in_dc, struct dml2_context *dml_ctx, con
 bool dml21_create(const struct dc *in_dc, struct dml2_context **dml_ctx, const struct dml2_configuration_options *config)
 {
 	/* Allocate memory for initializing DML21 instance */
-	if (!dml21_allocate_memory(dml_ctx))
+	if (!dml21_allocate_memory(dml_ctx)) {
 		return false;
+	}
 
 	dml21_init(in_dc, *dml_ctx, config);
 
-- 
2.54.0

