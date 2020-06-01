Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704A1EABCF
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47DF6E362;
	Mon,  1 Jun 2020 18:22:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9F76E359
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:34 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x29so8503258qtv.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwCpAdeczm6VTlnSZdoJy8lPz/uKigJr7qngJLcCPdw=;
 b=ZrkWl36Mlprw7kwEI4qGGr2SZoupwh32WANySNkGBlwpvQ/YDQrr1kKbKidMLLbrvI
 rar5e0JNL10L6huv662SUpAIybPr2B+iLffCTQSzQikwZr5YzSn77xBGiV7xmjeVtr5a
 tpnt3SP6WNJfU193zcjVuQwZU2qtqMXjdeLIm25epxD0JwdU0uMOqo38z4APx9WF35nN
 TQ1ocBaSl1oAFRrRnfb3moxU99z6W+bRzJoujjfucmnXYNcJTtyKgQW0KFksvv5kq4yV
 hvYdsq5P2PY0XJgGMj0RMBE7iPYQArSsxGHbN0FKkKpCDntPTw+yZsQI3091XagjfDrQ
 UeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwCpAdeczm6VTlnSZdoJy8lPz/uKigJr7qngJLcCPdw=;
 b=nPM0zg3dnQWZhI4Y+lvj/hw31XbcrxkEGUziCZvoyESWXOmxfV8/Qti7EiK8vX9myp
 Zy/lENbQkTJXmBfaagk+BBy1u/DBhKT4Mbc4iwzPbV13IW85bXfcoBI91DTLFNvGCYnD
 iMEXVRfOGN6SXDpTaskjF3bh/dkQVvW0DQW/NbICsyjUo1IscWKxhN3nq6idfxQUE2og
 mzkowgJ7FCLmnYtixhstZdzpteWFqu3KJQg/woyl8bDjYYUTpKoivUoxltMHanfqzH23
 3ZCChVOZt4rUly2RgoaWL4vSxQofxZhZiu09sSJOkTsLjMHFiCpENrrz51p1VNf6/sMQ
 Ueug==
X-Gm-Message-State: AOAM531/ZVU3A5chpsXa49mbB+dTVa4pcwSizJ8+U0sUAa7vkoUOKRkM
 S8ogy7b6bL8z2HNgnZGni6NH7upG
X-Google-Smtp-Source: ABdhPJxnUjyufDzg9M80W9EtURig8EBeO7Cj3QmIe0IENTuUzfZucSyL+x3n9EBr2TQrEpajK4kLUQ==
X-Received: by 2002:aed:38e4:: with SMTP id k91mr8820063qte.376.1591035753599; 
 Mon, 01 Jun 2020 11:22:33 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 159/207] drm/amd/powerplay: enable fw ctf
Date: Mon,  1 Jun 2020 14:20:06 -0400
Message-Id: <20200601182054.1267858-70-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

fw ctf can be triggered if the temperature can't be throttled below the limit.
then the gpu will be powered off and the whole system will hang.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 6223ecf3c11b..512fa07ab2b2 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -311,6 +311,7 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 				| FEATURE_MASK(FEATURE_TDC_BIT)
 				| FEATURE_MASK(FEATURE_BACO_BIT)
 				| FEATURE_MASK(FEATURE_APCC_DFLL_BIT)
+				| FEATURE_MASK(FEATURE_FW_CTF_BIT)
 				| FEATURE_MASK(FEATURE_FAN_CONTROL_BIT)
 				| FEATURE_MASK(FEATURE_THERMAL_BIT)
 				| FEATURE_MASK(FEATURE_OUT_OF_BAND_MONITOR_BIT);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
