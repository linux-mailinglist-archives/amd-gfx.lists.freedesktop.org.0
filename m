Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E128543
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 19:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45B89CD7;
	Thu, 23 May 2019 17:47:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBCD89CD7
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 17:47:49 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k24so7743807qtq.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 10:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+16jkiTfMoDy5UJJ1sUXqseZ/gOL4g/qNwM8NnJyjTI=;
 b=RCOzSL/cKZOr1Kr0RBxgXsna2IHRhQc3HPTk5rqv8TckVrcwu/FVNlsphcGMB+4rLp
 yeHwkqFE6xBsVV1KqQCqOwF8qkUq13LQpRjycjsn2hP6ha2bxUvSZxcSlj4RG8lDOLAd
 gtg3FbCI+ca8//btSh3h1kDerYYTZnPUr0fWETZvNZaqwyf8KlgafylHU/bEw3JF4kQO
 f7VC82mUV8m/PJOirPVxmw7GbR9g9x1m6xyrvDNYsXQzl1ofTMEaQUympO4s9PzP1bId
 bm1dFQXhD+0Iwqz1xIfJHcdyo2+tN8oRlSGEkSutjOHNVGz7ifpOzJLGzXn3leD8gQO9
 4WEg==
X-Gm-Message-State: APjAAAVqvtwJrWzc8PBhL0jvR2ztjSOj2IEMs5pmvnGfG9u4Ecvih333
 ISV/gtsNx8CWN3XnvXhyKTC32c2S
X-Google-Smtp-Source: APXvYqxh5zElGzrZgY69RRaHMbWlYzpli+vWat6cQ05p3yy5bQ+t83plG1yvadDP+mhOgT3Ml0SFow==
X-Received: by 2002:a0c:d96c:: with SMTP id t41mr67918073qvj.232.1558633668717; 
 Thu, 23 May 2019 10:47:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.72.228])
 by smtp.gmail.com with ESMTPSA id g54sm437326qta.51.2019.05.23.10.47.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 23 May 2019 10:47:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/ras: use GPU page size for page retirement
Date: Thu, 23 May 2019 12:47:40 -0500
Message-Id: <20190523174740.5002-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+16jkiTfMoDy5UJJ1sUXqseZ/gOL4g/qNwM8NnJyjTI=;
 b=UkhrHuglgxuOjOe+jdP1lOW9WJUbEbfDtGW+vRA+J/yS4VqeSkmcAi99SZvDYy4Ojb
 laqu9FbRHx1FUQPZmjkXVCG5a4ewD4ayh0pNyaLn2HsDR3p/OmeVBrTC45F1CmcXnU2c
 Hyy5iIsp0yJCtIfylSYCJYWV9fE8mv/t56D9XK5hoz0ZYcfWxhNHdwE5FUtkWZvfmjfp
 Xbu+IPy33UTpmruaMZZo2vasHUFk83L8Z71dCKufSS0sRe43LoAmPA2RASh5avc4ouIT
 p0qhpR/skalo5QsTtddSIrZGC0a8D8OamSBybAGrKdsZMe7O+rTnx6/yNzl45tzrFgCx
 eJ2w==
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

QmFkIHBhZ2VzIGFyZSBzdG9yZWQgaW4gR1BVIHBhZ2Ugc2l6ZSBzaW5jZSB0aGV5IGFyZSBWUkFN
IHBhZ2VzLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggZGExZGM0MGI5YjE0Li4z
MjkwNmQ2YzYyMWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAg
LTE0MDgsOCArMTQwOCw4IEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCWZvciAoaSA9IGRhdGEtPmxhc3RfcmVzZXJ2ZWQ7IGkg
PCBkYXRhLT5jb3VudDsgaSsrKSB7CiAJCWJwID0gZGF0YS0+YnBzW2ldLmJwOwogCi0JCWlmIChh
bWRncHVfcmFzX3Jlc2VydmVfdnJhbShhZGV2LCBicCA8PCBQQUdFX1NISUZULAotCQkJCQlQQUdF
X1NJWkUsICZibykpCisJCWlmIChhbWRncHVfcmFzX3Jlc2VydmVfdnJhbShhZGV2LCBicCA8PCBB
TURHUFVfR1BVX1BBR0VfU0hJRlQsCisJCQkJCSAgICBBTURHUFVfR1BVX1BBR0VfU0laRSwgJmJv
KSkKIAkJCURSTV9FUlJPUigiUkFTIEVSUk9SOiByZXNlcnZlIHZyYW0gJWxseCBmYWlsXG4iLCBi
cCk7CiAKIAkJZGF0YS0+YnBzW2ldLmJvID0gYm87Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
