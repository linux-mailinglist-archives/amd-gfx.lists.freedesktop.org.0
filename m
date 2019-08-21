Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617B98727
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0F9897FF;
	Wed, 21 Aug 2019 22:24:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9832F6EA22
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:29 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id z4so5139983qtc.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KJWH1/Ph8bMaQ3DQNYiQ/OwjlIsQ8N+MhjEXWBjdIlI=;
 b=nsZ5n/Io/LzYx+Nga+X1MUSJOcDTAGTpXS39M9qYXfZh4nOllQNjNNnjrOM3Rt3cyn
 5uFGhqbfoHLXX3qr6F4gaYA15WvfussIlc9WybVVGODp/2hpQAfYjgHHhydn9dh+bVPv
 ux8rHF7i2P41+GOcnGJg1R6U0CWnnEqcZ7Usl942KkVRFfnJ+BlykN0Ye9iKVF5vQjS+
 TE+uVlt+Cu0vljkiggH/Kah2aHWY77PLgAC+DB0AZKx5ogQMEUZLzQUS/yILXXOTP3eX
 9hWfPzbRJXhi+LGTV8dZYOgy0tsmYyPcZiSE5QZv6vo+T6paJuBh2QAA2lEHpIpFndpr
 8mCA==
X-Gm-Message-State: APjAAAWVtQ6BCfGmKmztHPzlJMB3COw8INmy0iuz4CvAYyG5oi8inAnm
 b7O0hLvkSeJK2C1o26r1ecvLd+uj
X-Google-Smtp-Source: APXvYqw7UbiECKjNSA0GKdMfCJdukDYSoFkFjOy+3l0NuBYqS1afETntE99GU8g8RA6ZJoXW9/7C8w==
X-Received: by 2002:ac8:7046:: with SMTP id y6mr6769942qtm.131.1566426268594; 
 Wed, 21 Aug 2019 15:24:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/37] drm/amdgpu: enable gfx clock gating for rn
Date: Wed, 21 Aug 2019 17:23:41 -0500
Message-Id: <20190821222359.13578-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KJWH1/Ph8bMaQ3DQNYiQ/OwjlIsQ8N+MhjEXWBjdIlI=;
 b=IjZwlNDi3yS3uDAX/NlKMKtOG0NZrXGw+qMk7bEJvu/ZzqhzmyMyWShHrdMEvrmNKn
 8XSH8P8eIHP5VpZVVKnSQV8zKNDRSeSoIpzjHjch0EStnzaB2fJIaS6MGQQehiYXMBp2
 eoH52fSo4qrPcncXG9D9tFPw0nwfkTn9fPWkFglHj2/Agt8o3WYY+j+aLPrxr9ZwNrS1
 +VpeDF+o7XNd0KHYUGEiOXEA0txaEBXRa7lIiu/OA/YkbGpNWDSgTRUfg5tyAF0Eqd7G
 EhSnqoMgTWueB4ZyvUlJt9l4Z44ZZ0jjuJQXQQT9tcqqVe4dBff/y3uEo0GE+TublsTH
 dT1w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgZ2Z4IGNnL21n
L2NwIGV0YyBjbG9jayBnYXRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2Uu
TGlhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA4ICsr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggYzA5MmJlNDVmNWUyLi5kNGNiN2E2NjAy
NGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTE1NCw3ICsxMTU0LDEzIEBA
IHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQlicmVh
azsKIAljYXNlIENISVBfUkVOT0lSOgogCQlhZGV2LT5hc2ljX2Z1bmNzID0gJnNvYzE1X2FzaWNf
ZnVuY3M7Ci0JCWFkZXYtPmNnX2ZsYWdzID0gMDsKKwkJYWRldi0+Y2dfZmxhZ3MgPSBBTURfQ0df
U1VQUE9SVF9HRlhfTUdDRyB8CisJCQkJIEFNRF9DR19TVVBQT1JUX0dGWF9NR0xTIHwKKwkJCQkg
QU1EX0NHX1NVUFBPUlRfR0ZYXzNEX0NHQ0cgfAorCQkJCSBBTURfQ0dfU1VQUE9SVF9HRlhfM0Rf
Q0dMUyB8CisJCQkJIEFNRF9DR19TVVBQT1JUX0dGWF9DR0NHIHwKKwkJCQkgQU1EX0NHX1NVUFBP
UlRfR0ZYX0NHTFMgfAorCQkJCSBBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFM7CiAJCWFkZXYtPnBn
X2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHg5
MTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
