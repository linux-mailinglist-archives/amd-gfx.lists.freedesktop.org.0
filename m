Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id unonHjIUHGpdJgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 31 May 2026 12:57:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A624615AF0
	for <lists+amd-gfx@lfdr.de>; Sun, 31 May 2026 12:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF9110E610;
	Sun, 31 May 2026 10:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="px+dIT2i";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEBF10E610
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 May 2026 10:57:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490a7629893so4613075e9.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 May 2026 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780225068; x=1780829868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vYRXPv5tN2XVnLouDMVbSByDeUvhvvD1wngQDJUyjCU=;
 b=px+dIT2iIG7RndMLmHHKPtgb8ho6JkK1d/rxhuPuPdZJ4DqWhvXp6XDvzcP/JjX7dD
 BNbawN/lC0cKVv5z3Sd164WJVW23WlpHw+hy2ZGW1eJzFDzQvbXpjAb17vNjNerm7yuM
 cQ2buOT9v4uC8RfTi6PxexqEMOaxVgCPLR9ymExof+E/8ukl/xN8vIxoskHW/tbPx/Kl
 Kck7ktwWd46ViibU0+LICHfYj61ITbm8vdNbbXz03+hUuO4ZxysGLjnlykrgphMyQ8II
 Upbm0K7vsrA2GWJ82tnIdizKdj/3j+N5fDII1lWRJ3/hU8S4YSVUftzMwbnP0yWaUTRC
 pEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780225068; x=1780829868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYRXPv5tN2XVnLouDMVbSByDeUvhvvD1wngQDJUyjCU=;
 b=DHGUwR1Ka6EdjiDJ9GR0dvVEi7jNdf33JnAj8HpPJ/+kK0vrVh5mNpAW/U17W/BhtS
 tnZNCWH1fWH4bZGhiuT3ZDCNWW9x2AEjU1YTkZSXa6uSrbzRZC59t+TKaIM3m4bWLJ+t
 wtQvh4/O18aAtOfmFDXgasbElbItIEFV7KEYnZSFpzBQcFxLm3DFvbDxqfeYeE7mqXG3
 6wq6Zi4RJDxUpVczoZ4g7Ht6SQnFv4URx8uchYZaz3zqcQKlZ6TvvxF8BwXzgQos/0X0
 XsTEElbKZZWqh407lqin8yhurQUwkMs0yh44n7qXTK01HD7LAgiv5qAUYhnG9H3tPiH7
 odXQ==
X-Gm-Message-State: AOJu0YwD27WrNtJpudHnVUFYltF8yXD/eb1rpqiG8MEvg5C0jgl+v9Vo
 OVeNymUupp/9h9zA9QONnL500SH+xO2arme0Q21ZTK4sHswQH+g6F9op5Cax5x03
X-Gm-Gg: Acq92OFZSneNzckaGoLznN6/EOx01VONm/ZVaPzsVSOeKFBzsOPtLHWHcr8qQE5H4FW
 1pBZ0R0oExhrYJX2P5akeshNnpnXa47EyqbqSCRlPByIsvTxndx5HAfIX0NVqKKdD/XUdE7xtZ+
 8m1qZBSn6ONK6I/x+sLcAZYLs/bhYhitIxa6v8gV4sQcbU7+kiTu6pUsgy55FyO0LFGiv2gO1UZ
 sefnRkEVKJwfZK8EuKBFHvx1oSSuaS4Dwcqsvj/5AVQnpVObpgSy1p2C1LsJROtWGuSzi+8k/Zh
 MXYK5KpliDvRRUL2idJTEQbDBzotr14ebr6EA5iciDioqYfbg8ajsVpBCm2MKKByG6DyqiTki1j
 B30dUoVU5bdL8hgItV7qApnK8eBZQIc00B+jlrBN8XCzp6dizDd5G2tnlo3ThaivM/YhU2nAM3B
 EtCSSsnPfoVasIt0tJK61F0h2mUvz++AOcgZcyI1WPppLBJsSBl6uSNlplLnykdmf+DDYdYhn7r
 oqghHmUQWNFtVhixOSYY84yhwY=
X-Received: by 2002:a05:600c:3b27:b0:490:958f:2a5c with SMTP id
 5b1f17b1804b1-490a292fbb2mr123043205e9.17.1780225068046; 
 Sun, 31 May 2026 03:57:48 -0700 (PDT)
Received: from Timur-Max.c.hoisthospitality.com (184.31.0.109.rev.sfr.net.
 [109.0.31.184]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68980csm192904065e9.1.2026.05.31.03.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 03:57:47 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 Ivan Lipski <ivan.lipski@amd.com>, harry.wentland@amd.com,
 Alex Hung <alex.hung@amd.com>, Ray Wu <Ray.Wu@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Dan Wheeler <daniel.wheeler@amd.com>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 0/5] drm/amd/display: Retry link detection when it fails
Date: Sun, 31 May 2026 12:57:39 +0200
Message-ID: <20260531105744.28717-1-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 9A624615AF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When dc_link_detect_connection_type thinks that a display is
connected, but dc_link_detect failed, enqueue delayed work to
retry the link detection again.

Useful when eg. HPD pin is high but the display isn't ready and
didn't respond to DDC. Typically this may happen when the HPD
pins make contact before the DDC pins, or when the display
is "slow to wake up" and doesn't respond on DDC.

The first few patches are just a slight refactor to
de-duplicate some code and do some cleanup necessary
for the retry. This is to avoid adding even more duplicated
code.

Timur Kristóf (5):
  drm/amd/display: Add detect reason to handle_hpd_irq_helper
  drm/amd/display: Use handle_hpd_irq_helper for HPD RX
  drm/amd/display: Always create delayed HPD work queue
  drm/amd/display: Retry link detection on hotplug
  drm/amd/display: Retry link detection on resume and boot

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 216 +++++++++++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  16 ++
 2 files changed, 179 insertions(+), 53 deletions(-)

-- 
2.54.0

