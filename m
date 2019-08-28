Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491EA0AE8
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A5189F33;
	Wed, 28 Aug 2019 19:57:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21C089EA3
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:51 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m2so851510qkd.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNK4x6nb5OiXQ7aRzyNvQA0fHp9ppNj6JUlO+Vza/CQ=;
 b=i3B6uEfqn4HkDEgt82D2OtHc33g1sETgMm4E2QRHCpDdBXHCK+7I00SaUkSqelV0I7
 yELmyPydn0CViXgvXFZiNTofUoaWOZJqhhUcJpZeE6PiFUSFMc/XkCg/FvLV/JZE1JyW
 A3xQ4ClYpamdNuTJcNS/ZQoApDAOENx5pTeMzjALfS6T5XXIK6gSgQQlkU7CEZfqeuzw
 3m7Z0zEjS5BGXxo7HDJJVME2MabHn9FO5ErPp3FK9B7+BJh2PGA8DjOuOBlJ+ho60aXn
 PYH/HPhH9+V3E0jZtjVPbtBY4J41KXk5I0XuzPTFvD9+7TVwPsz8p5MrLpXDBBdDGJsu
 1qXQ==
X-Gm-Message-State: APjAAAWV5DmCNQT9WVpHfpDQc6RD403GmFOdYG46ixQ3riM/zjQz0sQj
 /PmrhjOesp9qx4sDKQfx4XzierBu
X-Google-Smtp-Source: APXvYqyM9GiQCGqJnT4iJQ568aSKhq0sJgByVhHXBvUFhYrJ5B7eoFuUv4k7hfpCSMSlXCSNAl5zyQ==
X-Received: by 2002:a37:410:: with SMTP id 16mr3988861qke.52.1567022210846;
 Wed, 28 Aug 2019 12:56:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/23] drm/amd/display: add dcn21 core DC changes
Date: Wed, 28 Aug 2019 14:56:17 -0500
Message-Id: <20190828195622.28941-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNK4x6nb5OiXQ7aRzyNvQA0fHp9ppNj6JUlO+Vza/CQ=;
 b=lMkK6aPvYNKneBchuEYuCsbC+NEX3s5HfzAdlOwj5rgVlqovWYrTaN9JZFPRPGaRi7
 nenb3It25WIzSU1/NqwK+OKHJLM7xad5WOBGcnbt0BMjRy2N4j6MkrhWc2Lox/iAp0eq
 kS6NrgI9UdOdr1JA54sbdbKYzGBMfJ+NnuYRvwaSoUo1OVLpaeP5APEWEHmf0ezfKsCx
 /jlvjjIHB2lh9w7PZXCSefk7iPym/WPhfRyarbWZgv724RqbL97gM54OsynUDTDvZPNt
 CwWik8F53w04IwU9EuR4xp916pfSZFHoxhuaI6v3IUYWZx9wJvLHkI6fAna00rsKzuxx
 Gbng==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpBZGQg
bWlzc2luZyBwYXJhbWV0ZXJzLCB0byBtYWtlIGRjbjIxIGNvbXBpbGUKd2l0aG91dCBlcnJvcnMK
ClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgICAg
ICB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMu
aCAgIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbWVtX2lu
cHV0LmggfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHdfc2Vx
dWVuY2VyLmggfCAxICsKIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggNDJiNmE2ZTQxYzBiLi5hODIzNTJhODc4MDgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0zODUsNiArMzg1LDkgQEAgc3Ry
dWN0IGRjX2RlYnVnX29wdGlvbnMgewogCXN0cnVjdCBkY19id192YWxpZGF0aW9uX3Byb2ZpbGUg
YndfdmFsX3Byb2ZpbGU7CiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKIAli
b29sIGRpc2FibGVfZmVjOworI2VuZGlmCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8x
CisJYm9vbCBkaXNhYmxlXzQ4bWh6X3B3cmR3bjsKICNlbmRpZgogCS8qIFRoaXMgZm9yY2VzIGEg
aGFyZCBtaW4gb24gdGhlIERDRkNMSyByZXF1ZXN0ZWQgdG8gU01VL1BQCiAJICogd2F0ZXJtYXJr
cyBhcmUgbm90IGFmZmVjdGVkLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2luYy9jb3JlX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2NvcmVfdHlwZXMuaAppbmRleCA4NzI2YmQ3ZGQ5MTAuLmYxODkzMDc3NTBhYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmgKQEAgLTg3
LDYgKzg3LDkgQEAgdm9pZCBjb3JlX2xpbmtfc2V0X2F2bXV0ZShzdHJ1Y3QgcGlwZV9jdHggKnBp
cGVfY3R4LCBib29sIGVuYWJsZSk7CiBzdHJ1Y3QgcmVzb3VyY2VfcG9vbDsKIHN0cnVjdCBkY19z
dGF0ZTsKIHN0cnVjdCByZXNvdXJjZV9jb250ZXh0OworI2lmIGRlZmluZWQoQ09ORklHX0RSTV9B
TURfRENfRENOMl8xKQorc3RydWN0IGNsa19id19wYXJhbXM7CisjZW5kaWYKIAogc3RydWN0IHJl
c291cmNlX2Z1bmNzIHsKIAl2b2lkICgqZGVzdHJveSkoc3RydWN0IHJlc291cmNlX3Bvb2wgKipw
b29sKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcv
bWVtX2lucHV0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L21lbV9p
bnB1dC5oCmluZGV4IDcxOTNhY2ZjZDc3OS4uZTg2NjgzODg1ODFiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L21lbV9pbnB1dC5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbWVtX2lucHV0LmgKQEAgLTQwLDYgKzQw
LDEwIEBAIHN0cnVjdCBjc3RhdGVfcHN0YXRlX3dhdGVybWFya3Nfc3Qgewogc3RydWN0IGRjbl93
YXRlcm1hcmtzIHsKIAl1aW50MzJfdCBwdGVfbWV0YV91cmdlbnRfbnM7CiAJdWludDMyX3QgdXJn
ZW50X25zOworI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8xKQorCXVpbnQzMl90
IGZyYWNfdXJnX2J3X25vbTsKKwl1aW50MzJfdCBmcmFjX3VyZ19id19mbGlwOworI2VuZGlmCiAJ
c3RydWN0IGNzdGF0ZV9wc3RhdGVfd2F0ZXJtYXJrc19zdCBjc3RhdGVfcHN0YXRlOwogfTsKIApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9od19zZXF1ZW5j
ZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHdfc2VxdWVuY2VyLmgK
aW5kZXggNzMyYTkzZGYxODQ0Li4zYTkzOGNkNDE0ZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHdfc2VxdWVuY2VyLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9od19zZXF1ZW5jZXIuaApAQCAtNDgsNiArNDgsNyBAQCBz
dHJ1Y3QgZGNlX2h3c2VxX3dhIHsKIAlib29sIERFR1ZJRENOMTBfMjUzOwogCWJvb2wgZmFsc2Vf
b3B0Y191bmRlcmZsb3c7CiAJYm9vbCBERUdWSURDTjEwXzI1NDsKKwlib29sIERFR1ZJRENOMjE7
CiB9OwogCiBzdHJ1Y3QgaHdzZXFfd2Ffc3RhdGUgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
