Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95AD49071
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB386E06F;
	Mon, 17 Jun 2019 19:50:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F22889D5F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:35 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x18so6971112qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgTrj3Kzq4qBA2k+jWRj4yJkAsPxMuDdt1R/xWtJnEs=;
 b=t490YkJNFZj7MewhcFKbOsor0lVIXa0Ygj5kixplHj0Kru2LZC22w22l7YD4zLyw8I
 RaZRb0DqiFYHvgiES8dsk92XWGGiyokzRKfP6j96BFM2h59vW4gwvUmZ6hiVCSHRDnP+
 u5bDxTIjOmjkaHyhjp3aIJBe/mB0jmPvv3RML5R+4jE33ymge/8QU3j7Y5T/T76DshWf
 NwbT/sqXhw1YrFYFWcFIiCfVm9wJ3TCBjhr7HTsnRAyvIsruK7eSnzdjzMEvGfKbfU4E
 bcAmWkF1HzZfijyssEqUcLtAUGrbnjKj74pXyRwTpbwRZUV4QyhkArYW7Si15fJ1FG0y
 uXGQ==
X-Gm-Message-State: APjAAAVwEd/troV5aSllQCrR7zJeJkux0uJa7u/vEVQPCuSfO2w3x2Vf
 Ln8UNYEYG+9NSA/+tvFIfJbKRikJnozDUw==
X-Google-Smtp-Source: APXvYqy/qrUp/La5CuBambKAtmXB/mjJRxLx/RR4YMvuTqu4zwRgSK5tjvWEMzlyLRWuD16OBoG3Qw==
X-Received: by 2002:a05:620a:5a:: with SMTP id
 t26mr18519683qkt.201.1560801034541; 
 Mon, 17 Jun 2019 12:50:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 438/459] drm/amd/display: removing MODULO change for dcn2
Date: Mon, 17 Jun 2019 14:49:27 -0500
Message-Id: <20190617194948.18667-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgTrj3Kzq4qBA2k+jWRj4yJkAsPxMuDdt1R/xWtJnEs=;
 b=WA2AIPD1iOglmjRKptm8YUaq/DdfEUymFjGyh7S3qSF3Ol5xHr5NWIrrYBp6FVvQYG
 3H5iztdH1eJBViA7QAsKdLUYTiypOtlvaZESIqFnIUmdjtYrp5KhLwZns15SWWa/wB+N
 Rns8YfKIlVHGOAGV7lMBK9dsKOLjOOFuaQxo+NWHW9C29jc0fklkaQg26qTpbos2soy8
 B4S+FPMxNg5r/7ns5OqiX7NuwaDqJX5TAasgLLBzJQ5Y2mtOlxq/rcZlUKA94s46PCSA
 3cYP0pyuOFPAe/dzs4hsOP2dluNiyX6gKyG6fPd/zEAH9Ejw/CuCLcTmUo8pXyLi2Iuo
 LTpg==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Martin Leung <martin.leung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KClt3aHldCndoZW4gcmVz
