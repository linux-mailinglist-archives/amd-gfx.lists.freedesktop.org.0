Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3A5D77B
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E97A6E079;
	Tue,  2 Jul 2019 20:29:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8B26E072
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:33 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id d17so20144741qtj.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PImRe2j6IAjUtsKBMeuzyqAQ1yk6q4Yzd8kjCdeLGw=;
 b=lubA47ulgzHLr3RcJqyOTBo1Gc5CEc0ibRw29bhQuVRl+F9mTL4KUkXXOluW2MilHq
 ZtiHvSJuCE5TUZppzrdOaHhH8WDcY3cIW2VYe7+bJIPQeRMZUeo81SeuGd3kv5e0GYUa
 8nWvGpetsaOJCIklpLno6Tv7tG3OpSq1HsGE1uZ+OvpOzxyHVdYFlLPJoesRRGfd+iTO
 mZQBAWqoBWfFxrvH6pxalKjz+QNB8zu4pZDt6wfnRMYWTl0dueFb5GYCusXFUl7YWq/U
 PZhEtGYh8awss+quVuP/QF7c+OSMyGHg1brCRfIJePWAVqxon1edmTvGv/W9Lw8DTQUV
 Pe9w==
X-Gm-Message-State: APjAAAUAlPxHzGmQ5L7M4q0c6ze+OAGjTN5Ohk95bW8PFlZ0yI47WSvO
 Z6UeOkgEGkcGHLUfcVs2CeDO1CYAsCo=
X-Google-Smtp-Source: APXvYqw3Ug0feTLyqMs09XwrHpkcs3SwVb8vNmdTazBD5yYQbTZ8lGUcSYVQtIkmbmqQCAcnbn2zDA==
X-Received: by 2002:a0c:99e9:: with SMTP id y41mr27754253qve.186.1562099372006; 
 Tue, 02 Jul 2019 13:29:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 41/53] drm/amdgpu: Enable VCN on navi14
Date: Tue,  2 Jul 2019 15:28:32 -0500
Message-Id: <20190702202844.17001-42-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PImRe2j6IAjUtsKBMeuzyqAQ1yk6q4Yzd8kjCdeLGw=;
 b=fqW4WtIEu7FqDNJJbkz3ki2N0oY5gTTGrYpv4iLfIX/sUsmdd8M9y1hYl33VMdtRgE
 cuOnolIBSYHtB+G9VswyooYbgOSep3KQ7iLwkK97Hxyrh/oSMGtehi6choq2dp35insw
 f225rYcCX+QG5QnEFgr1N/bNkYNoEL7VqlMffTCQYTh8cQNsBKjH7se4L3QMO5Zu2DxI
 Z0PCCrUUWBeVDU9A/U5Gfh+UmSgjQmNJs6iYuDrKBsaDs0i4pjWq68+sqWoXLE2gbR97
 4XqgO8S2ujfl8rQMOnt9vllvYB8sLEH7ttdQCC1/buEb5o7dQZ+05B3ecgwbmvhO/BDX
 /hXg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCkFkZCBuYXZpMTQgdmNuIGZpcm13
YXJlLCBhbmQgZW5hYmxlIFZDTiBvbiBuYXZpMTQuCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUg
PEphbWVzLlpodUBhbWQuY29tPgpSZXZpZXdlZC1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIHwgNSArKysrKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyAgICAgICAgIHwgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y24uYwppbmRleCBjNjA0ZjE1MDRkM2UuLmYzYWFmNTUzMWMwZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y24uYwpAQCAtNDYsMTEgKzQ2LDEzIEBACiAjZGVmaW5lIEZJUk1X
QVJFX1BJQ0FTU08JImFtZGdwdS9waWNhc3NvX3Zjbi5iaW4iCiAjZGVmaW5lIEZJUk1XQVJFX1JB
VkVOMgkJImFtZGdwdS9yYXZlbjJfdmNuLmJpbiIKICNkZWZpbmUgRklSTVdBUkVfTkFWSTEwIAki
YW1kZ3B1L25hdmkxMF92Y24uYmluIgorI2RlZmluZSBGSVJNV0FSRV9OQVZJMTQgCSJhbWRncHUv
bmF2aTE0X3Zjbi5iaW4iCiAKIE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9SQVZFTik7CiBNT0RV
TEVfRklSTVdBUkUoRklSTVdBUkVfUElDQVNTTyk7CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVf
UkFWRU4yKTsKIE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9OQVZJMTApOworTU9EVUxFX0ZJUk1X
QVJFKEZJUk1XQVJFX05BVkkxNCk7CiAKIHN0YXRpYyB2b2lkIGFtZGdwdV92Y25faWRsZV93b3Jr
X2hhbmRsZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsKIApAQCAtNzksNiArODEsOSBAQCBp
bnQgYW1kZ3B1X3Zjbl9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkgICAg
KGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpCiAJCQlhZGV2LT52Y24u
aW5kaXJlY3Rfc3JhbSA9IHRydWU7CiAJCWJyZWFrOworICAgIGNhc2UgQ0hJUF9OQVZJMTQ6CisJ
CWZ3X25hbWUgPSBGSVJNV0FSRV9OQVZJMTQ7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVy
biAtRUlOVkFMOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IGE4MTVhYWRkNDBiMi4u
MzQ1MmZjMTBiYzk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTM3NSw2ICszNzUsNyBA
QCBpbnQgbnZfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkbV9pcF9ibG9jayk7CiAJCWFtZGdwdV9k
ZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwogCQlhbWRncHVf
ZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NV8wX2lwX2Jsb2NrKTsKKwkJYW1kZ3B1
X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZjbl92Ml8wX2lwX2Jsb2NrKTsKIAkJYnJlYWs7
CiAJZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
