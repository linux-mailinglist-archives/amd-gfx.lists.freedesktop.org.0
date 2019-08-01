Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCE7E37E
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A866E79A;
	Thu,  1 Aug 2019 19:50:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EB16E79A
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:50:53 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so71489707qtn.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fuocsp7R6diaVZCJlJm/vpdaysu/U2ZNuCcvv5MPsk=;
 b=Yh/BJ94te7p/T42E5MHrDCVlFmyUjF31VKHsBs+lv8/3oLiO6oVnRxDc8aj7WWwD0g
 g+QdV/WDXRuLdzpNPXDrIphrJlj4JQGz4sZKz9OKgPU13FXQY3K6rfLOdSzqds6mD29L
 Z3vFduuHXvyUZMTQKMJTXJ55ktM8+NfikgrrZC3k1tlI2kcoIda/6JJ/AI9Hk8shRcv0
 ARPjXWZQJE4IjU2L2r229xG8ux+M4T4e88MQwVS2bhUINyNaK6ut/4EiiFyi1rexxqs+
 /OLTwtawtkHNiRZ2EZC2+oDBNcgABpMaSCAQdiC6RaBST3vGp2bXBzdMJCMA4HJVdttC
 L6zQ==
X-Gm-Message-State: APjAAAXWJ/FayoDHMsWBMEt136qmuMlxNx7SxJsinvqwKm+73Hzm00RM
 liCxftYM+PhGCDLvhfQBCve0Fhli
X-Google-Smtp-Source: APXvYqw+tBtaI9e2YG3l7LVjY7+rXZwegP+w8h+2dW9WC0AJCJWc+f8kDJbpdHLIcMHOj83fNGiolg==
X-Received: by 2002:ac8:32ec:: with SMTP id a41mr93842684qtb.375.1564689051858; 
 Thu, 01 Aug 2019 12:50:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id f26sm39941602qtf.44.2019.08.01.12.50.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 12:50:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/amdgpu: removed duplicate line
Date: Thu,  1 Aug 2019 14:50:38 -0500
Message-Id: <20190801195044.10331-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fuocsp7R6diaVZCJlJm/vpdaysu/U2ZNuCcvv5MPsk=;
 b=r+hUHb+dI9f/o3LR7/cJZ67dh/vGhxmBGUf3mJ/EAA5l89jXezmNo/YA9HDJ1Be7DV
 CBYkTPyF4YmVRm6Mpvy5957FNvA8/myx1ZS57Zq4hMA+HbmfF/NZsAyCtMU+SuHaUgzZ
 Vz1Tw2cRrrqAkM1htMF+aCoJ8bhSRigCc+KhlDHe/O2K7BrOOKTMYvcSsL7fe+BKLISd
 DF6lqqTuaHlGtbLbB7bszBgkJMA59VxC0y14zLkAyA5hD4zTcIDz+QZMhFjyd3hIYroP
 AC0eHMQr6yQ3S68qtfIkagi5uaMDsERw5byJ5UfdepdneaSA1egsdfwfvAnNFicHFqxU
 f8lg==
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
 John Clements <john.clements@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBDbGVtZW50cyA8Sm9obi5DbGVtZW50c0BhbWQuY29tPgoKUmVtb3ZlIGR1cGxp
Y2F0ZSBicmVhay4KClNpZ25lZC1vZmYtYnk6IEpvaG4gQ2xlbWVudHMgPGpvaG4uY2xlbWVudHNA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxIC0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMKaW5kZXggNGRlZTVkNTAyYTFlLi4xMjBmNTRmZWVjZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMTMzMCw3ICsxMzMwLDYgQEAgc3RhdGljIGludCBnZnhfdjlf
MF9pbml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJZWxzZQogCQkJ
Y2hpcF9uYW1lID0gInJhdmVuIjsKIAkJYnJlYWs7Ci0JCWJyZWFrOwogCWNhc2UgQ0hJUF9BUkNU
VVJVUzoKIAkJY2hpcF9uYW1lID0gImFyY3R1cnVzIjsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
