Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABx8MGEOuWk/ngEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 09:18:41 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746CB2A5731
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 09:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CF410E591;
	Tue, 17 Mar 2026 08:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aC4KBnJ2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CADA10E597
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Mar 2026 15:43:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a133502accso5888917e87.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Mar 2026 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773675815; x=1774280615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jR0mZwx1CUBh145iaxjHuZaYgzh6NU6OLeScv/p5yO8=;
 b=aC4KBnJ2xwe4SCwlTFOUBm98UqH19kI+QNq22/DslKBLQY3o5D9DPIqRhm/GfhjqN0
 gKL5pT9Srs4BCZbP9eyRB5YwvSAqAin1I8noLcWgVLcuZoL9NY51vqjxNghChRLkrMI+
 Cm2A9gb7IWmgaxh5uEZvBwESCf0kvCYjcckHbvVoYhRkAB2MsAbO1ILgyzdVj+56lXyx
 FejzLWZXZXyOhYnd8dWZ+HjU2V4uvhvmv1xNAII/nSCNTF42QYEiCAIDKoOUQNPe8dFx
 Nzl63TSM7iAOR9QVUzjDTOF/CVl2z2A+u5uFZr8ms+/gVrLL/ueWYY8TcYtKMvtWB+F/
 jSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773675815; x=1774280615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jR0mZwx1CUBh145iaxjHuZaYgzh6NU6OLeScv/p5yO8=;
 b=onR+GhKDo6JfB39Ei7y/ghWGvTh03FsOuauuObv+y8rCT+LfLXcmdW40uLSjE0c+sT
 U5vfxtf4hQxr5Z6V0m1AT2Rp52nH4KhNxgO7KnZUzN/dXGkKtkNjsMKLOoDimhcPUTBA
 bbuK99nb1dpM5MMpqondjCkLCV9jDrvQ4sKyCVyD+vqUezqnxtaE0gh9c5eUf3BOR4Hg
 ALw74rSIuMMXXm/iad/n/7GMcNdORPGMzQGBVrpbRMEg+x/pf7rjXQ4itdIFAklEnVit
 IpG7dJMGW+Y2R+jG70iZ2akKeAyw58qj1MHrZDi/vyZSes7fLWScIw5SKyY7Axa2cDSx
 0Gtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWnhzwzf2OjcmJjQGxFM9vwALZfm1Ys2VIqO4w2qCcRm1VqztKkSeqkXnz6lm+eQg+IO8llhHt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA73G8GWASEJoegC4TLFY15b4fbniL2OjEeBbcra1HHkV17Ajg
 8Xz329MMurynYgsH7w/wurm9HMEZHSSFjcE/WY651/5XkRif8ipreF7x
X-Gm-Gg: ATEYQzyi4JgQI4w9ziRVBYRrWCaMpaPBgo0HlZK80y0qj/8+T8qH0qrD2fJk1/AD4g2
 0+OF1SSfLyw5v1c4mYibrU1TxUzqDlNGvPt4ND+XmiutVKFLHlHlDgNBUkmX7l4IRxHCnp6lrjd
 zxLm5CCgkFQ8L+SGoPps701pL1YaT2Xd2K13LbwDZVouRbncN+QbNZHt5gd3vSzHqoqgQdp9Ps8
 KTTf5REitY5KE9cdktiFAguJdyhfg3EBslOoA9YHl93PvJvpNfJPOM3g0g+/jeQJwylk2wpZc8R
 hTuWHb9cX5XpyWOv9NPo6fuHirg+U/zzFpSXPMGMdC3urCXOt7hw8O4wS52aHStz41zwh+Y/yst
 yJfQbpuJiZD2I03fmWuv95cARy8r55hVghd2aLvsZc7HQ2bCJLjKh+X1G+OEjmGGkZPkBh+4Wle
 sZ0fj1gSn7g03DQCdw0KEjsAh3phsSgmwIkcopP37Ct3QdBE2ZwtYsoH5v+QRGxxKID3f5xsZ9g
 JafyxNR/IyzH1XFbb69qJT3C9QbvxHgvCbUFcg=
X-Received: by 2002:ac2:5b52:0:b0:5a1:2c43:79be with SMTP id
 2adb3069b0e04-5a162b32696mr3402250e87.39.1773675814241; 
 Mon, 16 Mar 2026 08:43:34 -0700 (PDT)
Received: from rhel.homenet.telecomitalia.it
 (host-82-51-8-214.retail.telecomitalia.it. [82.51.8.214])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a15636a96bsm3600435e87.79.2026.03.16.08.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 08:43:33 -0700 (PDT)
From: Adriano Vero <litaliano00.contact@gmail.com>
To: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com
Cc: alexander.deucher@amd.com, siqueira@igalia.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Adriano Vero <litaliano00.contact@gmail.com>
Subject: [PATCH] drm/amd/display: fix double 'the' typo in dcn4_calcs
Date: Mon, 16 Mar 2026 16:42:55 +0100
Message-ID: <20260316154255.18637-1-litaliano00.contact@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Mar 2026 08:18:20 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:austin.zheng@amd.com,m:jun.lei@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:litaliano00.contact@gmail.com,m:litaliano00contact@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[litaliano00contact@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litaliano00contact@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 746CB2A5731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix a redundant "the" in the prefetch schedule calculation comments.

Signed-off-by: Adriano Vero <litaliano00.contact@gmail.com>
---
 .../dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index ca5ac3c0d..15f19891c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -5625,7 +5625,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			// vs the latency based number
 
 			// prefetch_bw1: VM + 2*R0 + SW
-			// so prefetch_bw1 will have enough bw to transfer the necessary data within Tpre_rounded - Tno_bw (Tpre is the the worst-case latency based time to fetch the data)
+			// so prefetch_bw1 will have enough bw to transfer the necessary data within Tpre_rounded - Tno_bw (Tpre is the worst-case latency based time to fetch the data)
 			// here is to make sure equ bw wont be more agressive than the latency-based requirement.
 			// check vm time >= vm_trips
 			// check r0 time >= r0_trips
-- 
2.47.3

