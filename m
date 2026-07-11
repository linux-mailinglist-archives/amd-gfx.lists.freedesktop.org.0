Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xc6BNPItUmqvMwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:50:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820297416B6
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:50:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kqVb52mF;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9E010E230;
	Sat, 11 Jul 2026 11:50:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8058981D
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 11:50:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493e4cccd8dso7277105e9.2
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783770604; x=1784375404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cVqLP2u+PWyKYab5Z1Hu7Vv0vC4hDA3S2JU9WjTYaeo=;
 b=kqVb52mFulTZw3mAtP6xONbA80R/TdxUdIgwj7lK7N3WhxyVe2reshNj5fGaKfy0lk
 2/PVb1e5fqG68X3Rpzr3b73MLEtFLPZB9TAjrNbiYn91DrZph1k+yk20ZruS6TbRSEdh
 xFRKorBgqVgbzaSOxG13+oDlVnFpJp1YWMgE/Yu8J8nnXmybyGdxB0ss26aOJ8NgackJ
 Oh47v5bmhOD6z6dtbX2fNy4Pcu3i7IUMJwMs8Ch32fh38rKcqe8uOspN2rpSlslW3yB1
 wW/SPvhWbEfvV8rRDxsE8n+HzujrQtGny4w4A2CNLVYaWLeAw2cQ/dAJtu/BWTn46RjP
 mFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783770604; x=1784375404;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cVqLP2u+PWyKYab5Z1Hu7Vv0vC4hDA3S2JU9WjTYaeo=;
 b=KV5Kmv9JDEAQrMWKJBUtrLgG5B/WMW917M8USo3rFZmOupV1/EdKgtRkpsrHtcOQIH
 lr/CvPSiM8udB4rh2CgKHOiOND9ys2vKDmxh58ySFHgl3BzSiNPhrXmotYBvpmFQenhA
 6uik+ioTa0b6pA6aiRHa7f8/S70zbyLaUt+af9Ao0GsjweWeCyB8bGynFucPii50Kpyd
 Y6wByrrRe5U9JslMJ9SVGQd2jvnj+bagVjV/emfCeU2xjDP8eWWCJR0KuUFd5pCZecxE
 lee6VRMmi2Fcl2N0mEmDB+vj+Cg27nIYWsihSlAt+k7iz4FcpIW75QIObrFPW9ga1xiW
 7Jfw==
X-Gm-Message-State: AOJu0YzGFML0f7pZo8GObPQcdsCuhCrarxcBIPsxwnAaIKC3teeGEI9E
 lHBf069/qLlPKshELhbuwPOJnSLWTHb8M7uXWuFMApZNB9M9KoYHvrY54lL0SQ==
X-Gm-Gg: AfdE7ckPiKcm9AGzZzUqahK6fAfyewTpe8QQDD6OafaxBrqwtm84JTVegXJTdEQ0xm8
 VQlIgPT3j4YzKm3T+0yjYE9REFEQWg9FovEc8jxO4izY364uWhMurYNgrebM6jrbabxUSvaQ0GD
 XK/Kbdr3x9ExPnsywieqeUOF1XvqYE2SUSFAaI4CRSqmJJGVMfvzcrk3SqCxPfhOKohGkf2FYQi
 gso5BPp+GFGViHMN8XOZbG2+Mied7Z2RvlmXuFKe2lvh+X6TL06fqYEJWGrdlxorrVmfIwhqR4i
 l6JSnwxZbQrvIUJbheA2YGMldN+PQdtSJGNquV3aWhVqN066rVuf1yxvWpmB52yKZdKcG5IpRbi
 oTNdXk60ATwE85bFsUkYbfSkAPO88SPLLniMDTyPY3zpD4FhW06PHAzCnWXlYu+kOttEjd/wyaL
 jt99+EFfS8FIAa4D3T3mCEZzOgrPT7ABI45yf8izRjD7v7aDd89kJEkg==
X-Received: by 2002:a05:600d:8444:10b0:493:e46a:ab with SMTP id
 5b1f17b1804b1-493f8837638mr16598465e9.34.1783770604136; 
 Sat, 11 Jul 2026 04:50:04 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493fbae1cdbsm16352865e9.10.2026.07.11.04.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 04:50:03 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 2/3] drm/amdgpu/ttm: Make buffer copy source readonly
Date: Sat, 11 Jul 2026 13:49:59 +0200
Message-ID: <20260711115000.40655-2-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711115000.40655-1-timur.kristof@gmail.com>
References: <20260711115000.40655-1-timur.kristof@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 820297416B6

When amdgpu is moving a BO from a location in VRAM to another
location in VRAM, we map both BOs in the GART and perform the
copy operation using the GART addresses.

We are not writing into the first GART window, so let's set
the PTE flags to make it readonly. This doesn't fix any known
issues but let's do it just to be safe.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9eb55df6e692..50725bd2448d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -199,7 +199,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window,
-				 bool tmz, uint64_t *size, uint64_t *addr)
+				 bool tmz, uint64_t *size, uint64_t *addr,
+				 bool readonly)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	unsigned int offset, num_pages, num_dw, num_bytes;
@@ -260,6 +261,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, mem);
 	if (tmz)
 		flags |= AMDGPU_PTE_TMZ;
+	if (readonly)
+		flags &= ~AMDGPU_PTE_WRITEABLE;
 
 	cpu_addr = &job->ibs[0].ptr[num_dw];
 
@@ -329,12 +332,12 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 
 		/* Map src to window 0 and dst to window 1. */
 		r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
-					  0, tmz, &cur_size, &from);
+					  0, tmz, &cur_size, &from, true);
 		if (r)
 			goto error;
 
 		r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
-					  1, tmz, &cur_size, &to);
+					  1, tmz, &cur_size, &to, false);
 		if (r)
 			goto error;
 
@@ -2593,7 +2596,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		cur_size = min(dst.size, 256ULL << 20);
 
 		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
-					  0, false, &cur_size, &to);
+					  0, false, &cur_size, &to, false);
 		if (r)
 			goto error;
 
-- 
2.55.0

