Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1348F29
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1ED89B78;
	Mon, 17 Jun 2019 19:31:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5231589B78
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:17 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t8so6973864qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUS+zSxRS3x9XJothOgiEZUoy4Y0we2ih8fdDjlemdw=;
 b=Rq14xr9AbZl29WgR9P8I5tlKg9DOS1cVwfb9dYys2qAvGlcMgn0nyfZqpRKf90ammX
 F2eq34otdA7iyrhd4VPJ/wGMRY4PblyrmLzBRQpmkYey43Vivnqp8tCYzgTrUUGwDT51
 RK6Bxml803RF/HJ8tOl+Rdg87AiOmPJAbFNIF+JnXiZZMZ42lImB7jYFaZJaQrzcQNov
 YxFxKEFAIiGstxLpHDf+X4qJ7P87foVFF02rkr+0a526nFlbfD5WKhi7uot9YcZNNiRM
 82whzjncLn8kqmHFVxdNqUeAe3hb74YCpjzhzMP7ChTCWloXBjNT3n+C2cZaA4I/l416
 5E3A==
X-Gm-Message-State: APjAAAUgpN7sgWcSRkDcfmvyJvB10IOxjEW7ipFsdtRcoRCgM6oEYupI
 jgKAM4SLwBtcyeL1rFE9j4OAm6MtCWU=
X-Google-Smtp-Source: APXvYqz0ZROUkdRUB1efMewcJCfYRdHaDdkewlanza0459rW/KTjFHU3phmZ9v0h7tAQT6WBo5OBTA==
X-Received: by 2002:a37:4d16:: with SMTP id a22mr88850895qkb.103.1560799876286; 
 Mon, 17 Jun 2019 12:31:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 203/459] drm/amd/powerplay: remove uvd_gated/vce_gated from
 smu_power_context (v2)
Date: Mon, 17 Jun 2019 14:29:30 -0500
Message-Id: <20190617193106.18231-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUS+zSxRS3x9XJothOgiEZUoy4Y0we2ih8fdDjlemdw=;
 b=W5DjyXMornhlueO6um3CpjrALtxVSVd7JIShmU5Y5UsKfxKbEpYbV8w0lD/uiFUKjY
 qaLzScs4eNencw4UUDYtqefv1ZKQZnu2CQTTBAtHZ+GTORdn11yUqyctr71G9JT1FQ0F
 nS8xjjBDIdCoVKjwR34f3EcwthwM9+rTY6oH0IbL2Bwn7+aeAOpIhdAMkLQcSAR0nwWw
 xETUKcgkRxgRJ4FA7vScKdFvPLobF39EHVf0KcG7DATdroHqPB6+HeqDqKMcLH+LDare
 iOnVOZ/TqS+CsV7I9YFaYPqiCTWYOReWmxeGBghTOaVQfHwLSBQLKBt+GhtuavDboxUq
 zQqg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKSXQncyBub3QgbmVl
ZGVkIGZvciBuYXZpLgoKdjI6IHJlbW92ZSB1bnVzZWQgdmFyaWFibGUgKEFsZXgpCgpTaWduZWQt
b2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAxNCArKysrLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGUwZDAyYTI0NThjNS4u
ZDI0MDBlY2Y1NjdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCkBAIC00NzcsMjEgKzQ3NywxNSBAQCBzdGF0aWMgaW50IG5hdmkxMF9zZXRfZGVmYXVsdF9k
cG1fdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiBzdGF0aWMgaW50IG5hdmkxMF9kcG1f
c2V0X3V2ZF9lbmFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKQogewog
CWludCByZXQgPSAwOwotCXN0cnVjdCBzbXVfcG93ZXJfY29udGV4dCAqc211X3Bvd2VyID0gJnNt
dS0+c211X3Bvd2VyOwotCXN0cnVjdCBzbXVfcG93ZXJfZ2F0ZSAqcG93ZXJfZ2F0ZSA9ICZzbXVf
cG93ZXItPnBvd2VyX2dhdGU7CiAKLQlpZiAoZW5hYmxlICYmIHBvd2VyX2dhdGUtPnV2ZF9nYXRl
ZCkgeworCWlmIChlbmFibGUpIHsKIAkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFt
KHNtdSwgU01VX01TR19Qb3dlclVwVmNuLCAxKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7
Ci0JCXBvd2VyX2dhdGUtPnV2ZF9nYXRlZCA9IGZhbHNlOwogCX0gZWxzZSB7Ci0JCWlmICghZW5h
YmxlICYmICFwb3dlcl9nYXRlLT51dmRfZ2F0ZWQpIHsKLQkJCXJldCA9IHNtdV9zZW5kX3NtY19t
c2coc211LCBTTVVfTVNHX1Bvd2VyRG93blZjbik7Ci0JCQlpZiAocmV0KQotCQkJCXJldHVybiBy
ZXQ7Ci0JCQlwb3dlcl9nYXRlLT51dmRfZ2F0ZWQgPSB0cnVlOwotCQl9CisJCXJldCA9IHNtdV9z
ZW5kX3NtY19tc2coc211LCBTTVVfTVNHX1Bvd2VyRG93blZjbik7CisJCWlmIChyZXQpCisJCQly
ZXR1cm4gcmV0OwogCX0KIAogCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
