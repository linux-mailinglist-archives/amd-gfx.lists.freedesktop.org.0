Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9149047
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0C86E03D;
	Mon, 17 Jun 2019 19:49:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC446E038
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:49:29 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b18so6973130qkc.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TURPCPxZA+fCqnngKcr+Yf6pzWiIV0Upb2+BQbysxDI=;
 b=Pqlb1R51JCFz0rrhb1ILUc/qlvC5IATYUDO+heBHDdd0mOR6Mg9B08gYXuvMAew2Gs
 Vlxyx09l09pNwgEpUK+dWf868tQIUXAtYh+VDt6wLI+GaATGGpPgQDGXnSvAyvjkLc3H
 DUE4GbYAIPXr+E7NPjllJ3qyKu9LiwGIynTcZCzZE4HCGr+lNS159CgRriUYors8XqkT
 NjOFvbM+WAzxfwIW6RimL7BtAT1+nr7xYzcoiIyQH7XukJ4bUp1prgdjCw6GMbQqfbjR
 BKVz1IZQK1RKI6MXAy36UT7/BBzkQHh0MxhUGv6uQ/WsLGu646t2dbgnEbt4lYEyeqDr
 q14A==
X-Gm-Message-State: APjAAAXvbrFVSRaqcZkFqfYpq1fd/Asl+30xX1T5SS4FCCRbO27z0DZ7
 MSdiRWp5L18+NxkxuKOy4RQoAqv8SwTFCw==
X-Google-Smtp-Source: APXvYqyH1JxBDaFXbqz1A3tD0lMUWjVRJwp+moKMqrK5+Npak+CdpTsB6o0VFq6CxFRqvFSPZLx6xQ==
X-Received: by 2002:a37:9d04:: with SMTP id g4mr89151306qke.52.1560800968219; 
 Mon, 17 Jun 2019 12:49:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id 34sm8125381qtq.59.2019.06.17.12.49.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:49:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 396/459] drm/amd/display: enable abm on dcn2
