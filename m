Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89C133E69
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jan 2020 10:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163D66E19C;
	Wed,  8 Jan 2020 09:39:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96FA6E19C
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jan 2020 09:39:52 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id k128so1198186ybc.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jan 2020 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wltswdz6Em8b9HQ6unpRXUDbHOq+vxw/83GqVx7qN3M=;
 b=YdQGElRSjvs/4PBfwHfT+SI8siMhg3UQztB5GGn7m3ID8sDnKvYGmO+forHsh9jIz6
 MRMeoeUE8/oxRMkZoEB4Y5QbKWg9xjBO6ypeHkUufx1jf6lm0OUoRUjLZpdOObzpK15A
 mFbGTRDPAxWYI3mX3xmh+n4QVdxK2trIou7Uh7acdKHx4RQCiCmKMbBwiYMO/6I2BcFA
 1w0SdgNRRzTFCM6yIe7BDQJQLK41ZPWC2pEMhx/aUX/ru7bJycr2ysQZI71J+wgkVqg7
 y2S5SAAHly7+ByPZowjetWBzzOEdZfgYnuIU22PWjyyLCWjxwS0QNhPQ34p3aieEhK8y
 xlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wltswdz6Em8b9HQ6unpRXUDbHOq+vxw/83GqVx7qN3M=;
 b=QEXgytVQ36tk5RFFI0POEZSFOQf4KkCVFwwKN2ADRIvrB3JsgOyNvaBRQYM0F61uLe
 F9fW8PDte7Aqmu5YQIICRN153d/guJBcmPbxJf/tkdiRcu+WrJHCArlKQPITmKRuElAY
 zB1PQFwyj1Xp8pDUFZejeTV1QbQmq+uXGGt+kgRhK0D5GaNi8UNlmuHIi7tuZGIVL3cR
 NjxDjzL1/GwM/8WwAjYga+KOmDWibq1MyQ5eERHweVptJCw5bSRBwC/8yagYok1v6EZr
 7fyWEndKnqmbn1dTbqAVxfE/ooJRJiMFiW13fgNPz6C+jGbmt14cF3+omv99dBjRp4SN
 y1KQ==
X-Gm-Message-State: APjAAAW7RB9XiYzCPNBV7rgEok/l/BMXiLDuHkFasH8ESNSTkqhW22i+
 QN5VjzEgUk7vBfXcH6CsRvKNAo3nbdQ2NA==
X-Google-Smtp-Source: APXvYqxjFfBeen+gtMtKi7wch1QioDwMpQJNS4L8Pfw0uVqlnP+7fM5Se/MjIKLFaS61RYNeMrfZPg==
X-Received: by 2002:a25:7604:: with SMTP id r4mr3160062ybc.204.1578476391870; 
 Wed, 08 Jan 2020 01:39:51 -0800 (PST)
Received: from brihaspati.amd.com
 (p200300C58F27BE00B2889D270CDB6B0F.dip0.t-ipconnect.de.
 [2003:c5:8f27:be00:b288:9d27:cdb:6b0f])
 by smtp.gmail.com with ESMTPSA id i72sm1098089ywg.49.2020.01.08.01.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 01:39:51 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: catch amdgpu_irq_add_id failure
Date: Wed,  8 Jan 2020 10:40:56 +0100
Message-Id: <20200108094056.23776-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, kenny.ho@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Do not ignore amdgpu_irq_add_id return value while registering
VMC page fault interrupt.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index da9765ff45d6..7dc8c068c62a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -720,6 +720,10 @@ static int gmc_v10_0_sw_init(void *handle)
 	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC,
 			      VMC_1_0__SRCID__VM_FAULT,
 			      &adev->gmc.vm_fault);
+
+	if (r)
+		return r;
+
 	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_UTCL2,
 			      UTCL2_1_0__SRCID__FAULT,
 			      &adev->gmc.vm_fault);
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
