Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D107569E27
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FC489ED6;
	Mon, 15 Jul 2019 21:25:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1658489F0B
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:33 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z4so17289524qtc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0N87mCHDjz7toee3SX3w58QFm+twaEIxvZOThVAqBzY=;
 b=EsWjtk+xAzffbQjA2ZfUCdu2/Og0wvyCoKgwdvyX0Q34oYw12XRAlBMcNOFKCsOk/2
 TPmRU2TwUJxDgTSjUexhlo/AtgwtqJm0kjSa71W7mDDnwvoZSBbpI9KgjLJ8Dd0MqjUK
 fr55Wzl1pPQNtsGVEw6WHhguHqsKQpIGrsjm+JJ4PUo65yBq5ce3JtUcVgrTSON4aD4b
 Xuxrru7QUkGcL5DVODTpg7uUzRoArnQGd0Uzqus0vWsRP2SHdgn/8iZiZs05IggtmRqn
 6Y4Hd4w+AuBnmfQBBdzOTtOPd956edR+M8UcDM++IDrPz7Hk53pEF1mhyhkJlm8dWKEf
 VFKw==
X-Gm-Message-State: APjAAAWDuozFfzPCqADRys8Dn4PzjHEn+jUnRI6Y+1ArEwlf5eslZppq
 E+GZZ8sHD1hceXRSv9bGdFr+oS2N
X-Google-Smtp-Source: APXvYqw4d7BpYfDSKo7Y1YTuBHx+aN+zcriyiinwJOqtRbDc2FwhFExLkoceq/yoGv6sAyH7Q4H3Eg==
X-Received: by 2002:a0c:f788:: with SMTP id s8mr19577662qvn.35.1563225932054; 
 Mon, 15 Jul 2019 14:25:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 053/102] drm/amdgpu: Enable xgmi support for Arcturus
Date: Mon, 15 Jul 2019 16:23:48 -0500
Message-Id: <20190715212437.31793-51-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0N87mCHDjz7toee3SX3w58QFm+twaEIxvZOThVAqBzY=;
 b=nXO6dgiTOiaqGVgp0dqJ+C5P9lYywwg1Iq+GUuxNv9alSvhzXteYYRLXItB54MuOQz
 xLOLfk+F3xhy7dUF3htT14ZQ2YHW5jOpj8Z5GFm+Kds9TkGLgjLr3wxip5RX0kkAvXOA
 xy+AMzc8fhgyuYl6LBHZwhpEFWjenotBqDCttg9A+609z7x9Hi8ZZsFvd+sygluZU05c
 J+DOvtr2Cqus2h4W3wbgBuO5Mtnf1AT76zT/dfpE2crduk6pN1+1fvh2XIrnZhWXUgwP
 sGKbli6VZXbKw2K//6MDCzl7sJphAC8wTsNi/x5WSHQSjw6uLf81GmAA/S94/YSS+3R4
 W+IA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVu
ZyA8T2FrLlplbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCA4Yzg4MTY5N2QyOWIuLmZiNGM3YWFjOGQ5
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC01OTIsNyArNTkyLDcgQEAgaW50
IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJldHVy
biAtRUlOVkFMOwogCX0KIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjApCisJ
aWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0EyMCB8fCBhZGV2LT5hc2ljX3R5cGUgPT0g
Q0hJUF9BUkNUVVJVUykKIAkJYWRldi0+Z21jLnhnbWkuc3VwcG9ydGVkID0gdHJ1ZTsKIAogCWlm
IChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
