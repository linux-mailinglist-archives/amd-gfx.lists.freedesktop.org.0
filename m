Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D3155ECE
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Feb 2020 20:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876356FD6B;
	Fri,  7 Feb 2020 19:51:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516876FD6B;
 Fri,  7 Feb 2020 19:51:09 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w47so312352qtk.4;
 Fri, 07 Feb 2020 11:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQTFjwgMEchTjLa3goNtnNye4mlWjyfx3vJFX1V23Ig=;
 b=vaJUVCOi5v0TRstikZiNpLyIp0J0TWcPezuaqN/KxCzIM7Ir9CG/TrQy+KelUXXCGP
 u4KJ1kXRGQrKtxfxF4H4IZApF04ocIGcMa97XiEf/ozxe2IFpRyd2JZY78ZVRvzrlaXq
 I+Mae8RQIQh7pCUJebu4AeDO955DRmW4oopXVuzRxpp8OW/1oPkes/sZYXjBaSneQY8v
 3vfZRsIEmtvcsMJcVp5dJSsurl0fpjoDgDtfOg1A6FxeIYo7QxLZ0ycLZDxXtI0yGNkF
 QmWnNDk8DnfmgasMLRBrzObkdqFlaDolt/oKpqrS3OZzbSbPSuNgnnsqMwTPTulAIB6x
 fs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQTFjwgMEchTjLa3goNtnNye4mlWjyfx3vJFX1V23Ig=;
 b=HIgoWjosnVeb9a65W9CSN0NQx8Auw9jjSF5CaEGzrlIMY2mblK1TM+VHWRM1Pj7X3w
 4Lv0GRvENNE+f/zlAF4wqhxMAYX915noWQQVjP6Zq12Hfpo0WIW53lnc1IMiYXZMRdRa
 pBeSi9oV1mcG3HiTvnqS6mjH8XsKtks5+cxUqTnTntpHNqE9E9nqmR5+aCIpgIQSeFlU
 /aix1dl9mPklr2q+HBONXRWS/O4/CUTI8cQu0xINyJtEcIDpIleYv1tsFzvk+J4hwFFn
 Z+0Y0TTK1Hq+xTGuzzqlo7rs8uYIJfCJVkz1k9wVUeWLXq13wqRgYxaIYha4KRb5bHbU
 /7Ow==
X-Gm-Message-State: APjAAAVWPHbKMgZZ09kBa+2ZFM8rLBnNYFg2GezUbewwH+WngXZJzYf3
 gVtj9Zs6r68aaoHLVKY41KDaP2tr
X-Google-Smtp-Source: APXvYqxx7Fpnk1NwLQzdVBi75uNBt8CBi4/gTdvBmSoGbVklIICWD8vH/QCumpZlnUZOF1EUGRwzMg==
X-Received: by 2002:ac8:718e:: with SMTP id w14mr11143qto.266.1581105068074;
 Fri, 07 Feb 2020 11:51:08 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:07 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/15] drm/amdgpu/ttm: move debugfs init into core amdgpu
 debugfs
