Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB11FkjZBGovPwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 22:04:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA553A4D1
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 22:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C2E10E177;
	Wed, 13 May 2026 20:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qkMv67xb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C6A10F047
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 May 2026 20:04:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43fe3e22e33so4371872f8f.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 May 2026 13:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778702659; x=1779307459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s/UgHKJ8AfymvmfqSR3wiinEgGLhCyf35eJqFkavxdM=;
 b=qkMv67xbTrHBx2qtKmTpzWLz6+hA1gWn68NsCdN91YhD6HiRoriFv2XNjg9MPK1f/2
 JB5ZgP5DvW5jmCo5MqDvsCjddfpvuBisWVM0V2AhhRO+aDLZEmHmcM9qIcMpl+dgyVKK
 ZKs7nWD9UdFjKhsRJ9Zx4bLCDe13C0d2RHZV7DDWJbipv0h9OpXrTHOyiygpftNJkM34
 8Q7EqJFRKZYfDdNiv+gH85nsweav1CZqMeDe2Qq7MWRf4jh53c8WS0fn1lkeeAjlVLIo
 l30SM0akJkQ3tkZmTkN3VutXhuPJ+Wmu4PhBDYz6wKh7YWGlfC/MGBHbwYYaSa7uTYWy
 YTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778702659; x=1779307459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/UgHKJ8AfymvmfqSR3wiinEgGLhCyf35eJqFkavxdM=;
 b=r17RXgNl7UwL3qfYgOAvtxC7KCOrlaNyVgkB2R+BpYhTsCuP4UO7FUtkI9H/nviHsf
 cX/TnnBckvb1ZSBf7f/IJarjhtX5/CtGbgO+00tNvIVv1W9JsGXfD2OAT7uO3DinFT4r
 WEPqFN31UWqz/I6qEu6DNFg1VFp06zXZ53fVIVcxNQeD+iHiY4U1QG4uaDxKhVJdNzJY
 YC3ftzXzilc4Vl71hi7lQZ2IEoSMNKU/LTOHjnkgZ3Bemh2g/bbDbnkEV2bnceDXfDnE
 ppdtdLvsh62i7TWrciF3W5EaPACILCtDNsJv9LorxMw4+vmNNbXkUBLuoPMxJXG99z/b
 +Zyg==
X-Gm-Message-State: AOJu0YwLexGK4vyN5mR8wDHYvpEju7KOpM1noHZdenK1EDx/mrt7kVDA
 esLwN3/X4E0mQ2ykjty35M733g1ko3aPQFNlK6sahXVav3kq87f9WpOkKlFfdA==
X-Gm-Gg: Acq92OH+gi3TlwiJz8m4h0DHfOyWgpnbOpriZ6mmImUoe8T6xceMnGZ1j0ZfLTh75IS
 uaJlsm+sIBEz9Tomw7A/y5gDkLGSnqcN2oYxX/sH2oYSyIoYKL8qi/fF+zIyraRxtk9cg8ew9JE
 U5+CmrpEL6gTKr24leJ/qJoz+55WWNDEDZ72AD6+J4atRBle+t+YVMHQSBjPl36dpi9kISS7Bld
 cN/Hf3gYHSdEvda9yNWD8CVGw6jtkoUBrpkizUOFriF8MEpkDQTD2fHGH+QSXQWkzPLqv/MB7cR
 +0coamSJXWeaN+L25V8PwQvNsAfrlhwBzXcCczbFvpRaFgoE6FsBfsLL1nSNN7hIxoASNwwSFSJ
 hEmbgXj7xDgraCCs4YLOcLeOfG86bWqVwXjqSHXDWxCbVmPW8XZKnZePKFpFawSDTwBZvj15wgO
 hinoP8OOxQRSSFwDwtgkq8ug2x2nUmxx27ALdjd27pMQkPir2liLK3JV8rYCckSNNqWCE+th4qr
 4s=
X-Received: by 2002:a05:6000:3111:b0:44f:aeac:5f66 with SMTP id
 ffacd0b85a97d-45c59fb882fmr7378110f8f.31.1778702658884; 
 Wed, 13 May 2026 13:04:18 -0700 (PDT)
Received: from Timur-Hyperion.home (540017BE.dsl.pool.telekom.hu.
 [84.0.23.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768c4fsm1257463f8f.8.2026.05.13.13.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 13:04:18 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 0/9] VCE1 fixes (v3)
Date: Wed, 13 May 2026 22:04:07 +0200
Message-ID: <20260513200416.35631-1-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: A1FA553A4D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.75 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

Fix various small issues regarding VCE1
and the workaround to ensure the VCPU BO
has a low 32-bit address.

These should be included in 7.1 because
that includes amdgpu_gtt_mgr_alloc_entries()
that exposed these bugs on VCE 1.

Also fix an issue around firmware size
and offsets on all VCE versions.

v3:
addressed review feedback,
dropped patches that were not reviewed

Timur Kristóf (9):
  drm/amdgpu: Align amdgpu_gtt_mgr entries to TLB size on Tahiti (v2)
  drm/amdgpu/vce1: Check that the GPU address is < 128 MiB
  drm/amdgpu/vce1: Remove superfluous address check
  drm/amdgpu/vce1: Check if VRAM address is lower than GART.
  drm/amdgpu/vce1: Don't repeat GTT MGR node allocation
  drm/amdgpu/vce1: Fix VCE 1 firmware size and offsets
  drm/amdgpu/vce1: Stop using amdgpu_vce_resume
  drm/amdgpu/vce2: Fix VCE 2 firmware size and offsets
  drm/amdgpu/vce3: Fix VCE 3 firmware size and offsets

 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  9 ++-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 64 +++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c       |  9 ++-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c       |  2 +-
 4 files changed, 55 insertions(+), 29 deletions(-)

-- 
2.54.0

