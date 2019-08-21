Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0709874F
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF7D6EA3D;
	Wed, 21 Aug 2019 22:24:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6516EA2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:41 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id i4so5087260qtj.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9duxz4GytudChsDJ42DfcUQhMwWYdgeKqh0VW4/VNoE=;
 b=Gj2y6HqjKXRpGsnUPT7ApfCM72N4dhNzVWcB/xebJlgbetmZvaZIJ0EOfCR5CenhwI
 Sz3tg/o+vpqM2RSaryl2pNV2iRljn2Fg0r8IHES9RtLLQzoBD4btdZQs7ijYNnnWiwml
 1+EdcBhjrc5oXpheW/jsiZEP6jIflQa5+hlYD8pCF/KyWPurbzK2DZZedDE5tfo8L1hF
 6YYfeE7ktFiGhLI+sguCCFLxfUdwobjeEB4kbX6mNaoL45XuH+C09uLzSOa21COR9slO
 TfFUE8LcS93n4yMJOubb+G+bTwRYLLfS1DWY4xWW53DoBEVW6NDs2VZcP3Xu+IKHRfmb
 TbJA==
X-Gm-Message-State: APjAAAXbluz6pSHwFuSuyT7gdIDwvJjyyfmtgE17Keeapt5pRy4ui5Ax
 bwxOntUq1iXbTW1ocj5MvMWSWY/E
X-Google-Smtp-Source: APXvYqyaMJAeFMGcQZd3rzE3FVjM/RF4Tvkv/vVbsM0D5CIn4rHYFLKecwmeYKRTqtAHPieIEUAs9Q==
X-Received: by 2002:a0c:e0c1:: with SMTP id x1mr20124729qvk.232.1566426280312; 
 Wed, 21 Aug 2019 15:24:40 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 33/37] drm/amd/powerplay: Disable renoir smu feature retrive
 for the moment
Date: Wed, 21 Aug 2019 17:23:55 -0500
Message-Id: <20190821222359.13578-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9duxz4GytudChsDJ42DfcUQhMwWYdgeKqh0VW4/VNoE=;
 b=Owqm9CTZKLkyMrmJEQBOOW4vI5O1Elfxq+ca3SQfRgkjqIXb4LrUQq3P0G8FLqitq9
 kPje4OgZqTZUkZwN9I9hz1vUUDnJ66Evf8/m4v55TEXkMMZW6nTqOnaEKB97dV/aR3cp
 PG/81KXFeOJkXRYDeG6CzUyuq8h8dpc8mU3ttB/MSpCulWtWBV/y9QAr//Se4IJdlH4B
 TL1BMoF90E/8rEUVZghCraO8wbrf+9GRfEwVDoZ/4/eKXJABnwEea795KZnBqcy5L6V0
 YVFBVwcenrruGyMPt8LE4gfNpqPTnamFijrXmyFLnyKi82QYZY4/nqlbBzZssgUghBic
 mEAg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpUbyBhdm9pZCB0aGUgZHBt
IGZyZXF1ZW5jZSByYW5nZSBnZXQgZmFpbGVkIHdoZW4gRFBNIGVuYWJsZWQgYW5kIGl0CndpbGwg
YmUgZW5hYmxlZCBsYXRlciBvbmNlIGhhbmRsZSB3ZWxsIHRoZSBmZWF0dXJlIGJpdCBtYXAgc3Ry
dWN0LgoKU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jCmluZGV4IDgwOGM4ZTAyYTY1MC4uNmY0MzVkNjBmZTg2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC02MzAsMTAgKzYzMCwxNCBAQCBpbnQg
c211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
dWludDY0X3QgZmVhdHVyZV9tYQogCiBpbnQgc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfZmVhdHVyZV9tYXNrIG1hc2spCiB7CisJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7CiAJc3RydWN0IHNtdV9mZWF0dXJlICpm
ZWF0dXJlID0gJnNtdS0+c211X2ZlYXR1cmU7CiAJaW50IGZlYXR1cmVfaWQ7CiAJaW50IHJldCA9
IDA7CiAKKwlpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKQorCQlyZXR1cm4gMDsKKwogCWZl
YXR1cmVfaWQgPSBzbXVfZmVhdHVyZV9nZXRfaW5kZXgoc211LCBtYXNrKTsKIAlpZiAoZmVhdHVy
ZV9pZCA8IDApCiAJCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
