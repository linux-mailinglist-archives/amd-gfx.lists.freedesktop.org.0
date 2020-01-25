Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA289149734
	for <lists+amd-gfx@lfdr.de>; Sat, 25 Jan 2020 19:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCE06E8E2;
	Sat, 25 Jan 2020 18:33:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E326E8E2
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Jan 2020 18:33:31 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id j20so5546118qka.10
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Jan 2020 10:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xui/cFvjG12J6fSCpItmVCyDY4ZPXzRAK7FtzZyxscY=;
 b=UstTMPwOaf7WFNnapPKrhs2wImGCA+zXHrPZ9m3LpUmVaJR8JNI9I2oUJlWAi/H2Ss
 VJ11nHFY1jUrYrY40xHDqsYnznyCXCcx1/Wm90pyuP+KQhyXErwFeqTPQ9zMEJeIV8NP
 QRedQ8RvQZMnxAFDhXhejkSBySTVq1mOPTvzHB1Qyh5CXsd7MPGY1P0mOh8PnB47Uatq
 W1qwkkWxUiAd0q09xexi2vMdybXBEJrS/SsoUsDbtA4QaoWHWEPGutMmw1fhdsLj87Bo
 fSOWxQpHYzaSqYDCAE9CdHAwQioxUjO1vW3NJiRRuf15PBgtGvVzv5/DcMpAjfP7xh5X
 jB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xui/cFvjG12J6fSCpItmVCyDY4ZPXzRAK7FtzZyxscY=;
 b=DPW4e8hDUNIuz+MkfZGS5+dspFEIFkPZscBkqYKBFcFlMyGuIQK5Sms812SygzW4nq
 ADyW2sn4DZZsKTzPmfLumU3Txcbsgk4MOoTTq+g/VTLIhxV+9cdFt42uLPy30BxdVmog
 HxeCz9qsM4U1iTBu46rsHZOP1slp0m8gjHHxd96ln2m97oBS4MszNlylLvfhN92+1Lty
 tPIjog7i9VJbNGsMJy3T0vS7Y0Y33u+3xfSDyxWhgtseEU+WKZvrNAo6vykdoH1QetQQ
 huhl1zxO6jCbMdfU8ooitN8OnXoVx6MYfZ9sSMSriq9Qi0bHpSe06gSKLm+xUj1sx5me
 CH4g==
X-Gm-Message-State: APjAAAWZCx8YibvlVXJMoseB43yt4Hp6Z58eOkX7orr9m4lxbzJMClw+
 65HrOF34ju5YZwEGwLAOzDx6qMo7
X-Google-Smtp-Source: APXvYqxSyf1MBmDYq2oYwoRtymPCgB7H7Rs2qOZtjB/O22OE0JCVvOKPfM/IliaJhZZWEFPZ7pzCvg==
X-Received: by 2002:a37:905:: with SMTP id 5mr8556987qkj.404.1579977210301;
 Sat, 25 Jan 2020 10:33:30 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id y26sm2111395qtv.28.2020.01.25.10.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 10:33:29 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/navi10: add mclk to
 navi10_get_clock_by_type_with_latency
Date: Sat, 25 Jan 2020 13:33:21 -0500
Message-Id: <20200125183321.2315-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Doesn't seem to be used, but add it just in case.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 015f5ea38901..f60762f9b143 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1008,6 +1008,8 @@ static int navi10_get_clock_by_type_with_latency(struct smu_context *smu,
 	case SMU_GFXCLK:
 	case SMU_DCEFCLK:
 	case SMU_SOCCLK:
+	case SMU_MCLK:
+	case SMU_UCLK:
 		ret = smu_get_dpm_level_count(smu, clk_type, &level_count);
 		if (ret)
 			return ret;
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
