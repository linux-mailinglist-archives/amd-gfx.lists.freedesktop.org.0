Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43A5D77F
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E036E075;
	Tue,  2 Jul 2019 20:29:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75E6E07F
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:36 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so20130340qtn.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9EiNiofMyETAX0TwHH7k5yuKZvNLZebuuvmTv3CWIc=;
 b=FJwQgVr6918fSGmDdSd+HOQoaetyVzHzwmuGW3As0icz1evPNzJEOEBz99iv89cLpB
 NhVR4t85gIGACZ1bN9xfm5yCXJY/6ewXBw48UkNj9iGvmjT2iw69e7lwyqO/FYUJNqIc
 ZamH47eBGR/6XJbaebR97bOU7ZhxYk8ZT9pmaZymWTwGk/5W3z03uOZnbqIf8jmlbE6S
 kxQ2PU16cggG2CvZYZxQootMJLMZQ3uWWAtwbdFl358EEDCbH4jmc8I6AF5s2yDeLGEj
 U2slo9NBqZvfNdxI5A4zAbBqv5+J7be7IwXREmcSKd3PU/ip5yFmc6UzQKa8bOTX1F37
 cwFg==
X-Gm-Message-State: APjAAAWwYhh0gWffBhKClZhLO7e9LQPHCEUXglMLjSo6xBWLaPTpiilN
 /6hsfShu/Zzxdo6mXYplXxlvSLUeN6I=
X-Google-Smtp-Source: APXvYqw1e9rYwInIw4FhvJQ9PjYmC64Cliv9W8BMWkQ0y+mYJe7UrDEOF8S5qVodUhb35PLzONVfTQ==
X-Received: by 2002:a0c:87ca:: with SMTP id 10mr28371401qvk.210.1562099375630; 
 Tue, 02 Jul 2019 13:29:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 45/53] drm/amdgpu: enable clock gatings for navi14
Date: Tue,  2 Jul 2019 15:28:36 -0500
Message-Id: <20190702202844.17001-46-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9EiNiofMyETAX0TwHH7k5yuKZvNLZebuuvmTv3CWIc=;
 b=CeK3Z0rt1ajBUhaxysWzvj/iHZPK605QVOlzEygi2XhnOXoEiBM/aEf7LQET7cIMIp
 IJw8xaGf4oRhecbkezaywnWThmVZeT8LtDuA2FCBKfJFIjAotBP1xZhLXyYx4tyxuaPF
 ArnmI+N7/Z822juhvWLq25vaDgj7EUo4v9cbfYVjsMFnrRso6KVbPEd64Jbz1w+6QhcL
 AJ78WYUDWHUOrxVy43JvyjeTAcvYIp2bSr/yOeJiF8WPVhSnSUkPXQ6qxN6HuLGwPqVA
 6OqAj1mcYhxv/q/ecgAvWJKXamoJF7O0hHZrs4dfg0rfDL7MxRv/aWUcXCSmozgMWskO
 2ADA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNldCBhcHByb3ByaWF0
ZSBDRyBmbGFncyBmb3IgbmF2aTE0LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFv
amllLnl1YW5AYW1kLmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMTUgKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9udi5jCmluZGV4IDM0NTJmYzEwYmM5NC4uOWNhODJiNWU4N2RmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMKQEAgLTUzMiw3ICs1MzIsMjAgQEAgc3RhdGljIGludCBudl9jb21tb25f
ZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYt
PnJldl9pZCArIDB4MTsKIAkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkxNDoKLQkJYWRldi0+Y2df
ZmxhZ3MgPSAwOworCQlhZGV2LT5jZ19mbGFncyA9IEFNRF9DR19TVVBQT1JUX0dGWF9NR0NHIHwK
KwkJCUFNRF9DR19TVVBQT1JUX0dGWF9DR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX0lIX0NHIHwK
KwkJCUFNRF9DR19TVVBQT1JUX0hEUF9NR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX0hEUF9MUyB8
CisJCQlBTURfQ0dfU1VQUE9SVF9TRE1BX01HQ0cgfAorCQkJQU1EX0NHX1NVUFBPUlRfU0RNQV9M
UyB8CisJCQlBTURfQ0dfU1VQUE9SVF9NQ19NR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX01DX0xT
IHwKKwkJCUFNRF9DR19TVVBQT1JUX0FUSFVCX01HQ0cgfAorCQkJQU1EX0NHX1NVUFBPUlRfQVRI
VUJfTFMgfAorCQkJQU1EX0NHX1NVUFBPUlRfVkNOX01HQ0cgfAorCQkJQU1EX0NHX1NVUFBPUlRf
QklGX01HQ0cgfAorCQkJQU1EX0NHX1NVUFBPUlRfQklGX0xTOwogCQlhZGV2LT5wZ19mbGFncyA9
IDA7CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDB4MTsgLyogPz8/
ICovCiAJCWJyZWFrOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
