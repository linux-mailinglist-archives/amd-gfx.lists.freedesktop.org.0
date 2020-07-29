Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63F23236B
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 19:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874456E5BF;
	Wed, 29 Jul 2020 17:34:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAC96E5BD
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 17:34:48 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 11so23045988qkn.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 10:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8eIigWBTmFFXTzotMjIUc6+P8WCQicmqMWXewf/m8rI=;
 b=UK9tcgUNKVO+sYluJUEZwqRdQxuMmnDFB8HHQOcXk+ngopCAj17DlbOU5eaDF7zQmq
 0MkxoqLd/aCpdLvDWJscl1gcNuENJylUN9IUSuyrHh/F9t+s14pNr8jIugcA8740Eg4W
 LiBr58sg6/IIRg1DfzhFFxHrl5FYcR31yeZ7UW2mpfZz3vQwefLrfPKOj42OIMGhL9fB
 RopgSBpoQEJqtKRsiue+c8fPv2CExv/jAmQUHMRZUYa6QZRdLum+nCb8rbByGeLJaF+j
 u0dfos73df6S+3dIv2kC+Howj7qX+9ltuVkiFBU/6f4AKZI53XBWi4M9bEaXuz0Lq+RS
 AJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8eIigWBTmFFXTzotMjIUc6+P8WCQicmqMWXewf/m8rI=;
 b=PSUbMUZmZXQDjDH02QMDNQeyzSlEiCtPmcT5shArdwdvSbI7ZnCNS1UIEaZl5eB2YL
 6y8/xZqRzXMylhY/XjwliR5GicpqF4zuo94wOYsY4Id8OmtBbjWsknLg/SOdtXZYkHzN
 Yd22H9ZAmV7GvD5Cq+WaqNYFoEKBKMeDgh96MXqugiXq6By/IlvvD/drYb9eBbQvEhsV
 fRWvQir+ev9pRMHV4c5QRZSxwY4wTOlyEYl8cTj6SVtuPjqAErl3EmDAhsR6mrMhsq7y
 +e77A1enDM4i1jXc6WP4rDj9ddrjLvHcbRtfRcW1lmrzGubuEEn7ioHOkXawexwnQ6ED
 id9Q==
X-Gm-Message-State: AOAM532LL9MWRG8wVoc3O6O2Oy/nFNCl4NEkuRu8Cmddsbp75RzPlCH8
 eNn5l2mPQTQUpoEmiWXpV3EToyme
X-Google-Smtp-Source: ABdhPJxaqYHI6xT73Yod+DL4mPjyWsZ0euJC8m1gcmWEClIZLspnupGZmsjMfXaRSljyw2Nh6TN2/g==
X-Received: by 2002:a05:620a:4ec:: with SMTP id
 b12mr25924250qkh.266.1596044087325; 
 Wed, 29 Jul 2020 10:34:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id z72sm2132956qka.107.2020.07.29.10.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 10:34:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/17] drm/amdgpu: handle bo size 0 in
 amdgpu_bo_create_kernel_at (v2)
Date: Wed, 29 Jul 2020 13:34:23 -0400
Message-Id: <20200729173439.3698-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729173439.3698-1-alexander.deucher@amd.com>
References: <20200729173439.3698-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Just return early to match other bo_create functions.

v2: check if the bo_ptr is NULL rather than checking the size.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 5ac7b5561475..a3cf38d25fc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -374,6 +374,9 @@ int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
 	if (r)
 		return r;
 
+	if ((*bo_ptr) == NULL)
+		return 0;
+
 	/*
 	 * Remove the original mem node and create a new one at the request
 	 * position.
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
