Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27795D75E
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28CE6E051;
	Tue,  2 Jul 2019 20:29:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A396E047
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d15so15490390qkl.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kjd1O6iq96zFQIQ8eNBOnP/FmhJLZy6TxfkNqSms+pw=;
 b=E3oOowcp726K4oDwMN66QFRIjZoT1LHRhWLf20R5pl9szQNEtStRiAxBMJChqvjJjE
 owkj6daigSCUq52WsFnsxCeHv9NAn6cWlW8/nyKHW9tVb457UmYhsGsbFlMg6Q3WujuR
 2AqcoWPX+cIBY73m/CHOagv/Nw41qQl/qnf/gnoubE2OCcu5C/FIXwgV8CtVD9DqlOpi
 OQAF7io39G5ceWaLqSwO2Pi/80cpCaHuEJGKy+3Z4Do/PFHebyfhLV52XgUD3col4vFp
 TOMXNO4OQIK/X+t7JN6Nd/lmc+WChg/wWmHdZq1iPrv9KHvURne4OWy18EJEIMZo6NrP
 TkCA==
X-Gm-Message-State: APjAAAUd/MGjymcVUt8LktjGQoQgTxnll7JbmtIFgO/0bg2G0zcL9XeS
 2OrCnpnXEo1n4H979qUbeEw9DRJD3dQ=
X-Google-Smtp-Source: APXvYqyYeIXyo0hF5d+muR3LyhtN3Q3R/prT2c0jZQxDoq1gF4auY5brD/Cy+3++yz26Y8UJRg/q/Q==
X-Received: by 2002:a37:6295:: with SMTP id
 w143mr28060087qkb.389.1562099347853; 
 Tue, 02 Jul 2019 13:29:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/53] drm/amdgpu/gfx10: add support for navi14 firmware
Date: Tue,  2 Jul 2019 15:28:05 -0500
Message-Id: <20190702202844.17001-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kjd1O6iq96zFQIQ8eNBOnP/FmhJLZy6TxfkNqSms+pw=;
 b=DPMmxsSKpji0RZF7ON30b9wg4SxX4DeJDFKkOFyBDCi/iJw8hanqTedQ+mBEZCpJdX
 ZtcJFoIM+26ujfN3QfrJLPXjEh2RTP1BImBbB1zfJZg2ppYJuUALVxQXvHhrsnCXa1dM
 pweSJuaZJSlPWfWpjcZpmj9c7+Vo3Gzs+hbWq3x3gE6AJ4+8viIaLo8xv7i8/hL8hQMb
 29wzmxzWYOOQF58LHC6CpY1ozTo0z9d15RMUcu3MpfE7gbegCKGhxA5mvXOrcG4AfGA7
 vUUFDedcPilAmjIKj1Q+c7u/MHDAq2hvDolO/cOu7BMWe0JcVm+f/HCQvobLWVc1YEDp
 6f8Q==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBzdXBwb3J0IGZv
ciBuYXZpMTQgQ1AgZmlybXdhcmUgZmlsZXMuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4g
PHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMTAgKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDIwYWJkYzA4Mzk4Yi4uMDY2YzcyMTdkMGE3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtNjMsNiArNjMsMTMgQEAg
TU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX21lYy5iaW4iKTsKIE1PRFVMRV9GSVJNV0FS
RSgiYW1kZ3B1L25hdmkxMF9tZWMyLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2
aTEwX3JsYy5iaW4iKTsKIAorTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X2NlLmJpbiIp
OworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X3BmcC5iaW4iKTsKK01PRFVMRV9GSVJN
V0FSRSgiYW1kZ3B1L25hdmkxNF9tZS5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25h
dmkxNF9tZWMuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfbWVjMi5iaW4i
KTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9ybGMuYmluIik7CisKIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfMTBfMVtdID0K
IHsKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNCX0hXX0NPTlRST0xfNCwgMHhm
ZmZmZmZmZiwgMHgwMDQwMDAxNCksCkBAIC00NzQsNiArNDgxLDkgQEAgc3RhdGljIGludCBnZnhf
djEwXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJY2FzZSBD
SElQX05BVkkxMDoKIAkJY2hpcF9uYW1lID0gIm5hdmkxMCI7CiAJCWJyZWFrOworCWNhc2UgQ0hJ
UF9OQVZJMTQ6CisJCWNoaXBfbmFtZSA9ICJuYXZpMTQiOworCQlicmVhazsKIAlkZWZhdWx0Ogog
CQlCVUcoKTsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
