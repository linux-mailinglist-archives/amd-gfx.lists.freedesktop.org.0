Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B1C087CB
	for <lists+amd-gfx@lfdr.de>; Sat, 25 Oct 2025 03:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8613B10E22B;
	Sat, 25 Oct 2025 01:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ScedcqeB";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5C610E045
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Oct 2025 01:01:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C4FBB45778;
 Sat, 25 Oct 2025 01:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115BEC4CEF5;
 Sat, 25 Oct 2025 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761354070;
 bh=z4s2rnpkLKKVn24LQ+yrvQrJv7Z/aSElqHhunimOlp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ScedcqeBFbB9tYT4iB9wBOuqxb6CcobiqEIxzyq9GjEyRX0F+SsUmCa39UUaetvT6
 ZiWbTCxNI+O5MzhaHMNPvxP1JqLCSuzg0XJ8Fhko3gY8i0ZEEwrpgXXxhcP2WJFveH
 E7JTbZPHaRbqd5Ki2S1UlfpBvmZsDn0+g69iPRnHnOpGETTqYKA8OCuQKwaos8W9c5
 Sr4GBd35P0KCBEOnLDrY5s1tH8PAtjMjWAS4TG3zQ1qilR766HVRf/NLXH4TAPl5oh
 0e/Nv+09BPEQschl4iYRHv/mZkO5Mbfx7Avhi5jrJy5PKW6s4bWNDCPHuWcb4qzFZ8
 GghSHuiQUHT1A==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), 
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: [PATCH v2 1/2] PM: Allow device drivers to manage the frozen state of
 a device
Date: Fri, 24 Oct 2025 20:00:57 -0500
Message-ID: <20251025010058.2417352-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025010058.2417352-1-superm1@kernel.org>
References: <20251025010058.2417352-1-superm1@kernel.org>
MIME-Version: 1.0
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

During a normal successful hibernate sequence devices will go through
the freeze() callbacks create an image, go through the thaw() callbacks,
and poweroff() callbacks.

During a successful hibernate sequence some device drivers may want to
skip the thaw() callbacks.  This confuses the PM core though because it
thinks the device is no longer suspended.

To accommodate drivers that want to do this, introduce a new is_frozen
bit that the driver can set and manage.  From the driver perspective
any thaw() or restore() callbacks that are being skipped should set
is_frozen and return an error code.  The PM core will then put the
device back into the list of devices to resume for any aborted hibernate.

Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v2:
 * add tag
 * fix lkp robot issue
 * rebase on linux-pm/bleeding-edge
---
 Documentation/driver-api/pm/devices.rst | 8 ++++++++
 drivers/base/power/main.c               | 7 +++++++
 include/linux/pm.h                      | 3 +++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index 36d5c9c9fd113..55c6337271086 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -578,6 +578,14 @@ should already have been stored during the ``freeze``, ``freeze_late`` or
 the entire system, so it is not necessary for the callback to put the device in
 a low-power state.
 
+Skipping thaw phase
+-------------------
+In some rare situations, it may be desirable to skip the thaw phases
+(``thaw_noirq``, ``thaw_early``, ``thaw``) of a device entirely.  This can be
+achieved by a device driver returning an error code from any of it's thaw
+callbacks but also setting dev->power.is_frozen to true.  This indicates to the
+PM core that the device is still in the frozen state.  The PM core will consider
+this when resuming the device in later phases such as `restore` or `poweroff`.
 
 Leaving Hibernation
 -------------------
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 7a8807ec9a5d0..c5a192fc04344 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -1110,6 +1110,13 @@ static void device_resume(struct device *dev, pm_message_t state, bool async)
 
  End:
 	error = dpm_run_callback(callback, dev, state, info);
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+	/* device manages frozen state */
+	if (error && dev->power.is_frozen) {
+		dev->power.is_suspended = true;
+		error = 0;
+	}
+#endif
 
 	device_unlock(dev);
 	dpm_watchdog_clear(&wd);
diff --git a/include/linux/pm.h b/include/linux/pm.h
index a72e42eec1303..852902fc72158 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -689,6 +689,9 @@ struct dev_pm_info {
 #else
 	bool			should_wakeup:1;
 #endif
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+	bool			is_frozen:1;	/* Owned by the driver */
+#endif
 #ifdef CONFIG_PM
 	struct hrtimer		suspend_timer;
 	u64			timer_expires;
-- 
2.43.0

