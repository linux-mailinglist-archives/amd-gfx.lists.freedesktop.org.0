Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0EE1285F0
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Dec 2019 01:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B6E6ECD2;
	Sat, 21 Dec 2019 00:17:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FBD6ECD2
 for <amd-gfx@lists.freedesktop.org>; Sat, 21 Dec 2019 00:17:11 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id t141so4553722ywc.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Dec 2019 16:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sotCgf8hgZDhuwGqKH4BEcVKj67UXct/L0SFsnNm58=;
 b=iN20BQIGnAgXa02l+KIXWXiCbfx2o/NPoNrzfqzjAotwfQl/JTiEr+5kMsENEKf9GE
 SwwAdXtBIcLgNPNS2NaVM6CKcul7v/LJU4yGa4+xIa0fwPFFOj69Jupw66wZ1s01cX5a
 BunKfdsAqTkBTA/lW05IN769HvTBYY8GRt6VFdF1rB7+zkfCXHKf1McBIoR4DkDytIar
 6umvfKraChZAN3ej6SdOPjw5sHG5Rq14tdCo3lCuoeOst2SSZwSYts3LtAN7b0J6Kv+x
 y25cLaRkhH/aeIQYnxvwPU6OrZN3vIbxyknKGI5ocZ0TuCJXaaJT+iUMj2VHeiqn0dCS
 dp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sotCgf8hgZDhuwGqKH4BEcVKj67UXct/L0SFsnNm58=;
 b=NNr79x7GQgNwfRTdyZCQVYR8/1hANjwUp8wwV5GQ8pSKQCEuEmIr1Ar2N6KXqxClmv
 as4/YGBN00YUxeqhvDKQnGS0JjvGBTFJUR2i5cPvtkID9fOTLUGoWQOnZ2DHpbBu3DhP
 Q/fPcAasHqc5jY6761ps2/EOP8GC8+uob1TMwFDIMMRoOPgqfbbursN7n8e82BFlofXe
 bLOmrW73Y6Hwg1/eOAXRgrBLlRlf66vBxDfJVKa8uuWyllntkhiy3bM/VvfGR2IfpoVG
 1I+zXjSE4PfIB9VHenYarMxwIjamyQjqjzyHOSNYT83JwO61L6UdE2Ast8C2DPe+wrcv
 y9jw==
X-Gm-Message-State: APjAAAVbvRuGkO8260aHChpc5gIV87Np2xBsZ5ejC/9eQzV/YBNepJwQ
 N7EDq/gPhGO0fS5Y6GZ8iK5VSGvq
X-Google-Smtp-Source: APXvYqzTC2xCTeznK0J5wqzo8//3BbLmwPPwt255mus4PTBGBsdZRx55BGsOkRWm7tkwM7wA+LpYVQ==
X-Received: by 2002:a0d:d4d6:: with SMTP id
 w205mr12514987ywd.366.1576887430604; 
 Fri, 20 Dec 2019 16:17:10 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id e186sm4461571ywb.73.2019.12.20.16.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 16:17:10 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi - fix atpx_present when CLASS is not VGA
Date: Fri, 20 Dec 2019 19:17:02 -0500
Message-Id: <20191221001702.1338587-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

You can't use PCI_BASE_CLASS with pci_get_class().  This
happens to work by luck on devices with PCI_CLASS_DISPLAY_VGA, but
misses PCI_CLASS_DISPLAY_OTHER.  Add a check for those as well.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b856b89378ac..f69c8de64bd6 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1410,7 +1410,17 @@ static bool atpx_present(void)
 	acpi_handle dhandle, atpx_handle;
 	acpi_status status;
 
-	while ((pdev = pci_get_class(PCI_BASE_CLASS_DISPLAY << 16, pdev)) != NULL) {
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
+		dhandle = ACPI_HANDLE(&pdev->dev);
+		if (dhandle) {
+			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
+			if (!ACPI_FAILURE(status)) {
+				pci_dev_put(pdev);
+				return true;
+			}
+		}
+	}
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (dhandle) {
 			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
