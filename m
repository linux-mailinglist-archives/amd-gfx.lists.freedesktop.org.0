Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EDF49080
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618D389FCA;
	Mon, 17 Jun 2019 19:50:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4646E071
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:45 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y57so12348449qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/IohiXeFqXGXsPZaP0eH/Z5rFTeZmzfiInsHggYVZE=;
 b=QLHV+yQMo2kDkY/BnuZbh+lB9SmAbkn2z/J2O2Q7RWEjlCVDPpqEk9AOt4wxf3E+eZ
 qL19bijOisUoZ58khAiighKPTz6Spqqo7JurQrw2xFWXK7lP+jJ8mu1+NsxLs74zdtJ8
 ITaqtlJzmcDxjCFrIZqme2odMddQ1JQHFzcgPmEMYu60smri9ihnBtQj68d7w9rjvhgq
 9HpO3bR2kFv0RseMvfTJij9ZUUJ9FQUWdvmdDH7K1QGTzehUmcg9w7OwRKgjQG/sztY1
 Dpyiq7mtGLP63ozK8+UiZOiPvRcJSKl0rOSCK2bry5rpkZ7Thh9GDzcp3evVlQrr0eSa
 JyHQ==
X-Gm-Message-State: APjAAAUYfy2tctuv0Hn4Gud28RvNIXkwVtKB2tejQyV1RgvlNKgBtV0S
 z6FpFGyJxwI3BsUkcAMguqnjNZ1cG9p4pw==
X-Google-Smtp-Source: APXvYqzTXsSIzH+/lIXWnzd1kTwlb93vBwR8Ao8C1Cplt7ulyuNFEX4br2UBDP09cgHQa7bqUKTPcw==
X-Received: by 2002:ac8:7a73:: with SMTP id w19mr75366375qtt.292.1560801044016; 
 Mon, 17 Jun 2019 12:50:44 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 448/459] drm/amd/display: expose enable dp output functions
Date: Mon, 17 Jun 2019 14:49:37 -0500
Message-Id: <20190617194948.18667-49-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/IohiXeFqXGXsPZaP0eH/Z5rFTeZmzfiInsHggYVZE=;
 b=KfH31xwsHkmrzmRfMnNCdRpNsfRJD61rqSe/fgGOASSoJKwh6dK700KIu61Lz01D0d
 sew+BkbEZIpm33J7urRI50HK4eJQPzg/moXp4La9nTify3gzqpJYpR4VzZky1n930JbT
 FduHNQ+Mz3dowIp//ovV1oIO79mX0qW6vXC0pk71HBnbCPDMHk+Ns91O2v5I8u63rxmv
 hUm9S9paVc4fpjOXqvTS46XXUI77EN3ybEP3fM1yNf8ncK9r6B2AqTP9+84+dm0n/nZW
 vhwHHIf6azB3pH37lWiIb8p7ynktbnl7dxavpFRnU9/zs0+3/R5ZcFBpJUpi+7d6OTuF
 Nyag==
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Eric Bernstein <eric.bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBCZXJuc3RlaW4gPGVyaWMuYmVybnN0ZWluQGFtZC5jb20+CgpleHBvc2UgdGhp
cyBmdW5jdGlvbiBmb3IgZnV0dXJlIHVzZQoKSW1wbGVtZW50YXRpb24gb2YgRENOMyBESU8gTGlu
ayBFbmNvZGVyIGluY2x1ZGluZwpkcGNzIHJlZ2lzdGVyIGhlYWRlcnMuCgpTaWduZWQtb2ZmLWJ5
OiBFcmljIEJlcm5zdGVpbiA8ZXJpYy5iZXJuc3RlaW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENo
YXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBM
YWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9saW5rX2VuY29kZXIuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9saW5rX2VuY29kZXIuaCB8IDUgKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5j
b2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtf
ZW5jb2Rlci5jCmluZGV4IGIwNGVmNTc2ZWM1YS4uZjQ5NTU4MmU5ZTg3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbGlua19lbmNvZGVyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5j
b2Rlci5jCkBAIC0yNDAsNyArMjQwLDcgQEAgc3RhdGljIGJvb2wgdXBkYXRlX2NmZ19kYXRhKAog
CXJldHVybiB0cnVlOwogfQogCi1zdGF0aWMgdm9pZCBkY24yMF9saW5rX2VuY29kZXJfZW5hYmxl
X2RwX291dHB1dCgKK3ZvaWQgZGNuMjBfbGlua19lbmNvZGVyX2VuYWJsZV9kcF9vdXRwdXQoCiAJ
c3RydWN0IGxpbmtfZW5jb2RlciAqZW5jLAogCWNvbnN0IHN0cnVjdCBkY19saW5rX3NldHRpbmdz
ICpsaW5rX3NldHRpbmdzLAogCWVudW0gY2xvY2tfc291cmNlX2lkIGNsb2NrX3NvdXJjZSkKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9saW5r
X2VuY29kZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9s
aW5rX2VuY29kZXIuaAppbmRleCA0MDFmZGVhNzcyNjIuLjM3MzZiNTU0OGEyNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5jb2Rl
ci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9saW5r
X2VuY29kZXIuaApAQCAtMTU1LDYgKzE1NSwxMSBAQCB2b2lkIGVuYzJfaHdfaW5pdChzdHJ1Y3Qg
bGlua19lbmNvZGVyICplbmMpOwogdm9pZCBsaW5rX2VuYzJfcmVhZF9zdGF0ZShzdHJ1Y3QgbGlu
a19lbmNvZGVyICplbmMsIHN0cnVjdCBsaW5rX2VuY19zdGF0ZSAqcyk7CiAjZW5kaWYKIAordm9p
ZCBkY24yMF9saW5rX2VuY29kZXJfZW5hYmxlX2RwX291dHB1dCgKKwlzdHJ1Y3QgbGlua19lbmNv
ZGVyICplbmMsCisJY29uc3Qgc3RydWN0IGRjX2xpbmtfc2V0dGluZ3MgKmxpbmtfc2V0dGluZ3Ms
CisJZW51bSBjbG9ja19zb3VyY2VfaWQgY2xvY2tfc291cmNlKTsKKwogdm9pZCBkY24yMF9saW5r
X2VuY29kZXJfY29uc3RydWN0KAogCXN0cnVjdCBkY24yMF9saW5rX2VuY29kZXIgKmVuYzIwLAog
CWNvbnN0IHN0cnVjdCBlbmNvZGVyX2luaXRfZGF0YSAqaW5pdF9kYXRhLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
