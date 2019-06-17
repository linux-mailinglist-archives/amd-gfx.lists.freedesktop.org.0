Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BC48EE2
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA23E89A32;
	Mon, 17 Jun 2019 19:28:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CABA89A75
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:18 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b18so6929095qkc.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K9f5fPBHcGEc4MD2vQWxNjkJpxzrEf52Z3nHk0U74GE=;
 b=G0odzY8uaJV0huixOgR1sQRk7b1Q5IadUUs92hiYYLUbU79hzgdZ/yGkkGmVpudYDQ
 8kXeqjsrEhl4YGRwidrRr/lTzCCpDAvXWAnj+Y7EPQ8JBDaUayjO4Pd0IvhTo1sgLq8i
 Ez8fGy5T45MSfw74pQOUZoX38WgiVXt+gehiTXDVfl3AF5yKyqhQXcbuRmjGI/iPBWyQ
 vbGV81y/3Ne7cetRHO9C3quoQr1tf9HRnPL0HFs68pjRfy1WNAeIzad0FeYn+WTaW4r4
 +UddggLwN++GMvFauTo+7l8u9Stt2UqqPkg3WRsTLQfTx49T2qUmnh0DF2oUN/HF8e2k
 TMFg==
X-Gm-Message-State: APjAAAXq7+AFO8fJxpWIv2WxsP0yXgGlXk0DvhZkhan+rrKycW12qM+4
 1g47gwrPQvYmO7vvMP+HuOyhAxoToCY=
X-Google-Smtp-Source: APXvYqy0WC/UBkbTxOIMKHImoYAyGKit/O32GvPj4IRZNFqhHFd5dHYzNtbwA50k1F/Do1yR6pBvww==
X-Received: by 2002:a05:620a:1329:: with SMTP id
 p9mr23081177qkj.224.1560799696853; 
 Mon, 17 Jun 2019 12:28:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 169/459] drm/amd/powerplay: gfxoff-seperate the Vega20 case
Date: Mon, 17 Jun 2019 14:26:34 -0500
Message-Id: <20190617192704.18038-70-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K9f5fPBHcGEc4MD2vQWxNjkJpxzrEf52Z3nHk0U74GE=;
 b=gVX/HGQsyS2TP3kWZcmiw9zrNsAu3R15CeVwnuguVx9hFBJqCv//IMVzM8Veiz6gWm
 JpdLYarBK//AzgV9xp6zycAFpQ97HYGL9B2UFwy71a5sUzvuq1NEQ81Fjt1P6H13i7Ke
 kLWNnJhLZBgjScmsfFvTbRSMY2shRJiOk6StAcA7KNYZrD1sRbs1PjWgWZ3f+r1kmpXv
 H81paNiKPzmwZPz+lhhuDE0KPuLBVqo+hUMNnB88Ew92BG3nYZx5n8O9hIajhUfSOgDC
 lT1Mt00CX8ZfKn7e8FiB0L5uFI0LxowXEUoYh7Fdgr0gL6ZdGGOvdsneg7cqs9ZJ9BNd
 ntVw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCnNlcGVyYXRlIHRoZSBW
ZWdhMjAgY2FzZSBmcm9tIG5hdmkxMCBmb3IgZ2Z4b2ZmIHNvIHRoYXQgZ2Z4b2ZmCndvbid0IGJl
IGFsbG93ZWQgb24gVmVnYTIwCgpTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGgu
ZmVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMjMgKysrKysr
KysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5k
ZXggZTE4NDE2NTE2OTNhLi5kMDAxOWI4YTY4ZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0xNTUwLDEzICsxNTUwLDI0IEBAIHNtdV92MTFfMF9zZXRf
d2F0ZXJtYXJrc19mb3JfY2xvY2tfcmFuZ2VzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1
Y3QKIHN0YXRpYyBpbnQgc211X3YxMV8wX2dmeF9vZmZfY29udHJvbChzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgYm9vbCBlbmFibGUpCiB7CiAJaW50IHJldCA9IDA7CisJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7CiAKLQltdXRleF9sb2NrKCZzbXUtPm11dGV4KTsKLQlp
ZiAoZW5hYmxlKQotCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19BbGxvd0dm
eE9mZik7Ci0JZWxzZQotCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19EaXNh
bGxvd0dmeE9mZik7Ci0JbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsKKwlzd2l0Y2ggKGFkZXYt
PmFzaWNfdHlwZSkgeworCWNhc2UgQ0hJUF9WRUdBMjA6CisJCWJyZWFrOworCWNhc2UgQ0hJUF9O
QVZJMTA6CisJCWlmICghKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykpCisJ
CQlyZXR1cm4gMDsKKwkJbXV0ZXhfbG9jaygmc211LT5tdXRleCk7CisJCWlmIChlbmFibGUpCisJ
CQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19BbGxvd0dmeE9mZik7CisJCWVs
c2UKKwkJCXJldCA9IHNtdV9zZW5kX3NtY19tc2coc211LCBTTVVfTVNHX0Rpc2FsbG93R2Z4T2Zm
KTsKKwkJbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJ
YnJlYWs7CisJfQogCiAJcmV0dXJuIHJldDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
