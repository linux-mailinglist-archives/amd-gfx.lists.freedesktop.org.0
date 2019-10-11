Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C854D36CE
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ADD6EAA5;
	Fri, 11 Oct 2019 01:21:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B696EAA5
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:47 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id u22so7404439qkk.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OgbQhcSAxkLD6Iss77zgW3bGv5ReNGxfSVLFEWc85Eg=;
 b=IFg4caYbZayzkK7P9wHFvbKXqs9KC/O+6/iqfgmgqNVNxfYVdGBAlQIVUOSjviEivQ
 wR5TuzqVeGPxKWl/QuDX7Tsb+94tNq/wdUMyx8t8jB6aP+5Q0FJfUetwaAJdrVTSvF3V
 Ic0cH7qM0Mh7ZLiwwKkGd/OwNPIxh1pACNzdrjih9gkzLJXgwm594E5D9UXbzyHtech7
 vV36U4ZcnurnLV4HMUpG7jzAjI+oJjkiAa8s5E45jfjekvn/Ptd3MhDnwnfVwZUqGTyr
 YCfTm6Zlgt9eE60n/exZL/Mifd7afQJuy5LYfI9n9OOE8AZX3tnRVZT66ZalLcX30KKo
 bqDQ==
X-Gm-Message-State: APjAAAWgevVgx8oLLvmV4IjzYhYgZ+kfpN+urv08OmBp9qM9dy6prX3d
 r6Ges2p2pNh+zB805OOW0LOp66WR
X-Google-Smtp-Source: APXvYqx5Dzm8j8cTDkteldiEdJGF+FwBGsq5HOm/kj+EFO5kpVYav+dtabwY4Vj020e3zI4iQzCN6g==
X-Received: by 2002:a37:9847:: with SMTP id a68mr13384734qke.223.1570756906209; 
 Thu, 10 Oct 2019 18:21:46 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/15] drm/amdgpu: add new BIF 5.0 register for BACO
Date: Thu, 10 Oct 2019 20:21:22 -0500
Message-Id: <20191011012135.18566-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OgbQhcSAxkLD6Iss77zgW3bGv5ReNGxfSVLFEWc85Eg=;
 b=o7Cva5ZADps4SrrhjEae1l6JplixYpDCD1tTflhD0HsN7gvpJcpTlLzAEMJitZAbP7
 f4tyzcq/NaMSildDUDFqo928hz70VKMp9RpRaqHNbb80Yw2SeUeiCpuxchvcKNyrn1Vo
 ojPosDAjbnQbuz1zuKJQnl4GUtQsGtcVTAYznhj7Xnce+GCSHhNKpqgIw/Jq1grrzCTc
 gazLuu7QH0EpnQ+kd/GIFRTrTKtpCbSsEP6ejJh8UuYVqJ2ev82af+S5LsBndV0jhYJz
 wT5ROuzN3UFQMtCg0YKJC2vrkjTbT0oTZBnGj0QzhpccggQ7aURj5d4C5l/QbZGrLszg
 5Q+Q==
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlmXzVfMF9kLmgg
ICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlm
XzVfMF9zaF9tYXNrLmggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlm
XzVfMF9kLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvYmlmL2JpZl81
XzBfZC5oCmluZGV4IDgwOTc1OWY3YmI4MS4uOGQwNWQ2Y2ExYzhkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvYmlmL2JpZl81XzBfZC5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlmXzVfMF9kLmgKQEAgLTI3
LDYgKzI3LDcgQEAKICNkZWZpbmUgbW1NTV9JTkRFWCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwCiAjZGVmaW5lIG1tTU1fSU5E
RVhfSEkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4NgogI2RlZmluZSBtbU1NX0RBVEEgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDEKKyNkZWZpbmUgbW1DQ19CSUZf
QlhfRlVTRVNUUkFQMAkJCQkJCQkweDE0RDcKICNkZWZpbmUgbW1DQ19CSUZfQlhfU1RSQVAyCQkJ
CQkJCTB4MTUyQQogI2RlZmluZSBtbUJJRl9NTV9JTkRBQ0NFU1NfQ05UTCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDE1MDAKICNkZWZpbmUgbW1CSUZf
RE9PUkJFTExfQVBFUl9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHgxNTAxCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
YXNpY19yZWcvYmlmL2JpZl81XzBfc2hfbWFzay5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2FzaWNfcmVnL2JpZi9iaWZfNV8wX3NoX21hc2suaAppbmRleCBhZGM3MWIwMWY3OTMuLjcz
NDM1Njg3ZDA0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNf
cmVnL2JpZi9iaWZfNV8wX3NoX21hc2suaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvYXNpY19yZWcvYmlmL2JpZl81XzBfc2hfbWFzay5oCkBAIC0zMiw2ICszMiw4IEBACiAjZGVm
aW5lIE1NX0lOREVYX0hJX19NTV9PRkZTRVRfSElfX1NISUZUIDB4MAogI2RlZmluZSBNTV9EQVRB
X19NTV9EQVRBX01BU0sgMHhmZmZmZmZmZgogI2RlZmluZSBNTV9EQVRBX19NTV9EQVRBX19TSElG
VCAweDAKKyNkZWZpbmUgQ0NfQklGX0JYX0ZVU0VTVFJBUDBfX1NUUkFQX0JJRl9QWF9DQVBBQkxF
X01BU0sgICAgMHgyCisjZGVmaW5lIENDX0JJRl9CWF9GVVNFU1RSQVAwX19TVFJBUF9CSUZfUFhf
Q0FQQUJMRV9fU0hJRlQgIDB4MQogI2RlZmluZSBCSUZfTU1fSU5EQUNDRVNTX0NOVExfX01NX0lO
REFDQ0VTU19ESVNfTUFTSyAweDIKICNkZWZpbmUgQklGX01NX0lOREFDQ0VTU19DTlRMX19NTV9J
TkRBQ0NFU1NfRElTX19TSElGVCAweDEKICNkZWZpbmUgQklGX0RPT1JCRUxMX0FQRVJfRU5fX0JJ
Rl9ET09SQkVMTF9BUEVSX0VOX01BU0sgMHgxCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
