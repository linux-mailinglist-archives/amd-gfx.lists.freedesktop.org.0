Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F651EA9A5
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8CF6E2A8;
	Mon,  1 Jun 2020 18:04:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DB86E2A8
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:04:08 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k22so8419418qtm.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rYlAUeeexaCss6rNlJ/nAfc3N54CR2s+SrNMwanTais=;
 b=jxkYEGDQ4XFFPv2KNyRnC08cecudRHx1u/35/z8YEtdQjjAF0J3NCYkUuhhPoH9gmp
 SAVWm0eZy4k/VO+mxEByzJxL8z5q64qr2o9ZNwB/IGdYsNVXK/D16BiCk2xxH131gxET
 l+diLiSHAuCMUxSnizG2katRKl+/MDVLZw2SUKxfNfSg0gj73BOiH1S6K0RHBhGyC7lC
 hKu0E/C6hIN0hTdV4Not6mNkRg58fBIwLiunDvtM2cARpnXjlzUMhVKrxsoRLmEgXR0y
 UnW8hHr0QDWEzj+mLJUUlLKMhMNmJfIO4a/uA3/Ll8DuAjqH2IUouWmlfAb/klselsCN
 9Drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYlAUeeexaCss6rNlJ/nAfc3N54CR2s+SrNMwanTais=;
 b=YxcyL/yXvcaVeQzoptMACRztNXEXB+2938YgdVWlxqS3bzmOTV/KJ1kfSV4TkjzpoF
 YfMPI7ooNrl871NdwRYvvOQ/5d/MP4Bd1NeMJ3mWmbKe3mjNZX+qEbFBnti6fCu1FE74
 /GIyovq45TyHZ9tY91koW3j3SAdYNPFye8StkDzae0pwggYcOG6RKjQUwiSXh7c11H/N
 txcTbigOs0eElEPZ6rqwnxHsB32jkRFbqHVXVbSm42aBBhJldT9Kio290SD89QF1/xB7
 7j+wSeQqHc3lT1TK2wlAHIW999llHtW8MPoPluLd0/HU+JiiJB3IP+qYWX4svZ69sN/q
 819g==
X-Gm-Message-State: AOAM533alQ52zX0IY4QjXlmwlIY4vggA6ZndccDNZQc/XmX18/Qow/hw
 iJgQNvtx49TL0hBD7p+w51M2ioOM
X-Google-Smtp-Source: ABdhPJy6orMfIgG+O8Y8NEnrw4bv4MaGO7s0Kks9j0uE6k5AFznulm/X2EjDC9j+jsu5xXF1OsQCkw==
X-Received: by 2002:ac8:4746:: with SMTP id k6mr11636065qtp.234.1591034647182; 
 Mon, 01 Jun 2020 11:04:07 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:04:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 056/207] drm/amdgpu: add the ring type definition of MES
Date: Mon,  1 Jun 2020 14:00:08 -0400
Message-Id: <20200601180239.1267430-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601180239.1267430-1-alexander.deucher@amd.com>
References: <20200601180239.1267430-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jack Xiao <Jack.Xiao@amd.com>

Add a new ring type definition.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index be218754629a..da871d84b742 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -62,7 +62,8 @@ enum amdgpu_ring_type {
 	AMDGPU_RING_TYPE_VCN_DEC	= AMDGPU_HW_IP_VCN_DEC,
 	AMDGPU_RING_TYPE_VCN_ENC	= AMDGPU_HW_IP_VCN_ENC,
 	AMDGPU_RING_TYPE_VCN_JPEG	= AMDGPU_HW_IP_VCN_JPEG,
-	AMDGPU_RING_TYPE_KIQ
+	AMDGPU_RING_TYPE_KIQ,
+	AMDGPU_RING_TYPE_MES
 };
 
 enum amdgpu_ib_pool_type {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
