Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C445D76F
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56316E065;
	Tue,  2 Jul 2019 20:29:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2E6E060
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:22 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w17so20139422qto.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yfo7l2QbYBDsEndTHfk3/vy7nvkDIq7hMQrtABPY/00=;
 b=ZLDINmZ3ZuFmuq3iU3qLpTKrnGHFd4NlLFZg+bmURu8B22TmytVP5BFmxpUDTpAwR8
 Fcuzirn1a/Mn3O47BzfV9LAj2HoxnULRlVLDWg/g6Je8mNejSXnquYjRCqwgO1/yMr7u
 EMzSrfa/YwQNEf/7SWKU6VzWqIgQTb6EABe2M3y7Y3727JcX92J/j3wbm+45hdgwaJGn
 JbVKHCsie5djl3Vzmgg98FOKQwVrQRTpPzqW8QXO5dp/mByYoh0sNcNjDrHz2iipCC7u
 JHGvihPUzb2K+0OoOPf+Ab80e5AsTM7Pm1xTbaiwMKhmer989UjS+eScVyBteoz7Jpat
 ab9g==
X-Gm-Message-State: APjAAAU+ve6c1oS7yoH2fKAoWG5o6+wI7gRxOjQzs0jx16tbbqIyjCnz
 VWjSlxQG+YD1gqsVd05VmKiDy0kIrZA=
X-Google-Smtp-Source: APXvYqz7aCu43Hm77Wm6ChiafYopH2AXXbuMEBwbHtoIncz7m+auRZAw2K5YZULV2NdeXac3KuqVHQ==
X-Received: by 2002:ac8:2a0a:: with SMTP id k10mr28121779qtk.148.1562099361475; 
 Tue, 02 Jul 2019 13:29:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 29/53] drm/amdgpu: enable virtual display for navi14
Date: Tue,  2 Jul 2019 15:28:20 -0500
Message-Id: <20190702202844.17001-30-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yfo7l2QbYBDsEndTHfk3/vy7nvkDIq7hMQrtABPY/00=;
 b=BfFwKjzJ9vuWrHdSOORXsR54sHwTD+DRDeqiZjoUJ14MzHjWQmwA66SCLa0QGogwJz
 RHq4l6Jm1hYjg4ciTmGwVrD20UbDWXsEsnOs+UlR5DDcXM3PyuFwFRVRnv+azCRwizSP
 mlIXTcBcBkndVBitjc1+KaOz5PcBTYOmfwH/tT3cb9XhdhS9TQVnHVdK+Gto+Dm5IU9h
 qixlGtLo4SFPDOE8Sh6B8gk1tUEsCOk0v7rhOvvdsumlkX2Y8ftJs8O8kQRKQ8IL3Sce
 KREtexeVBKlnGzec5AGtpFw0WN4acQCWxu1gVE2iAcOVvEare3pYDLV/71SedqA3Aclr
 OQPQ==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClZpcnR1YWwgZGlzcGxh
eSBpcyBhIHN3IGJhc2VkIGttcyBpbnRlcmZhY2UgZm9yIHZpcnR1YWxpemF0aW9uCmFuZCBlbXVs
YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29t
PgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyB8IDEgKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyAgICAgICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZGNlX3ZpcnR1YWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFs
LmMKaW5kZXggOGJlNGU0ZmFjYThlLi40MTk1YjExNzJiZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGNlX3ZpcnR1YWwuYwpAQCAtNDU2LDYgKzQ1Niw3IEBAIHN0YXRpYyBpbnQgZGNl
X3ZpcnR1YWxfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJY2FzZSBDSElQX1ZFR0ExMjoKIAljYXNl
IENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9OQVZJMTA6CisJY2FzZSBDSElQX05BVkkxNDoKIAkJ
YnJlYWs7CiAJZGVmYXVsdDoKIAkJRFJNX0VSUk9SKCJWaXJ0dWFsIGRpc3BsYXkgdW5zdXBwb3J0
ZWQgQVNJQyB0eXBlOiAweCVYXG4iLCBhZGV2LT5hc2ljX3R5cGUpOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmMKaW5kZXggMDhkYjgzOGRiZTc3Li43MThjMjIzMjljZGQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbnYuYwpAQCAtMzY2LDYgKzM2Niw4IEBAIGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAm
bnZfY29tbW9uX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwg
JmdtY192MTBfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYs
ICZuYXZpMTBfaWhfaXBfYmxvY2spOworCQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxh
eSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikpCisJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmZGNlX3ZpcnR1YWxfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmZ2Z4X3YxMF8wX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9j
a19hZGQoYWRldiwgJnNkbWFfdjVfMF9pcF9ibG9jayk7CiAJCWJyZWFrOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
