Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075907AB7D6
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Sep 2023 19:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ADC10E6B0;
	Fri, 22 Sep 2023 17:39:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47410E6B6
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Sep 2023 17:32:22 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-578b4981526so1789865a12.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695403942; x=1696008742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxN1BE4ZHdJI3Tb4/0aUqoFzscF/JkAVA7bHFE5N/Lw=;
 b=bD2xTadDXTR5lvsAgO9jU61vS7yykAPy+ysHmM/kk7MGszuK0PlNidXQkjeKrLtzLw
 3wN5HejyKlsxddaIbHWc7klkp4MtBwjPZm17Cvn9hM5v2cSWOclRz6hDlapxFkXXV7ko
 yL44pwtM1zFW5u5TwGp1hnWvgg/weab7DjzrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695403942; x=1696008742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxN1BE4ZHdJI3Tb4/0aUqoFzscF/JkAVA7bHFE5N/Lw=;
 b=eGNbrCuqw+P/zpcl0Vvcv4tHVrbxtrJEIqvdNQEzLGZwaJOmo71qReM4mK/0PjivYO
 S4dp30wmG4D08EotXcOeY6F8Q/DJGaKBoUx5wATVTRR/FXUwM1qIYVfWaGijMLV45Sdo
 71Sxwph75ekDqMV3T8vVIGgtgex2sr67Tfwv5znQhUTsoDbbGUutETzPh7mZe7+Jexfv
 +dvr25MnVLHE/yVcTB/s2xiAccRoM44x7ZoNCbFtezTHpZ7s7L+LkZnPSjm/q1SPcy8s
 oeu3oJxOMsPjDCfzjPY+b03FN7iF7GSWSVy2Jy7HqwiyGYIc+lDCnbQegsnaqR/tpURi
 bihA==
X-Gm-Message-State: AOJu0YyoMtwsjt5b06H0zVRH3+Bx4eSnlyQB3Z7AraJ8IC5uKk5fiGim
 yyPUcLtVdGNL2+0TH4/TnchhEQ==
X-Google-Smtp-Source: AGHT+IH//vRAyYVOKaaq6VhS1fbYsjjpT5jue+Yc4/zN4nLEb/l32hmv6bVyDmgeyxxMAVlMxqzNow==
X-Received: by 2002:a17:90a:5806:b0:26b:4ce1:9705 with SMTP id
 h6-20020a17090a580600b0026b4ce19705mr304838pji.38.1695403941884; 
 Fri, 22 Sep 2023 10:32:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 30-20020a17090a005e00b00274c541ac9esm3815585pjb.48.2023.09.22.10.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with
 __counted_by
Date: Fri, 22 Sep 2023 10:32:10 -0700
Message-Id: <20230922173216.3823169-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=keescook@chromium.org; 
 h=from:subject;
 bh=IPCNKuct38YwTzB2zIOXZz855pzU163uvmhflCBSQWQ=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+ePLJ5Y9ji0102KrPkzSXaeWKfcfISds5DF
 aJ14tx1Y4aJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JtXrD/0RXHf3wSRStY2vqlZH/um0jQPMLbKbehlFgssNmiWNKLGOpr9br8S3vwu1QvHGz1HXrqy
 ek4gD5gpWq9HZI5TJ2S0ATi0PCNLJBhXIuhc34RvAQY4zFQ3xDP1+U9nxWirglYoYpY8M62/YSo
 B0HX0gFwkDnSKjEiTZRLqLNrHJ2uDlJPrCaCz4/eG9EdAXU5odsdQXdC9MXbzm7VxjwSRLgFwVK
 GHLJXusf7Ruisahsoa0m9dY0LDoKPcUPSm6nZyyulGzjj8O7nZD5mkW5LmE3acjay9ccGO6xVQV
 CEmQ8fU5KxWIXh39kd9vqnEzf3cWZgF/XottaJZSmQfT1Ch1cecAsaQT61aXa0XgwnSoBRR1Adm
 pc0Dq6V8Dq2SSnL3qijLYnz0JJZIxQ2Vea1R0y83xCcXxYu29UWHu78xEIII3D5O3DQH7LTIFRk
 64XrJvEWliQkDVEjTU9AAQ1DmI0+XI32xp59hVd2qxbLXVzaJbyW96YRrwk0Z8tybyQKuBGbl+N
 UjYgjPXkrQlaLwdvsSB5hxsSwDYFtZYt+C8rKOWeJuWm6hWS/WNw8to6mNAPP2UcQkbXemA4N1n
 LDw+BMjjOgfNdMdxGQwv3iqnBs5Ov3VImnlMxKxr+X4ixt4v0594/VlXa7PXU40u430EsrX9Bgl
 2ggHJiZsUawsmBg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 17:39:34 +0000
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Emma Anholt <emma@anholt.net>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor <nathan@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tom Rix <trix@redhat.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>,
 linux-hardening@vger.kernel.org, Lijo Lazar <lijo.lazar@amd.com>,
 Kees Cook <keescook@chromium.org>, Yifan Zhang <yifan1.zhang@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Kevin Wang <kevin1.wang@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Zack Rusin <zackr@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct nvkm_perfdom.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
index 6ae25d3e7f45..c011227f7052 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
@@ -82,7 +82,7 @@ struct nvkm_perfdom {
 	u8  mode;
 	u32 clk;
 	u16 signal_nr;
-	struct nvkm_perfsig signal[];
+	struct nvkm_perfsig signal[] __counted_by(signal_nr);
 };
 
 struct nvkm_funcdom {
-- 
2.34.1

