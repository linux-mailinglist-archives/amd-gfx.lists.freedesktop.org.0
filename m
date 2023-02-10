Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEE69197B
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Feb 2023 09:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D9F10EC6C;
	Fri, 10 Feb 2023 08:04:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B710EC55
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Feb 2023 04:50:48 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s8so2950598pgg.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Feb 2023 20:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sE4704yMcD8OhEtSdIHgmuAh40caq0AjoSbBLrO0PpE=;
 b=B07TtWs0e5YqEoHY0pl9umYy3Y4kVoKOXCI+ufw8+ducRUqCUUMQUAurZt/rS3orVs
 6dBeAs1kD/xQ+1IwMyqIuQxioJjgxJ22r6v6gOOuUdm7xjBjBfkq8rV2dSi4mSGgIlMM
 sVuHKT4hGDGQMumOgK84e1Ek/taIl6gUet2+h56Llgs2XE7NFMm5DhsSpn/NWYlUs3oS
 5N2XN+oORiRhXrMvwPY8ZXJU7S16ovhWn9XyMZSYBSwFbbPG1V71CofozZup4QQw5fQ1
 QgBa5iy3Jjn9FqZGRZlEeGcysIKlzgyZqejaCVTLgUJCFwArmizwgE/Rz9xvhjXZkDwW
 LUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sE4704yMcD8OhEtSdIHgmuAh40caq0AjoSbBLrO0PpE=;
 b=rpNEI0KMhhu13PSWdrrxeA6sh1HRA6Q795zzEdvVHb0hrRfw63yBT+qC9tlid1Muj0
 VEETP48X874ACxuxY24hVQ5yFVdZozDjKGopaQG03FXp2UAqdMla8OTkIgInsCIkwadO
 HB2OOXm3v2lKxBnCmNrTClpN+rpttqulFW0MZ7FQZ1aOHqAG7ZYsjbH9Xt8QA/2IOEEy
 bEnOMJVPBsiqAGDfRnMTP8wSgPiPUwSx4s9LkY3RwYv+OPLKfthLBelHMC4FLISdm5J/
 H96fJ4AD8q3/iCUYQhAlN9axUQJG7UaCKrQvqGl62E1xZgZjD9ky1yr8xFpL+W0Gd8iz
 77Sw==
X-Gm-Message-State: AO0yUKXIeRi3+KyVhxxchNxrPRxVjQPrkQuQNiyB613BqJXZ5pRnis2i
 nFXMJa01WAWdf3iLJKkaeCY=
X-Google-Smtp-Source: AK7set+rB1DzlPtgtx+cW6eKyGGS40W+wG2M3MsKCsoZ+srntvMUHEbQXVftnqI/S8nvQnjv5ylLMg==
X-Received: by 2002:aa7:96c3:0:b0:581:a8dc:8f95 with SMTP id
 h3-20020aa796c3000000b00581a8dc8f95mr12954481pfq.12.1676004647757; 
 Thu, 09 Feb 2023 20:50:47 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 20:50:47 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RFC PATCH 5/9] apple-gmux: Use GMSP acpi method for interrupt clear
Date: Fri, 10 Feb 2023 15:48:22 +1100
Message-Id: <20230210044826.9834-6-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210044826.9834-1-orlandoch.dev@gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Feb 2023 08:04:04 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Rander Wang <rander.wang@intel.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Quan <evan.quan@amd.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Kerem Karabay <kekrby@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Jack Xiao <Jack.Xiao@amd.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Aditya Garg <gargaditya08@live.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is needed for interrupts to be cleared correctly on MMIO based
gmux's. It is untested if this helps/hinders other gmux types, but I
have seen the GMSP method in the acpi tables of a MacBook with an
indexed gmux.

If this turns out to break support for older gmux's, this can instead
be only done on MMIO gmux's.

There is also a "GMLV" acpi method, and the "GMSP" method can be called
with 1 as its argument, but the purposes of these aren't known and they
don't seem to be needed.

Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 760434a527c1..c605f036ea0b 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -494,8 +494,29 @@ static const struct apple_gmux_config apple_gmux_index = {
  * MCP79, on all following generations it's GPIO pin 6 of the Intel PCH.
  * The GPE merely signals that an interrupt occurred, the actual type of event
  * is identified by reading a gmux register.
+ *
+ * On MMIO gmux's, we also need to call the acpi method GMSP to properly clear
+ * interrupts. TODO: Do other types need this? Does this break other types?
  */
 
+static int gmux_call_acpi_gmsp(struct apple_gmux_data *gmux_data, int arg)
+{
+	acpi_status status = AE_OK;
+	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
+	struct acpi_object_list arg_list = { 1, &arg0 };
+
+	arg0.integer.value = arg;
+
+	status = acpi_evaluate_object(gmux_data->dhandle, "GMSP", &arg_list, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("GMSP call failed: %s\n",
+		       acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
 {
 	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
@@ -519,7 +540,10 @@ static void gmux_clear_interrupts(struct apple_gmux_data *gmux_data)
 
 	/* to clear interrupts write back current status */
 	status = gmux_interrupt_get_status(gmux_data);
-	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
+	if (status) {
+		gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
+		gmux_call_acpi_gmsp(gmux_data, 0);
+	}
 }
 
 static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
-- 
2.39.1

