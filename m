Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE848DF9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB4989471;
	Mon, 17 Jun 2019 19:18:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32368893ED
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:52 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j19so12135585qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7REU1yyKw/R1bV+QsDoZ+kpVZQ12XACZtl8y8RidFdg=;
 b=ArUqN4iGFst5x8ybKOLXoj5zolXOcX7j1OwiTx1sv5yqgyVQwVW0mRBC1xALkNOUSk
 itwmr6f0EdDTcFrdAwwWzGt6RvAbpROxO6f5oFErGhi6cnBI11+u+nJiI07XfSQaOmcJ
 lFSZqLPNp1slRhfradYGfZTd4nONCEXLKEacK5UluQ0w4E01SAHk4BwvRLz4IyCEsu+W
 PpjyV/BPH/7+MlVFY3eTyjJeZg1vgHwrKTXiAmZKqH0ZTlQqalgyki+bOzkveBOXasrn
 nKwGDEOu6zPQ9Sr9PQvaiVRXkLjpbZPQZiDs1SRZWSVVUPSoGFS4K5one4lAgL5g46wq
 E57g==
X-Gm-Message-State: APjAAAX7s6gA7+c90lMdoVtdyVYQZ3mfvAUghUYRmKz+NBdzrLtsUSiX
 nsVLETdhC+/c5+E+5vjM5WuREqrt0cg=
X-Google-Smtp-Source: APXvYqwm77SRfvw6gtnI0JeCvn2k04h+ifctajBAKUR0wkAMpjmGZ27din4RRJJYCyG/MkHDorMFcA==
X-Received: by 2002:a0c:86c3:: with SMTP id 3mr22527764qvg.12.1560799070987;
 Mon, 17 Jun 2019 12:17:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 049/459] drm/amdgpu: add flag to support IH clock gating
Date: Mon, 17 Jun 2019 14:10:10 -0500
Message-Id: <20190617191700.17899-38-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7REU1yyKw/R1bV+QsDoZ+kpVZQ12XACZtl8y8RidFdg=;
 b=mbKgWerr+qHN0Qx0b4VVelJaV/SnQtsldu/J2TV153ESd1m4jpHxZ/B0Tso+l3ee6o
 SVZbLpzKmj19ZJUD3a9kea7u+qxyb1UFV1ZImN2accBFefNSdiJVJRGUs+tjGAkxH0fb
 8blpnsCSa2wGXbILKufTMxElSn++Wli9xgn0Q5VivSI7wpXBScYwPVDvM4yarHzlY9sQ
 PNH7JVBRe0zjXK7EL47FzJK7yRxw+uxUvVgHgETyCMu56JKpVyprhOnDCWMCLWUD16su
 FD2cmrACheLuUqdEWV93DHWcuStW1AaBOhODst8+xTHtVp0ecGVWvBG710S1NKog3Sqd
 xH5w==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFy
ZWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgKaW5kZXggYWJm
MDQ1NGIxYTlkLi4xNWZiYjJkZmY0NjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9hbWRfc2hhcmVkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Ft
ZF9zaGFyZWQuaApAQCAtOTUsNiArOTUsNyBAQCBlbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0ZSB7
CiAjZGVmaW5lIEFNRF9DR19TVVBQT1JUX1ZDTl9NR0NHCQkJKDEgPDwgMjQpCiAjZGVmaW5lIEFN
RF9DR19TVVBQT1JUX0hEUF9EUwkJCSgxIDw8IDI1KQogI2RlZmluZSBBTURfQ0dfU1VQUE9SVF9I
RFBfU0QJCQkoMSA8PCAyNikKKyNkZWZpbmUgQU1EX0NHX1NVUFBPUlRfSUhfQ0cJCQkoMSA8PCAy
NykKIC8qIFBHIGZsYWdzICovCiAjZGVmaW5lIEFNRF9QR19TVVBQT1JUX0dGWF9QRwkJCSgxIDw8
IDApCiAjZGVmaW5lIEFNRF9QR19TVVBQT1JUX0dGWF9TTUcJCQkoMSA8PCAxKQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
