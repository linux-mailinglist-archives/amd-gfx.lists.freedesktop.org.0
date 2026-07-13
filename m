Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QOq2AAfhVGpCgQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 14:58:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D0174B2D4
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 14:58:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fQq6PVbk;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A74610E5DA;
	Mon, 13 Jul 2026 12:58:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C248910E5DA
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 12:58:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so2872012f8f.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783947522; x=1784552322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vaUeSmuhCiA7lSR97QWUe7zZrHPEX/LCCaBX9k0X5nc=;
 b=fQq6PVbk8tfOG5oEMrPUlplkBMBTtr9lVkuXOkt7P7YIKgdyrm093U/atLgt4VDNNd
 JzexEn1hDiP2K5FgZkIIFg7m3An3xtafxYDZrnm+75JXJeDWCroHmGOf89LzIaLQ2Ym/
 sH5tiUW0t+yUWmeSQ9VA1DhFZYMRPBHBE2NX32FQQI6+P7nlLRnODvEhggrVtp/GAnBX
 TG8VbG7c/OVo/C5cxQbZ/Cdn3bKGOmehbvIlCvuBw1EXLmUASjOca/Ieni2ScWpm+/nV
 NL9AboOOwcYh0BY1EMaDBliwEma8gUAOkiBkbPqTo9gTidqCFCMc5fUTo3GoGfElWEv9
 lscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783947522; x=1784552322;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vaUeSmuhCiA7lSR97QWUe7zZrHPEX/LCCaBX9k0X5nc=;
 b=dpZuM4ekCH4fDJBkgmXd/+ErWWsqT+M/ba7jgHBuTSmYIKvxNPbhHxZeXerbyO9+28
 TVCZbBdsdVGRgxYBbs8uPSGeDNBzQv3C3aBD1hI3iQGBIxMFhxB4/nNN9DTLnClFoJjs
 NR1O9yM1YZyx9xc9vQUZB+3ZVZg1nfcdJsgBh8Dbu7YS2Lg78v+Wl15BmCIW6LPoBm/K
 ughT+eyszQrjldzcx3Dl1VxxIXcN1C/Cy60EgYIIDkTmvTOkbBKJuUBp/40+WXX9CXpm
 qVwu0IGfvcd0c3BZTFOsSJGeqwO/PrsIgFm3yTUVaetBD/sciUiAxRCp5bBRnrqc7X+0
 +POw==
X-Gm-Message-State: AOJu0YwecUcCDRQug/i6fHsULiJ08cNJca1rl9g+9eHKnyUe4PLqCYe1
 VZg0k2SR8hrERxvt4sFbbAGy0wfrmSCS09xsSScGwXALqP0eEvLVs8Qn77ebhg==
X-Gm-Gg: AfdE7ckjxrSr92lhdYJYnzZoTAhzjt3xtZJedWceoowq5JNyfDL1f174gcffnsD/z9l
 CSrv6Bb2g8xZ53k+G0UCxWCAciECh/DSDPZRoq/vsrChKDOc5miODYKQ21MpiUcwmh1bk27SfC+
 gSC88GLObRzBRAq80VGOI8OLFyhOiOV4Daq1YrTSX52676ZFTCWarjBTlpI/ghvjtPdqbzk03S1
 w1fuhX/CAcPlfnr4NFo8VlSgRJUsaQpHzTartr4jH5rvT3UmLOuL5mZmIF7XWK5vBQbg0p1s2UU
 lXjPfx1vyXvvMxYkxg8a5rLdiEQeTp9lh8qEaeq4iJdlmIj/aAfOMvR/Jlpbp1eNER81HXVFxBZ
 m42UH5pO6Ys/d4jExzbFethJzfHkF/7xRtp25mRkv+o+b3+LpC+1/bLYbTVichhaVLanfyZThaM
 Eyx+XEzoXJQvlSesKM1JzfZupn3aUAZstmgDN9XxUPDpeIMxWwJc2Z1cgtJRTtHlBH
X-Received: by 2002:a05:6000:4381:b0:47d:eedb:ee62 with SMTP id
 ffacd0b85a97d-47f2dcb50f2mr10638564f8f.14.1783947521745; 
 Mon, 13 Jul 2026 05:58:41 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6e4csm80456918f8f.10.2026.07.13.05.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 05:58:40 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 0/9] drm/amdgpu/gfx7: Use GFX IP block soft reset on GFX7
Date: Mon, 13 Jul 2026 14:58:29 +0200
Message-ID: <20260713125838.30607-1-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.55.0
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,ursulin.net,gmx.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82D0174B2D4

GFX IP block soft reset has been implemented as recovery
method so that we can have a way to reset just the GFX
block without resetting the whole GPU or losing the
contents of VRAM.

Fix up various things in the GFX7 code to prepare it
to work with IP block soft reset. The main challenge
was fixing up the MQD/HQD handling to ensure that it
doesn't hang after the soft reset. There are also
other minor fixups.

Rework the pre-existing GFX7 soft reset implementation
like the reworked version on GFX8 to make it more robust.
In practice, this means that it will now reset everything
in the GFX IP block (instead of taking a guess at which
parts need to be reset) to make it consistent, and it now
also handles clock and power gating to make sure not to
degrade GPU functionality after a GFX IP block soft reset.

This improves current user experience on all GFX7 chips:

On Kaveri and Kabini there is currently no working
GPU recovery method so those chips currently require
the user to manually reset the computer when there
was a hang.

On Hawaii and Bonaire, the current GPU recovery method
always clears the contents of VRAM, which means that
a buggy (hanging) app can crash the whole graphical
session, which is less than ideal.

Using GFX IP block soft reset means that we can now
have a working recovery on GFX7 APUs and we can also
move on from GFX hangs on dGPUs without crashing the
whole system.

Tested on the following chips:

Bonaire (Radeon HD 7790)
Hawaii (Radeon R9 390X)
Kaveri (A10-7850K)

Timur Kristóf (9):
  drm/amdgpu/gfx7: Make amdgpu_gfx_mqd_sw_init() usable on GFX7
  drm/amdgpu/gfx7: Refactor MQD initialization and finalization
  drm/amdgpu/gfx7: Return error code when compute ring tests fail
  drm/amdgpu/gfx7: Return error code when failing to start GFX ring
  drm/amdgpu/gfx7: Fixup emitting SWITCH_BUFFER packets
  drm/amdgpu/gfx7: Clean up gfx ring during reset
  drm/amdgpu/gfx7: Use COND_EXEC
  drm/amdgpu/gfx7: Fixup IP block soft reset
  drm/amdgpu/gfx7: Enable IP block soft reset as a GPU recovery method

 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c   | 333 +++++++++++++-----------
 2 files changed, 181 insertions(+), 154 deletions(-)

-- 
2.55.0

