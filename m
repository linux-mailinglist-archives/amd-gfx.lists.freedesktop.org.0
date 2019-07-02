Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD345D752
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FAD6E043;
	Tue,  2 Jul 2019 20:29:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260CF6E040
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:28:58 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p15so33241qtl.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPe5c73vqu56zLM55ljio/0fQ+LuCVbj0xSqwv9FS2Y=;
 b=Zx2N49KCj22nyOCAILqmuBNjVNuROhMchgALLjvSKdiczqk2l65O9lQ82KjkIMm6TH
 cVhz7JhPncYZxqCdzJZH5gnMDwLp/B/jU9r3CN3ulFJAoLbhu0vhWVGYdc9IFTaw1K9n
 oV0Lc9fWG2EakHLOXAWQWOAy5UDydeFCwlbuuP67prnr+V6R6I6B24xcglzyrWJRV+PW
 eDD/nsQfDjHhhKqyOTiTVlxP0T6aqGkGh/jhsQFBIBi7j/tyyQPt3BrwpFRDBgtoO2XZ
 iRY9FF/J1sVp7PtMx24OABnmFi0tmRgvO0FpGsL9F9vZGIfhO5N+OZwUJSdwiFwscqmF
 0ZWw==
X-Gm-Message-State: APjAAAWHimts8TTSju8DzF3YVI0sCHw+O/XhX6bhcePCgVDx0w90S2jX
 3CWmfUgU6xMNsqcirnAZiBc/MrITxEY=
X-Google-Smtp-Source: APXvYqyc8dLeVwiGQdCcAxdGWshKJy6l7TmExQrnYnWxuw5CqwGKiO/LnzecxXvFwav/I49Ptp9c2w==
X-Received: by 2002:ac8:828:: with SMTP id u37mr25345765qth.96.1562099337063; 
 Tue, 02 Jul 2019 13:28:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.28.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:28:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/53] drm/amdgpu: add gpu_info firmware for navi14
Date: Tue,  2 Jul 2019 15:27:53 -0500
Message-Id: <20190702202844.17001-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPe5c73vqu56zLM55ljio/0fQ+LuCVbj0xSqwv9FS2Y=;
 b=u/cTqwFHKMAPHFArdwzoAK0CPwzu4nM4L0a2vM6KTyTOnGhVne3Oej0EbbJAtOR3GY
 DWfdvJzMyXgLPAcwbcNUIJ9ZGP1VxrFSz79L251CI6+C6CH0+cX4FDvlcPDhOyjfiL7r
 64tkNJN88gpY6QGF9d08osakaxdfyzpbMe9DG4aa16Q2BWoTWEd9JSVhOp1TdwfEf+49
 d/0eG5Pha+aII8B9yDiN7yTOgAURU/6TQbZGi90be2Tk5qSr1Wb+15TMPbvRME0ZUVRs
 PbNtIx8GAAJ7ldFTJ0JmOUgKRNg+p1Bf/Ho1CpqJhYDlDocXdcteczcyz0eDTQq+9EtS
 OoyQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBuYXZpMTQgdG8g
Y2FzZSBzdGF0ZW1lbnQgdG8gbG9hZCB0aGUgR1BVIGluZm8gZmlybXdhcmUuCgpTaWduZWQtb2Zm
LWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFjayBY
aWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA2MDk5OTky
ODk2MmQuLmI4YmYxMDU5MzEyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwpAQCAtNzAsNiArNzAsNyBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZl
bl9ncHVfaW5mby5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3BpY2Fzc29fZ3B1X2lu
Zm8uYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbjJfZ3B1X2luZm8uYmluIik7
CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTBfZ3B1X2luZm8uYmluIik7CitNT0RVTEVf
RklSTVdBUkUoImFtZGdwdS9uYXZpMTRfZ3B1X2luZm8uYmluIik7CiAKICNkZWZpbmUgQU1ER1BV
X1JFU1VNRV9NUwkJMjAwMAogCkBAIC0xMzg3LDYgKzEzODgsOSBAQCBzdGF0aWMgaW50IGFtZGdw
dV9kZXZpY2VfcGFyc2VfZ3B1X2luZm9fZncoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJ
Y2FzZSBDSElQX05BVkkxMDoKIAkJY2hpcF9uYW1lID0gIm5hdmkxMCI7CiAJCWJyZWFrOworCWNh
c2UgQ0hJUF9OQVZJMTQ6CisJCWNoaXBfbmFtZSA9ICJuYXZpMTQiOworCQlicmVhazsKIAl9CiAK
IAlzbnByaW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfZ3B1X2luZm8u
YmluIiwgY2hpcF9uYW1lKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
