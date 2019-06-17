Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B7648E95
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E38982E;
	Mon, 17 Jun 2019 19:27:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E9189829
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:20 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so12175903qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rVQDxYftgSdMVIaVjD2HDsgx+6vX+QLA1slroeINVx8=;
 b=S1+TfJKmfCRefeE+KWAAn04e/IvB6vJdUmS/l4OTvn2/OudMwwZU/a+5UPS6TMSosg
 3yKWI/PCTPkMJXwVMb5o9TrWX1oGKRzfc4ggWS3I0KS1RlRsTULQnZStaH6Z5+TTATro
 n5bCF8vBeCUlEk/c+b6HiZfWxyMgwK3cEpizs2D2hjynB+26PrDBjBMDJ2BYQvoMOobf
 Lt3PQ49BYSd1b/IudSmhB6muhCrcVNMYUms0FtF46N8FBQ1fmjPrSSsdvdKCy22KQOAJ
 xGdQOcxyMtdu1WdgRsqA0sRmd8rbmq8L4dG3DJIQ36XyunZiPwVQlAcHps9SuLK+BX1N
 sOiA==
X-Gm-Message-State: APjAAAXw3dNA6XZj/On0zp9XPBkHyCT9HCzd2gkjb3QpMbQrh7heHC8J
 SEZ4lbiFO8AesBGaNOaJleKsFwUH5NE=
X-Google-Smtp-Source: APXvYqwAXX5s0pExXYY96WrBJ7NRFs+WUAhwpBVjYrY9KZfEQJlcTjPge9Kss+WdGGb/2XX/ctoq9Q==
X-Received: by 2002:ac8:94f:: with SMTP id z15mr61538575qth.265.1560799639526; 
 Mon, 17 Jun 2019 12:27:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 108/459] drm/amdgpu: disable concurrent flushes for Navi10 v2
Date: Mon, 17 Jun 2019 14:25:33 -0500
Message-Id: <20190617192704.18038-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rVQDxYftgSdMVIaVjD2HDsgx+6vX+QLA1slroeINVx8=;
 b=iESgpCBi6w71GayJOjcj+225r7xdXnsWWxJ/pr9UY2lv7d6Hs6GX5VwlgrEbmBMR4f
 93pKJbtkMmhxZ071zj8XpKEGhwYWs9wQn3fEliM1nwmH3hsjgRMlanD5dukPYTOqlSrp
 XtnIdVv3Ilbio3lFTR3qOJRdh2zBYXg0hTkuCVazsZ1EWrADmrLSlxAUsnhW3pw6iyN8
 WL2kOyI8dbxJLBpx8mjIYV6e8XLQUUxkW8BY3MwHBBSFFDv6sLr/ez7Ht38U2hn9iDrK
 cfTnJRoi9H8DU7kP38cjkBMtitYcKf8n2ult7akn9JxRo/dxcnKnoHAdYUO5jWsh1qRp
 t8Ig==
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
