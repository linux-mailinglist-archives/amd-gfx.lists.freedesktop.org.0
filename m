Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F41EABAD
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2706E328;
	Mon,  1 Jun 2020 18:21:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321276E328
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:53 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id n141so10041691qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjngsjtADBt3P+cM57UqPQVUjqVmcuDKA0vD8YWAd9A=;
 b=X9kLWrbGCrwndiaR2gzoUZGhRnkame1e92cQjE66Jqcnr8gXEv+pSpDCkTkR/Pb50d
 BKnowLk72Juv8WKXbUbUy0SIzQAXTu3Edgs08QuPeC4Hh02vmQdGDRIj5FWdMsrxdcJf
 1ercSeSQ5zq6qBKCT/XlX6mwmDjqnzxVdCFW+VgG8EC0nvgZ+Ldq7gekTUyNr9P4RCPr
 3bPatQTy1ABZLf9mhYWxTPmvBvQlTTN+3LhOGQKB1Ub1xi7rKhY2bb45VjTquKd15Uob
 iy/J1SnPZ95d0WIM1X//7LuFZnCXVPl2Xsv6CNOuiN4p62pkRMC5s6NSAKR/IPmnpvKK
 966A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjngsjtADBt3P+cM57UqPQVUjqVmcuDKA0vD8YWAd9A=;
 b=FnuHCG0NOESd1HI7vMtdtt1pinIPzweto9n9itv5vWuP5Y2RoskTPfnHudLKVjZU+A
 7U/anTEoQB+SXtSH6RvXobUeugvQSysCsoZPDK9yfAwA5KPqsXJ0r5LFQPn1rtvm6orD
 wjIjsA/Kia7xmqpgnddHIuolfpcj3e51TDMCuZn7rzbpFAcETn30q1ASwj071Ov27+Vl
 ORcWjUaITGH2cb5eZ+kgUrphW46qAxKPkP/FhG5gmBK9n/AeDq1za4jZKvnxKeE9jUD0
 COy7Wov5fgmYq+HpTKbF/guXBik2hOxfU86D1KyCeiI88vFYrNTgJLRrP431u7h9NqYq
 UdvQ==
X-Gm-Message-State: AOAM531kQRRA30H2dnkFH444J2qQTDwf/z6SgAF+PsdFubTvwbUOjGjh
 nHyDWdZh2YQkvbUnk/0zjqenyJrE
X-Google-Smtp-Source: ABdhPJxLv2r+YevjypZXC0PgOtrbXHk5MX6vA3SmLB1ICS7bCXivR7rM7+MyLfyvmHrTDr2Nmea7XQ==
X-Received: by 2002:a37:845:: with SMTP id 66mr20760708qki.67.1591035712181;
 Mon, 01 Jun 2020 11:21:52 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 126/207] drm/amd/powerplay: enable BACO for sienna_cichlid
Date: Mon,  1 Jun 2020 14:19:33 -0400
Message-Id: <20200601182054.1267858-37-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

Enable BACO for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 80a099877a68..e0067921a3e9 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -103,6 +103,7 @@ static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_message_map[SMU_MSG_MAX_C
 	MSG_MAP(PowerUpJpeg,			PPSMC_MSG_PowerUpJpeg),
 	MSG_MAP(PowerDownJpeg,			PPSMC_MSG_PowerDownJpeg),
 	MSG_MAP(BacoAudioD3PME,			PPSMC_MSG_BacoAudioD3PME),
+	MSG_MAP(ArmD3,				PPSMC_MSG_ArmD3),
 };
 
 static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_clk_map[SMU_CLK_COUNT] = {
@@ -304,6 +305,7 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 				| FEATURE_MASK(FEATURE_VR0HOT_BIT)
 				| FEATURE_MASK(FEATURE_PPT_BIT)
 				| FEATURE_MASK(FEATURE_TDC_BIT)
+				| FEATURE_MASK(FEATURE_BACO_BIT)
 				| FEATURE_MASK(FEATURE_FAN_CONTROL_BIT)
 				| FEATURE_MASK(FEATURE_THERMAL_BIT);
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
