Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NqytF4DzVWoLwwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:29:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E6752679
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="kRYOFmK/";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8039B10EC77;
	Tue, 14 Jul 2026 08:29:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DF010E64E
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 18:38:55 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493f2e39e81so13573785e9.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783967934; x=1784572734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6DtghhdTtGAGyMOfw++Q+YSFv47tiRopnFCf1YJmgL0=;
 b=kRYOFmK/w00DA/N22XKG3BrjyFHIENc1RMKApJGXCTADdtzPiiS1iWaOSNV1ICX1no
 9G9dbJTnR3/ToubA3WPXIuzP5+XkGN+Q0pGESE3Ioa/4HyE4ANF6NhcUcXQt01m5KZTg
 Tpw4aFb4bYp1QwDCwguVpYsvGIY8FtYgo24y+8TPn725WsJwipHcjVRdF9YeNGFRxxD6
 Jt5C94XiJ2PMcqI07OPV0/ChcScfrKMXCjxEqESkB9gaboIguYJq4Aw1+pE/y83tj2LZ
 Mci8a+xos2rJlRiI2P9ONtMjcyk5A5VhDswkZudqKBd2qgutnhZOqIcAR8eNsjp3xzYY
 8tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783967934; x=1784572734;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6DtghhdTtGAGyMOfw++Q+YSFv47tiRopnFCf1YJmgL0=;
 b=M6zE6/u7pQsfnfD7LC3HKRFlqKvHHjlsmXv9w8FyggaifjjQ3mGlv843pkzNbp47qA
 RrnU8nXRvUShhvCLBq1pY+hGLVXvE+FQK+9HEaDhi1Enxwggr0jw3RAdAYjhZnSxkp5+
 g0/ZjZw/GBdjyCBF04Fu2esKT+DUZIhKGqPK6M1/cw7N0i85YKJ7dho5pgcNr0EVZ4ET
 nJ3VljM60pSsStTzlYpKPU5fulXRalDCNhtZlE25e1bluhzE79T6j7AiKD4iQgglzg0O
 Tu+zSR5UCOsDFHcGq8wMBJ9Ktof5HKVQq8Biw50iVoMzGd0u+DR3hr8/v5wQiA4z0AdK
 CLxQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5NBEnEtohiwgbnwtO2DttfiRf4PUxbP8PwHMs5YWsI02UoR9IAVOhxJmzi3TZIRyuQhfbDQwm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybCghZ5Hwzbsa5CWzbepIx7ztTcTtrg58xjQoiuR/SjcJ0LiR8
 kd/bph0jGtpy1LxXp+2WJo7Z/MpRuSJbtPh4pR8es/ByobGmujFYmMFP
X-Gm-Gg: AfdE7cneBhb6l15onBverkyK6fAlbt26xzufNI3BJstPdgk8O5iDKBZy/+Xyi/obfea
 JazWg/l8UcpmTbppDaja32en5jT+sFyS+SiCgVOearSjkwfrIbhkt7GRB0GdwufgWSuoAgCS5a8
 IlSZFIcL0GPzIiY+qdCPG/SpMqGMx+6b2Vj+Jz+ghXYdM0qa+hFrPVKOseqontv6gTr9C4ULXTn
 vJhypydyzr+E+yFTYFhV4v0pmwgi2JoZ8mHXH1tTsEU4TwfOtnvm6lDNe3yZGwIkblNtXj8OHq+
 8TcR6UCvpg4zXE77p9niASnxL5yRKMqmLrAW1UDah8VvmRpd0r/KJEp7mnPJJ1Q/PNbmlkOG8Wr
 +2xX7tW779IY4TW6LTqABAiArvy5YsqrVHoEeKOvueKzalOyLQrfG9/xjKnSaRGnKNZqecuAqrw
 aiFRBC6JmxdEpTBJcrq8pOUCCrF9P3zIeRsYbsWS4=
X-Received: by 2002:a05:600c:3b0a:b0:493:f6f7:299e with SMTP id
 5b1f17b1804b1-493f88241d7mr105526565e9.20.1783967933785; 
 Mon, 13 Jul 2026 11:38:53 -0700 (PDT)
Received: from timo-z13.fritz.box ([193.30.163.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508727f7dsm14702455e9.4.2026.07.13.11.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 11:38:53 -0700 (PDT)
From: =?UTF-8?q?Timo=20Pr=C3=B6mer?= <timo.proemer04@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Timo=20Pr=C3=B6mer?= <timo.proemer04@gmail.com>
Subject: [PATCH 0/2] drm/amd/display: Fix missing HF-EEODB blocks in EDID
 copies
Date: Mon, 13 Jul 2026 20:38:39 +0200
Message-ID: <20260713183841.5921-1-timo.proemer04@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Jul 2026 08:29:45 +0000
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timo.proemer04@gmail.com,m:timoproemer04@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[timoproemer04@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[igalia.com,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timoproemer04@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 098E6752679

Fix an issue in amd/display where devices with HF-EEODB blocks would 
be missing these additional blocks during EDID reads.

The driver previously used `edid->extensions + 1` to calculate the 
number of blocks to copy, but the base extension flag does not include 
HF-EEODB blocks.

Use drm_edid_block_count() directly to get the true number of blocks, 
ensuring that HF-EEODB blocks are properly copied.

Timo Prömer (2):
  drm/edid: Export drm_edid_block_count()
  drm/amd/display: Use drm_edid_block_count() instead of raw extensions

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 5 ++++-
 drivers/gpu/drm/drm_edid.c                                | 3 ++-
 include/drm/drm_edid.h                                    | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.55.0

