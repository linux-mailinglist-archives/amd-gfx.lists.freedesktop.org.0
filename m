Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD7348E34
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9097897D7;
	Mon, 17 Jun 2019 19:18:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5218979E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:50 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id h21so12130848qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TYPoQJI+7LPnwnN/JiNNdKp2EUS7jfUIyJ4sOTIvag=;
 b=r4dr1fGr1VSWkuZwG4BwsKdajUiL/G/agc99Ah25bW48fPIP+1WS1etiwtwg16bx85
 11ZQTX9dKhL7vyboCfKrIMkhVHpDvb535+/i8ZprSBR0BJshUMoA6o2b+mS1M3Dq1WIy
 +vAZmTq6AIvtbceaOXcQwC25AOIgCLYVyUqtblb1KGCiKG6RsMtQwCbEiH+8+4SlNNpE
 fbWBcRl4HvLCxEdnBXkdoowh5zR67ZmrMYGSm3e8Qm/pX/yPSGtImsX6pqz51MXPWkPR
 nMaFSpBvs/BUSZmiLz/fg73yO17+4McqTDIYVHkIph2vc2/IiSVC8CEDR/8bA0vfD2oo
 Q75w==
X-Gm-Message-State: APjAAAUxp9WcQOIZoteiGyi91rrSuNpHgbAiT6XyApRWnt0HFpj8PfAJ
 5Dwz44/u4Locox+VwZAyuRtp2kJip/4=
X-Google-Smtp-Source: APXvYqyCjwVstGZPJXJXvmX5MmGnFZFTkslfEDcN0uUz9dylFQMtWf1L9KD+NHXJDTx2Y2eUv+7u3Q==
X-Received: by 2002:a0c:d0f6:: with SMTP id b51mr1650848qvh.225.1560799129440; 
 Mon, 17 Jun 2019 12:18:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 114/459] drm/amdgpu: add VCN2.0 decode ib test
Date: Mon, 17 Jun 2019 14:11:15 -0500
Message-Id: <20190617191700.17899-103-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TYPoQJI+7LPnwnN/JiNNdKp2EUS7jfUIyJ4sOTIvag=;
 b=lpdqbt6JwjvxshZxsIUOXLVzpGowbvk9h319R6M+R8tXwOv60Ph94q4m7zNSmkr3yT
 0l3CXh1o2ktiUZpWBJfLTqH20i2Ur2h82kCFYQG2D5x5OZ0Qu98em9AJ7Z9aZLlrJvxT
 SYmJJpX4xq39UvC6foCsKV1yt6QJPS/89/SQH6g8JvATrvVqGoyrKwV1NLxH4nSTrmps
 b/yZviS7TL9uh5mk9SR6nqsEl1Y/WEthYLRn9Vg1ZhWmcnETLAnFw3lACaojiFlu4RFa
 n7reAw3cxcPv7Nzn+3PGFgpJc3jynZV+0BrBGqiuY2jnENiQrTbnrRAQaNb/T3wgesfx
 PjJg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWRkIGludGVybmFsIHJlZ2lzdGVyIG9m
