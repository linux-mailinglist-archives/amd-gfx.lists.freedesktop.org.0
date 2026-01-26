Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHh/E97Xd2mFlwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Jan 2026 22:08:46 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4E8D88F
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Jan 2026 22:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6DD10E49F;
	Mon, 26 Jan 2026 21:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ayxu9mTh";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF1F10E49E
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Jan 2026 21:08:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so4463678f8f.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Jan 2026 13:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769461721; x=1770066521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gr+Q9dUGALsqtYU8e1qxwqo8P84xX2QI7IYouX5QXjk=;
 b=Ayxu9mThwW64N+6EsYk327JbYZoHfq/hHbKSza5qjb9fYb1eleL8SziiV8LLfW+LS/
 29rlQnol6ToThxY3BDSENhduOzcP7SkLOMrvz+de+X3VpzERyEhlq+kqIO39H/rj8KLA
 XkbVJlVIqxIaEAjNOxv1jb2gk7pHxVUBrxBql6pBGp5koSQjd11EHi63dr7xXrtJDt77
 RSsFWABHscZvZhoQd9YYhQWfnVGZkxklXg7d9RRaqD+nLinp8TAR4QVqUaJkw0T6st09
 1TXIiDzPWJ+B/u3B6ztNITWL7tUQHm1BrcHggrfN4h2ECUxJDmqOoaz1YwAR9KMDGTCn
 r45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769461721; x=1770066521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gr+Q9dUGALsqtYU8e1qxwqo8P84xX2QI7IYouX5QXjk=;
 b=bfg+UcTWAXS5/JFmDZbsVzIbl/QT9BBIGHXf0VFfKobb7wrCUsXlIt5xdBCp0EnV2e
 9TtGN0kU99PK2yUUftN9585CRZQhWRCvSQD9rZ6+0nfOmcuWER8puVYPcLyQVAc2iQOG
 Np4F/7wcTmIkd+z5bdeL2312xWQ3cUOIG1+4P4AZnMvdfeGSxdx8c6wg0E7CfvEL+PmT
 QjamOvPfo6R2Wn5J+9rws04yHSVbzHQOthuGQXaGkn9R3DpIrrs0BJl2BMkUi/3Z+IO/
 uvf23HZQwX75fxAKtBOogVBUn9+lhspzzcuwfcp3nCp2WE8nvBEBtYn7XbZkljFLWLdQ
 YmwQ==
X-Gm-Message-State: AOJu0YyPMlN0DJj/zidCJD/Y+aab2uWpTgBJghLj5O3hwkMj3V5AeO8I
 UXce9KqEgjrt4Wv71KEeWAUk0yGJWDEMaBxeprXt2/zV/NY4UPLTFG270gzzb+GW
X-Gm-Gg: AZuq6aKL0a4Tjd7W7JkVK7XcyRv1ZB6Os71f9b9TAWD7bbaR3BZaKgv0A4PtX47a4FC
 wDLYNbQX9Vx02QrnjfLedgCJ7TPDDncKqtamanzkc1L8xQM9dGfmQqADWUlqmUWaN+5vSVBrEcf
 M+847dlLmO5j6G9EnlBdM6rLUi/Cdd+ueSJCH50Nn9o47J8AVybVywJ0n/ILDLJqgxi/M/dalzC
 rZEVoifb+tYSHRR+qagK6dch3eKF05aASeXnslS2IhDwN4AMn7pdaMeDnxdmdSjlOtsxw2i+G3B
 huwb8LnEKoWP0jH/3MPrS0zE2+W8cNADD2QDkkPdbLVVYtvgg2k9NWGCxOhCNpG94YXTekdh5wR
 QwPbsRsUYMXNQQkShyDTTrvTTVXjTD985t/v2yUC4e4pBcA6y7Dg2kt3JnVecXxd2afG599HwAs
 LddsFFxUyajge715d1vPCEh4c/o7R5njMkvuKihlk4LErTD1rATMLo
X-Received: by 2002:a5d:5d08:0:b0:435:ae10:cf92 with SMTP id
 ffacd0b85a97d-435ca0ecc8dmr9112414f8f.8.1769461720426; 
 Mon, 26 Jan 2026 13:08:40 -0800 (PST)
Received: from Timur-Hyperion.home (54001FF2.dsl.pool.telekom.hu.
 [84.0.31.242]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24acdsm33940275f8f.13.2026.01.26.13.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 13:08:40 -0800 (PST)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 Christian.Koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Ray Wu <Ray.Wu@amd.com>, siqueira@igalia.com
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 01/14] drm/amd/display: Use DCE 6 link encoder for DCE 6
 analog connectors
Date: Mon, 26 Jan 2026 22:08:24 +0100
Message-ID: <20260126210837.21885-2-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126210837.21885-1-timur.kristof@gmail.com>
References: <20260126210837.21885-1-timur.kristof@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F1A4E8D88F
X-Rspamd-Action: no action

DCE 6 should use the DCE 6 specific link encoder.
This was a copy paste mistake.

Fixes: 0fbe321a93ce ("drm/amd/display: Implement DCE analog link encoders (v2)")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
index f0152933bee2..068fb1df8d88 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
@@ -734,7 +734,7 @@ static struct link_encoder *dce60_link_encoder_create(
 		return NULL;
 
 	if (enc_init_data->connector.id == CONNECTOR_ID_VGA) {
-		dce110_link_encoder_construct(enc110,
+		dce60_link_encoder_construct(enc110,
 			enc_init_data,
 			&link_enc_feature,
 			&link_enc_regs[ENGINE_ID_DACA],
-- 
2.52.0

