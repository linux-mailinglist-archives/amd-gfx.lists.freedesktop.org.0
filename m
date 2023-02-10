Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6E691989
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Feb 2023 09:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8256210EC9A;
	Fri, 10 Feb 2023 08:04:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8318F10EC55
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Feb 2023 04:50:38 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id u75so2958311pgc.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Feb 2023 20:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=llCbPbOzgkB9LqnEKDg0eJRQRzqzHegvsI/7ZgnBi0I=;
 b=DakxaCeFrVUDK+fBPzwW0q50lGy8dfpodfy+gMycCeoLm0uDmeXFnQXXDZyLi7del7
 JaaUcKkYa2ZMk6NKk7ql73vYJwD80tNBKd8BX9MS8jQSeiI2oGavDPYPWA6joip4Hx6U
 TLbJ+Kk1/3UIiTtq+g00TLDRCrzTYNbB+gaBeh3Mt5sKSY007swlm4nV852KMa/uGthP
 xLqZRWkgrgHg9wl5MbP3LDrV9cVcfLruRDM0bWbAYXXU4XhiGEZQ/DtWVnKsLeYZpIO4
 rvMDC+rIIjsQt/LUdFi99/aFasESB8qmzDqCEijNL41XCe/zLP+GtXIzbmudLQkyprqV
 o/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=llCbPbOzgkB9LqnEKDg0eJRQRzqzHegvsI/7ZgnBi0I=;
 b=Kr6o3fUx9x3ciCa5VSpDeRK8yRNfAH5qP4PMLXDFYlCroDZWMhBGIEYGtdvo024a0l
 u/TM7Xi63HcCDlBavyWvicTjrtVanheGB8R+S7KEbLAlirobKOf5ryRVzsFa3Zml5OFu
 WW3Ujih9ZFUGvtA5dnE6O1+iszfryS1slAKWyYYuCimBGlqKzs35Y+1kVzThbI4m46/w
 2N0tkERmhjjmTFs6xnFX5A6Wlb6UJq9XmUsvnslxTZJVDg/bToQP0k9cDp2vHmsDIuRK
 BzWg5tqAPZpLchS2xbZY7waH24dGPcubzjqKcqJln4r3pTGWFvv7zNjI0JvSZDTjsCkM
 36eg==
X-Gm-Message-State: AO0yUKUN/+JW/gpgmk3GTrmogBDd2EHnR/b5POKB1CFXA5/XSQrya346
 D1MnjOLZKlp10BMtA/qPs1w=
X-Google-Smtp-Source: AK7set/SdNDaxY8RGkXC46WnRWnT+ejz/fvUgvitcGPaMPnjzk2pPPFhGYTCadje/Vq75fDjEdq/AQ==
X-Received: by 2002:aa7:991a:0:b0:5a8:4de2:e95e with SMTP id
 z26-20020aa7991a000000b005a84de2e95emr5148288pff.18.1676004637995; 
 Thu, 09 Feb 2023 20:50:37 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 20:50:37 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RFC PATCH 4/9] apple-gmux: refactor gmux types
Date: Fri, 10 Feb 2023 15:48:21 +1100
Message-Id: <20230210044826.9834-5-orlandoch.dev@gmail.com>
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

Add apple_gmux_config struct containing operations and data specific to
each mux type.

This is in preparation for adding a third, MMIO based, gmux type.

Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 91 ++++++++++++++++++++-----------
 include/linux/apple-gmux.h        | 18 ++++--
 2 files changed, 70 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 6109f4c2867c..760434a527c1 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -5,6 +5,7 @@
  *  Copyright (C) Canonical Ltd. <seth.forshee@canonical.com>
  *  Copyright (C) 2010-2012 Andreas Heider <andreas@meetr.de>
  *  Copyright (C) 2015 Lukas Wunner <lukas@wunner.de>
+ *  Copyright (C) 2023 Orlando Chamberlain <orlandoch.dev@gmail.com>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -43,10 +44,12 @@
  *     http://www.renesas.com/products/mpumcu/h8s/h8s2100/h8s2113/index.jsp
  */
 
