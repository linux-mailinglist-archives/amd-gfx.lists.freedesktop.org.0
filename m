Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C704EC8BC
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Mar 2022 17:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C218210E315;
	Wed, 30 Mar 2022 15:48:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258B610F5E8
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Mar 2022 07:51:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so28039626wrg.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Mar 2022 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6A0P5Nugt3q0KDLO33UJFcQEQx63LX/0cNUolmrKWM=;
 b=V16MaX+hkN/U1Y39xaECqqNIGuGZn7Y8hPlKTULdPk5qbq8anVYXQfHLRMtoe1Ig4W
 Sfd9WfI81jqiAeEtYcjI3kq1h+xMrU+O962hOtF5wLxBZEbUplHfPcBRr7uInR1VP9y/
 vmIvR7iBpaVxm1QUh9I1DP/61+Rhw27+n56Y5uUCXPNRcpSdnFxtjCkkaOuK4/JaStkT
 /ubjCpgaQlbFjnc7q1EtTVNvWkQWBAIJhpwAGuE1GIEGXCVXsvyf52ldTRLZR64dq7zG
 bgfrrho0pUtuloTOPd/nwjX/hw2HDqccsiayW8zaeySMZv2hrMSTybaa3I5hxTbB/B7j
 bkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6A0P5Nugt3q0KDLO33UJFcQEQx63LX/0cNUolmrKWM=;
 b=33Z772Ijtn+YswaNdg6WjXFjMVWVSCshch1pUmUrciAQRyU8+zz0COr0IwF/4VDlNO
 DMLT3++3maZXJ+m7tuvtUyZhoB5IYSgjg54K7JzOj8zpvuumD9SG5r40qFXl0uWLDa3x
 M+AtM9ZLyOQ2plfDKV6dk7UVAIQVVUaLpYT0T0rj3GQHAlvMw1/hELTwmIbhzhR71Kwt
 i5Iz3R/Vkt5Rdc+9OJ8sb6L0IZ4KDJAKvdDepSQHZRS4N+R9g93UKSc3Ml90YSIAZPTU
 SQrCHch1mIPSWN6jLQcOtd09w+IashgaDiAMU9/rXtLFy3CMLivZuTbvKvzIPntoFJC7
 d5cA==
X-Gm-Message-State: AOAM5327/JB5EZQbewF/4vtKQQj/S4dGG4lYqRP3u4MbDLnOIek0fk4i
 iHaYFeMAumSU5GTt9DCmciQ0Uw==
X-Google-Smtp-Source: ABdhPJxVO1y8gkkfGyd8mfh/5laRpzQ0HsRKTWtp+wjJsFvotvbjrSiCHWCtvhWYEIWbz9CGdaq9Tw==
X-Received: by 2002:a5d:64a3:0:b0:203:d7e5:67ff with SMTP id
 m3-20020a5d64a3000000b00203d7e567ffmr35060091wrp.617.1648626711521; 
 Wed, 30 Mar 2022 00:51:51 -0700 (PDT)
Received: from joneslee-l.cable.virginm.net
 (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm16447335wru.75.2022.03.30.00.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 00:51:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/1] drm/amdkfd: Create file descriptor after client is added
 to smi_clients list
Date: Wed, 30 Mar 2022 08:51:15 +0100
Message-Id: <20220330075115.426035-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Mar 2022 15:48:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This ensures userspace cannot prematurely clean-up the client before
it is fully initialised which has been proven to cause issues in the
past.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index e4beebb1c80a2..c5d5398d45cbf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -247,15 +247,6 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
 		return ret;
 	}
 
-	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
-			       O_RDWR);
-	if (ret < 0) {
-		kfifo_free(&client->fifo);
-		kfree(client);
-		return ret;
-	}
-	*fd = ret;
-
 	init_waitqueue_head(&client->wait_queue);
 	spin_lock_init(&client->lock);
 	client->events = 0;
@@ -265,5 +256,14 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
 	list_add_rcu(&client->list, &dev->smi_clients);
 	spin_unlock(&dev->smi_lock);
 
+	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
+			       O_RDWR);
+	if (ret < 0) {
+		kfifo_free(&client->fifo);
+		kfree(client);
+		return ret;
+	}
+	*fd = ret;
+
 	return 0;
 }
-- 
2.35.1.1021.g381101b075-goog

