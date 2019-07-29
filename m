Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD487997D
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAA889FA9;
	Mon, 29 Jul 2019 20:15:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBD06E237
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:34 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id u124so41888030vsu.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8F3mWcJhFYDIHHi/s4GBEJzm6H7Utk8TJO5+0hjwOg=;
 b=fN+wo1C1I3gi2ZRV1M9/NfWEpOWZ1IXKlR0v1Udp0LBb35kVEZ3M/jzgwWlMwBMrDC
 y1BkN0fp75sc7NMEFf34A9dSUcawI5WBBj3xjCLFR7v/k9YT7Ozb048pbITtYhlcZghq
 9BFiyBb8iIzhJ7NV1ogZFN7u/6kgHLcOQWJflzhuCWTk8GxJxf/FpCKOrLsM01dcyMJQ
 gXbOjVa37fgYn5G3jzFczcZbOKHiJNB12qHWTbE5tnQX2UMFRSD3pFLnjcHNFY4SxlUy
 9LcGCytENnPUW93VTP/j/OmYTMAWxiJYL30MrgXF7HnmBYlq7xUofSqbpT0JDRTPVl5O
 yFIw==
X-Gm-Message-State: APjAAAU7iQ8YOiOqmXr66kyEgysU8xx24xtZYnkXco79sMPNVHL8LXjU
 jpxcKaayt530UgDAzMUx29Y0xD+K
X-Google-Smtp-Source: APXvYqxX2VDBAjdcQcKoOBT99nqfI7ttg+GqRdozPh+xKWhkRyuGu2MNlUhJN0U6QLR89Piouz4tWw==
X-Received: by 2002:a67:f795:: with SMTP id j21mr52368770vso.226.1564431333616; 
 Mon, 29 Jul 2019 13:15:33 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/30] drm/amd/powerplay: support VCN powergate status
 retrieval for SW SMU
Date: Mon, 29 Jul 2019 15:14:53 -0500
Message-Id: <20190729201508.16136-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8F3mWcJhFYDIHHi/s4GBEJzm6H7Utk8TJO5+0hjwOg=;
 b=hyy7LQ+Xx7uhNRjtyXpElcueHlp1Lx2K1gxG2SopZB59W+AAw4Dca3uqvpIzLxMvRV
 YiclwMgJ0Hq8GXFg7/drzjRbyOz+tN2ksl3y69Q2NoxsVqBlG+ZfAn3O8YODRcvnytRU
 PztELTrH++EGhntSnyDKCBHBwfBadYQVy7sIOy9gRxdB234hyBoIWgrkJdgAZP66scPW
 7IXEOKCm9I+ADBzg1OsnimrEG+m1yD18GkH4ZOhCDERirAQTVDNPWdYCKLitXb0Q/s4F
 4RMqwEzvp/yMWmgJ78qGnGUdSmz6KV86KLeeA1cRcjN5FGq4GSRjaNH/iNSpOSH3Zpzu
 D9EQ==
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

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkNvbW1vbmx5IHVzZWQgZm9yIFZD
TiBwb3dlcmdhdGUgc3RhdHVzIHJldHJpZXZhbCBmb3IgU1cgU01VLgoKU2lnbmVkLW9mZi1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8
a2VubmV0aC5mZW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggOGViZmU0MWE0
ZGM5Li4zZjYxNWQ0NjI0YzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMKQEAgLTQyNCw2ICs0MjQsMTAgQEAgaW50IHNtdV9jb21tb25fcmVhZF9zZW5zb3Io
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLAogCQkq
KHVpbnQzMl90ICopZGF0YSA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVS
RV9EUE1fVkNFX0JJVCkgPyAxIDogMDsKIAkJKnNpemUgPSA0OwogCQlicmVhazsKKwljYXNlIEFN
REdQVV9QUF9TRU5TT1JfVkNOX1BPV0VSX1NUQVRFOgorCQkqKHVpbnQzMl90ICopZGF0YSA9IHNt
dV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9WQ05fUEdfQklUKSA/IDEgOiAw
OworCQkqc2l6ZSA9IDQ7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldCA9IC1FSU5WQUw7CiAJ
CWJyZWFrOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
