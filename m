Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CDE87E90
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5355F6EE3A;
	Fri,  9 Aug 2019 15:53:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7176EE38
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:14 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so17295580qtj.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tS2WrlgevdgAXXmgxqjGoFGhsy4qe8HmI0Xu0QO2d4Y=;
 b=Z7oE0AA6SE4STfFb89wwn56VNKQN1grv9Y2kpKKC9KdkQBk32xcoAozXMciqU7Dujr
 pjK4bWQ+Yi1+gNm589/FKrHL6SYiZA80GTuYhK773DwRWXbX0tPH5KrXclpNbMvcuIFd
 A1JQaTH1UxvOakc+x0AcJAcJZeukQnHk7lixWEdeS5zDlQZPS8NSt8hPEzlsIxCArRKs
 GzrFi/YWIPD4kwoBZkS8rjq1yGWIHQi49H8KfM9HnE/wCC/aOrsYtoa1iMYqtH1gyx06
 7byPCleh61hrWFlDyC1+DuNLbMuJ+nzlm2WrI7Q3GQjGLSck9ZaO2bcJm/dcsES0BpWY
 0I0w==
X-Gm-Message-State: APjAAAVyUKhB1LfybVrhThfBI4w8DA0qoy+t34qa6stA71/PBwUsPjqH
 EBiWasWrb+zDbRnkuacz41pTTbKJ
X-Google-Smtp-Source: APXvYqz9kvoVg3ngmRwT/Xhcoba12Boo8KsyRUS9LEAU/qWiE4Ygjm/7jbhwe71erHC34LwUhXdKhg==
X-Received: by 2002:a0c:9782:: with SMTP id l2mr5321493qvd.72.1565365993283;
 Fri, 09 Aug 2019 08:53:13 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/27] drm/amdgpu: add soc15 common ip block support for renoir
Date: Fri,  9 Aug 2019 10:52:39 -0500
Message-Id: <20190809155302.4733-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tS2WrlgevdgAXXmgxqjGoFGhsy4qe8HmI0Xu0QO2d4Y=;
 b=dke3mXsFso39FS6XdC4KapNUnLkKf6LisV9lwXfnPH8k+fQreEwswc4BMuCSoAZu0+
 NouHKIW0d9p0LOgegcX57f9Mtbu33PXXRNRC71wqT2B06WIgVaPRmc5esy6cn0WPghW2
 Q7U/hiZLArqrA55YaBfvRm1i8FdgOfTo1ceelneXp+ACcMwHGp7rJjuTl9PBFCJnxY3N
 q9t3a7ycDZFQKhVKcupzFBRtxl7B1hLhoX5+JZlB2kojFUSNY0p7UPtEEWDojC7cxrjc
 rgcLpcHIPJoiRVt+lHzQZ6zBlIabI5ymODxFXxJxtj2CGBAIkVZjNb4M642/CoQ+FTUQ
 mxjw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyBjb21t
b24gaXAgc3VwcG9ydCBmb3IgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA2ICsrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCmluZGV4IDEyNWJhMWIxNWI2YS4uOGRlZWYyY2YxZTY5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMKQEAgLTYzNiw2ICs2MzYsNyBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2Nr
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfVkVHQTEwOgogCWNhc2Ug
Q0hJUF9WRUdBMTI6CiAJY2FzZSBDSElQX1JBVkVOOgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCXZl
Z2ExMF9yZWdfYmFzZV9pbml0KGFkZXYpOwogCQlicmVhazsKIAljYXNlIENISVBfVkVHQTIwOgpA
QCAtMTEyMiw2ICsxMTIzLDExIEBAIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQo
dm9pZCAqaGFuZGxlKQogCQlhZGV2LT5wZ19mbGFncyA9IDA7CiAJCWFkZXYtPmV4dGVybmFsX3Jl
dl9pZCA9IGFkZXYtPnJldl9pZCArIDB4MzI7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9SRU5PSVI6
CisJCWFkZXYtPmNnX2ZsYWdzID0gMDsKKwkJYWRldi0+cGdfZmxhZ3MgPSAwOworCQlhZGV2LT5l
eHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweDkxOworCQlicmVhazsKIAlkZWZhdWx0
OgogCQkvKiBGSVhNRTogbm90IHN1cHBvcnRlZCB5ZXQgKi8KIAkJcmV0dXJuIC1FSU5WQUw7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
