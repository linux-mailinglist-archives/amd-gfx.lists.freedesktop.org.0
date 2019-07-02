Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E899E5D75F
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72A6E047;
	Tue,  2 Jul 2019 20:29:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5996E051
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:09 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l128so15491779qke.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2C50uDdLeYI+U4ovUar3WqoH2wdZK6ag5eT3DvT5ik=;
 b=Pvnh3ZptimQbFL6ORUIio/dyWQ2nMSWqZFyBReYAue80JZiJAxotEYuUplRofQRZHL
 04Pw0g7yIh6c7srLmIgvyM0Dk5kGaRhavU8B5A8a32ijxtPz+rf8AnmNn+Du7mFUQ6QF
 Wd/36zdknGstY8I87fwaRC8oBinEgKv9JqWyILC+H290C9iimbT4Qii+wX/KeVcs9Brs
 SGCIFYA074pmYK/C5xE/uuEkof1z2SMGh3M+dJLIgw2WPc5nKWDH+eXl5JDPAgY0CCjr
 zZQ8XjcSFFf7AHSkEgd5gnbUNH/4Kt8bwGxOganQr8yPg8XgXY5oFT9ih8442xbsJbKU
 A5nQ==
X-Gm-Message-State: APjAAAX/oGZYCdnJNCj4lyq9Xu8aUYPV7rvd7ldgAr1IKuzEygQBZx7A
 uqRa7XxtlHqANVQwzR9Zd5An/a87xjY=
X-Google-Smtp-Source: APXvYqzNACruM3LiB7RuWiwrjcVOpv+j1t0BETC5xq/P/V6XaAbblnxhyMA0bqQfi6cYBMbHeEcraw==
X-Received: by 2002:ae9:eb8b:: with SMTP id
 b133mr18937926qkg.497.1562099348806; 
 Tue, 02 Jul 2019 13:29:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/53] drm/amdgpu/gfx10: add placeholder for navi14 golden
 settings
Date: Tue,  2 Jul 2019 15:28:06 -0500
Message-Id: <20190702202844.17001-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C2C50uDdLeYI+U4ovUar3WqoH2wdZK6ag5eT3DvT5ik=;
 b=RRqqyeQCGjLp6oBdWWVf1iyKBVaU78BRQ4YgMSTe5eAH7DOpODZ/XtMhecnMm4AiJY
 EzBDaUpgcDnHB3ft7LQAW7QVNK9osrkamdAL5BRjzrbTGqz0XZzydeeZvU9SV9Clwco/
 dsmR+INWLNPLh03inv5tKaKKFpmpRHETp/l6PvtzOTt8dDfJVOK/reKEzv6aBzQT0e1j
 /sIB3oKXgBNJDjdpKCPke8jLNwWehJPPwdVqOrrNNnaLdlbzQK6W3C92ufegmLU34tCI
 BGApLeUqroqaW409iegpASuoe7RjR4ERvS7Gn/xtHxnqyx1JqL0/T8yJOq8s/CXn1fvm
 JuJg==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClRvIGJlIGZpbGxlZCBp
biBvbmNlIGF2YWlsYWJsZS4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55
dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAxMyArKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMKaW5kZXggMDY2YzcyMTdkMGE3Li5kMDQ1YTdkOTAxMDQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC0xMTYsNiArMTE2LDExIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfMTBfMF9u
djEwW10gPQogCS8qIFBlbmRpbmcgb24gZW11bGF0aW9uIGJyaW5nIHVwICovCiB9OwogCitzdGF0
aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2djXzEwXzFf
bnYxNFtdID0KK3sKKwkvKiBQZW5kaW5nIG9uIGVtdWxhdGlvbiBicmluZyB1cCAqLworfTsKKwog
c3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF9yaW5nX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsKIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9zZXRfZ2RzX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwpAQCAtMjUwLDYgKzI1NSwxNCBAQCBzdGF0aWMgdm9p
ZCBnZnhfdjEwXzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCQkJCQkJZ29sZGVuX3NldHRpbmdzX2djXzEwXzBfbnYxMCwKIAkJCQkJCShjb25zdCB1
MzIpQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3NfZ2NfMTBfMF9udjEwKSk7CiAJCWJyZWFrOwor
CWNhc2UgQ0hJUF9OQVZJMTQ6CisJCXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRl
diwKKwkJCQkJCWdvbGRlbl9zZXR0aW5nc19nY18xMF8xLAorCQkJCQkJKGNvbnN0IHUzMilBUlJB
WV9TSVpFKGdvbGRlbl9zZXR0aW5nc19nY18xMF8xKSk7CisJCXNvYzE1X3Byb2dyYW1fcmVnaXN0
ZXJfc2VxdWVuY2UoYWRldiwKKwkJCQkJCWdvbGRlbl9zZXR0aW5nc19nY18xMF8xX252MTQsCisJ
CQkJCQkoY29uc3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX2djXzEwXzFfbnYxNCkp
OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
