Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8F2A97F2
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Nov 2020 15:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A419D6EA8B;
	Fri,  6 Nov 2020 14:53:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481F16EA8B
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Nov 2020 14:53:57 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id k9so1251609qki.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 06 Nov 2020 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cE27ew2YHK7k0r/aRuDh9qJ5yt/RySOYsYBDFBnnzgc=;
 b=jfpVSbNYTEf90PQJcsthqGajPm9NdK/hhoUYKR1BmotBop1N5M91HfSOe97zC/0Rap
 T0+uGYDYkBxt4OBal757nYSOWMnFHPxxDF4fcHAC9zkE4CxhEoQWVR1sZytDRPme0kFj
 p5TcxMyzV/QShASdwsagNgGvXNRQAWP5WrFJfK0Z4pRqXvCyqknKHmm7C/PMobdic6fj
 Pi1JTS1+hhQWLE0fYqfZae3Q7jswzdlV8YfBfWhVE4ny/PjINUM7liZzBEYki56g2E79
 n4rduxh8fYzrrnMQu//wbIEzWC/6bqE9GoiEwWDd2ZM9SAVWToGCwd4cKEFBG2dQphPB
 8kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cE27ew2YHK7k0r/aRuDh9qJ5yt/RySOYsYBDFBnnzgc=;
 b=he/qSwhwUAAz/N/uN/aBbA2hyjdTbimnc2yPWl5h48+whOYMLpzopQyZGhOrEgiwxL
 xNs6T0Yp/mlr1dzOAlk5hrnf6DU0BfVCCHk6yT0Goly8NbEBQHl2HUzN5rEGnq9DOrVn
 VBr+WHWTIshNl1Qi/mioHmIt3EffUjRRJGg90WORoK6emv2ZssG1fwZrskj6Z1ntHs43
 RC3hpkeSV0q0KM8dNlzfNZDiBHZmXJg3saUzP9CfpzoSuUgRiYGUSevrdqwHpYkjX+oN
 GFLwir1MUEADu/wlVtAbSRZyVHqVlkfiZQtkMoybikCEcapTyUwOHQIHoNizpVqSnHMi
 yOmQ==
X-Gm-Message-State: AOAM533hgCraQnv0CUlb/XXRqLnUNDqhbbKpiZMC2l0kG9U0BZjhXSZn
 l4emNXXHCsnd/wAPt4F4XuY97NwU5MI=
X-Google-Smtp-Source: ABdhPJxbsl3A9y28nUDdiYwPUsac7z+ajV6MKyvPM4S/9EaLk4/lLP9T8d2rkvzLr5nHNFCV9EdkrA==
X-Received: by 2002:a37:9e16:: with SMTP id h22mr1773090qke.481.1604674436245; 
 Fri, 06 Nov 2020 06:53:56 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id k15sm655935qtq.11.2020.11.06.06.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 06:53:55 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/pm/smu11: cache smu firmware version
Date: Fri,  6 Nov 2020 09:53:47 -0500
Message-Id: <20201106145347.421966-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201106145347.421966-1-alexander.deucher@amd.com>
References: <20201106145347.421966-1-alexander.deucher@amd.com>
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

So we print the proper SMU firmware version in debugfs, ioctls, etc.
for vangogh.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index b6453ee6f8e6..6b7d1335b46d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -216,6 +216,7 @@ int smu_v11_0_check_fw_status(struct smu_context *smu)
 
 int smu_v11_0_check_fw_version(struct smu_context *smu)
 {
+	struct amdgpu_device *adev = smu->adev;
 	uint32_t if_version = 0xff, smu_version = 0xff;
 	uint16_t smu_major;
 	uint8_t smu_minor, smu_debug;
@@ -228,6 +229,8 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
 	smu_major = (smu_version >> 16) & 0xffff;
 	smu_minor = (smu_version >> 8) & 0xff;
 	smu_debug = (smu_version >> 0) & 0xff;
+	if (smu->is_apu)
+		adev->pm.fw_version = smu_version;
 
 	switch (smu->adev->asic_type) {
 	case CHIP_ARCTURUS:
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
