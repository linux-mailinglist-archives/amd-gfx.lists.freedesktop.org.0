Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92F151BDE
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Feb 2020 15:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847626EF39;
	Tue,  4 Feb 2020 14:09:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35A96EF39
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Feb 2020 14:09:43 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id i190so17722762ywc.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Feb 2020 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHCbDypxDO5x5GfKuAR76f0Gf9LHZQMj+RkrNVnJNHI=;
 b=Of3swPK5nvr8gH3nC7WKg6zw91qY2Awp8OqxCCUZhNSN+mCXzkWmVCv2hZBFq8MKNM
 hynelV4Un5U0dWNXOJX+vLu/Huw175na9y9L1uW8zWDLvEaYJOu3qY/8Ou7Bs/KmfBfE
 8p9RJ/C/jJJqFvkG+YkV4wJEPdrxfXsdUrIubPJ8ka9J6ZJoeYF+MSJW7PrWEyQlFz0u
 1iSqXdwqTM+sIJ18UosybbqwZJAHyOup7c6ZiHbBRLplP+BTL3hEGMwVNA+h41HOt2jj
 O0IerugT6uyfBmhfXUCptLV7iYqntbL0XOC4+z29F7VlxCZcB4JINWQv13oA4JKgVAbE
 XBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHCbDypxDO5x5GfKuAR76f0Gf9LHZQMj+RkrNVnJNHI=;
 b=t74TOk2oo/CdmtajreMUl+uC5nWgfs3lkG0YD0qPjow+VDneUZt7u/ieUnqxJosEiZ
 0D/tzd38WFNBayKVhp/wIOVVBA5mHIuBzux8117iqid3UzUR0zh3XJHPNf+WPsLfWNZ1
 zRf9CN/bkYwCx4WAm7ydvCvN2NA0Xgp8u0BZcotFbE3WxAQREif8cuR7eNhjB76EBs8S
 SjlrVqJrykMa0pLQirD1Q8d16ABOkMQvfd2pFHp9QxSxBO2ANVG1JLsfEGTTeWkRS2WE
 I1vv1Uq8wCdmbWHsOpLkRS8thPg9BnHa1Q/bqFZ9xWUUBF1btPqEugs3BTKMFze1EgI5
 8Qfg==
X-Gm-Message-State: APjAAAWEbeaHP3UDcndDMdCj/K/CThgZkDjcJQiQvPFgI8tpiccSErpj
 Xz1ko89RQNxKoW2jGTx+sEKvW54H
X-Google-Smtp-Source: APXvYqwqxiPsUuwk3UC7P/K7QxqS6YCsn3JAQmKg4g8pV5lMVSNyMMHdmEcOcvHaPyi6aU0s94cq1A==
X-Received: by 2002:a81:ad62:: with SMTP id l34mr5556096ywk.233.1580825382884; 
 Tue, 04 Feb 2020 06:09:42 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l37sm10499137ywa.103.2020.02.04.06.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 06:09:42 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: update default voltage for boot od table for
 navi1x
Date: Tue,  4 Feb 2020 09:09:30 -0500
Message-Id: <20200204140930.328662-1-alexander.deucher@amd.com>
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

It needed to be updated as well so it will show the proper values
if you reset to the defaults.

Bug: https://gitlab.freedesktop.org/drm/amd/issues/1020
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 2c8c4cbce548..19a9846b730e 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1977,7 +1977,7 @@ static int navi10_setup_od_limits(struct smu_context *smu) {
 }
 
 static int navi10_set_default_od_settings(struct smu_context *smu, bool initialize) {
-	OverDriveTable_t *od_table;
+	OverDriveTable_t *od_table, *boot_od_table;
 	int ret = 0;
 
 	ret = smu_v11_0_set_default_od_settings(smu, initialize, sizeof(OverDriveTable_t));
@@ -1985,6 +1985,7 @@ static int navi10_set_default_od_settings(struct smu_context *smu, bool initiali
 		return ret;
 
 	od_table = (OverDriveTable_t *)smu->smu_table.overdrive_table;
+	boot_od_table = (OverDriveTable_t *)smu->smu_table.boot_overdrive_table;
 	if (initialize) {
 		ret = navi10_setup_od_limits(smu);
 		if (ret) {
@@ -1998,6 +1999,8 @@ static int navi10_set_default_od_settings(struct smu_context *smu, bool initiali
 										od_table->GfxclkFreq1);
 				if (ret)
 					od_table->GfxclkVolt1 = 0;
+				if (boot_od_table)
+					boot_od_table->GfxclkVolt1 = od_table->GfxclkVolt1;
 			}
 
 			if (!od_table->GfxclkVolt2) {
@@ -2006,6 +2009,8 @@ static int navi10_set_default_od_settings(struct smu_context *smu, bool initiali
 										od_table->GfxclkFreq2);
 				if (ret)
 					od_table->GfxclkVolt2 = 0;
+				if (boot_od_table)
+					boot_od_table->GfxclkVolt2 = od_table->GfxclkVolt2;
 			}
 
 			if (!od_table->GfxclkVolt3) {
@@ -2014,6 +2019,8 @@ static int navi10_set_default_od_settings(struct smu_context *smu, bool initiali
 										od_table->GfxclkFreq3);
 				if (ret)
 					od_table->GfxclkVolt3 = 0;
+				if (boot_od_table)
+					boot_od_table->GfxclkVolt3 = od_table->GfxclkVolt3;
 			}
 		}
 	}
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
