Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202949045
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834146E03B;
	Mon, 17 Jun 2019 19:49:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE2E6E03A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:49:31 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so12331285qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hw4jT+DioRiqa1kZwUR34cIbKa/bML/HdvchQ/MHZo=;
 b=lrzNU/sEJstehE3fnMO5QTHPFTLeHJZH6oDq+ALt1mI9iaPnMHKiw/zGBV0miYpD1/
 PsqYKzgW3VV6VaBaocK+Visn5fuPePVMfXuKHnc6YrVsyN4UNMI/M3GZAJbFGq76K86u
 M4I+STt82uAgIiRFcd+lY/L87w1nwCmpxNh/+sLrzA2Wo2iDBnbBUhtd7cHL0V2f1Jj0
 GImGNE0y7sq4Xz5jPIhOFGmeX7uc4SBNjcVkWUnunkPQBVd3Z6j72Zg1NwnAZgSufJ/1
 doeCT7Dm2V6VLtQb4eNbTKUENQdn7SsZ5kzm4cSdbg8pY1axPUOvN7jxEV3IE2vRYbmP
 XKJg==
X-Gm-Message-State: APjAAAVvqCH6cxqnMGwLH1s/JExbPvg7PVTZ9zYpHuFFJSnL2PfyLEFr
 jNhC97osaiN7cud/ryZYskUPhNZeZL+8zQ==
X-Google-Smtp-Source: APXvYqzFSI67AIxaYpx54MKN6ioTn2V+bnwusmqw+f0LKrddAl3eCqg9dswOu5Rx065+xM3G2o8HoA==
X-Received: by 2002:ac8:87d:: with SMTP id x58mr96956247qth.368.1560800970380; 
 Mon, 17 Jun 2019 12:49:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id 34sm8125381qtq.59.2019.06.17.12.49.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:49:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 398/459] drm/amd/display: Add power down display on boot flag
Date: Mon, 17 Jun 2019 14:49:14 -0500
Message-Id: <20190617194915.18618-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194915.18618-1-alexander.deucher@amd.com>
References: <20190617194915.18618-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hw4jT+DioRiqa1kZwUR34cIbKa/bML/HdvchQ/MHZo=;
 b=lDqJIspoemAL8JLy+6kAW8ClugW/Z9+fblfYkBoA3gxJ8fZzaHWcoaGmldMc88jxU7
 qrT8qg75dAFr9WUGdc+huPzf2h2ivnlki01R20AOriGj9zS0cF2YkMsINVq2T0oNnIyX
 UA6ItM4zRR0aqQQb3s3vTCMwKz0UA/biUDGWtvCMuH27kr8JAPFIOwtZDNg3vq0cfdDl
 e78/DeHfn4wGg5nM23bp33Lx2azNXCgxZsZ09mFnbO4D5wJafc41wF7jtn4y/E9NBTrT
 pLajR7reIHmXeKxlzcJWOA823jvRdX622lZAPDdgYkw7mBbYJgwRDzv+HnhkWK17Aq4e
 mXug==
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIExpbSA8VGhvbWFzLkxpbUBhbWQuY29tPgoKW1doeV0KRHVlIHRvIHRoZSBn
ZW5lcmljIGludHJvZHVjdGlvbiBvZiBzZWFtbGVzcyBib290LCB0aGUgZGlzcGxheSBpcyBubwps
b25nZXIgYmxhbmtlZCB1cG9uIGJvb3QuIEhvd2V2ZXIsIHRoaXMgY2F1c2VzIGNvcnJ1cHRpb24g
b24gc29tZQpzeXN0ZW1zIHRoYXQgZG9lcyBub3QgbG9jayB0aGUgbWVtb3J5IGluIHRoZSBub24t
c2VjdXJlIGJvb3QgY2FzZSwKcmVzdWx0aW5nIGluIGJyaWVmIGNvcnJ1cHRpb24gb24gYm9vdCBk
dWUgdG8gZ2FyYmFnZSBiZWluZyB3cml0dGVuIGludG8KdGhlIGZyYW1lIGJ1ZmZlci4KCltIb3dd
CkFkZCBhIGZsYWcsIHJlYWQgZHVyaW5nIERDIGluaXQsIHRvIGRldGVybWluZSB3aGV0aGVyIGRp
c3BsYXkgc2hvdWxkIGJlCmJsYW5rZWQgb24gYm9vdC4gRGVmYXVsdCB0byB0cnVlLgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIExpbSA8VGhvbWFzLkxpbUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJp
YyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+CkFja2VkLWJ5OiBBbnRob255IEtvbyA8QW50aG9ueS5L
b29AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpBY2tlZC1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZDIwMjUwYjE4MWI3Li44ZjIwNmE3ZGRiOGMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwpAQCAtNTU3LDYgKzU1Nyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWluaXRfZGF0YS5mbGFncy5mYmNfc3VwcG9ydCA9IHRydWU7
CiAKIAlpbml0X2RhdGEuZmxhZ3MucG93ZXJfZG93bl9kaXNwbGF5X29uX2Jvb3QgPSB0cnVlOwor
CiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8wCiAJaW5pdF9kYXRhLnNvY19ib3VuZGlu
Z19ib3ggPSBhZGV2LT5kbS5zb2NfYm91bmRpbmdfYm94OwogI2VuZGlmCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