Date: Fri,  7 Feb 2020 14:50:45 -0500
Message-Id: <20200207195058.2354-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcmVtb3ZlIHRoZSBsb2FkIGFuZCB1bmxvYWQgZHJtIGNhbGxiYWNrcywKd2Ug
bmVlZCB0byByZW9yZGVyIHRoZSBpbml0IHNlcXVlbmNlIHRvIG1vdmUgYWxsIHRoZSBkcm0KZGVi
dWdmcyBmaWxlIGhhbmRsaW5nLiAgRG8gdGhpcyBmb3IgdHRtLgoKQWNrZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCAxMCArKysrKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgIHwgMTQgKystLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCAgICAgfCAgMyArKysKIDMgZmlsZXMg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKaW5kZXggNThiNWUxYjRmODE0Li5mNDk2
MDRjMGQwYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZWJ1Z2ZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMu
YwpAQCAtMTIxNiw2ICsxMjE2LDggQEAgREVGSU5FX1NJTVBMRV9BVFRSSUJVVEUoZm9wc19pYl9w
cmVlbXB0LCBOVUxMLAogCiBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIHsKKwlpbnQgcjsKKwogCWFkZXYtPmRlYnVnZnNfcHJlZW1wdCA9CiAJCWRl
YnVnZnNfY3JlYXRlX2ZpbGUoImFtZGdwdV9wcmVlbXB0X2liIiwgMDYwMCwKIAkJCQkgICAgYWRl
di0+ZGRldi0+cHJpbWFyeS0+ZGVidWdmc19yb290LCBhZGV2LApAQCAtMTIyNSwxMiArMTIyNywy
MCBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAkJcmV0dXJuIC1FSU87CiAJfQogCisJLyogUmVnaXN0ZXIgZGVidWdmcyBlbnRyaWVzIGZvciBh
bWRncHVfdHRtICovCisJciA9IGFtZGdwdV90dG1fZGVidWdmc19pbml0KGFkZXYpOworCWlmIChy
KSB7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIGluaXQgZGVidWdmc1xuIik7CisJCXJldHVybiBy
OworCX0KKwogCXJldHVybiBhbWRncHVfZGVidWdmc19hZGRfZmlsZXMoYWRldiwgYW1kZ3B1X2Rl
YnVnZnNfbGlzdCwKIAkJCQkJQVJSQVlfU0laRShhbWRncHVfZGVidWdmc19saXN0KSk7CiB9CiAK
IHZvaWQgYW1kZ3B1X2RlYnVnZnNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsK
KwlhbWRncHVfdHRtX2RlYnVnZnNfZmluaShhZGV2KTsKIAlkZWJ1Z2ZzX3JlbW92ZShhZGV2LT5k
ZWJ1Z2ZzX3ByZWVtcHQpOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMKaW5kZXggNzZmODZkNjRkZDM1Li4xNWY1NDUxZDMxMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTY4LDkgKzY4LDYgQEAgc3RhdGljIGludCBhbWRncHVf
bWFwX2J1ZmZlcihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJICAgICBzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsCiAJCQkgICAgIHVpbnQ2NF90ICphZGRyKTsKIAotc3RhdGljIGlu
dCBhbWRncHVfdHRtX2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Ci1z
dGF0aWMgdm9pZCBhbWRncHVfdHRtX2RlYnVnZnNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7Ci0KIHN0YXRpYyBpbnQgYW1kZ3B1X2ludmFsaWRhdGVfY2FjaGVzKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCBmbGFncykKIHsKIAlyZXR1cm4gMDsKQEAgLTE5MjEs
MTIgKzE5MTgsNiBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCQlyZXR1cm4gcjsKIAl9CiAKLQkvKiBSZWdpc3RlciBkZWJ1Z2ZzIGVudHJpZXMgZm9y
IGFtZGdwdV90dG0gKi8KLQlyID0gYW1kZ3B1X3R0bV9kZWJ1Z2ZzX2luaXQoYWRldik7Ci0JaWYg
KHIpIHsKLQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gaW5pdCBkZWJ1Z2ZzXG4iKTsKLQkJcmV0dXJu
IHI7Ci0JfQogCXJldHVybiAwOwogfQogCkBAIC0xOTQ4LDcgKzE5MzksNiBAQCB2b2lkIGFtZGdw
dV90dG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlpZiAoIWFkZXYtPm1tYW4u
aW5pdGlhbGl6ZWQpCiAJCXJldHVybjsKIAotCWFtZGdwdV90dG1fZGVidWdmc19maW5pKGFkZXYp
OwogCWFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7CiAJLyogcmV0
dXJuIHRoZSBJUCBEaXNjb3ZlcnkgVE1SIG1lbW9yeSBiYWNrIHRvIFZSQU0gKi8KIAlhbWRncHVf
Ym9fZnJlZV9rZXJuZWwoJmFkZXYtPmRpc2NvdmVyeV9tZW1vcnksIE5VTEwsIE5VTEwpOwpAQCAt
MjU0OCw3ICsyNTM4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB7CiAKICNlbmRpZgogCi1zdGF0
aWMgaW50IGFtZGdwdV90dG1fZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQoraW50IGFtZGdwdV90dG1fZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogewogI2lmIGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTKQogCXVuc2lnbmVkIGNvdW50OwpAQCAt
MjU4NCw3ICsyNTc0LDcgQEAgc3RhdGljIGludCBhbWRncHVfdHRtX2RlYnVnZnNfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKICNlbmRpZgogfQogCi1zdGF0aWMgdm9pZCBhbWRncHVf
dHRtX2RlYnVnZnNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3ZvaWQgYW1kZ3B1
X3R0bV9kZWJ1Z2ZzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAjaWYgZGVm
aW5lZChDT05GSUdfREVCVUdfRlMpCiAJdW5zaWduZWQgaTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uaAppbmRleCBmMWViZDQyNDUxMGMuLjJjNGFkNWI1ODlkMCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaApAQCAtMTMzLDQgKzEzMyw3IEBAIHVp
bnQ2NF90IGFtZGdwdV90dG1fdHRfcGRlX2ZsYWdzKHN0cnVjdCB0dG1fdHQgKnR0bSwgc3RydWN0
IHR0bV9tZW1fcmVnICptZW0pOwogdWludDY0X3QgYW1kZ3B1X3R0bV90dF9wdGVfZmxhZ3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSwKIAkJCQkgc3RydWN0
IHR0bV9tZW1fcmVnICptZW0pOwogCitpbnQgYW1kZ3B1X3R0bV9kZWJ1Z2ZzX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwordm9pZCBhbWRncHVfdHRtX2RlYnVnZnNfZmluaShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CisKICNlbmRpZgotLSAKMi4yNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
