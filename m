Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB74613185
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Oct 2022 09:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAFC10E14A;
	Mon, 31 Oct 2022 08:14:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F015A10E8F3
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Oct 2022 22:48:22 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so11155575pji.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Oct 2022 15:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0xiJp4XHOD7FpE79mlTo4FZ8hKLVDdbQ6PJGlmtm0c=;
 b=mzDl6TMyHJf63jH7iKtcAAGM8XDN0rgDSAUs7hfgOey2i6dDPc9aOOCZYNZNETkm2j
 yVEIR85X+aSQjrVbZpYjQoDLmGgkswWXkfsecH1i+hYCnMCRGj96w+Nxrz2B/QCGVpZQ
 gtgV0voDj/MPBaheBlaJn/W0fjq4tkMXfBnrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0xiJp4XHOD7FpE79mlTo4FZ8hKLVDdbQ6PJGlmtm0c=;
 b=I9DL7xnnT16WiRkXrL0JCIJ7UGFv2taYXnXHYfG+cabrkEpM4v2T96nsrR1DimNEtt
 RXW7SKz+PaprWFVxFKXyBrYPcZr50U7ZpYWhgEDD2mu+WdIFdmR7q0y93RBJQNDpEnlE
 s592Xlm54l9fyoZIPr9JVZpc9/S/3AD2MYoRy2sCr2C1Yv0Ii7LjEbB2Kw9rhX63T8Io
 czcvtuAeysvgmVtVoeSUnqDGyvST98MuPQSW0tRVYybqpjEtbG99Sw9xGtkDPgH5DqPP
 G9BybQoQDgBHQe0tR/J8Asi1BJy16NpoWATflJ2ireTOyD27KEFOnY/diihzuWdLzNLZ
 SJlA==
X-Gm-Message-State: ACrzQf2NVMflHa/e2eLUD9Gfik9nIYWHLiFZYQMZ6C4DOljoJYXh+Uxb
 5WNfotPBNe8uzqN140dJ6BV8JOyv7S/nCA==
X-Google-Smtp-Source: AMsMyM6gOemtrc+N4udmSmBnnTAvh0sGPbgP5WutWSSxft54Cqt48ebDSnWboQa9R6hvi7GWIMFDSQ==
X-Received: by 2002:a17:902:848c:b0:17a:b4c0:a02b with SMTP id
 c12-20020a170902848c00b0017ab4c0a02bmr1355571plo.122.1666997302622; 
 Fri, 28 Oct 2022 15:48:22 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
 by smtp.gmail.com with UTF8SMTPSA id
 bd13-20020a656e0d000000b0043c9da02729sm3161736pgb.6.2022.10.28.15.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:48:22 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui  <Xinhui.Pan@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Set PROBE_PREFER_ASYNCHRONOUS
Date: Fri, 28 Oct 2022 15:48:13 -0700
Message-Id: <20221028154718.2.I30f27b240e63cc269076556407e6eddcf5177b5e@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221028224813.1466450-1-briannorris@chromium.org>
References: <20221028224813.1466450-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 08:14:28 +0000
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
Cc: Brian Norris <briannorris@chromium.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This driver often takes over 200ms to start, so it can improve boot
speed to probe it asynchronously.

I did a short review of the driver, and apart from an issue fixed in the
parent patch ("drm/amdgpu: Move racy global PMU list into device"),
there don't appear to be many cross-device dependencies or racy accesses
to global state, so this should be safe.

This driver was pinpointed as part of a survey of top slowest initcalls
(i.e., are built in, and probing synchronously) on a lab of ChromeOS
systems.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3c9fecdd6b2f..2d180e48df1b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2793,7 +2793,10 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.probe = amdgpu_pci_probe,
 	.remove = amdgpu_pci_remove,
 	.shutdown = amdgpu_pci_shutdown,
-	.driver.pm = &amdgpu_pm_ops,
+	.driver = {
+		.pm = &amdgpu_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
 	.err_handler = &amdgpu_pci_err_handler,
 	.dev_groups = amdgpu_sysfs_groups,
 };
-- 
2.38.1.273.g43a17bfeac-goog

