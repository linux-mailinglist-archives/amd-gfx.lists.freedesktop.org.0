Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA15E628AE
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 20:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E40D6E040;
	Mon,  8 Jul 2019 18:48:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7687C6E036
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 18:48:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so19034392qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 11:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nvoMk0ZbHfuHEy6ztbUGScV0buC8bKg8wWLgu8qUi5c=;
 b=almoMwIW7C4nblKSohPbdHGFSfo8Mxslsthi5+tzn/zvXRaPpWYGa7b8C32UXs9dbQ
 5dyaQoscqXknCcoy7u2sUMWrdl/EbZL8YPOvpbrT59JFT+rRAaJPc5QRs5csvUxGgYtz
 OLhK8ZLcl0tybC8e8QfdQE4vALdP5HqNRv5dZIKGyZpy3tbH6MLbKR6fN17TtJ5F2f8Q
 JKJsfd6knkduYwRHH8X+5tpF2G69Q4uwRa/HGsKHIb5E9SylHji2MgI1pgaj5Lu27bA/
 r9FR426IhUdcsLwGNx++B6eCoKbvHlF9iJV8K3nEbK6dZOPrK0OXj+BHG4OBiRaO0GGS
 GH1g==
X-Gm-Message-State: APjAAAUOXgzG80DmzJ8+7A7JHuaCsbfWHYJpEvfvqy+OyB+Ol6VnwloI
 l0yPUUowLhZU3TlMOfyzzvOw6t9Z
X-Google-Smtp-Source: APXvYqxG6rRRzJcKCb0BIlXbjBMhwJg6J6UX+sVKVKsRMgQ9OV7FyBI0+QBvsEhvzYdnie1ZSabWKQ==
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr16335360qvg.181.1562611707400; 
 Mon, 08 Jul 2019 11:48:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id h26sm8954179qta.58.2019.07.08.11.48.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 11:48:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: enable IP discovery by default on navi
Date: Mon,  8 Jul 2019 13:48:11 -0500
Message-Id: <20190708184811.6409-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708184811.6409-1-alexander.deucher@amd.com>
References: <20190708184811.6409-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nvoMk0ZbHfuHEy6ztbUGScV0buC8bKg8wWLgu8qUi5c=;
 b=C+xbG1p8ErdU5OaWbIM0Ex+sip/duWb/Xbu+Pptv/fvadJRgPiVFg1i6TjmjV8IhMH
 pGTeyQg5D6RtJhcUWTHQO2aFI9ydcUGpIBrocwujnW2yxnRP2dcrRNhdIvC2NcP5tU8e
 XKqR1df/e9uaCF4YuUtN+AwoCZOyeNh6a/2lOyfFDBghr3jYzcMlojV+ag+Hvx7a7CLa
 qgMgJBvnnNZzq1VAhJWifTc3+xKyYsSlblXkNFtBppI1Qhc0m5tZvHnUexLeyQtKnizM
 iWYHu4UvUYB7i7ubiqEZWWPu8VP2vFW/XQlZ5rAL7c4XM5KJ3AOlqh1X4wU8ol69Y46p
 6o2g==
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

VXNlIHRoZSBJUCBkaXNjb3ZlcnkgdGFibGUgcmF0aGVyIHRoYW4gaGFyZGNvZGluZyB0aGUKc2V0
dGluZ3MgaW4gdGhlIGRyaXZlci4KClJldmlld2VkLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUu
eXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
IHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggNzk0MWE1MzY4ZmI1
Li42Zjc3NzJlZWViNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMK
QEAgLTE0MCw3ICsxNDAsNyBAQCB1aW50IGFtZGdwdV9zbXVfbWVtb3J5X3Bvb2xfc2l6ZSA9IDA7
CiB1aW50IGFtZGdwdV9kY19mZWF0dXJlX21hc2sgPSAwOwogaW50IGFtZGdwdV9hc3luY19nZnhf
cmluZyA9IDE7CiBpbnQgYW1kZ3B1X21jYnAgPSAwOwotaW50IGFtZGdwdV9kaXNjb3ZlcnkgPSAw
OworaW50IGFtZGdwdV9kaXNjb3ZlcnkgPSAtMTsKIGludCBhbWRncHVfbWVzID0gMDsKIAogc3Ry
dWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvID0gewpAQCAtNTkyLDYgKzU5Miw3IEBAIG1v
ZHVsZV9wYXJhbV9uYW1lZChtY2JwLCBhbWRncHVfbWNicCwgaW50LCAwNDQ0KTsKIC8qKgogICog
RE9DOiBkaXNjb3ZlcnkgKGludCkKICAqIEFsbG93IGRyaXZlciB0byBkaXNjb3ZlciBoYXJkd2Fy
ZSBJUCBpbmZvcm1hdGlvbiBmcm9tIElQIERpc2NvdmVyeSB0YWJsZSBhdCB0aGUgdG9wIG9mIFZS
QU0uCisgKiAoLTEgPSBhdXRvIChkZWZhdWx0KSwgMCA9IGRpc2FibGVkLCAxID0gZW5hYmxlZCkK
ICAqLwogTU9EVUxFX1BBUk1fREVTQyhkaXNjb3ZlcnksCiAJIkFsbG93IGRyaXZlciB0byBkaXNj
b3ZlciBoYXJkd2FyZSBJUHMgZnJvbSBJUCBEaXNjb3ZlcnkgdGFibGUgYXQgdGhlIHRvcCBvZiBW
UkFNIik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
