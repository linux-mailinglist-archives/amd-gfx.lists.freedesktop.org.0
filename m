Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11404903C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387796E036;
	Mon, 17 Jun 2019 19:47:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A3E89FEC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so12335524qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zE3UscW6B3BxiuBFirzRVJbeMOVpHln+EmoRXhPZbFk=;
 b=f5df94kIljw4dT5Sosjheh6/hno9/mxgiDQ2tO6HLY/r4xXwuoEQCpvRXWmBPreArI
 uauIqiHFMH18YXFdvwKppJc1hAGGEf8wwxwl1pjiKc3odZMbVna09J3rwzWWZuXas5PU
 SJKBWHGU1rN9WM52Hrtw3uk40+OKu7ps66SfsqZZMNPchNO/seg5wo3UC1dqPGEB28iJ
 0FKoflqEs1wrS4x91X6pXHYoLyMLBTxlAgwEeGV/QZgRxYoXZkfKeZc9jbcA62R51uLK
 TDigjOK2O9628fF1XnX+rS8J2jPYh4WBX3B43YWwS5XfV24Az3Km5c42BwE59JZKjCiZ
 GNBw==
X-Gm-Message-State: APjAAAUzuLAvNC6gD1nfo1PnMJs6YCT5uFHNKmKd7y8EzuV2vvNxTowV
 1wm84Qa/ql4LDQAs3Nv0PdYu3+h5cxKZWw==
X-Google-Smtp-Source: APXvYqxpH1BSux5Oxetm6mg6kn3oKi4mZRvNXSLeC+a4XrSbjWHaTomt0b8keM4GmkLBN3yk1Eoc5Q==
X-Received: by 2002:ac8:2834:: with SMTP id 49mr78034925qtq.326.1560800847915; 
 Mon, 17 Jun 2019 12:47:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 391/459] drm/amd/display: Mark DSC resource as unused after
 copying to the secondary ODM pipe
Date: Mon, 17 Jun 2019 14:45:32 -0500
Message-Id: <20190617194540.18497-92-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zE3UscW6B3BxiuBFirzRVJbeMOVpHln+EmoRXhPZbFk=;
 b=Ro1o1t6LWRGwtzNqz6L8HzVLUgvvLuAdVgq7IrCKVSHVYEO8tivryhgL2k0NMn65YM
 OhDNQ2uQHT8zl8wqbskTU3Y26SKGchky8WLLiheUb99jUKD4C/2JqZMQ7qtprzTY3qvb
 JdE+WqQcvVZR7QAMpIyJL8TdgJbOWyrVWM0s+Bx9wTHgIIxFsplNxqfLn56IUT4XKww8
 Om9ImltfOS/Dxwy49bb1jMgzkHHhxYsEqooO524/hAO4uHP2mBwSdj1m0aNAymKXowad
 dWerogko5G6k2sM77rciqqbb56lopDrK8mftjxmEOmLsGFoYQj3lhNnA/X3JYj0fCG+I
 HZkA==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KRFNDIHJl
c291cmNlIGhhcyB0byBiZSBhY3F1aXJlZCBiZWZvcmUgaXQgY2FuIGJlIHVzZWQgYW5kIHNpbXBs
eSBjb3B5aW5nCmEgcmVmZXJlbmNlIHRvIGl0IGlzIHZlcnkgbGlrZWx5IHRvIGNhdXNlIHByb2Js
ZW1zIHdoZW4gYWNjZXNzaW5nIERTQy4KCltob3ddClNldCBEU0MgcmVzb3VyY2UgcG9pbnRlciB0
byBOVUxMIHRvIG1hcmsgaXQgYXMgdW51c2VkIGFmdGVyIHByaW1hcnkgcGlwZQpyZXNvdXJjZXMg
d2VyZSBjb3BpZWQgdG8gdGhlIHNlY29uZGFyeSBPRE0gcGlwZS4KClNpZ25lZC1vZmYtYnk6IE5p
a29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERteXRybyBM
YWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5w
cmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IGM5YjczNDBjOTYwMS4uYjIz
MzMzYjc0ZjVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMTQyNyw2ICsxNDI3LDkgQEAgc3RhdGljIGJvb2wg
ZGNuMjBfc3BsaXRfc3RyZWFtX2Zvcl9jb21iaW5lKAogCXNlY29uZGFyeV9waXBlLT5wbGFuZV9y
ZXMueGZtID0gcG9vbC0+dHJhbnNmb3Jtc1tzZWNvbmRhcnlfcGlwZS0+cGlwZV9pZHhdOwogCXNl
Y29uZGFyeV9waXBlLT5wbGFuZV9yZXMuZHBwID0gcG9vbC0+ZHBwc1tzZWNvbmRhcnlfcGlwZS0+
cGlwZV9pZHhdOwogCXNlY29uZGFyeV9waXBlLT5wbGFuZV9yZXMubXBjY19pbnN0ID0gcG9vbC0+
ZHBwc1tzZWNvbmRhcnlfcGlwZS0+cGlwZV9pZHhdLT5pbnN0OworI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCisJc2Vjb25kYXJ5X3BpcGUtPnN0cmVhbV9yZXMuZHNjID0gTlVM
TDsKKyNlbmRpZgogCWlmIChwcmltYXJ5X3BpcGUtPmJvdHRvbV9waXBlICYmIHByaW1hcnlfcGlw
ZS0+Ym90dG9tX3BpcGUgIT0gc2Vjb25kYXJ5X3BpcGUpIHsKIAkJQVNTRVJUKCFzZWNvbmRhcnlf
cGlwZS0+Ym90dG9tX3BpcGUpOwogCQlzZWNvbmRhcnlfcGlwZS0+Ym90dG9tX3BpcGUgPSBwcmlt
YXJ5X3BpcGUtPmJvdHRvbV9waXBlOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
