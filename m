Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A327281A
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Sep 2020 16:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B406E3BC;
	Mon, 21 Sep 2020 14:41:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B88D6E3B8;
 Mon, 21 Sep 2020 14:41:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F0C12311D;
 Mon, 21 Sep 2020 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600699284;
 bh=Fos8BaE3bYuVzPOI84cI9gq+tooOKMU1WwPwuUcClUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aWsl/s5tdTQDXrBn7HmgBRbwcMmqVQhmlSED2UaxjwJ1cwjEQLCmQpH3uPYXc4czI
 QYby9UE+IWZy2SiYaLsMOiDQHVFIAdXVkAAXDkF/wQcLiPAK8Hp/qKdPemMFt3kXD0
 jb6cK6cXWrY9Vkvbv0kxeNWzuRr0wrh4fP3CTdj0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 7/9] drm/amdkfd: fix a memory leak issue
Date: Mon, 21 Sep 2020 10:41:12 -0400
Message-Id: <20200921144114.2135773-7-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921144114.2135773-1-sashal@kernel.org>
References: <20200921144114.2135773-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dennis Li <Dennis.Li@amd.com>

[ Upstream commit 087d764159996ae378b08c0fdd557537adfd6899 ]

In the resume stage of GPU recovery, start_cpsch will call pm_init
which set pm->allocated as false, cause the next pm_release_ib has
no chance to release ib memory.

Add pm_release_ib in stop_cpsch which will be called in the suspend
stage of GPU recovery.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Dennis Li <Dennis.Li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 189212cb35475..bff39f561264e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1101,6 +1101,8 @@ static int stop_cpsch(struct device_queue_manager *dqm)
 	unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
 	dqm_unlock(dqm);
 
+	pm_release_ib(&dqm->packets);
+
 	kfd_gtt_sa_free(dqm->dev, dqm->fence_mem);
 	pm_uninit(&dqm->packets);
 
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
