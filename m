Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F56A993B
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Mar 2023 15:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58CD10E5F5;
	Fri,  3 Mar 2023 14:16:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0910E5CB;
 Fri,  3 Mar 2023 12:03:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [182.179.171.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 08B366602F6A;
 Fri,  3 Mar 2023 12:02:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677844983;
 bh=Hi8NWUOMMhmWak92kY1THi2+V5As1Gogx3xi3UhkAYk=;
 h=From:To:Cc:Subject:Date:From;
 b=JGNkfj0R1zmjv3rck3W64LfaNpmhpZiJvB4SF6QxmIUFL6E894MBBQ9jLy7cLa0UZ
 /WhSqN1k2/TX29VIffjcQeg+keZDXGN66tQtoHqU7Rdv1RWq1UmlUkcoCTKHjvuCqQ
 EGBzKHC8GmC5getS+aJ7vEaKCdXIMA6jNRNXJQWgkOzKGOLzVqDv87zPXVDKcXNcHi
 isDRmxTMhl25NtPlhcGviYxsFdMoj4GzFHp/zX+kPgS/J1FAZfh49fW7OwRhwA+UI+
 wUp1z15IiQ/VpF21BNu5IjileBKwv60BjkKkS7nPhhXV9PYYgVV6z1mm1pHFmIAedG
 66fkI/Ppm0EGA==
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kun Liu <Kun.Liu2@amd.com>
Subject: [PATCH] drm/amdgpu: remove dead code
Date: Fri,  3 Mar 2023 17:02:32 +0500
Message-Id: <20230303120233.1878140-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Mar 2023 14:16:35 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The less than zero comparison of unsigned variable "value" is never
true. Remove dead code.

Fixes: c3ed0e72c872 ("drm/amdgpu: added a sysfs interface for thermal throttling")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index f212cae0353f..0ffe351c1a1d 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1738,7 +1738,7 @@ static ssize_t amdgpu_set_apu_thermal_cap(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (value < 0 || value > 100) {
+	if (value > 100) {
 		dev_err(dev, "Invalid argument !\n");
 		return -EINVAL;
 	}
-- 
2.39.2

