Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0773319D
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Jun 2023 14:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBEA10E618;
	Fri, 16 Jun 2023 12:51:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 526 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jun 2023 12:20:07 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D40910E0EB
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Jun 2023 12:20:07 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4CCE63F16F
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Jun 2023 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686917480;
 bh=ygm1JpcHC+yM6gwUZ9anDyDYQkSa5UJcZ+p9QEN6GhU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=m80NhPyjDUPqJGH+dmcSS1hWLH3FcicKhUkPYlM1C1vnspQ+/LWrwQGr7PqsgRyx6
 svaXwURgeBgJhSIPbb4czOv33q0jtzO7m6VTzr5UPjl+WagKysQuUNN065BgqvFK7y
 BM3k1h6wOljAc1DJRHf8+Nu0odTWOhyR6DfdsF7ZwNqdvFhNyyLCIqMphQu3Q0fSC4
 eZoOfWo0zxlHqSdus5vCFCA3m3lCH6daJw6I2aWbgKmC8NP+Pi5yaTd9J4MBDqhziX
 8oZS2R0xxl/60DnHcmwjDhn0j60iZSQvHFFPKjUrE9eSN5ffc2fgRYxLMgF9hhBjTy
 Zr10Sq3xDbekQ==
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30fc67636a2so212268f8f.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Jun 2023 05:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686917480; x=1689509480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ygm1JpcHC+yM6gwUZ9anDyDYQkSa5UJcZ+p9QEN6GhU=;
 b=ey1jW75mHIMMCMm3s4eu0JJnuX0acR7qTXlwNiJ7VV0xdODE6rKPC9dK5/0aq5LsUR
 5B9LfFuB2sWW1p7IOZ6MBKGaqe988IDP/DDeqwd7qxstSj3kmayckzMu6SzXJhN/PxdO
 5AhBsxO3i16/jwk5tZL1HylknTMit/3TYIc987mhUupJgcb5OLIBzJQxchEphc14AEMT
 O9ErOf3DG9V8q/mlPi9+yl55/mEB0ULJyTQqD49d4HOvaMviMWmrWbWK1uB5wptOa6Qo
 dn/5J1iltq35/muGq4ZxJBhQBQoh8cpOrVlchZuxdXEqnsp2cakwv9MRFMghmAgVv6cz
 GyTQ==
X-Gm-Message-State: AC+VfDwkz9GO5qvluGEQ7OqvC/aaAkxuAVTW5pujTXctcW0g1S0d9kKC
 LWiHsELtFgfPo1ES5xK4iPrS0JJvdvZ1vhTckpNooKPlaz40FKjlCLSM2bGEqG6USusBvJVM2ay
 obBX0yzATcNiwRFgh5eQBTvICwJcnBROh6WtQAD9zmHM=
X-Received: by 2002:adf:fd82:0:b0:30e:19a8:4b15 with SMTP id
 d2-20020adffd82000000b0030e19a84b15mr1232214wrr.30.1686917480060; 
 Fri, 16 Jun 2023 05:11:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+RJMFh0mO2k3qKah4mRBirj+tBn8JQcdEo6xSgXQRBq85MahquhXfYVqxTBHqLgbleXfsHQ==
X-Received: by 2002:adf:fd82:0:b0:30e:19a8:4b15 with SMTP id
 d2-20020adffd82000000b0030e19a84b15mr1232197wrr.30.1686917479747; 
 Fri, 16 Jun 2023 05:11:19 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 s2-20020adfecc2000000b0030aed4223e0sm23325047wro.105.2023.06.16.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 05:11:19 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Add missing MODULE_FIRMWARE macro
Date: Fri, 16 Jun 2023 14:11:16 +0200
Message-Id: <20230616121116.1031336-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 Jun 2023 12:51:53 +0000
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
Cc: Bokun.Zhang@amd.com, lijo.lazar@amd.com, linux-kernel@vger.kernel.org,
 YiPeng.Chai@amd.com, Juerg Haefliger <juerg.haefliger@canonical.com>,
 mario.limonciello@amd.com, Likun.Gao@amd.com, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add the missing MODULE_FIRMWARE macro for "amdgpu/fiji_smc.bin".

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5c7d40873ee2..1f83a939d641 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -92,6 +92,7 @@ MODULE_FIRMWARE("amdgpu/picasso_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/raven2_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/arcturus_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi12_gpu_info.bin");
+MODULE_FIRMWARE("amdgpu/fiji_smc.bin");
 
 #define AMDGPU_RESUME_MS		2000
 #define AMDGPU_MAX_RETRY_LIMIT		2
-- 
2.37.2