ZXR0aW5nIHBpcGVzIGZyb20gNDgwcCB0byBkdWFsLXBpcGUgOGssIG1vZHVsbyByZWcgd3JpdGUg
Zm9yCnZpZGVvIG9wdGltaXplZCByYXRlIHVwZGF0ZWQgb25lIHBpcGUgd2l0aG91dCBjaGFuZ2lu
ZyB0aGUgb3RoZXIsIGNhdXNpbmcKc3luYyBlcnJvcgoKW2hvd10KcmVtb3ZlZCBjb2RlIGZyb20g
ZGNuMgoKU2lnbmVkLW9mZi1ieTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Ns
b2NrX3NvdXJjZS5jIHwgMjggLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfY2xvY2tfc291cmNlLmMKaW5kZXggYmY4Y2ZkOWIzZThmLi5jNzJhZWQzNWY0ZGIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2Nr
X3NvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Ns
b2NrX3NvdXJjZS5jCkBAIC0xMDQ2LDQxICsxMDQ2LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGl4ZWxfcmF0ZV9yYW5nZV90YWJsZV9lbnRyeSB2aWRlb19vcHRpbWl6ZWRfcGl4ZWxfcmF0ZXNb
XSA9CiAJezEwODEwMCwgMTA4MTEwLCAxMDgwMDAsIDEwMDEsIDEwMDB9LC8vMTA4TWh6CiB9Owog
Ci1zdGF0aWMgY29uc3Qgc3RydWN0IHBpeGVsX3JhdGVfcmFuZ2VfdGFibGVfZW50cnkgKmxvb2tf
dXBfaW5fdmlkZW9fb3B0aW1pemVkX3JhdGVfdGxiKAotCQl1bnNpZ25lZCBpbnQgcGl4ZWxfcmF0
ZV9raHopCi17Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgTlVNX0VMRU1FTlRTKHZpZGVv
X29wdGltaXplZF9waXhlbF9yYXRlcyk7IGkrKykgewotCQljb25zdCBzdHJ1Y3QgcGl4ZWxfcmF0
ZV9yYW5nZV90YWJsZV9lbnRyeSAqZSA9ICZ2aWRlb19vcHRpbWl6ZWRfcGl4ZWxfcmF0ZXNbaV07
Ci0KLQkJaWYgKGUtPnJhbmdlX21pbl9raHogPD0gcGl4ZWxfcmF0ZV9raHogJiYgcGl4ZWxfcmF0
ZV9raHogPD0gZS0+cmFuZ2VfbWF4X2toeikgewotCQkJcmV0dXJuIGU7Ci0JCX0KLQl9Ci0KLQly
ZXR1cm4gTlVMTDsKLX0KLQogc3RhdGljIGJvb2wgZGNuMjBfcHJvZ3JhbV9waXhfY2xrKAogCQlz
dHJ1Y3QgY2xvY2tfc291cmNlICpjbG9ja19zb3VyY2UsCiAJCXN0cnVjdCBwaXhlbF9jbGtfcGFy
YW1zICpwaXhfY2xrX3BhcmFtcywKIAkJc3RydWN0IHBsbF9zZXR0aW5ncyAqcGxsX3NldHRpbmdz
KQogewotCXN0cnVjdCBkY2UxMTBfY2xrX3NyYyAqY2xrX3NyYyA9IFRPX0RDRTExMF9DTEtfU1JD
KGNsb2NrX3NvdXJjZSk7Ci0JdW5zaWduZWQgaW50IGluc3QgPSBwaXhfY2xrX3BhcmFtcy0+Y29u
dHJvbGxlcl9pZCAtIENPTlRST0xMRVJfSURfRDA7Ci0JdW5zaWduZWQgaW50IGRwX2R0b19yZWZf
a2h6ID0gY2xvY2tfc291cmNlLT5jdHgtPmRjLT5jbGtfbWdyLT5kcHJlZmNsa19raHo7Ci0JY29u
c3Qgc3RydWN0IHBpeGVsX3JhdGVfcmFuZ2VfdGFibGVfZW50cnkgKmUgPQotCQkJbG9va191cF9p
bl92aWRlb19vcHRpbWl6ZWRfcmF0ZV90bGIocGxsX3NldHRpbmdzLT5hY3R1YWxfcGl4X2Nsa18x
MDBoeiAvIDEwKTsKLQogCWRjZTExMl9wcm9ncmFtX3BpeF9jbGsoY2xvY2tfc291cmNlLCBwaXhf
Y2xrX3BhcmFtcywgcGxsX3NldHRpbmdzKTsKIAotCWlmIChlKSB7Ci0JCS8qIFNldCBEVE8gdmFs
dWVzOiBwaGFzZSA9IHRhcmdldCBjbG9jaywgbW9kdWxvID0gcmVmZXJlbmNlIGNsb2NrICovCi0J
CVJFR19XUklURShQSEFTRVtpbnN0XSwgZS0+dGFyZ2V0X3BpeGVsX3JhdGVfa2h6ICogZS0+bXVs
dF9mYWN0b3IpOwotCQlSRUdfV1JJVEUoTU9EVUxPW2luc3RdLCBkcF9kdG9fcmVmX2toeiAqIGUt
PmRpdl9mYWN0b3IpOwotCX0KLQogCXJldHVybiB0cnVlOwogfQogCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
