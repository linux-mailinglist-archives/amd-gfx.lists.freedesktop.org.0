Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5060BD36D3
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE596EB9A;
	Fri, 11 Oct 2019 01:21:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E336EB94
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:48 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id 3so11637608qta.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INfHNKePqC2ndFpkiHTprkCnyk7LzyMBcjBmeS74xwA=;
 b=jRK6VjjWCZsTGy+NIi22n6xJ+nHLANdIFsVpVO53SuKuKeagk/ETCGGLkMAO97+HoR
 OqcC1s8RBD0CBmJjXCO+P0itdlUj9bm9STOTrp32VXTBL2MOn3R407PKJkxyLG+6OlBG
 UzY4jR3LD5dFdpPd7ETDhDSOPPwFzw/JeWqo0un2etGm2PjGvr0Sltx9W6OBECqS2brb
 tu7e1WZcomMHFAZbT/iUxDRE98gJfxBYl67EhUJP+v6budpbzzQLlFRWAulb8erru4Ds
 h1S07hyS97MZv5HCisGwHkXLpLgQUAi1UZ8JVDPp/PmQwRHrT1YbPiMfWBgrAYpcaO5G
 7X/w==
X-Gm-Message-State: APjAAAUxpY3vmexguzsmQi31V/GgFh347Nl5h490rJ5kOPFa1X3PsvUm
 oQJPvriJqZa/B4h/u/hxWfOYpz/Z
X-Google-Smtp-Source: APXvYqyli+wem/LEiGFJ3dQdq8i31xfGmykzRYxfTGXuiv0xJSnUiltSdO2Fhe7WaUPKQaw4FGV1Kg==
X-Received: by 2002:aed:2794:: with SMTP id a20mr14097280qtd.353.1570756907135; 
 Thu, 10 Oct 2019 18:21:47 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/15] drm/amdgpu: add new SMU 7.0.1 registers for BACO
Date: Thu, 10 Oct 2019 20:21:23 -0500
Message-Id: <20191011012135.18566-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INfHNKePqC2ndFpkiHTprkCnyk7LzyMBcjBmeS74xwA=;
 b=OT+Wmr7VIUw6ETI+N23d1RmyBVNiso89xszfp08QzmFjUahphz6XG7GFJhXolL07z3
 HnGZGQOmiN2dexvyVfh3q5TctN7CKHWGzZt9WXQ8kgkpKA19q6D5SP7IcbjkUC0cOKIk
 nwp/P1mTjwtSeS3qe34eoM76+bveTovshTt00V/GDrgqVL9VXpH/+CrZT3LLrxj8HGQp
 b7lzhlovKLCBml3upW2jzTB6w0NpttQF4lGwC6hOVlaskcarxOjiTgVfyoh0hh4qnVbq
 gQLsOUZkG3yKnV4bd+/1JlQ4X9USrMhfXSf/pu+IzrEq7ZryFAWPpdRgYIYgYeNU5ux7
 RJYQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9zbXUvc211XzdfMF8xX2Qu
aCAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9z
bXVfN18wXzFfc2hfbWFzay5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211
L3NtdV83XzBfMV9kLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211
L3NtdV83XzBfMV9kLmgKaW5kZXggZGJjMmU3MjNmNjU5Li43MTE2OWRhYTcwMWEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9zbXUvc211XzdfMF8xX2Qu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211L3NtdV83XzBf
MV9kLmgKQEAgLTQ5LDYgKzQ5LDcgQEAKICNkZWZpbmUgaXhDR19TUExMX0ZVTkNfQ05UTF81ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMDUwMDE1
MAogI2RlZmluZSBpeENHX1NQTExfRlVOQ19DTlRMXzYgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAweGMwNTAwMTU0CiAjZGVmaW5lIGl4Q0dfU1BMTF9G
VU5DX0NOVExfNyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4YzA1MDAxNTgKKyNkZWZpbmUgaXhDR19TUExMX1NUQVRVUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhDMDUwMDE1QwogI2RlZmlu
ZSBpeFNQTExfQ05UTF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweGMwNTAwMTYwCiAjZGVmaW5lIGl4Q0dfU1BMTF9TUFJFQURfU1BF
Q1RSVU0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4YzA1
MDAxNjQKICNkZWZpbmUgaXhDR19TUExMX1NQUkVBRF9TUEVDVFJVTV8yICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMDUwMDE2OApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18wXzFfc2hfbWFzay5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18wXzFfc2hf
bWFzay5oCmluZGV4IDZhZjlmMDIxN2IzNC4uNjFhOWE4NGUwYzNhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211L3NtdV83XzBfMV9zaF9tYXNrLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18wXzFf
c2hfbWFzay5oCkBAIC0xOTQsNiArMTk0LDggQEAKICNkZWZpbmUgQ0dfU1BMTF9GVU5DX0NOVExf
Nl9fU1BMTF9MRl9DTlRSX19TSElGVCAweDE5CiAjZGVmaW5lIENHX1NQTExfRlVOQ19DTlRMXzdf
X1NQTExfQldfQ05UUkxfTUFTSyAweGZmZgogI2RlZmluZSBDR19TUExMX0ZVTkNfQ05UTF83X19T
UExMX0JXX0NOVFJMX19TSElGVCAweDAKKyNkZWZpbmUgQ0dfU1BMTF9TVEFUVVNfX1NQTExfQ0hH
X1NUQVRVU19NQVNLIDB4MgorI2RlZmluZSBDR19TUExMX1NUQVRVU19fU1BMTF9DSEdfU1RBVFVT
X19TSElGVCAweDEKICNkZWZpbmUgU1BMTF9DTlRMX01PREVfX1NQTExfU1dfRElSX0NPTlRST0xf
TUFTSyAweDEKICNkZWZpbmUgU1BMTF9DTlRMX01PREVfX1NQTExfU1dfRElSX0NPTlRST0xfX1NI
SUZUIDB4MAogI2RlZmluZSBTUExMX0NOVExfTU9ERV9fU1BMTF9MRUdBQ1lfUERJVl9NQVNLIDB4
MgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