+struct apple_gmux_config;
+
 struct apple_gmux_data {
 	unsigned long iostart;
 	unsigned long iolen;
-	bool indexed;
+	const struct apple_gmux_config *config;
 	struct mutex index_lock;
 
 	struct backlight_device *bdev;
@@ -64,6 +67,17 @@ struct apple_gmux_data {
 
 static struct apple_gmux_data *apple_gmux_data;
 
+struct apple_gmux_config {
+	u8 (*read8)(struct apple_gmux_data *gmux_data, int port);
+	void (*write8)(struct apple_gmux_data *gmux_data, int port, u8 val);
+	u32 (*read32)(struct apple_gmux_data *gmux_data, int port);
+	void (*write32)(struct apple_gmux_data *gmux_data, int port, u32 val);
+	const struct vga_switcheroo_handler *gmux_handler;
+	enum vga_switcheroo_handler_flags_t handler_flags;
+	unsigned long resource_type;
+	char *name;
+};
+
 #define GMUX_INTERRUPT_ENABLE		0xff
 #define GMUX_INTERRUPT_DISABLE		0x00
 
@@ -181,35 +195,23 @@ static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
 
 static u8 gmux_read8(struct apple_gmux_data *gmux_data, int port)
 {
-	if (gmux_data->indexed)
-		return gmux_index_read8(gmux_data, port);
-	else
-		return gmux_pio_read8(gmux_data, port);
+	return gmux_data->config->read8(gmux_data, port);
 }
 
 static void gmux_write8(struct apple_gmux_data *gmux_data, int port, u8 val)
 {
-	if (gmux_data->indexed)
-		gmux_index_write8(gmux_data, port, val);
-	else
-		gmux_pio_write8(gmux_data, port, val);
+	return gmux_data->config->write8(gmux_data, port, val);
 }
 
 static u32 gmux_read32(struct apple_gmux_data *gmux_data, int port)
 {
-	if (gmux_data->indexed)
-		return gmux_index_read32(gmux_data, port);
-	else
-		return gmux_pio_read32(gmux_data, port);
+	return gmux_data->config->read32(gmux_data, port);
 }
 
 static void gmux_write32(struct apple_gmux_data *gmux_data, int port,
 			     u32 val)
 {
-	if (gmux_data->indexed)
-		gmux_index_write32(gmux_data, port, val);
-	else
-		gmux_pio_write32(gmux_data, port, val);
+	return gmux_data->config->write32(gmux_data, port, val);
 }
 
 /**
@@ -449,19 +451,41 @@ static enum vga_switcheroo_client_id gmux_get_client_id(struct pci_dev *pdev)
 		return VGA_SWITCHEROO_DIS;
 }
 
-static const struct vga_switcheroo_handler gmux_handler_indexed = {
+static const struct vga_switcheroo_handler gmux_handler_no_ddc = {
 	.switchto = gmux_switchto,
 	.power_state = gmux_set_power_state,
 	.get_client_id = gmux_get_client_id,
 };
 
-static const struct vga_switcheroo_handler gmux_handler_classic = {
+static const struct vga_switcheroo_handler gmux_handler_ddc = {
 	.switchto = gmux_switchto,
 	.switch_ddc = gmux_switch_ddc,
 	.power_state = gmux_set_power_state,
 	.get_client_id = gmux_get_client_id,
 };
 
+static const struct apple_gmux_config apple_gmux_pio = {
+	.read8 = &gmux_pio_read8,
+	.write8 = &gmux_pio_write8,
+	.read32 = &gmux_pio_read32,
+	.write32 = &gmux_pio_write32,
+	.gmux_handler = &gmux_handler_ddc,
+	.handler_flags = VGA_SWITCHEROO_CAN_SWITCH_DDC,
+	.resource_type = IORESOURCE_IO,
+	.name = "classic"
+};
+
+static const struct apple_gmux_config apple_gmux_index = {
+	.read8 = &gmux_index_read8,
+	.write8 = &gmux_index_write8,
+	.read32 = &gmux_index_read32,
+	.write32 = &gmux_index_write32,
+	.gmux_handler = &gmux_handler_no_ddc,
+	.handler_flags = VGA_SWITCHEROO_NEEDS_EDP_CONFIG,
+	.resource_type = IORESOURCE_IO,
+	.name = "indexed"
+};
+
 /**
  * DOC: Interrupt
  *
@@ -551,13 +575,13 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	int ret = -ENXIO;
 	acpi_status status;
 	unsigned long long gpe;
-	bool indexed = false;
+	enum apple_gmux_type type;
 	u32 version;
 
 	if (apple_gmux_data)
 		return -EBUSY;
 
-	if (!apple_gmux_detect(pnp, &indexed)) {
+	if (!apple_gmux_detect(pnp, &type)) {
 		pr_info("gmux device not present\n");
 		return -ENODEV;
 	}
@@ -567,6 +591,16 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		return -ENOMEM;
 	pnp_set_drvdata(pnp, gmux_data);
 
+	switch (type) {
+	case APPLE_GMUX_TYPE_INDEXED:
+		gmux_data->config = &apple_gmux_index;
+		mutex_init(&gmux_data->index_lock);
+		break;
+	case APPLE_GMUX_TYPE_PIO:
+		gmux_data->config = &apple_gmux_pio;
+		break;
+	}
+
 	res = pnp_get_resource(pnp, IORESOURCE_IO, 0);
 	gmux_data->iostart = res->start;
 	gmux_data->iolen = resource_size(res);
@@ -577,18 +611,13 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		goto err_free;
 	}
 
-	if (indexed) {
-		mutex_init(&gmux_data->index_lock);
-		gmux_data->indexed = true;
-	}
-
 	version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
 	ver_major = (version >> 24) & 0xff;
 	ver_minor = (version >> 16) & 0xff;
 	ver_release = (version >> 8) & 0xff;
 
 	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
-		ver_release, (gmux_data->indexed ? "indexed" : "classic"));
+			ver_release, gmux_data->config->name);
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_PLATFORM;
@@ -678,12 +707,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	 *
 	 * Pre-retina MacBook Pros can switch the panel's DDC separately.
 	 */
-	if (gmux_data->indexed)
-		ret = vga_switcheroo_register_handler(&gmux_handler_indexed,
-					      VGA_SWITCHEROO_NEEDS_EDP_CONFIG);
-	else
-		ret = vga_switcheroo_register_handler(&gmux_handler_classic,
-					      VGA_SWITCHEROO_CAN_SWITCH_DDC);
+	ret = vga_switcheroo_register_handler(gmux_data->config->gmux_handler,
+			gmux_data->config->handler_flags);
 	if (ret) {
 		pr_err("Failed to register vga_switcheroo handler\n");
 		goto err_register_handler;
diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
index eb2caee04abd..25c1de4a716e 100644
--- a/include/linux/apple-gmux.h
+++ b/include/linux/apple-gmux.h
@@ -36,6 +36,11 @@
 
 #define GMUX_MIN_IO_LEN			(GMUX_PORT_BRIGHTNESS + 4)
 
+enum apple_gmux_type {
+	APPLE_GMUX_TYPE_PIO,
+	APPLE_GMUX_TYPE_INDEXED
+};
+
 #if IS_ENABLED(CONFIG_APPLE_GMUX)
 static inline bool apple_gmux_is_indexed(unsigned long iostart)
 {
@@ -65,12 +70,12 @@ static inline bool apple_gmux_is_indexed(unsigned long iostart)
  * Return: %true if a supported gmux ACPI device is detected and the kernel
  * was configured with CONFIG_APPLE_GMUX, %false otherwise.
  */
-static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
+static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, enum apple_gmux_type *type_ret)
 {
 	struct device *dev = NULL;
 	struct acpi_device *adev;
 	struct resource *res;
-	bool indexed = false;
+	enum apple_gmux_type type = APPLE_GMUX_TYPE_PIO;
 	bool ret = false;
 
 	if (!pnp_dev) {
@@ -95,13 +100,14 @@ static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
 	 * device isn't present or that it's a new one that uses indexed io.
 	 */
 	if (!(~inl(res->start + GMUX_PORT_VERSION_MAJOR))) {
-		indexed = apple_gmux_is_indexed(res->start);
-		if (!indexed)
+		if (apple_gmux_is_indexed(res->start))
+			type = APPLE_GMUX_TYPE_INDEXED;
+		else
 			goto out;
 	}
 
-	if (indexed_ret)
-		*indexed_ret = indexed;
+	if (type_ret)
+		*type_ret = type;
 
 	ret = true;
 out:
-- 
2.39.1

