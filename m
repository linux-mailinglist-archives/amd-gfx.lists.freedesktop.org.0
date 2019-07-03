Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3D5E788
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 17:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C06E15B;
	Wed,  3 Jul 2019 15:13:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BC46E15B
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 15:13:50 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h18so1519992qtm.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Jul 2019 08:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CPWIMEGV7M8eKjdeppdQko/sj+YibJrbULozICssR8E=;
 b=EAvOBqbY11C5CLsIp4l9LAiFU9CsA8E1kC6AyrUuRVmMzmfYWTUpp7DvX650QBObAA
 O4r3h+KiwYMdkySutaZwG0bLXv9IOXLMKwDfr+3M2Or+2rRViyemOVOfzCPWVoyC/uzY
 KMbtZEIPvj6GM9+JWstWnKHckQrfviBuFbJRlg4QciQcNcO5etB+GoVblljzplWIL4eI
 MPuvOgXiCoNiqUJysMY1TDrDYFqOcVVVoD+YRoWAzLOABuC2gZt/G5bKpcvm0U7qqwyG
 5QBXTb17C0nwDyd7wIfJVlfhft2OQEqs8cjghpuGEGT+B4wLjk8wB4WYlCSg6IGobYFK
 PEXg==
X-Gm-Message-State: APjAAAWF3EFAmGjXCZSGR8wfwLK/yEjtKE8+6Xdr6+28f6fEmYcLmgZw
 tk8LvFzgiMATrcsD7aJmuCjfUFxvqYiyRw==
X-Google-Smtp-Source: APXvYqx91xITjmZOwYywixGEsgWVHPd+dO3xJcfTHVxqrNTPsru0wWV/MmfBQy8GgEj+i4YwD+6YtA==
X-Received: by 2002:a0c:d4f4:: with SMTP id y49mr32721078qvh.238.1562166829775; 
 Wed, 03 Jul 2019 08:13:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id q9sm961617qtn.86.2019.07.03.08.13.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 08:13:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Date: Wed,  3 Jul 2019 10:13:41 -0500
Message-Id: <20190703151341.5916-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703151341.5916-1-alexander.deucher@amd.com>
References: <20190703151341.5916-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CPWIMEGV7M8eKjdeppdQko/sj+YibJrbULozICssR8E=;
 b=tR189CKS2D46VC/teTIYz50uB80XNCkUXYt5fmXIsS9GLvzeFk+skjCg/jtkqHLEle
 LglVPSl7LjwHnOd5lFFJDaojKE+ES2FJmsPWvKJNCuXBzJwuCqfnaLCjNw/FHJgiYUhf
 K247cZLhSfcH4XYybv7R6A3DuZ7xfd9n9GnH3DwbnIdjZnvUE4dhGM16mZepwVWoSUZE
 i7DmAuJSeyquNpdkltXF8Js8xhtU+TOINirq6BKyClQW97b+6CbALSwKHuJOla6M5sR0
 gnV5Y/MN7DYczuXOonKAWCjzZYlykEbf0p3C/EBYgQKIo9orSAK7IxdBYxZE5I2LPQ2I
 lDEA==
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

VXNlIHRoZSBJUCBkaXNjb3ZlcnkgdGFibGUgcmF0aGVyIHRoYW4gaGFyZGNvZGluZyB0aGUKc2V0
dGluZ3MgaW4gdGhlIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA3OTQx
YTUzNjhmYjUuLjZmNzc3MmVlZWI3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYwpAQCAtMTQwLDcgKzE0MCw3IEBAIHVpbnQgYW1kZ3B1X3NtdV9tZW1vcnlfcG9vbF9z
aXplID0gMDsKIHVpbnQgYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayA9IDA7CiBpbnQgYW1kZ3B1X2Fz
eW5jX2dmeF9yaW5nID0gMTsKIGludCBhbWRncHVfbWNicCA9IDA7Ci1pbnQgYW1kZ3B1X2Rpc2Nv
dmVyeSA9IDA7CitpbnQgYW1kZ3B1X2Rpc2NvdmVyeSA9IC0xOwogaW50IGFtZGdwdV9tZXMgPSAw
OwogCiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7CkBAIC01OTIsNiArNTky
LDcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1jYnAsIGFtZGdwdV9tY2JwLCBpbnQsIDA0NDQpOwog
LyoqCiAgKiBET0M6IGRpc2NvdmVyeSAoaW50KQogICogQWxsb3cgZHJpdmVyIHRvIGRpc2NvdmVy
IGhhcmR3YXJlIElQIGluZm9ybWF0aW9uIGZyb20gSVAgRGlzY292ZXJ5IHRhYmxlIGF0IHRoZSB0
b3Agb2YgVlJBTS4KKyAqICgtMSA9IGF1dG8gKGRlZmF1bHQpLCAwID0gZGlzYWJsZWQsIDEgPSBl
bmFibGVkKQogICovCiBNT0RVTEVfUEFSTV9ERVNDKGRpc2NvdmVyeSwKIAkiQWxsb3cgZHJpdmVy
IHRvIGRpc2NvdmVyIGhhcmR3YXJlIElQcyBmcm9tIElQIERpc2NvdmVyeSB0YWJsZSBhdCB0aGUg
dG9wIG9mIFZSQU0iKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
