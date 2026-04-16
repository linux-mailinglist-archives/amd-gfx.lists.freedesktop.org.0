Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGmbMwtG4WlErAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 22:26:51 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6754149F1
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 22:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B16010E232;
	Thu, 16 Apr 2026 20:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="s6Mk943N";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4755910E234
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 20:26:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso78818115e9.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776371207; x=1776976007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wWYD4zZwWCneVW+voHOpKa3gYiSFeLXB+uMjyI215+s=;
 b=s6Mk943NwLI3uxYJOXuCERo/XQzWHiwjvPGv+w/FoMkZ2sJDyDjyuIG+pIcrfqtdiR
 RQFd7q9iyH+gb9lW+gu63nZUFcbD+6nkbQ8Qn373xXMgBOvTqvjQxVIO69T0mQkvofpv
 VkDT771oSQPHRvifhw/PjRtHvl8SC/vIWVJoZoAYS7O+xDw6s2dGVr2FHaXYRoEBZGSX
 PqLqNSJgO6HrVQHjfKfDl4S0Zyo0C/Q3xUgabj5UEoYL3RLRJRG8IfqRx51LMd22yLHf
 RDMvnRscqHViRCYZTZf14Lw3NL71i2skl07E6+hhv8+xeO3UyHTi9aQO6wPYbJeRxnsR
 zjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776371207; x=1776976007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWYD4zZwWCneVW+voHOpKa3gYiSFeLXB+uMjyI215+s=;
 b=JeOahgfdXwAuvrkJ55LvnnCYl7t6NHRY+wwQUs7IVDDujUa+BjIUMa1uLnA9CpbUq6
 zILwZtGHzx0tJHjh7gZRpdCmr0dkV0r9wRoYQOQVr0zoz64/fPSpKxK80kLCD81rOn7q
 LoLrdoWYUWkB9396qm/DxxLVc+iqmlMP0DN+xz2acCNKRsJGABql4y7mC+gLmOrsP8Op
 A57LCHkKZwQr6fA/FxzruSrCN0ah3vDgJ1cS1kK7BGekiC89u9L+wFu0hH/1vz0isHoi
 y5p/jnj57NnCx/BSdKKtLp8E85DZXHCzpUabahL6svEnGL6hXHDLecJ5loBJCFQqYHRj
 sziQ==
X-Gm-Message-State: AOJu0YxLxBERqI7v2jY11+tN52hXb/HYIOsLOLHsGd+HX7AGMO/e4Pgp
 I7iebhunAe9BamkPD/Ured1TLqIRrbgJfnUVhjilpUB7UUidk5aKV+rQ4xH0YA==
X-Gm-Gg: AeBDieta24f5GOaqX9FQwBJWSNyo+++6ugnw90hnAJ4vesmSgmIZ75Gw/ZQaEnmVe58
 rc4ugGDzVwDIr7cCnXB7G9wF0OOtYIe4mBaIM342YfDlVSQH/+yeKWDv2zkZopcw8vLIL9dHIEN
 P/CMOET8pbg3dnlpN2RaP6XuN/F8CGnk20kpDDGvPVGPPmxWfYeaEWwPKuOdWu8IJrR/Eb7RIRe
 LeFP1g/8YZSrdP6cSiCutLmaEKTS/PXuQERbYqVaiBhALFzxc6vXTWbFHK92V2fqdh2zkcGcskW
 vmAKXYfTqEg39YWyb9zedWZeCz9i8b+XgWeESApixkYwubO6oauSfbaa2g87jD49bWpk7RNKWpX
 dKIekabegbL+YpQpk9slaIHhPFkMFqGHhfYcDk89FpLlI3T+pt+0VZ+GGsRbGsfKphONJ33ru/X
 pvUpkOjNxqDUWV1qMgjCfZt2Cxb2Df2a5Sg4YKpyf4DTWa9lGONJkocksuB2QUuYJGDu6YRaq5+
 A4DOw==
X-Received: by 2002:a05:600c:83cf:b0:488:aa3d:fab1 with SMTP id
 5b1f17b1804b1-488fb76877fmr1411615e9.17.1776371206433; 
 Thu, 16 Apr 2026 13:26:46 -0700 (PDT)
Received: from Timur-Hyperion.home (5E1B98A2.dsl.pool.telekom.hu.
 [94.27.152.162]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f581b9fbsm76941355e9.5.2026.04.16.13.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 13:26:45 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 0/7] Various SI fixes, fix Radeon HD 7870 XT
Date: Thu, 16 Apr 2026 22:26:36 +0200
Message-ID: <20260416202643.25350-1-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3D6754149F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes amdgpu to work on the Radeon HD 7870 XT
which has never worked with the Linux open source drivers before.

There are also various other fixes related to GART mapping,
the VCE1 workaround and a UVD fix.

Timur Kristóf (7):
  drm/amdgpu/gmc: Fix AMDGPU_GART_PLACEMENT_LOW to not overlap with VRAM
  drm/amdgpu/vce: Align VCPU BO to a power of two address
  drm/amdgpu: Add alignment to amdgpu_gtt_mgr_alloc_entries()
  drm/amdgpu/vce1: Fix workaround to ensure low 32-bit VCPU address
  drm/amdgpu/uvd3.1: Don't validate the firmware when already validated
  Documentation/gpu: Add TCC, update TCP in amdgpu glossary
  drm/amdgpu/gfx6: Support harvested SI chips with disabled TCCs

 Documentation/gpu/amdgpu/amdgpu-glossary.rst |  9 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c      |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c        | 63 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c        | 10 ++++
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c        | 25 +++++---
 9 files changed, 109 insertions(+), 15 deletions(-)

-- 
2.53.0

