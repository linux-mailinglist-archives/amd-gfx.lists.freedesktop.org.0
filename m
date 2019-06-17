Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB4E49086
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C694E6E083;
	Mon, 17 Jun 2019 19:51:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2C789FC8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:56 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c11so6985833qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+u5jNaAH0ca2G+yKL8KoBF6CFw6xcvfjewRR5af6cco=;
 b=lvcdEof+eVsaNpFeunyTcujFDPQLgiJ3WD5vbAHLSYd3w1xkzbla4DyAR3JDyqZ7wy
 aK5xEWCTHqtCU95GEhyhqRgay4TO1EWDYbt7MFv/DqeugITFrl5D7m28amjNdN1TIMCX
 vh9zOXyHCJn5RwO2/2O470Ehaam20tuO57qKSKm/kPIazj1fZ2d6FoNXkAl1LL7sddUb
 8B5U7DZ5u30nobEecAuBwDjwF/Z2OTDTp0tc3lFvZ5g6vWixePI95xCjq96EQJ0Km+4J
 UKJmiijmmaZnVMp49pl17CYlaGsgIvmP1rv7TXo9m7Qcvlbx2tiGIBZQMHTCQmF95W1Q
 3shQ==
X-Gm-Message-State: APjAAAU2xBJE6SySvXFQHgBRXDCh6rkJxYvKEZQ1up9Jv3p7pWzGx00o
 GodULJATnr/skdNUnCDVOUWh2k4cJIU/Qg==
X-Google-Smtp-Source: APXvYqxKEWtCT8smPAurvOT1909vhYrHWKH4SbAakBFsEbusWuunoSMBWm3qcQJFaHcmpynvtx1QOw==
X-Received: by 2002:a37:5f82:: with SMTP id
 t124mr23822588qkb.180.1560801055600; 
 Mon, 17 Jun 2019 12:50:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 459/459] drm/amd/display/dc: set num-dwb = 1 as navi10 asic cap
Date: Mon, 17 Jun 2019 14:49:48 -0500
Message-Id: <20190617194948.18667-60-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+u5jNaAH0ca2G+yKL8KoBF6CFw6xcvfjewRR5af6cco=;
 b=B2a4P8sa2iLm1IhGVJJtHaAw7HCDkJeeVxtAGCl/R4EvwgwNezI4Fo37OBReNq3BEG
 aURZpylVrRdzl/YuqcQK1rsQVo3ak2dYkrpwAKS0r9B7Alk7DO1UJ2b99WqAvN4EWMy3
 PT/ol5LKEwpgFkmS3RfZQ89wGcR8mmOsKnz6zxBr7sxpNRuIZ86TQbOjNXNcUXXvWLUN
 JsQOoS48rZ8rqUhgwrldfHwf5axAZf2HuR4FfnNfPHqNFpZiRpQQ53EUK+2tB6qsLUqP
 WeCjf7HjwAaZ/2uI5StAtuSEcLaL4s2BO2tdMIhuz7XbwYJRaakRqJ/iOTOiYqJsAM3z
 NT1g==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKZHVyaW5nIG5hdmkxMCBicmlu
ZyB1cCwgZHdiIGNhdXNlcyBzeXN0ZW0gaGFuZy4KdG8gY29udGludWUgZGVidWcgbWFqb3IgaXNz
dWUsIGRpc2FibGUgZHdiIGJ5CnNldCBudW0tZHdiID0gMC4gdGhlIGhhbmcgaXNzdWUgaXMgbm90
IHJlcHJvZHVjZWQgbm93CmJ5IGVuYWJsZSBudW0tZHdiID0xLiBkYyBzb3VyY2UgaXMgc2hhcmVk
IGJ5IGFsbCBvcy4Kd2luIG5lZWRzIG51bS1kd2IgPSAxLgoKU2lnbmVkLW9mZi1ieTogaGVyc2Vu
IHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMKaW5kZXggNmQ5ZmQ5M2VjZTg1Li5jNWFjMjU5ODBmMTkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5j
CkBAIC02NjEsNyArNjYxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZV9jYXBzIHJl
c19jYXBfbnYxMCA9IHsKIAkJLm51bV9hdWRpbyA9IDcsCiAJCS5udW1fc3RyZWFtX2VuY29kZXIg
PSA2LAogCQkubnVtX3BsbCA9IDYsCi0JCS5udW1fZHdiID0gMCwKKwkJLm51bV9kd2IgPSAxLAog
CQkubnVtX2RkYyA9IDYsCiAJCS5udW1fdm1pZCA9IDE2LAogI2lmZGVmIENPTkZJR19EUk1fQU1E
X0RDX0RTQ19TVVBQT1JUCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
