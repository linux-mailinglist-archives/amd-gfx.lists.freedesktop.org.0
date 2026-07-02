Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CXykOpBfR2rrXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:56 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A38C6FF64B
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EcGPNAat;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005A810F68B;
	Fri,  3 Jul 2026 07:06:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFCB10F2F2
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 11:28:34 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-380f3c1b087so39739a91.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 02 Jul 2026 04:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782991714; x=1783596514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vwpv11A8Wqk34ZvqVFhL1Yv/Rbg0bjinwLUWjlhF31w=;
 b=EcGPNAat4oLuA406gmVGA7c4OaI7UU7Nlr4iz/qLZNnz3xvCPxTfXSIltLoxJIpo+3
 7U2Lmzxf4fTNgrJmTScdBlkcLRT+m9Ul0VlvYHTGVe7xFstGeqxx4bPX1UYpepr+Jj5P
 jMida/VmgbS2kksHtTBFYxkAyNaAYLpq9Ha2s0ACDzKxO1XdMw4yQMdNvSOX64lDKzfo
 SXv5hg/Du/wbDOWmvWr6cClG5are6tDUFNS/kK9SX3zJ5Cn2TvvtywAh98ofmo95aVtA
 aQq5DifiG63DyGHEXLpzMc8nbi7jIFs9Z11d/DsCLdBgk6v1/7uedUR2b3k0U5zYtvsL
 c8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782991714; x=1783596514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vwpv11A8Wqk34ZvqVFhL1Yv/Rbg0bjinwLUWjlhF31w=;
 b=ekC1z+8WRn2vd7x4amWSof/3CJuQ0ZfsiIQDQCl1BlRMDxsO2EblOIS5qMeno+xN3U
 ahTGRBGCYTMNDHuQKSCN/Ti1mQpKiKLChoWncqjCNiIi6jF8Xd/474PTXopLwYkYM96y
 MkLATNNrkBgTjHn6Mk0B1beYN6UQfMbNuMNR8rQtmIFQgVYRaJTPDy2B6HCcbFp1mXbK
 hAmy8swiMPwOeUku1q4OoxooG6Vjly19zEfKKpHcg87JfSawa+9oyhFoYLCm4ti+NN9t
 LTJg/A3GrIFTv2Bf4/z1PV5so8qXDWpCk5XrXQxbc6R+VDG0HLTRKiYrCTMiYE2PcbN9
 9ESw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpyzQbmLJ/cHNhuu3svTbP+c0KbXWVhxTgoDbp4qY0Kpc6IO+clrc4aEMHaBDFfMlQ1zicQ6SUn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiQwD2xFq9/6j8b8yKQeweDMJS1PJZDEep5azwwvpiXFrtoa7E
 3eyXYZiSQKYXmyV4kT5Ijm1ub12TtJ/qC6AgpCl8tkevxSYDpWeGBFDP
X-Gm-Gg: AfdE7ckXn9N+sSJ+FuySwgfeDacRopzVCn5O+328/B2Nq1tYDktz18obBLUIaCpXzE3
 /YR2eyxcPmz/HWqJibtPMt0NkSm9Gqa+XEepXFic5i4xG1GL3FjFMys50PMAyXKC9XcQoYCID5+
 U7gd3vzUvVYBTsQydnPjR8FQjBTLXGd84TdaKltpvuxQGpPsdeqebSInUpEti1cHbn18viu9g/w
 PG1dbRinzBwlaO1IqhTnDkrkzc8BXHGFCdmj+H8SN0/+VDva2N9fAt8O+l1DpK3zGEZ04+qNXz0
 143H6KUjll8UtlUEoNXN9eMmMdEuuj8QLY+tdl3xSvIpg8fPS5fXwxTBO3II5/aZQE6QjteNMbK
 Jiho/imO4MOgrPAPInWww/C281+wzPj/TdQdvkdsPmQKw/FP2IjcvOJ8Z33PzLIiShxyP7W3pP5
 poGPCebDog12rt5P/UtA6cR9NaDJrFhEO8sb1dLKrCv5DotcgJQkunaWM17GA7Eud3TsWy9r/2F
 FLIMKkxdBKBTFgYRsW9nTwcEB7S3JxVtp0hQbKO7umFaj+3AnWXwaU+CnOg/+80mfcUv5w5bL71
 jg4E6t0aho8oy7wZ5krH420pdVgktoLcZ9iMnb4jLdyQ/TSs
X-Received: by 2002:a17:90b:258c:b0:37d:f70f:fbf8 with SMTP id
 98e67ed59e1d1-380a9e471dcmr3852595a91.0.1782991714179; 
 Thu, 02 Jul 2026 04:28:34 -0700 (PDT)
Received: from midnightair ([2401:4900:1c94:62e8:bc10:77d0:2fda:415d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-380e1636a03sm954793a91.1.2026.07.02.04.28.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Jul 2026 04:28:33 -0700 (PDT)
From: Anas Khan <anxkhn28@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Peichen Huang <PeiChen.Huang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Anas Khan <anxkhn28@gmail.com>
Subject: [PATCH] drm/amd/display: remove duplicate link_dp_panel_replay.h
 include
Date: Thu,  2 Jul 2026 16:58:28 +0530
Message-ID: <20260702112828.34698-1-anxkhn28@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Jul 2026 07:06:48 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:siqueira@igalia.com,m:PeiChen.Huang@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:anxkhn28@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[anxkhn28@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[anxkhn28@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A38C6FF64B

link_dp_irq_handler.c includes "link_dp_panel_replay.h" twice. Drop the
redundant second include; this is a non-functional cleanup flagged by
scripts/checkincludes.pl.

Fixes: 1e5cd4adfc54 ("drm/amd/display: move panel replay out from edp")
Signed-off-by: Anas Khan <anxkhn28@gmail.com>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
index 54ce768ae6ad..da679fb7d89c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
@@ -39,7 +39,6 @@
 #include "link/link_dpms.h"
 #include "dm_helpers.h"
 #include "link_dp_dpia_bw.h"
-#include "link_dp_panel_replay.h"
 
 #define DC_LOGGER \
 	link->ctx->logger
-- 
2.54.0

