Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1bsjEgfjVGrmgQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:07:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306574B494
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:07:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rbi4Mjo7;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C4810E994;
	Mon, 13 Jul 2026 13:07:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1610E994
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 13:07:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493ba701891so29379745e9.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 06:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783948034; x=1784552834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JvSUIVvbfqY6QHxM6iDD2gcQlCyxcaXqMc5Jht0NXfM=;
 b=rbi4Mjo7ld+WGlU2W5NGpDsFaBFoVpzoMWgIzMZE7JGL3JrATKFJKX4fo3qn+5YJ5S
 Ct1Wn0mYal/wqbnSyKHlxIcplKHeKKDQG+jdQQu3AYpHyM4ZBYQE2ORPigKbcsmN8Ot9
 8ykL2BTmPWiyq+gy2ROyhGgrSph8zr5LGMMx53OwZUj1tZwt6M0NIimT1Nzx7WPe6/+I
 Vuq03M10sppU1Kpfl9Ouh3E5N91nslwzg1bDjxP/PByewd2WgiPtCzLN8F4g4eQCoWr9
 HsYri4/y43YQn6+Wj1nqOfSwSXBFMIjY69pAXET4fPSoKNMfMoctANm1jb8lnHyxN6cm
 6lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948034; x=1784552834;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JvSUIVvbfqY6QHxM6iDD2gcQlCyxcaXqMc5Jht0NXfM=;
 b=ph0ph5sUy6L0v0b26vysgGp+yVsE7aryV/wtY4OC8jKgWohdSsxBqg5tl+fSTMoj+Q
 g+39LOb2J6NSLM7ajBnLLbqkR0RTG/1OhFtFHScL3w1bOx2Y1t/HP0XkPe3ei+jJWUTb
 oR0GvjwBO8Fqtcwcv74eJEI7EQ5Xi55WAxmsAANBSrlDqtO2mrzMxWy+N2GIt4KjFSeL
 VDdG0h5461qoRwLRsXBbql+zQBYhjuXKooJs4m4JR/Ix+Em5XGLASwkQKUOYsJrH/AGF
 wWi/K6XV97ney+PdmHneT1DSo5nrEoWORk50SFoWynQ4ObrTIST+4MoPZdgTns+dQsY1
 J/zA==
X-Gm-Message-State: AOJu0Yydq/V1ojRjxmL6kw3lEbazDH+6Tbq5kI8S8BYoBAsUI4MJVYL3
 zufwfW2tbCVSqt1TweWcxjoJye7JYx4aPlZxlRQgbMcBtNh016gdV2Rj6CetMg==
X-Gm-Gg: AfdE7cmk6RVC4Of/yMiqqApYNF5w71UXNK5r73ftb2NGXeizC/IXclPhkEcHv67X0dI
 Wr/NKiEJRfx27GcJaFOqkoi0meDMejgLMMSfjOfr5+wrwtw2shSNgFMaXCkBj7wk5IDys7+hiCb
 EbopZizHRdAOmLYoRJTB3cdTwHYenfX66G/80auebbc4yKHEH3abqprSptsRYCYQ3MKygiG8bAR
 Zub/6jWEATCwOwqxGoTl5OCFjVE9Yri3bJdVlLehodp6flJ3PpmLn6GBUQSFXlZVTbFcPDkds8x
 brDIV9vWmgn/+7p+VpiNE6iPvTLLdfnov9JpP5qjr9+Puil8Lme7qegrbuZJv7sgcb2XANPlI3x
 Ao5gnu1YYWsX3Ef0oM5VCNycC0z/UwD+vAz4aiUNrM+md3G4BH6YwjHv5Hvd677BOGw5G+SThaG
 0O+Ru+Q+2Ah1Rt13RaPfXjlMvqQgnfjvhsKD2EYgIC4tzllyfoWWbVpg==
X-Received: by 2002:a05:600c:8284:b0:493:b647:1acd with SMTP id
 5b1f17b1804b1-493f8845b3amr99440515e9.36.1783948033668; 
 Mon, 13 Jul 2026 06:07:13 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df417sm387974995e9.8.2026.07.13.06.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:07:11 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 00/11] drm/amdgpu/gfx6: Use GFX IP block soft reset on GFX6
Date: Mon, 13 Jul 2026 15:06:58 +0200
Message-ID: <20260713130709.34262-1-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: 8306574B494

Fix up various things in the GFX6 code to prepare it
to work with IP block soft reset. The main challenge
was figuring out how to properly initialize the
compute queues so that they work well after a reset,
as well as realizing that on GFX6 the compute queues
also have a PFP (as opposed to GFX7+ where PFP is
a graphics only thing). There are also other minor
fixes.

Implement GFX6 IP block soft reset: just reset everything
in the GFX IP block (instead of taking a guess at which
parts need to be reset) to make it consistent, and
also handle clock and power gating to make sure not to
degrade GPU functionality after a GFX IP block soft reset.

This improves current user experience on all GFX6 chips:

On GFX6 dGPUs, the current GPU recovery method
always clears the contents of VRAM, which means that
a buggy (hanging) app can crash the whole graphical
session, which is less than ideal.

Using GFX IP block soft reset means that we can now
move on from GFX hangs on dGPUs without crashing the
whole system.

Tested on the following chips:

Tahiti (FirePro W9000, Radeon HD 7870 XT)
Cape Verde (Radeon R7 450)
Pitcairn (Radeon R9 270X)
Oland (Radeon 430)

Timur Kristóf (11):
  drm/amdgpu/gfx6: Improve emit_cntxcntl()
  drm/amdgpu/gfx6: Fixup emitting SWITCH_BUFFER packets
  drm/amdgpu/gfx6: Use PFP on the compute queues too
  drm/amdgpu/gfx6: Initialize compute rings before CP start
  drm/amdgpu/gfx6: Clean up rings during reset
  drm/amdgpu/gfx6: Execute CLEAR_STATE when initializing compute rings
  drm/amdgpu/gfx6: Properly enable/disable priv_req and priv_inst
    interrupts
  drm/amdgpu/gfx6: Adjust how harvested TCCs are set up
  drm/amdgpu/gfx6: Use COND_EXEC
  drm/amdgpu/gfx6: Add IP block soft reset implementation
  drm/amdgpu/gfx6: Enable IP block soft reset as a GPU recovery method

 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c         | 403 +++++++++++++-----
 .../include/asic_reg/gca/gfx_6_0_sh_mask.h    |  32 +-
 2 files changed, 316 insertions(+), 119 deletions(-)

-- 
2.55.0