ZnNldCBmb3IgcmVnaXN0ZXJzIGludm9sdmluZyBpbiBpYiB0ZXN0cwoKU2lnbmVkLW9mZi1ieTog
TGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Zjbi5jIHwgOCArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Zjbi5oIHwgNiArKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMg
ICB8IDggKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKaW5kZXggNWRi
ZDk3NWJhYzA5Li4xZDU3NWUyZTcwMWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92Y24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmNuLmMKQEAgLTM0OSwxNCArMzQ5LDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zjbl9kZWNf
c2VuZF9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAogCiAJaWIgPSAmam9iLT5pYnNbMF07
CiAJYWRkciA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KGJvKTsKLQlpYi0+cHRyWzBdID0gUEFDS0VU
MChTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgMCwgbW1VVkRfR1BDT01fVkNQVV9EQVRBMCksIDApOwor
CWliLT5wdHJbMF0gPSBQQUNLRVQwKGFkZXYtPnZjbi5pbnRlcm5hbC5kYXRhMCwgMCk7CiAJaWIt
PnB0clsxXSA9IGFkZHI7Ci0JaWItPnB0clsyXSA9IFBBQ0tFVDAoU09DMTVfUkVHX09GRlNFVChV
VkQsIDAsIG1tVVZEX0dQQ09NX1ZDUFVfREFUQTEpLCAwKTsKKwlpYi0+cHRyWzJdID0gUEFDS0VU
MChhZGV2LT52Y24uaW50ZXJuYWwuZGF0YTEsIDApOwogCWliLT5wdHJbM10gPSBhZGRyID4+IDMy
OwotCWliLT5wdHJbNF0gPSBQQUNLRVQwKFNPQzE1X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9H
UENPTV9WQ1BVX0NNRCksIDApOworCWliLT5wdHJbNF0gPSBQQUNLRVQwKGFkZXYtPnZjbi5pbnRl
cm5hbC5jbWQsIDApOwogCWliLT5wdHJbNV0gPSAwOwogCWZvciAoaSA9IDY7IGkgPCAxNjsgaSAr
PSAyKSB7Ci0JCWliLT5wdHJbaV0gPSBQQUNLRVQwKFNPQzE1X1JFR19PRkZTRVQoVVZELCAwLCBt
bVVWRF9OT19PUCksIDApOworCQlpYi0+cHRyW2ldID0gUEFDS0VUMChhZGV2LT52Y24uaW50ZXJu
YWwubm9wLCAwKTsKIAkJaWItPnB0cltpKzFdID0gMDsKIAl9CiAJaWItPmxlbmd0aF9kdyA9IDE2
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCmluZGV4IGI4MGZjMTM5ZWI3
Yi4uYjE0NjU1YTBlMWRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNuLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5o
CkBAIC0yNSw3ICsyNSw3IEBACiAjZGVmaW5lIF9fQU1ER1BVX1ZDTl9IX18KIAogI2RlZmluZSBB
TURHUFVfVkNOX1NUQUNLX1NJWkUJCSgxMjgqMTAyNCkKLSNkZWZpbmUgQU1ER1BVX1ZDTl9DT05U
RVhUX1NJWkUJKDUxMioxMDI0KQorI2RlZmluZSBBTURHUFVfVkNOX0NPTlRFWFRfU0laRSAJKDUx
MioxMDI0KQogCiAjZGVmaW5lIEFNREdQVV9WQ05fRklSTVdBUkVfT0ZGU0VUCTI1NgogI2RlZmlu
ZSBBTURHUFVfVkNOX01BWF9FTkNfUklOR1MJMwpAQCAtODgsNiArODgsMTAgQEAgc3RydWN0IGRw
Z19wYXVzZV9zdGF0ZSB7CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1X3Zjbl9yZWd7CisJdW5zaWduZWQJ
ZGF0YTA7CisJdW5zaWduZWQJZGF0YTE7CisJdW5zaWduZWQJY21kOworCXVuc2lnbmVkCW5vcDsK
IAl1bnNpZ25lZAlzY3JhdGNoOTsKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFf
MC5jCmluZGV4IGJhYjkwMDY1M2EwYi4uMmEyYzQwY2YzMmM4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92MV8wLmMKQEAgLTEzMCw2ICsxMzAsMTQgQEAgc3RhdGljIGludCB2Y25fdjFf
MF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAogCWFkZXYtPnZjbi5pbnRlcm5hbC5zY3JhdGNoOSA9
IGFkZXYtPnZjbi5leHRlcm5hbC5zY3JhdGNoOSA9CiAJCVNPQzE1X1JFR19PRkZTRVQoVVZELCAw
LCBtbVVWRF9TQ1JBVENIOSk7CisJYWRldi0+dmNuLmludGVybmFsLmRhdGEwID0gYWRldi0+dmNu
LmV4dGVybmFsLmRhdGEwID0KKwkJU09DMTVfUkVHX09GRlNFVChVVkQsIDAsIG1tVVZEX0dQQ09N
X1ZDUFVfREFUQTApOworCWFkZXYtPnZjbi5pbnRlcm5hbC5kYXRhMSA9IGFkZXYtPnZjbi5leHRl
cm5hbC5kYXRhMSA9CisJCVNPQzE1X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9HUENPTV9WQ1BV
X0RBVEExKTsKKwlhZGV2LT52Y24uaW50ZXJuYWwuY21kID0gYWRldi0+dmNuLmV4dGVybmFsLmNt
ZCA9CisJCVNPQzE1X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9HUENPTV9WQ1BVX0NNRCk7CisJ
YWRldi0+dmNuLmludGVybmFsLm5vcCA9IGFkZXYtPnZjbi5leHRlcm5hbC5ub3AgPQorCQlTT0Mx
NV9SRUdfT0ZGU0VUKFVWRCwgMCwgbW1VVkRfTk9fT1ApOwogCiAJZm9yIChpID0gMDsgaSA8IGFk
ZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2kpIHsKIAkJcmluZyA9ICZhZGV2LT52Y24ucmluZ19l
bmNbaV07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
