Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A27286440
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E749B6E94E;
	Wed,  7 Oct 2020 16:31:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6676E94E
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:31:54 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j22so2394284qtj.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2t8ERYY7XTsl2ndg9qEkegX1e3SnrnaMLRDUYTuo5vA=;
 b=hlK77cH5lP4DY8tgIW9Bw/br3wmqK7y39jPh9Poi2lYLFBsX5jFnUWA0yY1kxLMLAD
 1uERrHqzUC3FS7BkZOwGq/ON7L6K3v1CmdzWzvEnmxjJ467DoO1iKQBiLZSApsW3nIrD
 GuCiBAtg5kVM8/0kGA1u2TSImxRM77W+rNTzinUXSWXrsSlqIBK4VTC5PO/QFyBPIAUv
 4YuJr9Vi3FmuHEdMdI3dpm7X/tbevYX+kjTwj4ito4/5jx3u5a7t33JNlmuZhfwTbHIj
 WLUiNAACDCmzwxyYPYBveCn2nI7VNAcnnltqwKH2yIyPXu0YL9duYD/IUPkZhRyaihO8
 BpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2t8ERYY7XTsl2ndg9qEkegX1e3SnrnaMLRDUYTuo5vA=;
 b=Y77EXHFD5XBfWrUNmAAyY1477XUItTY5oysiv9I9xbxgOsyqERWBZHN/1IJcutCiyo
 3DYqYj/gJh3ennVhiH7Kg/tZq/3fNBkiQBEZOw7APbMbyEAV/XrXp6L8olS2pyqHVaWW
 exO56UUqNMeW6fTIvOq3N3Cz1cy/VZgQFx89ZQ9n5GZKzfqaFgLShbnY/Zl0FZ2QqjST
 mtj4uJeJZNNjhHziJR0nz+pudRAsJzUeym/JnK6TIpW9dhURmvw+o8r0GLxlXx85Ey7q
 yJcmnBBKGqtPXSaWIZQgLElz6BWUXkvtbc5Ygl+rGse/yKCDLxXIpfN1j1ZYYdmIAiOy
 I6Bg==
X-Gm-Message-State: AOAM531hJLXffpZxnTIqH648FWw+NAflDXgyrsT67gKXdYzGuLhupQge
 9ckXDD1XPmQSrK3XJSer5qjmifugiaw=
X-Google-Smtp-Source: ABdhPJyj0RqhE+l1s70Cx5541Q9z4pY80xjAy+bJ+FsJJdbBK/WlLG8oYSJ5OTGdOPZZfw82jqCCwQ==
X-Received: by 2002:ac8:b8b:: with SMTP id h11mr3962129qti.28.1602088313823;
 Wed, 07 Oct 2020 09:31:53 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:31:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/50] drm/amdgpu: add gfx clock gating support for
 dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:30:52 -0400
Message-Id: <20201007163135.1944186-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007163135.1944186-1-alexander.deucher@amd.com>
References: <20201007163135.1944186-1-alexander.deucher@amd.com>
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
 Jiansong Chen <Jiansong.Chen@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

Set gfx clock gating for dimgrey_cavefish.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Jiansong Chen <Jiansong.Chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 79c02e8281f0..218f67d29257 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7686,6 +7686,7 @@ static int gfx_v10_0_set_clockgating_state(void *handle,
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
 	case CHIP_VANGOGH:
+	case CHIP_DIMGREY_CAVEFISH:
 		gfx_v10_0_update_gfx_clock_gating(adev,
 						 state == AMD_CG_STATE_GATE);
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
