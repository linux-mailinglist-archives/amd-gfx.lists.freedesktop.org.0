Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775CD98746
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B47D6EA2A;
	Wed, 21 Aug 2019 22:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184D6EA2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:40 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d23so3370399qko.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QnMeF5yLOTmvYdWuFfyUmjKh7zwS/O2Rv6mdXPSrzao=;
 b=edAqq7ZXhBbp8RbAzfNIoWJycST+6bQyCIJyoPXXYPdQsQPUNMarQjSELkpKWLBQsM
 XxsG4lXFGCQkkuc5ifLBfr9K9pYFbK1Gg2kNDYGxr6i3kDZ5av8zRTSgD32jySNFbboS
 SwhBRIZud6YqvdslVDwOBFMraaGL9lF6twCayqh3ISMd2qkgBwDNDkcI9CdctJOL8vhS
 4uTnxzJN1G3hSOJ7X4GNUDqHmffkBnJ73VXVkUcwACFbGmeahUJsY9WkQUn1x34njnvc
 8dbcFw32/IHJWzOBbmCIP+GsVYJZcz1vcGi6diPqznn3QZTNv1EFkqJ8uIEXetRWF8y9
 ZgJA==
X-Gm-Message-State: APjAAAUljZvcKVQwq7mLxMpJWp2XS/5+KU84G6rlzaQfEeh3zRdE9D3C
 3aAirg2OfHNJlx2Csq7UGsVXCR8o
X-Google-Smtp-Source: APXvYqyRaoND0KhI4gE+2UjYWCO1kc86j58lSeZcl6pPlC7C8DFyHAxfQTzByh/mXGPQO+2dbYvyNA==
X-Received: by 2002:a37:9d94:: with SMTP id
 g142mr33119310qke.209.1566426279477; 
 Wed, 21 Aug 2019 15:24:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 32/37] drm/amd/powerplay: enable renoir dpm feature
Date: Wed, 21 Aug 2019 17:23:54 -0500
Message-Id: <20190821222359.13578-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QnMeF5yLOTmvYdWuFfyUmjKh7zwS/O2Rv6mdXPSrzao=;
 b=JKi/PQ6BNBuqsy2lP2bsaNt7Nbe+/3UROhNcCW+wLIFXh9pohTVtYDks4EigCvugI/
 1XqHDrFbNgmbGcbJGQqpbuiKb4vE1auR70k0l/S8XKFiivnNXnqLlBtBevTGYD6oON0F
 xydiT9cb5S5clIFUeUxANNBgZJPOI4TuFj0yATQ4HPP+ZFqXakGU9qOO6NoudVLJQMBC
 sUor5rr2glERXQc2PIO2RjzGXL1QTur6y5QPuz+C5kByChf/GJEMq3kNuGCzTXpRkFF2
 uQp6gX7oEsAtJixOo9hec/2ICNUQ4SwaSYqdB/Wl+0hE0MH5snCTilJwuYEN/JsWs2gE
 XZMQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgplbmFibGUgdGhlIGRwbSBm
ZWF0dXJlIGZvciB0aGUgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFByaWtl
LkxpYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgOCAtLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGViZmQ2MzE1MjFjOC4uODA4YzhlMDJhNjUw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC03Njgs
MTAgKzc2OCw2IEBAIHN0YXRpYyBpbnQgc211X2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJaWYg
KCFzbXUtPnBtX2VuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JLyogVG8gYmUgcmVtb3ZlZCBhZnRl
ciBkcG0gaXMgZW5hYmxlZCAqLwotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIp
Ci0JCXJldHVybiAwOwotCiAJbXV0ZXhfbG9jaygmc211LT5tdXRleCk7CiAJc211X2hhbmRsZV90
YXNrKCZhZGV2LT5zbXUsCiAJCQlzbXUtPnNtdV9kcG0uZHBtX2xldmVsLApAQCAtMTI3NSwxMCAr
MTI3MSw2IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCWlmICghc211
LT5wbV9lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCS8qIFRvIGJlIHJlbW92ZWQgYWZ0ZXIgZHBt
IGlzIGVuYWJsZWQgKi8KLQlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfUkVOT0lSKQotCQly
ZXR1cm4gMDsKLQogCXJldCA9IHNtdV9mZWF0dXJlX2luaXRfZHBtKHNtdSk7CiAJaWYgKHJldCkK
IAkJZ290byBmYWlsZWQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
