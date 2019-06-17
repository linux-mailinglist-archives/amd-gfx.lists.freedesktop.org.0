Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD34148F6A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828DA89C7F;
	Mon, 17 Jun 2019 19:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF4389C7F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:04 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so12186701qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0n9Do9wOWqiOLUUesjkS7+5t+FUdTuRmwWVScjDe7G4=;
 b=hi/zHTsYzK8pjmGu41Cn3Ai7PMC6GrVwT76R5pEpbsZwUn2npzpEDMQElL+jhuDeVd
 HXTwTdxaGye6sb+4Km5uNpr+7yvXsvHq2eGjYfsYy80bMftbBIXPDznwX8kfKnjahRhA
 LXwKKJcr90fe1PJJKFl1dSQO38nV48oi3oKL+CHYUKXF4zsRUkBZRhccfbCB7mqdHZOR
 w6qVjiL5DvTw0Su/sJLJHjCxy/YTMaifwueawcA/JwJIx68A4/iwL1yk/AtMZkf1HzOX
 A3eKzbQCSrMHsQIPvL+mMlJw8cSVK4wbSEwHF9wys1bsIl2UqI64luqRHl55ay7OyOzc
 DgBw==
X-Gm-Message-State: APjAAAWvI0/DIr5pyJLPJtE6SlS7ue/sYY5qYV4DbN95QVbtJQ2FNbXe
 od1YSGezr4VE63hdNaDEcmUGGSXXer4=
X-Google-Smtp-Source: APXvYqzb0m1JQlPLUTZRTiNqreBu5q2V1G/76KB9U07CJLf+qUO07YzQqr/41c/EcMnQjuASLWN7lw==
X-Received: by 2002:ac8:2f90:: with SMTP id l16mr80760975qta.12.1560799922752; 
 Mon, 17 Jun 2019 12:32:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 254/459] amd/powerplay: update the vcn pg
Date: Mon, 17 Jun 2019 14:30:21 -0500
Message-Id: <20190617193106.18231-55-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0n9Do9wOWqiOLUUesjkS7+5t+FUdTuRmwWVScjDe7G4=;
 b=bwEDz08/nRtXZhDfrhfRZpa44n+VkSOVzJcJzcWwrOEXFLTIZomTjVbiFKC+wgarvD
 W1Ev1mEne45pVNq2gOTcuWH3WTdtabZl4GexJ8o7SfZjoYz6IS34JZnKzDg8x/2fvYbC
 R3sPRNnKu//aXn18A4GXmTsFdLL53Gdz4LSSPR6NpY47nbBEgzmq8Ybq16gJyfuvWZ+Q
 XfFosoS7DBcbFyYmeNU8KOvPSREebUCWz5lJE5vihmxDFXcEbP69NfWki80ptwhU4jnO
 urRZTf7TWeDl8Gm2FUUc0G7ME7gZ8FAShdt76mXzYWevw/Pl3kLvgZfTXQ4DV34mFM8N
 30YQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCnVwZGF0ZSB0aGUgdmNu
IHBnIGZ1bmN0aW9uIGluIG5hdmkxMC4KClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2Vu
bmV0aC5mZW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8
ICA2ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAg
ICB8IDE0ICsrKysrKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9h
bWRncHVfc211LmgKaW5kZXggYjYyZDI3MjM4MGQ1Li5hNDgxMmMwNWMwOWMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtNDM5LDkgKzQz
OSwxNSBAQCBzdHJ1Y3Qgc211X2RwbV9jb250ZXh0IHsKIAlzdHJ1Y3QgbWNsb2NrX2xhdGVuY3lf
dGFibGUgKm1jbGtfbGF0ZW5jeV90YWJsZTsKIH07CiAKK3N0cnVjdCBzbXVfcG93ZXJfZ2F0ZSB7
CisJYm9vbCB1dmRfZ2F0ZWQ7CisJYm9vbCB2Y2VfZ2F0ZWQ7Cit9OworCiBzdHJ1Y3Qgc211X3Bv
d2VyX2NvbnRleHQgewogCXZvaWQgKnBvd2VyX2NvbnRleHQ7CiAJdWludDMyX3QgcG93ZXJfY29u
dGV4dF9zaXplOworCXN0cnVjdCBzbXVfcG93ZXJfZ2F0ZSBwb3dlcl9nYXRlOwogfTsKIAogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggMTg2YzU3MjY1
ODBhLi5jZWE1NzA0ZTNmNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKQEAgLTUyMSwxNSArNTIxLDIxIEBAIHN0YXRpYyBpbnQgbmF2aTEwX3NldF9kZWZh
dWx0X2RwbV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHN0YXRpYyBpbnQgbmF2aTEw
X2RwbV9zZXRfdXZkX2VuYWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFibGUp
CiB7CiAJaW50IHJldCA9IDA7CisJc3RydWN0IHNtdV9wb3dlcl9jb250ZXh0ICpzbXVfcG93ZXIg
PSAmc211LT5zbXVfcG93ZXI7CisJc3RydWN0IHNtdV9wb3dlcl9nYXRlICpwb3dlcl9nYXRlID0g
JnNtdV9wb3dlci0+cG93ZXJfZ2F0ZTsKIAotCWlmIChlbmFibGUpIHsKKwlpZiAoZW5hYmxlICYm
IHBvd2VyX2dhdGUtPnV2ZF9nYXRlZCkgewogCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhf
cGFyYW0oc211LCBTTVVfTVNHX1Bvd2VyVXBWY24sIDEpOwogCQlpZiAocmV0KQogCQkJcmV0dXJu
IHJldDsKKwkJcG93ZXJfZ2F0ZS0+dXZkX2dhdGVkID0gZmFsc2U7CiAJfSBlbHNlIHsKLQkJcmV0
ID0gc211X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0dfUG93ZXJEb3duVmNuKTsKLQkJaWYgKHJl
dCkKLQkJCXJldHVybiByZXQ7CisJCWlmICghZW5hYmxlICYmICFwb3dlcl9nYXRlLT51dmRfZ2F0
ZWQpIHsKKwkJCXJldCA9IHNtdV9zZW5kX3NtY19tc2coc211LCBTTVVfTVNHX1Bvd2VyRG93blZj
bik7CisJCQlpZiAocmV0KQorCQkJCXJldHVybiByZXQ7CisJCQlwb3dlcl9nYXRlLT51dmRfZ2F0
ZWQgPSB0cnVlOworCQl9CiAJfQogCiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
