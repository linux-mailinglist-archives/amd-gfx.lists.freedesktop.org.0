Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B069E1A
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B3589E8C;
	Mon, 15 Jul 2019 21:25:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB42D89E41
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:16 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 44so17215270qtg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=816YKvvkANLlDvo8eZc5fwsSNhJzeXcue+eV6wJL9x0=;
 b=axmhqNhvmXJsNBl4ZVDMtnOmQhS95o9mReBNc2lmlv1g1dbtWxmD6r+qTqjZsJvrnO
 ViR4VT5Y0hwyG08aAD7ozAs+u06mWfzahO+iXuPfww9SRxxZ91Ts43fNeV9akICmSm2H
 oHgofcqgso7sqqkFOGoXl0BavmF6+ykiRQfg9btD9MGs4HCWKc3RqXj3q02dE6v9mHDT
 4pTxqPEZt3motUTawS46JrCamOJ0K8iMf1UXwBH/Uzrunvnk6jkuknbc5I0EK00sgNGi
 GmrGqBSnD+CgxPo4Vxdb3/MeuVKk9AdDBeqWyM5BAj+2n4cP/4iPzYc8LWJIqEtGVN5o
 YTuQ==
X-Gm-Message-State: APjAAAUA4a6yAyalF5v8ok5Vh9xXaoX24HHIo1q9nHQ/cHDGgZlHG3NG
 Dj3G2gENYbXBZmar1oDXCMHHYDRN
X-Google-Smtp-Source: APXvYqweqS791yvqcz/4v2tIkXxssaAwr8MzJVDot0jWD/k8EenSpDPc7yKj2trukjElVB8k2Vxdvw==
X-Received: by 2002:ac8:2d08:: with SMTP id n8mr19604192qta.383.1563225915865; 
 Mon, 15 Jul 2019 14:25:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 035/102] drm/amdgpu: support sdma 2~7 doorbell range register
 offset
Date: Mon, 15 Jul 2019 16:23:30 -0500
Message-Id: <20190715212437.31793-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=816YKvvkANLlDvo8eZc5fwsSNhJzeXcue+eV6wJL9x0=;
 b=DlmwoernX2KFkFWyERvF5yE4KYC8eJ+hCJGy61f4uMVoz0rnO6IbkIFcTdDBfX7SUC
 XSbU5lE2AAnJqiSDskCKEc6UwFDgCQ7diYcotPHW/dwWXHKaUe9rNXUcKMuxf6eFxE8U
 LUci5pUBS/+2y5LRNE8jpXFDpJ1Kv+3q41rgm6aTNsaWZeUYVObVXds3mq48bLz/7HCN
 f7XKOmuShI5beJrAXPiHl48lN3EQJIJddKi32hxf0WxWsT4N9pVxs+gcj+kNpUnyf2Oo
 ZoVy9tiekLvqUp8HWXLxRlWCH/33QYM3kgxfZWn0wdIH2nVKBwB4wHU7flhwYlasv8MI
 SAXA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jIHwgMjAgKysrKysr
KysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdf
NC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMKaW5kZXggMmUxMDk4
YzVjMzJiLi5mYzQ1ZWFlYWJhNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L25iaW9fdjdfNC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdf
NC5jCkBAIC04NiwxMCArODYsMjQgQEAgc3RhdGljIHUzMiBuYmlvX3Y3XzRfZ2V0X21lbXNpemUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiBzdGF0aWMgdm9pZCBuYmlvX3Y3XzRfc2RtYV9k
b29yYmVsbF9yYW5nZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGluc3RhbmNlLAog
CQkJYm9vbCB1c2VfZG9vcmJlbGwsIGludCBkb29yYmVsbF9pbmRleCwgaW50IGRvb3JiZWxsX3Np
emUpCiB7Ci0JdTMyIHJlZyA9IGluc3RhbmNlID09IDAgPyBTT0MxNV9SRUdfT0ZGU0VUKE5CSU8s
IDAsIG1tQklGX1NETUEwX0RPT1JCRUxMX1JBTkdFKSA6Ci0JCQlTT0MxNV9SRUdfT0ZGU0VUKE5C
SU8sIDAsIG1tQklGX1NETUExX0RPT1JCRUxMX1JBTkdFKTsKKwl1MzIgcmVnLCBkb29yYmVsbF9y
YW5nZTsKIAotCXUzMiBkb29yYmVsbF9yYW5nZSA9IFJSRUczMihyZWcpOworCWlmIChpbnN0YW5j
ZSA8IDIpCisJCXJlZyA9IGluc3RhbmNlICsKKwkJCVNPQzE1X1JFR19PRkZTRVQoTkJJTywgMCwg
bW1CSUZfU0RNQTBfRE9PUkJFTExfUkFOR0UpOworCWVsc2UKKwkJLyoKKwkJICogVGhlc2UgcmVn
aXN0ZXJzIGFkZHJlc3Mgb2YgU0RNQTJ+NyBpcyBub3QgY29uc2VjdXRpdmUKKwkJICogZnJvbSBT
RE1BMH4xLiBOZWVkIHBsdXMgNCBkd29yZHMgb2Zmc2V0LgorCQkgKgorCQkgKiAgIEJJRl9TRE1B
MF9ET09SQkVMTF9SQU5HRTogIDB4M2JjMAorCQkgKiAgIEJJRl9TRE1BMV9ET09SQkVMTF9SQU5H
RTogIDB4M2JjNAorCQkgKiAgIEJJRl9TRE1BMl9ET09SQkVMTF9SQU5HRTogIDB4M2JkOAorCQkg
Ki8KKwkJcmVnID0gaW5zdGFuY2UgKyAweDQgKworCQkJU09DMTVfUkVHX09GRlNFVChOQklPLCAw
LCBtbUJJRl9TRE1BMF9ET09SQkVMTF9SQU5HRSk7CisKKwlkb29yYmVsbF9yYW5nZSA9IFJSRUcz
MihyZWcpOwogCiAJaWYgKHVzZV9kb29yYmVsbCkgewogCQlkb29yYmVsbF9yYW5nZSA9IFJFR19T
RVRfRklFTEQoZG9vcmJlbGxfcmFuZ2UsIEJJRl9TRE1BMF9ET09SQkVMTF9SQU5HRSwgT0ZGU0VU
LCBkb29yYmVsbF9pbmRleCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
