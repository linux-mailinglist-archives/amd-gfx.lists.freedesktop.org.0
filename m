Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBFD36CF
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD096EB94;
	Fri, 11 Oct 2019 01:21:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956526EAA5
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:46 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id l51so11322440qtc.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJaXM0K+svJwpjZc6XQreJYLdnx7k2usr4/wk3TINls=;
 b=PJuHlskgmpaZ0AZc2rEvfjPOGs9Lb1A+WBbvZ4PWRnifS/u1Wlpg1ZPRKw/q5sdLcS
 KfMbnkBe3dn6H9voIb3tZOH9pNIW/3ljVKpYntvYzAGDKfQXxyVztMCYsx2GP91A+Usg
 reZ1/dsvFBh3bKkzPNXXQFZ98wK5ABpmbbuOZC9gTxg7eOm+QuAovDXNYRjXZ9Kz6YCK
 SDm8kZLYd6HhvOPDcrWt7tJF5HN5bEjFULsVR9Y5LJJrcAuzkLBrW+2FdPosVpHOw1sV
 zOQu6mFY6JblLyvk0gL6LLxrO+huCFEeeCgegUavlHL4T6TDjeOMxxJvJJ6XmIDTYZ3g
 1pwA==
X-Gm-Message-State: APjAAAUgc0472YH50MLQkOP6Hpg9PvEt5hhTQoT0HuBJjjxKI3HQzIXQ
 lPqTZMAK7wqVhGRVg9cHjARwYYaP
X-Google-Smtp-Source: APXvYqxGLX5fAFAxrMHLl+c0RLN1HnOBFoR1iVhDtsBHSSXcTihLwC0L4gw2Y8LgbQrhBc92TewUrA==
X-Received: by 2002:ad4:4c8c:: with SMTP id
 bs12mr13094586qvb.171.1570756905278; 
 Thu, 10 Oct 2019 18:21:45 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/15] drm/amdgpu: add new BIF 4.1 register for BACO
Date: Thu, 10 Oct 2019 20:21:21 -0500
Message-Id: <20191011012135.18566-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJaXM0K+svJwpjZc6XQreJYLdnx7k2usr4/wk3TINls=;
 b=IDDkAmgS3G7EfNqH66zu7tWp34iRtdYo6wQhx3ekmNWaJOQVgt7J7i8Lt7T+gBwkMI
 wryOL3qQoH8imTiFtHnxStInAAw580qoV3bgcZvWMeLL+HXh7e3EHQROCJ0fXTZwmRrN
 qFfUOkKraalfFrrhQy4Rfjx8cxypycR5zgDoI79zp/jKoCVFdMUKu8Zms/Bd+IDFOt1G
 E0ytlUxdYKmEgomBqBNstEYSo7Bj7zb47C/lEUUbEi4YNwXCHdlyFV9d2ELoAh7wn5Pz
 qsVMQgQ0/o81/oZSBfFIw8dJjkK+7BctjWhGySuqyls+thzp/upeIIBZ2zyjXVyRLhTc
 7nug==
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlmXzRfMV9kLmgg
ICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlm
XzRfMV9zaF9tYXNrLmggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlm
XzRfMV9kLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvYmlmL2JpZl80
XzFfZC5oCmluZGV4IGE3NjFiYTA3ZjkzNy4uZmNlOTY1OTg0ZTc2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvYmlmL2JpZl80XzFfZC5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9iaWYvYmlmXzRfMV9kLmgKQEAgLTI3
LDYgKzI3LDcgQEAKICNkZWZpbmUgbW1NTV9JTkRFWCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwCiAjZGVmaW5lIG1tTU1fSU5E
RVhfSEkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4NgogI2RlZmluZSBtbU1NX0RBVEEgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDEKKyNkZWZpbmUgbW1DQ19CSUZf
QlhfRlVTRVNUUkFQMAkJCQkJCQkweDE0RDcKICNkZWZpbmUgbW1CVVNfQ05UTCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxNTA4
CiAjZGVmaW5lIG1tQ09ORklHX0NOVEwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDB4MTUwOQogI2RlZmluZSBtbUNPTkZJR19NRU1TSVpF
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
eDE1MGEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9i
aWYvYmlmXzRfMV9zaF9tYXNrLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19y
ZWcvYmlmL2JpZl80XzFfc2hfbWFzay5oCmluZGV4IDhmYmZkMDI2MWQyNy4uMzljYzQ4ODBiZWI0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvYmlmL2Jp
Zl80XzFfc2hfbWFzay5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3Jl
Zy9iaWYvYmlmXzRfMV9zaF9tYXNrLmgKQEAgLTMyLDYgKzMyLDggQEAKICNkZWZpbmUgTU1fSU5E
RVhfSElfX01NX09GRlNFVF9ISV9fU0hJRlQgMHgwCiAjZGVmaW5lIE1NX0RBVEFfX01NX0RBVEFf
TUFTSyAweGZmZmZmZmZmCiAjZGVmaW5lIE1NX0RBVEFfX01NX0RBVEFfX1NISUZUIDB4MAorI2Rl
ZmluZSBDQ19CSUZfQlhfRlVTRVNUUkFQMF9fU1RSQVBfQklGX1BYX0NBUEFCTEVfTUFTSyAgICAw
eDIKKyNkZWZpbmUgQ0NfQklGX0JYX0ZVU0VTVFJBUDBfX1NUUkFQX0JJRl9QWF9DQVBBQkxFX19T
SElGVCAgMHgxCiAjZGVmaW5lIEJVU19DTlRMX19CSU9TX1JPTV9XUlRfRU5fTUFTSyAweDEKICNk
ZWZpbmUgQlVTX0NOVExfX0JJT1NfUk9NX1dSVF9FTl9fU0hJRlQgMHgwCiAjZGVmaW5lIEJVU19D
TlRMX19CSU9TX1JPTV9ESVNfTUFTSyAweDIKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
