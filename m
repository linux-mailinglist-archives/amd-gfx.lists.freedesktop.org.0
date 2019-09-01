Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31BA4AE6
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Sep 2019 19:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687DF8954A;
	Sun,  1 Sep 2019 17:39:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825848954A
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 17:39:10 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id w10so6072376pgj.7
 for <amd-gfx@lists.freedesktop.org>; Sun, 01 Sep 2019 10:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBK6D5q+i98CYRAcFy9F9o/VAu6keUHWayrlk9j71Sc=;
 b=BhbM9dHRNKDx0TGJ6OhifarlUG9tM2riYW0vDJouzf5OheDec6M9Q48OAxg3ygkuzv
 9EOat2DoyShhcv+kOwz9bgW68bchOH2PLAimV0jzTEdXw+/KBK5z+2HwH7HxDry9TerM
 4vtmY0qYqXnXGMnqY4p0nD3MkytJxeN/Ac3txfd8qgC+xF9W3oe4mkhT/MhKtPS9gTYI
 z2ly0zkVGRAjr/ON/gzlogI27sFxRzVlHp0A3tGgZZnc+b9GLKru6rO9zVzEjUE3YG69
 Hu3+anBJ4AREsbvOhe/9tCa+82y2BRDF0CbHbY64B3jcB5LG+pr4L/nhlcTyI7QT8Mp0
 nnNg==
X-Gm-Message-State: APjAAAWeeyC28JEVsLVucAi0DpF9Jt8YijTmWKZuRmenRQ5lUCaSdNIW
 HHEubvbaNdRiO92BhmUJxf3NWxWB
X-Google-Smtp-Source: APXvYqxjoIhbQdKJblSfi36pV8onbtcRpt57b1Sv1SzzASxFM3OjXEwxExUCJ4SsfCrav0++sU3rvw==
X-Received: by 2002:a63:e70f:: with SMTP id b15mr21790275pgi.152.1567359549704; 
 Sun, 01 Sep 2019 10:39:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id y13sm17633670pfb.48.2019.09.01.10.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 10:39:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/irq: check if nbio funcs exist
Date: Sun,  1 Sep 2019 12:38:54 -0500
Message-Id: <20190901173854.8824-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBK6D5q+i98CYRAcFy9F9o/VAu6keUHWayrlk9j71Sc=;
 b=e/qy4JKfSfrGRlLhcWamnlNsJgU9/vMC4guLLci3rzHL+CvoGs16aFntYM+tXzGwTb
 ppGU6OXKoNpW9MRn8ihoCQJrO0hjBZ6Ij0nAnGy1eiRv+pz08OEgosUfM/ujMifCANfW
 9DdCultSYba05bOBJ1obB7UM8AFdrxlqJhfDvotWJxJ6f4Zuuski+JLnRNP2DkQDKBKL
 HDoe+Ndeic8aj08WMVQcHtqBmIQI9wfqds1eoTm9yWIf95D0AzrGzrVc6+qSTSn8cjL4
 RGPilTjINwf12aJObjJIkTdBZhuLefGTZogwMpefHVhk5WcOvbBhRLO8vT/3fnY8omOn
 vcCw==
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

V2UgbmVlZCB0byBjaGVjayBpZiB0aGUgbmJpb3MgZnVuY3MgZXhpc3QgYmVmb3JlCmNoZWNraW5n
IHRoZSBpbmRpdmlkdWFsIHBvaW50ZXJzLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pcnEuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYwpp
bmRleCAzZTQ5YWExNDY1ZTIuLjA3ODJmOTE1M2I2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pcnEuYwpAQCAtMTU2LDEwICsxNTYsMTIgQEAgaXJxcmV0dXJuX3QgYW1kZ3B1
X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmFyZykKIAkgKiByZWdpc3RlciB0byBjaGVjayB3
aGV0aGVyIHRoZSBpbnRlcnJ1cHQgaXMgdHJpZ2dlcmVkIG9yIG5vdCwgYW5kIHByb3Blcmx5CiAJ
ICogYWNrIHRoZSBpbnRlcnJ1cHQgaWYgaXQgaXMgdGhlcmUKIAkgKi8KLQlpZiAoYWRldi0+bmJp
by5mdW5jcy0+aGFuZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9fYmlmcmluZykKKwlpZiAoYWRl
di0+bmJpby5mdW5jcyAmJgorCSAgICBhZGV2LT5uYmlvLmZ1bmNzLT5oYW5kbGVfcmFzX2NvbnRy
b2xsZXJfaW50cl9ub19iaWZyaW5nKQogCQlhZGV2LT5uYmlvLmZ1bmNzLT5oYW5kbGVfcmFzX2Nv
bnRyb2xsZXJfaW50cl9ub19iaWZyaW5nKGFkZXYpOwogCi0JaWYgKGFkZXYtPm5iaW8uZnVuY3Mt
PmhhbmRsZV9yYXNfZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZykKKwlpZiAoYWRldi0+
bmJpby5mdW5jcyAmJgorCSAgICBhZGV2LT5uYmlvLmZ1bmNzLT5oYW5kbGVfcmFzX2Vycl9ldmVu
dF9hdGh1Yl9pbnRyX25vX2JpZnJpbmcpCiAJCWFkZXYtPm5iaW8uZnVuY3MtPmhhbmRsZV9yYXNf
ZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZyhhZGV2KTsKIAogCXJldHVybiByZXQ7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
