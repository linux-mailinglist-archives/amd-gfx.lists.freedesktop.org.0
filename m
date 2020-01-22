Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0ED144FFA
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Jan 2020 10:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186C16F457;
	Wed, 22 Jan 2020 09:43:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1856F457
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Jan 2020 09:43:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so6478054wre.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Jan 2020 01:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kBxK/6phLsCpEyadqRBeBA7iZO7lAfG2Xdv5AX8QdJ4=;
 b=hf+0J9MUX714ss1s0Kyn2p5Oqi7zEO7FRcM/M377yVtaqQFozyoqNMTiQpvH0dBQen
 cLdbpbDrVeOiS+nB7iflqAJ/gH3oNJnRIAGbEueJ6iyEvGfBoZUfz1PQbZGxl22ce7jh
 1BOZG1MyTy06IOLwseR8/UO9Ks6ZI9gFdkE/K9PdKKaHu62FYZf7T4cveqjMuhLd6rQ7
 EdWtVnWPWrDsF0VVe+AqC/dDUR850P1VmjV17FqBygcjvva+idaJatqVPHNDte9uNGdh
 MPcUuhWPFIRAM3ZeJswxCsYFDsqgVE3smolb2js5EV6gamUpirlB2BVmoYnvE/6U3MOr
 /fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kBxK/6phLsCpEyadqRBeBA7iZO7lAfG2Xdv5AX8QdJ4=;
 b=CP4v+pJgLZRohRnBThoBePvfGFePlzWWZ+3+cYaiXWcL/+8jUat0pKBdJzhD1gSWhJ
 /m48PgjaLMufE4UCiLrDEaz0U8j5MI3wMRAlWibhg063GCbnmBtgJgIgMWOGh+CRMbEV
 B7VfTDCqpAwXFTUsF/nuwbfP9k1gnEoPo5FbItnFdoYZFWkPwPGA+lXJMi38Y1wTISFe
 kTD5UTAlEO23brlVYbRZ4auehtS4syVSSuZUTuGhw+b3PulLjVHDDfKLlLgrJbqDMbGH
 MEqPdg/EFYQ5Dy4GiI5wkjZ6mUOEokcQgfArIKYoS4M8FepHeCXZhqNtJoRhUjA+/5t3
 UTng==
X-Gm-Message-State: APjAAAW1ueYHA8VLQ9ccdyMAAbH8pVfbDJz71jHP9m+W+QecCrXwm0Au
 PGmgNbE0BxKIg0+Bia8czcAEJTg4kl0xmQ==
X-Google-Smtp-Source: APXvYqxsPKFiD9dMxpCEMg0nwdJUTolHT8bRPzy6OEJstR0pUYXpCcixO7Qh1cmo6cVDB0rF3ahETw==
X-Received: by 2002:adf:f003:: with SMTP id j3mr10480939wro.423.1579686178532; 
 Wed, 22 Jan 2020 01:42:58 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2957000A0F1FDBBC5B14D8.dip0.t-ipconnect.de.
 [2003:c5:8f29:5700:a0f:1fdb:bc5b:14d8])
 by smtp.gmail.com with ESMTPSA id d12sm57088837wrp.62.2020.01.22.01.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 01:42:58 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: remove unused label
Date: Wed, 22 Jan 2020 10:44:40 +0100
Message-Id: <20200122094440.31166-1-nirmoy.das@amd.com>
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
Cc: alexander.deucher@amd.com, kenny.ho@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes: 445a7d54 (drm/amdgpu/vcn2.5: fix a bug for the 2nd vcn instance)

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index de32e96a8409..70fae7977f8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1353,7 +1353,6 @@ static int vcn_v2_5_stop(struct amdgpu_device *adev)
 			~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
 	}
 
-power_off:
 	if (adev->pm.dpm_enabled)
 		amdgpu_dpm_enable_uvd(adev, false);
 
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