Date: Mon, 17 Jun 2019 14:49:12 -0500
Message-Id: <20190617194915.18618-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194915.18618-1-alexander.deucher@amd.com>
References: <20190617194915.18618-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TURPCPxZA+fCqnngKcr+Yf6pzWiIV0Upb2+BQbysxDI=;
 b=D5gvWhjdx9xJRn2jMwAjHDbWcz9Tsw5AvIJaaDeR/uzrRUXC7IqzT4K6eMuCUzVWHg
 wCWXxde0kEUbM0ooGwHJnNspIS7ZpUXo7UUXrClQDvTUF9Q6C/6h+5Qc19qONxEFMSY4
 NoamWBR/E3MAxc4vbWUWtjpYiCZ23fLWJPJuBEX3FBq84NVH0fBpNsF3u3jaEmcc5NUr
 XXDTwXEjxUUd8qLnJRdoSTQbRWLJU9sSemS1jaHtoEG8FR9iYAPATpHMktuIZBS0LlTw
 GVAbY2bhVxy+5RhZ3QrYHNIMB655pJxwcxT9cN8+yg92+krkaAMMwjThpA7/zuAPyhjD
 px+w==
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaXAgUGF2aWMgPEpvc2lwLlBhdmljQGFtZC5jb20+CgpbV2h5XQpBQk0gaXMgY3Vy
cmVudGx5IG5vdCBlbmFibGVkIG9uIERDTjIuCgpbSG93XQpVcGRhdGUgdGhlIHJlZ2lzdGVyIG5h
bWUgbGlzdCBmb3IgRENOMiBhbmQgdW4tY29tbWVudCB0aGUgY29kZSB0aGF0CmNyZWF0ZXMgdGhl
IGFibSBvYmplY3QuCgpTaWduZWQtb2ZmLWJ5OiBKb3NpcCBQYXZpYyA8Sm9zaXAuUGF2aWNAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tl
ZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkFja2VkLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9hYm0uaCAgfCAyMCArKysrKysrKysrKysrKysrKysrCiAuLi4vZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAxNCArKysrKystLS0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uaAppbmRleCBmZjk0MzY5NjYwNDEu
LjdiYTdlNmY3MjJmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfYWJtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9k
Y2VfYWJtLmgKQEAgLTY3LDYgKzY3LDIyIEBACiAJU1JJKERDX0FCTTFfSEdMU19SRUdfUkVBRF9Q
Uk9HUkVTUywgQUJNLCBpZCksIFwKIAlOQklPX1NSKEJJT1NfU0NSQVRDSF8yKQogCisjaWYgZGVm
aW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzApCisjZGVmaW5lIEFCTV9EQ04yMF9SRUdfTElT
VCgpIFwKKwlBQk1fQ09NTU9OX1JFR19MSVNUX0RDRV9CQVNFKCksIFwKKwlTUihEQ19BQk0xX0hH
X1NBTVBMRV9SQVRFKSwgXAorCVNSKERDX0FCTTFfTFNfU0FNUExFX1JBVEUpLCBcCisJU1IoQkwx
X1BXTV9CTF9VUERBVEVfU0FNUExFX1JBVEUpLCBcCisJU1IoRENfQUJNMV9IR19NSVNDX0NUUkwp
LCBcCisJU1IoRENfQUJNMV9JUENTQ19DT0VGRl9TRUwpLCBcCisJU1IoQkwxX1BXTV9DVVJSRU5U
X0FCTV9MRVZFTCksIFwKKwlTUihCTDFfUFdNX1RBUkdFVF9BQk1fTEVWRUwpLCBcCisJU1IoQkwx
X1BXTV9VU0VSX0xFVkVMKSwgXAorCVNSKERDX0FCTTFfTFNfTUlOX01BWF9QSVhFTF9WQUxVRV9U
SFJFUyksIFwKKwlTUihEQ19BQk0xX0hHTFNfUkVHX1JFQURfUFJPR1JFU1MpLCBcCisJTkJJT19T
UihCSU9TX1NDUkFUQ0hfMikKKyNlbmRpZgorCiAjZGVmaW5lIEFCTV9TRihyZWdfbmFtZSwgZmll
bGRfbmFtZSwgcG9zdF9maXgpXAogCS5maWVsZF9uYW1lID0gcmVnX25hbWUgIyMgX18gIyMgZmll
bGRfbmFtZSAjIyBwb3N0X2ZpeAogCkBAIC0xNDcsNiArMTYzLDEwIEBACiAJQUJNX1NGKEFCTTBf
RENfQUJNMV9IR0xTX1JFR19SRUFEX1BST0dSRVNTLCBcCiAJCQlBQk0xX0JMX1JFR19SRUFEX01J
U1NFRF9GUkFNRV9DTEVBUiwgbWFza19zaCkKIAorI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURf
RENfRENOMl8wKQorI2RlZmluZSBBQk1fTUFTS19TSF9MSVNUX0RDTjIwKG1hc2tfc2gpIEFCTV9N
QVNLX1NIX0xJU1RfRENFMTEwKG1hc2tfc2gpCisjZW5kaWYKKwogI2RlZmluZSBBQk1fUkVHX0ZJ
RUxEX0xJU1QodHlwZSkgXAogCXR5cGUgQUJNMV9IR19OVU1fT0ZfQklOU19TRUw7IFwKIAl0eXBl
IEFCTTFfSEdfVk1BWF9TRUw7IFwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggMmQ2ZjljNGRlODkzLi4wYTExZDEw
OThhN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jCkBAIC0yNzEsMTkgKzI3MSwxOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRjZV9kbWN1X3NoaWZ0IGRtY3Vfc2hpZnQgPSB7CiBzdGF0aWMgY29uc3Qgc3RydWN0IGRj
ZV9kbWN1X21hc2sgZG1jdV9tYXNrID0gewogCQlETUNVX01BU0tfU0hfTElTVF9EQ04xMChfTUFT
SykKIH07Ci0vKgorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRjZV9hYm1fcmVnaXN0ZXJzIGFibV9y
ZWdzID0gewotCQlBQk1fRENOMTBfUkVHX0xJU1QoMCkKKwkJQUJNX0RDTjIwX1JFR19MSVNUKCkK
IH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNlX2FibV9zaGlmdCBhYm1fc2hpZnQgPSB7Ci0J
CUFCTV9NQVNLX1NIX0xJU1RfRENOMTAoX19TSElGVCkKKwkJQUJNX01BU0tfU0hfTElTVF9EQ04y
MChfX1NISUZUKQogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkY2VfYWJtX21hc2sgYWJtX21h
c2sgPSB7Ci0JCUFCTV9NQVNLX1NIX0xJU1RfRENOMTAoX01BU0spCisJCUFCTV9NQVNLX1NIX0xJ
U1RfRENOMjAoX01BU0spCiB9OwotKi8KKwogI2RlZmluZSBhdWRpb19yZWdzKGlkKVwKIFtpZF0g
PSB7XAogCQlBVURfQ09NTU9OX1JFR19MSVNUKGlkKVwKQEAgLTI4MTEsNyArMjgxMSw3IEBAIHN0
YXRpYyBib29sIGNvbnN0cnVjdCgKIAkJZ290byBjcmVhdGVfZmFpbDsKIAl9CiAKLQkvKnBvb2wt
PmJhc2UuYWJtID0gZGNlX2FibV9jcmVhdGUoY3R4LAorCXBvb2wtPmJhc2UuYWJtID0gZGNlX2Fi
bV9jcmVhdGUoY3R4LAogCQkJJmFibV9yZWdzLAogCQkJJmFibV9zaGlmdCwKIAkJCSZhYm1fbWFz
ayk7CkBAIC0yODE5LDcgKzI4MTksNyBAQCBzdGF0aWMgYm9vbCBjb25zdHJ1Y3QoCiAJCWRtX2Vy
cm9yKCJEQzogZmFpbGVkIHRvIGNyZWF0ZSBhYm0hXG4iKTsKIAkJQlJFQUtfVE9fREVCVUdHRVIo
KTsKIAkJZ290byBjcmVhdGVfZmFpbDsKLQl9Ki8KKwl9CiAKIAlwb29sLT5iYXNlLnBwX3NtdSA9
IGRjbjIwX3BwX3NtdV9jcmVhdGUoY3R4KTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
