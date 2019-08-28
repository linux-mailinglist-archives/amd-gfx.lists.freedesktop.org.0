Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F623A03CA
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC56898A7;
	Wed, 28 Aug 2019 13:56:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953CA898A7
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:56:20 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id q64so3078918qtd.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 06:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l1I64W3BSyHkVRv4Fbs5WIpqWrbGax7bnnKNovPt7Oc=;
 b=mf5TH5NWTk+80y0IKFetFjyL3W14NG5+U7UY0gRLblajz8hP18yAapVa617hRdlRqT
 5kSRS9mAmKl8beHihX1d7zNktuUnjKqb/9UOBaCHh4tiEB3q2quEvVecngAJI6tESuR9
 RLOgTLOtlcQ28rllAo+7H/cKoqE54cAhahZsbdPZrQoigL+qRdSYltmh4YKrF1IKPo6V
 VYTKK+llL6yVvrc8t1/01vKCCUMNByCbpX7bueZPiUpN/bTzgK4J3whYaD1Rj+e/Wm+f
 bi78laDYbdqyLkyw50CVENmi29mt31OrhO+joP7iiXjPHbovfWyVqLwEuxmJnt5I50f4
 9M5Q==
X-Gm-Message-State: APjAAAV5hWizLFGzDvwhV7f9NqwQq0hLgMKkSxq8UOyNRqvQziuY3KCK
 43DzEJ/0eMmXWNxiJYxjZZPD/NwbdJE=
X-Google-Smtp-Source: APXvYqwqBnp9aeEqtAd0gAFwIJadLlKNLigphFVJZnW9qBp6tP6jgf65J/FOvWgpVlUxIhWtsPZUjQ==
X-Received: by 2002:ac8:5247:: with SMTP id y7mr4439327qtn.107.1567000579409; 
 Wed, 28 Aug 2019 06:56:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id o9sm1101139qtr.71.2019.08.28.06.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 06:56:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/virtual_dce: drop error message in hw_init
Date: Wed, 28 Aug 2019 08:56:10 -0500
Message-Id: <20190828135610.3827-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l1I64W3BSyHkVRv4Fbs5WIpqWrbGax7bnnKNovPt7Oc=;
 b=j1SOEQvf9p3H+ZCKMB8E2yxEBDSuw+tI3gpvn6CLtYatVS3FsH9W0FxhmUJ5PJQzYu
 fjTs1SqBas1qWjNXWSi5ufBbJRmDrV5wx/l4TmFBLip+6ZdmZ8P7AocdjxNYE1LJybZN
 jwTkSZHK2/AjzXn5wlLGvsN8/xuI0GZjP4It8akNi6HEYbfYkyJNHt9tjcSBDgsNikwI
 JjrGyzftsfQ6v2IC59PaOQQYkydigWYz9rB0YQdzjLxlZ2nV3obehUrFwhhmXltcLpAo
 1HvmmvBioQOmkgbE3gHWGtnufo/fl6SiHhUlY1bP89tJMppHZItdXIoxKzUXntDowgus
 U9ww==
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

Tm8gbmVlZCB0byBhZGQgbmV3IGFzaWMgY2FzZXMuICBUaGlzIGlzIGEgc3cgZGlzcGxheQppbXBs
ZW1lbnRhdGlvbiwgc28ganVzdCBkcm9wIHRoZSBlcnJvciBtZXNzYWdlIHNvIHdoZW4Kd2UgYWRk
IG5ldyBhc2ljcywgYWxsIHdlIGhhdmUgdG8gZG8gaXMgYWRkIHRoZSB2aXJ0dWFsCmRjZSBJUCBt
b2R1bGUuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyB8IDEx
ICstLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdmlydHVhbC5jCmluZGV4IDZkYWRi
ZWQ3Y2U0My4uZmUyNDJjYzdjMDRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9kY2VfdmlydHVhbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92
aXJ0dWFsLmMKQEAgLTQ1MiwxNyArNDUyLDggQEAgc3RhdGljIGludCBkY2VfdmlydHVhbF9od19p
bml0KHZvaWQgKmhhbmRsZSkKICNlbmRpZgogCQkvKiBubyBEQ0UgKi8KIAkJYnJlYWs7Ci0JY2Fz
ZSBDSElQX1ZFR0ExMDoKLQljYXNlIENISVBfVkVHQTEyOgotCWNhc2UgQ0hJUF9WRUdBMjA6Ci0J
Y2FzZSBDSElQX0FSQ1RVUlVTOgotCWNhc2UgQ0hJUF9SRU5PSVI6Ci0JY2FzZSBDSElQX05BVkkx
MDoKLQljYXNlIENISVBfTkFWSTE0OgotCWNhc2UgQ0hJUF9OQVZJMTI6Ci0JCWJyZWFrOwogCWRl
ZmF1bHQ6Ci0JCURSTV9FUlJPUigiVmlydHVhbCBkaXNwbGF5IHVuc3VwcG9ydGVkIEFTSUMgdHlw
ZTogMHglWFxuIiwgYWRldi0+YXNpY190eXBlKTsKKwkJYnJlYWs7CiAJfQogCXJldHVybiAwOwog
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
