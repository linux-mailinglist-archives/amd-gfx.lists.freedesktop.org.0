Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8242C91B1
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Nov 2020 23:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942C689BF5;
	Mon, 30 Nov 2020 22:56:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2CF89BF5
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 22:56:22 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id f15so9538692qto.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 14:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uPBsuDNDCFwqZr8HxxxKkD6Gx7t6a+IrE15Wxo7URq0=;
 b=crxB7W4z3S+qQJU8ftDkvlOBSF4ju5n8OiRK5ui+iVRtL8TLgDq4UStCyxt1FbxFTk
 6MfnYi1UuRVfxTAn2OC5OvJULObGFcJ/MZ/K1JHrKzxQdZ8XvNUtc7fiC3RkwkNBSuzn
 cu49ecqjVPzu09hJVkAfHu1yttDfy6eGOx4g6F3q7YBLX0Cy/qKa31Xf4sM9HgqF74PF
 bBwKSYg9Dvr4nERvhqdKivDgVRB8RB1cFVaGuTYhXfO3N+nCQsYNxQ4HFp83NJ8Nzn9h
 xKYREccr9K2UcE+qAic+j4WGN04K/6EUlF9DwfRnMpbvWgGRPusYXs4CAKAzbZpJnw8f
 AKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uPBsuDNDCFwqZr8HxxxKkD6Gx7t6a+IrE15Wxo7URq0=;
 b=l8l1SvLbgARYKNCbBFxh3Jx6TD+8gYeDiDjguPvtf6p5Lfc1NZhchJuQ4sfgGzNKs1
 U3V2niARW+VqrTbKevQZk/sMmpG9O28wRHqXyGsuqWsCNhE6ph5Fyng86OWCciyQAfWF
 GCJC+NAi463xOV2CZtCmBYZXhzlSmjF/J0S/U0PzaBt50SVW9sbzxTaBYj8N7q60wkqJ
 nam4bxlmMyCE07LCnzn7vORUvvT+DFb4qkL8Teg4VnQpGH9AHJjyvFErlvkZ7mgwO2BZ
 kUMV/U1adW/5ESG4MMXO5V9tqZ6bBPldMTLkyJI3DHuN/neVNkPUhgGkvTv1UYz1llFC
 7Xhw==
X-Gm-Message-State: AOAM530xLXKHAssrXYU/wXKmYdfhv7NoxBkerlbyWAtWMQF+viXLPkCZ
 qhhGMjMgcStiQ0OkE19IJhwvh4HqmyM=
X-Google-Smtp-Source: ABdhPJxn+Rd2AsqkctSBnaqz2DWDEActb/vrBLQ+c10f6Ul/kMH73O4969LRDjFl9TkgQyaDIWT38g==
X-Received: by 2002:aed:3865:: with SMTP id j92mr23684969qte.318.1606776981402; 
 Mon, 30 Nov 2020 14:56:21 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id 200sm247306qkl.60.2020.11.30.14.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 14:56:21 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/swsmu/vangogh: return error if fetching metrics
 fails
Date: Mon, 30 Nov 2020 17:56:12 -0500
Message-Id: <20201130225612.155092-1-alexander.deucher@amd.com>
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

rather than just dropping the error.  Also fixes a set but not
used variable warning.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 3d4d27a304e9..56704181c5a9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -410,6 +410,8 @@ static int vangogh_get_current_activity_percent(struct smu_context *smu,
 		ret = vangogh_get_smu_metrics_data(smu,
 						  METRICS_AVERAGE_GFXACTIVITY,
 						  value);
+		if (ret)
+			return ret;
 		break;
 	default:
 		dev_err(smu->adev->dev, "Invalid sensor for retrieving clock activity\n");
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
