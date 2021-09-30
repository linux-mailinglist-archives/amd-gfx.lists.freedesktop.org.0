Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE29D41D707
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Sep 2021 12:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C466B6E3DA;
	Thu, 30 Sep 2021 10:00:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2666E3DA
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Sep 2021 10:00:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso7912951wma.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Sep 2021 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjqXiPavKL9aC+DZp19V2JL0bO/PkJeCzorreHTPeTU=;
 b=A+sObxTY35YP8YnyFacdaY/OrpcLTSMXeu+grfVmt+70ZEFL0Q9zucRXlPr9Vso4tG
 b86WyF1oVoyzCxOhKwf8W7qf7zFtSJO0XaVrmen07XhMg2xBEFCjNXWBUG74Lqaq+MYC
 gbivVPtMfjsRuiEeFxRyt90nC8e6VJ8nlvIBBTWIe8SxR7HZCTQJ2AEKq/ce26VGhWR5
 LGleLsHOtIl8slc6dxup29VJAiN3ihfpBnWfklEulzSVD902CvyDAtRQkGvDSJ/cvynB
 oylQy4O07GPYARpgrK5Ysn62lNwmAFfoLS5EygkB0bs+kWBqW64InOSYQNR+rQx39EmG
 tFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjqXiPavKL9aC+DZp19V2JL0bO/PkJeCzorreHTPeTU=;
 b=ltA/sYdOT2WIDm6n/pBe6vk2s5R9UBNWcllek/jBeqLa8dSgNVSyIRlyt4trFXCpkG
 bQSyhoWV5igcYWgd+2q1lezUhpd+uEYfaCt2i529yBs9yXGeZBzT9TFZfOvSJ0RdpiZp
 RhHZZh54ixbhGj8czFVcOVznlDdCyl95/YBtfGHiQ4TzF8GsRMKPesnVlG4IPtE/NAnW
 AbPpXQHi1thnsjDJty9dHUdJWa6lRrxKsBDEI5qparXKAEq6DDe10ONcbwvcmUOx59XD
 Gg1f82hkRLISgNSIuxwe3lRc6U0UrGV2G9TN1qvgXfeSL8PkOJXweaUsbbhXBtJghQLX
 1wjw==
X-Gm-Message-State: AOAM533/nnvo/bNqpxGIPQD1TZZwD7EWAfbVlJFocB0m885pYaydr7nG
 0I2HqQkfEnCO2AfupoH2cM0=
X-Google-Smtp-Source: ABdhPJwdDYATM39wfi95EnX4cCGk9kuaGyEJ4sxzrTzAvwVi+B6hoshkYn2IoJTlDo/ojtxdW+z96A==
X-Received: by 2002:a1c:95:: with SMTP id 143mr4434838wma.29.1632996015548;
 Thu, 30 Sep 2021 03:00:15 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 a63sm2453057wme.18.2021.09.30.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 03:00:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: print warning and taint kernel if lockup timeout
 is disabled
Date: Thu, 30 Sep 2021 12:00:14 +0200
Message-Id: <20210930100014.1337-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Make sure that we notice this in error reports.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4d34b2da8582..8ee5bbc19f62 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3346,6 +3346,8 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 				continue;
 			} else if (timeout < 0) {
 				timeout = MAX_SCHEDULE_TIMEOUT;
+				dev_warn(adev->dev, "lockup timeout disabled");
+				add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
 			} else {
 				timeout = msecs_to_jiffies(timeout);
 			}
-- 
2.25.1

