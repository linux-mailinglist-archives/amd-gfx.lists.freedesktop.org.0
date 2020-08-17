Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B02477B7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Aug 2020 21:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E8289F2A;
	Mon, 17 Aug 2020 19:53:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117B989F19
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Aug 2020 19:53:41 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d14so16105922qke.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Aug 2020 12:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mwcT0bwbs6Ew+gr4DNcc7DKwBdm4RQ1vCX9FXGHa8H4=;
 b=QaabLybQrq0JVbgUP63oACfAvcHalnnlFp+gInOYYLpkRDzs55ehLDkeOlmTTBgOoX
 KZvZfaKTBiCpVaBohbBwBSPvJrie8aYnDtT6lCXTv00OD+Q0NnQfhnZM9yBJB5vTLdak
 dgH0m3c+K2kkVFG2lNfNb1+eYZrjZhhEjVkOzs0WpPzzK4f00bsIvxqHydvuni2wHsU0
 W5VWVZs/2eUN00XAjoVxlsFdzw5Ven66pigl1dbzCOqCdMZd5A/ylT1ePBS9NHj9O89r
 /2ssYoKoE1vui7ulQuRD0bpEcgYEFxmeleTB8VppmOJgMrqwli/ayRGlJM5bkPK7/vHQ
 lb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mwcT0bwbs6Ew+gr4DNcc7DKwBdm4RQ1vCX9FXGHa8H4=;
 b=kBOjh2UB5+oHARCp1ftbfJbSHunT5adPZmhObeQJu7u569e3cVhHPfp50q4TOF4oe8
 Jy45kabE4WACdzLUN1MvV1qVLk5RvxGoxgE+XlfyaSfpTB9oULhvsuS1VFGfOamY2/VM
 FvHLKwCmXmHTq28ZU5C76QamcL5Bop2nXS9OlLrF46r1tTGIqjnTMtQ6nnGQlzqe8umj
 DbrXsZWuAeahnRIc+qMrPgPfD+qslvzzVhePGqRfSdpFqByausVVR3lEJZEQCIGKKvJ3
 QFGAfdgEPvGa6T9GGpV2x2/AXtJiBcdr9Jn6xkuCHWr1wqEU8eWXUqYPopAQ6LuZSdsi
 NXcA==
X-Gm-Message-State: AOAM532zTGmY029qadROLoco0/D4sJ6tLuBXtraRprVpnYIt0mOadalg
 xPiDnR5DTeHd6fQ5P3thzmuA5vVspqM=
X-Google-Smtp-Source: ABdhPJxNLfltal0Il9KFQzsbejN0b/u8Ij4YMsIyiMbtHcvxZY3Z4FIo1/q4jdF4N4eypsg9BK1d5g==
X-Received: by 2002:a37:68c1:: with SMTP id d184mr14404338qkc.62.1597694020011; 
 Mon, 17 Aug 2020 12:53:40 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id p189sm18103161qkb.61.2020.08.17.12.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 12:53:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/amdgpu/swsmu: implement power metrics for RENOIR
Date: Mon, 17 Aug 2020 15:53:28 -0400
Message-Id: <20200817195329.1971490-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200817195329.1971490-1-alexander.deucher@amd.com>
References: <20200817195329.1971490-1-alexander.deucher@amd.com>
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

Grab the data from the SMU metrics table.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---

Can someone with a renoir system verify this?

 .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
index ac81f2f605a2..3b9ac72c7571 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
@@ -637,6 +637,23 @@ static int renoir_get_vddc(struct smu_context *smu, uint32_t *value,
 	return 0;
 }
 
+static int renoir_get_power(struct smu_context *smu, uint32_t *value)
+{
+	int ret = 0;
+	SmuMetrics_t metrics;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = smu_cmn_get_metrics_table(smu, &metrics, false);
+	if (ret)
+		return ret;
+
+	*value = metrics.CurrentSocketPower << 8;
+
+	return 0;
+}
+
 /**
  * This interface get dpm clock table for dc
  */
@@ -981,6 +998,10 @@ static int renoir_read_sensor(struct smu_context *smu,
 		ret = renoir_get_vddc(smu, (uint32_t *)data, 1);
 		*size = 4;
 		break;
+	case AMDGPU_PP_SENSOR_GPU_POWER:
+		ret = renoir_get_power(smu, (uint32_t *)data);
+		*size = 4;
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
