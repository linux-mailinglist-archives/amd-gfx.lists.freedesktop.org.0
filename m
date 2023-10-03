Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259D7B8089
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Oct 2023 15:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643FD10E379;
	Wed,  4 Oct 2023 13:16:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA5F10E323
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Oct 2023 23:29:57 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6c4fa1c804bso981660a34.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Oct 2023 16:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696375797; x=1696980597;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sHOGbVO4yt56UuQA6X7B53h+Y2FMmkpmlA/gBYESKrU=;
 b=Uy/0Z2YIFTTuTnaFubaK7B0r6hY8hmMfGjaW1THZwdVigyNg4xDOpe37rvhpmHw1Ps
 dgl5YHo0Lxt6byt9yND/dgGN1DBbiw7t+Hj/CKYvq7lknMqhiLnbyBcSKL4OMIYB3YDR
 L97ae7IvtMbfbImmjwGtZ7vHFsjcWf6PRpTNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696375797; x=1696980597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sHOGbVO4yt56UuQA6X7B53h+Y2FMmkpmlA/gBYESKrU=;
 b=DpZ6pOhzllWwThRB5mwxC0y7pw7LSUs6J2/1yIws3EVCju3/1xsKyOCiernEV6r4EO
 spzReCLDmu0KpEOGQItEOyMS20qZUeXGfiUSmpBe1LPSKfPv/FZsRAyuu2Mgmr1Tc+c2
 G5vMT6g05LCo8jgxIl60i+deJSrt4vcRpSRDQYYRiR3AHjWWZs7XqWMpBQAeDnOfWroK
 ZRB/K6cn/O/0EQG8Z8OkF7OXX29SiLGRzRmDmzm9zmBeC90wPQ7IqlmjoVdPWZ52IKRe
 +yK25DMuYUq17f5STDziTnYwuO/0aSUqyAZD8JLwOQvoK4GQZFLs6e7lhxPUWFG1g05L
 0sOQ==
X-Gm-Message-State: AOJu0YxXbTJSfj07Vyiq8rq4vUkbfzM3Eb4s3Dc2A+XgrvM4UmQa3fYJ
 UkcnXkwtQT1d+JdMS9h7D1vUTw==
X-Google-Smtp-Source: AGHT+IE5Y1aTeSmZultlmhH08sL/6gXNiFbzPXi0v1PX93a6hQ7va5s5hktVz94Kc3mdmWYw273bWw==
X-Received: by 2002:a05:6358:3182:b0:143:1063:d1eb with SMTP id
 q2-20020a056358318200b001431063d1ebmr1010070rwd.17.1696375796777; 
 Tue, 03 Oct 2023 16:29:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 z20-20020a17090a8b9400b0026d54b2abe9sm134489pjn.37.2023.10.03.16.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 16:29:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: Annotate struct amdgpu_bo_list with __counted_by
Date: Tue,  3 Oct 2023 16:29:52 -0700
Message-Id: <20231003232952.work.158-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=1v/oxBN7ZqO28+dM0oWFTdo9vpsVEGznhHHT3hTYF8I=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKPwyIdWSWld6J97atG9hIxpNtU0Dh7/kol1x
 NGYcBbZXXGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyj8AAKCRCJcvTf3G3A
 JgEqEACpA4yYWb2KVzTOCIfwm8hujCVTSJPb/hR3KANtcMNWX25mFUB8inrRxZWNTJKlqnLkDzN
 VGPP1FbsCXD2NkpMv9Mi5rqHxnIYI4dPDjXghdQZo5wwWSmTJ0gDxcvYlhF68WAUuSdvzAYcuRR
 Ua+upzrG0Zxau1z8VFtdASoWxhl6W5HCuBWKVJzL8coLB2q2sxHBtdJC9utqgikQ+n0LXYRG5/V
 aIQWGc1WjEYexxVOe0SI0nqCGbvf/eSyWa7NM5pbGLR1oVDB4ThDda1/F+wHQ/qmoam8kolP2AJ
 oif+XR3OH8/MLa0+Kb/eK+eJEclZP7gav8nxBSgsB0gjyvfBjmVd5mIPJGIteGyclUcZWQVeb0l
 Kv+i+yrEZgNkEfh8Gflfov5ubL79ZXskKLGfkaJmMBAIm9kvZBbvzIrIzGxI9tuD3sRDd+CrqSU
 XlgByjZ5HUL2Uqwbuj+8V4e6ks6sp0HYyeN26gSl+Ta8yOR8L1c+HaJpeBpPhItyuMwXwEN8vV4
 WJCL05UQH36noU9sZ9FxQwYeP7wFkf6e4jOTjhPwjBMg3Lc9cDgUHaU3r+BizH/wpINJF9UCSmF
 ibq3bJCAyYdVnesvLjy+QzmKTpbLov9bkIJeuxtJ/uTrmRoaLQunBZ3qRodYL81VPJ74Nt+blMg
 vM2VNuF fGpQ1XFg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Oct 2023 13:16:11 +0000
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
Cc: llvm@lists.linux.dev, Kees Cook <keescook@chromium.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tom Rix <trix@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct amdgpu_bo_list.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-hardening@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 6f5b641b631e..781e5c5ce04d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -84,6 +84,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 	kref_init(&list->refcount);
 
+	list->num_entries = num_entries;
 	array = list->entries;
 
 	for (i = 0; i < num_entries; ++i) {
@@ -129,7 +130,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	}
 
 	list->first_userptr = first_userptr;
-	list->num_entries = num_entries;
 	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
 	     amdgpu_bo_list_entry_cmp, NULL);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index 6a703be45d04..555cd6d877c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -56,7 +56,7 @@ struct amdgpu_bo_list {
 	 */
 	struct mutex bo_list_mutex;
 
-	struct amdgpu_bo_list_entry entries[];
+	struct amdgpu_bo_list_entry entries[] __counted_by(num_entries);
 };
 
 int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
-- 
2.34.1

