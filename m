Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CC69E37
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425FB89FA9;
	Mon, 15 Jul 2019 21:25:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046789FA7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:48 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so17233145qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hoozCoK/8cbIwu+7XtpDqBcQVAvpbAOFGkFmjg3WgbQ=;
 b=PZ0Z+nRwUcjevg/REeetm8z35SRjQMIMVGX4GSxr+blXR66E8A2+Jq3IDs+9jre5eg
 n4+jySJv2wG+a2GCA339ewTFwPIAmsjPZitwm6wYz8A+rF15HBpn0i6aLmGNNBB6QGCW
 AaEjkp0w8YSyfPu0IW9l96cW6d93WuR7aBWGBl5sp0NZzLuqkW9zF77AbNlMl+ndZHcz
 5l/rq50ilgwk4nWpAQGzpVQAMspzVJKmLDhsCswRbnL75/trNXUZTUu60q2mxgcuNMx1
 mTDMKasPB+4zW+0pEAwBZUCp4DNuZMTtquqI9SRmIb7bUJuFZKbtCKzTi1JkG4hzIZV4
 ukGA==
X-Gm-Message-State: APjAAAVCsI4KdlI9K9WTTsEIngrV0Oi8BZ1t5twTG5kPlGsTDCWDD8j0
 x0EQvOj9qSmDSkTrVVSTdeOj50Nn
X-Google-Smtp-Source: APXvYqyExbXh4D+1QEaFzInkFL6ACKrRxx13sm3Y6vJKcUvHIpOXfqDxwQeJHY+unkrisNkdJ8ObvA==
X-Received: by 2002:a0c:d0fc:: with SMTP id b57mr20805364qvh.78.1563225947499; 
 Mon, 15 Jul 2019 14:25:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 070/102] drm/amd/powerplay: get smc firmware and pptable
Date: Mon, 15 Jul 2019 16:24:05 -0500
Message-Id: <20190715212437.31793-68-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hoozCoK/8cbIwu+7XtpDqBcQVAvpbAOFGkFmjg3WgbQ=;
 b=afabOlRRqehGc2kLnFJzBjKwiQPLGHSAK42vHPfOXilRrajs+pxbWS/nIRQK2b7CBV
 kNi5u4OZEuln/jhjuKchfHHLP0HS34WZjdZXogwkFz9kV4DNN70LlssiaU+M9JB4kts4
 N3C1ns9Khc5qdsp+kEJTFJ/Q1tZ3BNh7UJelbLJl8hsxl9j2gzvFUUc76gTre2FGKj39
 HVEL29AYRtlfhp30jZpjSu+Iv5bSMV2wRsTcCu3skpvdnt+c2xS0M+c6jH5zz1qEuWVe
 wsx9yEySr5hy+kx7IiVSZmr1IhFxoucqUSdJvpyf4uxYkahoEPhZgRFEkad/UDV4zgkR
 H+0Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hlbmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNvbT4KCmdldCBzbWMgZmlybXdhcmUg
YW5kIHBwdGFibGUgZm9yIGFyY3R1cnVzCgpTaWduZWQtb2ZmLWJ5OiBDaGVuZ21pbmcgR3VpIDxK
YWNrLkd1aUBhbWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMTEg
KysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCBkMDc2
NGJhMjcwNWMuLjdkNzIzYTVlNDEzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211X3YxMV8wLmMKQEAgLTQzLDYgKzQzLDcgQEAKICNpbmNsdWRlICJhc2ljX3JlZy9zbXVpby9z
bXVpb18xMV8wXzBfc2hfbWFzay5oIgogCiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMjBf
c21jLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfc21jLmJpbiIpOwog
TU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX3NtYy5iaW4iKTsKIE1PRFVMRV9GSVJNV0FS
RSgiYW1kZ3B1L25hdmkxNF9zbWMuYmluIik7CiAKQEAgLTE1Myw2ICsxNTQsOSBAQCBzdGF0aWMg
aW50IHNtdV92MTFfMF9pbml0X21pY3JvY29kZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlj
YXNlIENISVBfVkVHQTIwOgogCQljaGlwX25hbWUgPSAidmVnYTIwIjsKIAkJYnJlYWs7CisJY2Fz
ZSBDSElQX0FSQ1RVUlVTOgorCQljaGlwX25hbWUgPSAiYXJjdHVydXMiOworCQlicmVhazsKIAlj
YXNlIENISVBfTkFWSTEwOgogCQljaGlwX25hbWUgPSAibmF2aTEwIjsKIAkJYnJlYWs7CkBAIC0y
MDQsNyArMjA4LDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfbG9hZF9taWNyb2NvZGUoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUpCiAJdWludDMyX3QgaTsKIAl1aW50MzJfdCBtcDFfZndfZmxhZ3M7
CiAKLQloZHIgPSAoY29uc3Qgc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJfdjFfMCAqKQlhZGV2
LT5wbS5mdy0+ZGF0YTsKKwloZHIgPSAoY29uc3Qgc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJf
djFfMCAqKSBhZGV2LT5wbS5mdy0+ZGF0YTsKIAlzcmMgPSAoY29uc3QgdWludDMyX3QgKikoYWRl
di0+cG0uZnctPmRhdGEgKwogCQlsZTMyX3RvX2NwdShoZHItPmhlYWRlci51Y29kZV9hcnJheV9v
ZmZzZXRfYnl0ZXMpKTsKIApAQCAtMjkxLDcgKzI5NSw4IEBAIHN0YXRpYyBpbnQgc211X3YxMV8w
X3NldF9wcHRhYmxlX3YyXzAoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHZvaWQgKip0YWJsZSwg
dWluCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgc211X3YxMV8wX3NldF9wcHRhYmxlX3Yy
XzEoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHZvaWQgKip0YWJsZSwgdWludDMyX3QgKnNpemUs
IHVpbnQzMl90IHBwdGFibGVfaWQpCitzdGF0aWMgaW50IHNtdV92MTFfMF9zZXRfcHB0YWJsZV92
Ml8xKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB2b2lkICoqdGFibGUsCisJCQkJICAgICAgdWlu
dDMyX3QgKnNpemUsIHVpbnQzMl90IHBwdGFibGVfaWQpCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBzbXUtPmFkZXY7CiAJY29uc3Qgc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJf
djJfMSAqdjJfMTsKQEAgLTE3MzksNyArMTc0NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211
X2Z1bmNzIHNtdV92MTFfMF9mdW5jcyA9IHsKIAkuc2VuZF9zbWNfbXNnID0gc211X3YxMV8wX3Nl
bmRfbXNnLAogCS5zZW5kX3NtY19tc2dfd2l0aF9wYXJhbSA9IHNtdV92MTFfMF9zZW5kX21zZ193
aXRoX3BhcmFtLAogCS5yZWFkX3NtY19hcmcgPSBzbXVfdjExXzBfcmVhZF9hcmcsCi0JLnNldHVw
X3BwdGFibGU9IHNtdV92MTFfMF9zZXR1cF9wcHRhYmxlLAorCS5zZXR1cF9wcHRhYmxlID0gc211
X3YxMV8wX3NldHVwX3BwdGFibGUsCiAJLmluaXRfc21jX3RhYmxlcyA9IHNtdV92MTFfMF9pbml0
X3NtY190YWJsZXMsCiAJLmZpbmlfc21jX3RhYmxlcyA9IHNtdV92MTFfMF9maW5pX3NtY190YWJs
ZXMsCiAJLmluaXRfcG93ZXIgPSBzbXVfdjExXzBfaW5pdF9wb3dlciwKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
