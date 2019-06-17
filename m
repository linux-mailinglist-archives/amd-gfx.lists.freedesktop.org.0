Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6498348E29
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00B38973E;
	Mon, 17 Jun 2019 19:18:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B3B89733
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:45 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so5774017qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rVQDxYftgSdMVIaVjD2HDsgx+6vX+QLA1slroeINVx8=;
 b=IBUDXsP5iakA2dj6hM2yapFbc9OoGtmKbV0JXmw4RsIyyUpN6yp96cRZSm+mUTgsZw
 RIfdiybtAidfYUjdDUWPe7UuqKP3YYqeucj3oh6nuwIXFmajr16tJXDBlmfNHyi0Gmjc
 Cfg+ymGWN3vvr21P2AU4iGeuYSLpm/HMAM1abEdDK8b/wylLJXzStcACn+rIL6RL8JuA
 K51wgBADRtPBfRxkhcg0Po2X5UvMl93CqgzVm//Albw6Sr3CxoarzS82Zuupq5JrvnHT
 jfVKulomPwhlw30ebBCnwUCcT4VDz5yQ6bXkKqdEkNzlPseFi5bGxDWigsOIcb9S+bAr
 ytrg==
X-Gm-Message-State: APjAAAVG8XzKPP4ga93F5VXaQmImrw+RnyNP0m/uOr89WdrWPSw04HJY
 UtCJoRzePzbveAIPiLWYJuGyEYaJuZM=
X-Google-Smtp-Source: APXvYqwZq8smNyltkzzz1LYjKt+Q+PniztPYUV8BTjCEQUviflrPSclhEYX/TYq3XdSlfEWpqsvTEA==
X-Received: by 2002:ac8:189d:: with SMTP id s29mr66782982qtj.14.1560799123754; 
 Mon, 17 Jun 2019 12:18:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 108/459] drm/amdgpu: disable concurrent flushes for Navi10 v2
Date: Mon, 17 Jun 2019 14:11:09 -0500
Message-Id: <20190617191700.17899-97-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rVQDxYftgSdMVIaVjD2HDsgx+6vX+QLA1slroeINVx8=;
 b=lOecxK0ePHnTnF8fZFyzz4gQ4yJUYeJVxMHzPrA+73R7afSZC5Y21NtliSTNOIhTjp
 YvGMMJixPeURI4hvmYuk9RtaS54n/W66pvIYSV6QOUc0VT0u4GY12F8b9QCgkWQ+WOMj
 rgBZd2O5B3LNk8a/cUCWe/lTkQGESfaIMWE20FGPD6IzVyKC1xwEfZTLlrT2NZQb0Trx
 uRalfohLRR6PBEJwBL6Z53vKhLa04zexdhPc+mcWIdJ0MjUKfLm0PBRpXMdW4U8JBZHw
 17fwePUW/R9kVzXyc+averm0T0oTv5Nez91/CQCX0smryyBKPWDZIWakTCrE+uLSwdWD
 CMkA==
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKTmF2aTEw
IGhhdmUgYSBidWcgaW4gdGhlIFNETUEgd2hpY2ggY2FuIHRoZW9yZXRpY2FsbHkgY2F1c2UgbWVt
b3J5CmNvcnJ1cHRpb24gd2l0aCBjb25jdXJyZW50IFZNSUQgZmx1c2hlcwoKdjI6IGV4cGxpY2l0
ZWx5IGNoZWNrIE5hdmkxMAoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lk
cy5jIHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYwppbmRleCBkZjli
MTczYzNkMGIuLjU4OTlkMjE0MTg3YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2lkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9pZHMuYwpAQCAtMzY0LDggKzM2NCwxMSBAQCBzdGF0aWMgaW50IGFtZGdwdV92bWlkX2dyYWJf
dXNlZChzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKIAkJaWYgKHVwZGF0ZXMgJiYgKCFmbHVzaGVkIHx8
IGRtYV9mZW5jZV9pc19sYXRlcih1cGRhdGVzLCBmbHVzaGVkKSkpCiAJCQluZWVkc19mbHVzaCA9
IHRydWU7CiAKLQkJLyogQ29uY3VycmVudCBmbHVzaGVzIGFyZSBvbmx5IHBvc3NpYmxlIHN0YXJ0
aW5nIHdpdGggVmVnYTEwICovCi0JCWlmIChhZGV2LT5hc2ljX3R5cGUgPCBDSElQX1ZFR0ExMCAm
JiBuZWVkc19mbHVzaCkKKwkJLyogQ29uY3VycmVudCBmbHVzaGVzIGFyZSBvbmx5IHBvc3NpYmxl
IHN0YXJ0aW5nIHdpdGggVmVnYTEwIGFuZAorCQkgKiBhcmUgYnJva2VuIG9uIE5hdmkxMCBhbmQg
TmF2aTE0LgorCQkgKi8KKwkJaWYgKG5lZWRzX2ZsdXNoICYmIChhZGV2LT5hc2ljX3R5cGUgPCBD
SElQX1ZFR0ExMCB8fAorCQkJCSAgICBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9OQVZJMTApKQog
CQkJY29udGludWU7CiAKIAkJLyogR29vZCwgd2UgY2FuIHVzZSB0aGlzIFZNSUQuIFJlbWVtYmVy
IHRoaXMgc3VibWlzc2lvbiBhcwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
