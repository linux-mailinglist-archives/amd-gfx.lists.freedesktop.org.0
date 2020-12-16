Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BBE2DC462
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Dec 2020 17:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024D6896A3;
	Wed, 16 Dec 2020 16:37:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31AF896A3
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Dec 2020 16:37:34 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 22so12878093qkf.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Dec 2020 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnmdlQHOo2xKzJGX+fqRo1jpHlhWtKtPUfakgjeztn0=;
 b=bl16z9o/wA7eMS7JCxsomQYhxuQQn3PN6NWPmbFThSYVtMU8D7Mp+auu6dhhUrjcbY
 w5XID/OMOvPD/C43mEkZfbjmgFhKUDFYZ3y2SrjrAyVzDugoSbR4UZ5vAUjC6qvteGO+
 iimHv4Q/S3ukUvr9PX3Q/0U7E6iWaVg+MCXxudjU8fArst+teTJhJ5geMuuaPKInlZZ+
 RG1/GPMf59Gifw16QOuwnzk0Jk9fI+nl/lXr5tlfuRsEX2qWe0QrFC7LWN53FkTIWdLL
 ZzKoQ8SWrG9S/wfyf1Tk/uTxSevOWOXb0GDBKVxdN1+JFJOhk2YfVkvFmbyuAQ8a4pBA
 Vi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnmdlQHOo2xKzJGX+fqRo1jpHlhWtKtPUfakgjeztn0=;
 b=jU9ruYN0b/WAZn51YwtDgSSc//ioqHue3C5m5Fl/uPwhkjiR1HLedtujRGMcAUpAe4
 DiUBSKwl1VoDL0DjMkwv7sC8QAqR6Ypko8s2INxuzI82Q2vHa3f97KSjotFaITcupKkA
 04wTwHSWWDfJDyDw+EjBjOk6OZqMg598ziWUM0e9AdegnpEPxSDwb2u9TH6ELAeNjSVZ
 MVz6sBopGjMxgV88JcobpN8DwE0BkptEmPXpimpBeowqxEo4UGXlVAPuFSjgjpgZJIA5
 AcRKLTZXnH9cpe9mfx1rHS9xoRdd1FHD6DuwcnoB1I+wZSKkNoT58bKxFLdl+NMJ2wPJ
 kMqw==
X-Gm-Message-State: AOAM5307fGD99WOHmF2xTsx4i2VRtXUK8TsLjMrXmE3oRNkJHJPx5tKq
 r869/k6s+XG9LEwp9PLiTf+tL7MqGPA=
X-Google-Smtp-Source: ABdhPJyriqHTApNfpj8DncfIQgVQd5uBVYelFIfD4CT2vAf2yoirBsiXrrjP49tua6HHvG0QLvApNw==
X-Received: by 2002:a37:9687:: with SMTP id
 y129mr42368124qkd.104.1608136653784; 
 Wed, 16 Dec 2020 08:37:33 -0800 (PST)
Received: from tr4.amd.com ([165.204.84.11])
 by smtp.gmail.com with ESMTPSA id j30sm1330697qtl.43.2020.12.16.08.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:37:33 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix vbios reservarion handling on SR-IOV
Date: Wed, 16 Dec 2020 11:37:21 -0500
Message-Id: <20201216163721.2432665-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

There is no reserveration so set the size to 0.  Fixes
a regression on SR-IOV.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index c2ced5be6d7b..6e679db5e46f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -496,7 +496,8 @@ void amdgpu_gmc_get_vbios_allocations(struct amdgpu_device *adev)
 		break;
 	}
 
-	if (!amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_DCE)) {
+	if (amdgpu_sriov_vf(adev) ||
+	    !amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_DCE)) {
 		size = 0;
 	} else {
 		size = amdgpu_gmc_get_vbios_fb_size(adev);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
