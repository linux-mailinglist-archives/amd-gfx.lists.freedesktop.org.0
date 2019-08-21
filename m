Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2009874C
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C146EA3A;
	Wed, 21 Aug 2019 22:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0662F6EA30
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:40 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i4so5087191qtj.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kUmK5O/lYq82fOc+P18CY/fYcK5qgsrQdKLHt0Jykh8=;
 b=FAkluN4mNoGEa/ZZJ9Q8NJ687nVdJA1YoyHoDPzqT4aC6SnAWzmu/E3Mx9UvLWXoBg
 Qbw46lcWCM9Lo6doRmT1Y/LaPBtoiD2/gVZja2rWCptqbOc1uNdi9RhZVo+twVAsO6Ys
 NKPV3C45Sbz4WHK+bLE1qSa2KncgHTa4wV1ljPKoXz0crE3PEUCOCwGoLu0k2bbK5DIO
 1x7bLA7l7+zq72fxnSKIYYRhvXfbQjOv0HdhT3qgNci1rTzYJjer11c1meT+LafFq53b
 r5j4Yj1K6Mpcuu58Sv6eLM2Ja9fb2V/Gm3Kjjbgv/BIs18+dnL5QyP8cPaan2zW3Yn1U
 NhCg==
X-Gm-Message-State: APjAAAXQMJiF7MxZqMrhnuja2R8AUZ6lHy0Oa8YkuZu439pTRtBRyCpY
 gxknocAjiVGZ2pPDRR6Qq2rFOJCM
X-Google-Smtp-Source: APXvYqx3q0bLKHWPp1YIryP55m9KOE3+7+Ki32g2L8uu2eu/81qUEadxSqvIWLOHjRLVReYh8AEN0A==
X-Received: by 2002:a0c:a0c2:: with SMTP id c60mr1816103qva.10.1566426278570; 
 Wed, 21 Aug 2019 15:24:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 31/37] drm/amdgpu: enable SDMA power gating for rn
Date: Wed, 21 Aug 2019 17:23:53 -0500
Message-Id: <20190821222359.13578-32-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kUmK5O/lYq82fOc+P18CY/fYcK5qgsrQdKLHt0Jykh8=;
 b=Wh3EtAeSBK09w02k96ffwSKUsQWEDnUTuLMeAFjQL6UwoSVthVZLdODD1FFjwgeD8D
 Ir3SnvyD+pB3kTkM8YKdbhQhaIVit7GcEXxrKunD0ia2tEq4WYDcMdXUyvZQ8RsUnC1W
 1jE7RYEBvaCCY53ZbDuRdjm/DprmsKie42/2HGM9rmd1oWYzmDbxOWdmC5xkQrx4AorD
 hEJ778V8sDFeGDtB+HXorz+QgF1zNFZ+uu0BiT+QjG0IM8cPTM893I0dq+qmvrBj3NGp
 SrUIpOAo8exeqF2FXq/J+2Rn76u1MqvHpHWZKyRQLhWzaZqfiXIuA28SCuCSW89ykQnx
 T7DA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgU0RNQSBQRyBm
bGFnIGR1cmluZyBkZXZpY2UgaXAgZWFybHkgaW5pdC4KClJldmlld2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5n
IDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDZhYjQ0NGQ2YmU3Mi4uNWMyMTFm
YTAzMzI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTExNzMsNyArMTE3Myw3
IEBAIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQkJ
CSBBTURfQ0dfU1VQUE9SVF9BVEhVQl9MUyB8CiAJCQkJIEFNRF9DR19TVVBQT1JUX0FUSFVCX01H
Q0cgfAogCQkJCSBBTURfQ0dfU1VQUE9SVF9ERl9NR0NHOwotCQlhZGV2LT5wZ19mbGFncyA9IDA7
CisJCWFkZXYtPnBnX2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfU0RNQTsKIAkJYWRldi0+ZXh0ZXJu
YWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHg5MTsKIAogCQlpZiAoYWRldi0+cG0ucHBfZmVh
dHVyZSAmIFBQX0dGWE9GRl9NQVNLKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
