Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B37CB38
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608E26E2B0;
	Wed, 31 Jul 2019 17:58:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0FB6E1B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:48 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 8so27284514uaz.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEyupcNAsARWGQaomuK5XfbYw9sYe8cIBQzt6MCM0ys=;
 b=jfb//w3TFStc3AK5dw24pYhHPDBWKOAnrNS8NFiHy+8eF21EcQCYenIGaEfpBeRnzk
 BGg2RzhsRqXY8rVT1NPbW/HpfinSngXXf7FwcCwA0vfqwjx72TLfm433Sw/l1EyN08gw
 F1ps1pQL2m6JQP1ujpzCog1JdYJIL4+DRdGHC0OzvEYL7t63k1mTTNi+UbgwPL8MJE9z
 41LPzs5KelJ4YXzZu2u3cy8Q8fZ4PaYq5I7hOwWXGSDzqIlVe/zrNeR0C9y6mzM7guV/
 EEaqMUV1Ymoy9u0cCska6DlZr8hI9Q77XkdKAvojZBm4hHeaXLG0KtobYuZ/UCBOnV8s
 wJDg==
X-Gm-Message-State: APjAAAXPCs3W2FiNExFX5VukxRfcw9DVQpdBzllO+fUH9L16xFte9zez
 /VZtCtGzFt7uVQMvpRRrp9D/yoml
X-Google-Smtp-Source: APXvYqzToPahkm3qYEczxA20ArZ3vQvb0tH33rgyCNMyjJ6sodjv6EqzkS7/T6spN/UbEf5V/XT81w==
X-Received: by 2002:a9f:3871:: with SMTP id q46mr81035304uad.50.1564595926970; 
 Wed, 31 Jul 2019 10:58:46 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/26] drm/amdgpu: add check for ras error type
Date: Wed, 31 Jul 2019 12:58:11 -0500
Message-Id: <20190731175818.20159-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEyupcNAsARWGQaomuK5XfbYw9sYe8cIBQzt6MCM0ys=;
 b=jlrWBpFPTjDgt6v2eP6EKebg6ryLt5NzxTIfhqj5u+E4MKB2UZDdvddCMy80oV4vMv
 bi5c7WeIaMnHd2+IeaEw9inuTKQpBN4avCj1+H4Ftoj0OcnXsVGyY573+Ecp/e4vZ553
 CvVUFjbbD6GBtNwha5w9xbzbg0a5wP80X2SJyet+kjxtSL+ydx/zmX65yhVoyQVQHoGg
 Jyru53KsEuekSHnAR839UUZDwC1TpAzG7Rcg+XSrUWuamNfBbCQrPL81SuhY3gUGnzn6
 Hfd8MsAPr23wcADy1uFbTFJkf8WsEoej5VFuvkkuNCj2AmyE008mXtaBm3oikxgqvDC8
 atlA==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKb25seSB1ZSBhbmQgY2UgZXJyb3Jz
IGFyZSBzdXBwb3J0ZWQKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IERlbm5pcyBMaSA8ZGVubmlzLmxpQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IDBlZWI4NWQ4Mzk5ZC4uYTg3ZGViN2JlNDE0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0xNTMsOSArMTUzLDE0IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShzdHJ1Y3QgZmls
ZSAqZiwKIAkJCXJldHVybiAtRUlOVkFMOwogCiAJCWRhdGEtPmhlYWQuYmxvY2sgPSBibG9ja19p
ZDsKLQkJZGF0YS0+aGVhZC50eXBlID0gbWVtY21wKCJ1ZSIsIGVyciwgMikgPT0gMCA/Ci0JCQlB
TURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJFQ1RBQkxFIDoKLQkJCUFNREdQVV9SQVNfRVJS
T1JfX1NJTkdMRV9DT1JSRUNUQUJMRTsKKwkJLyogb25seSB1ZSBhbmQgY2UgZXJyb3JzIGFyZSBz
dXBwb3J0ZWQgKi8KKwkJaWYgKCFtZW1jbXAoInVlIiwgZXJyLCAyKSkKKwkJCWRhdGEtPmhlYWQu
dHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7CisJCWVsc2UgaWYg
KCFtZW1jbXAoImNlIiwgZXJyLCAyKSkKKwkJCWRhdGEtPmhlYWQudHlwZSA9IEFNREdQVV9SQVNf
RVJST1JfX1NJTkdMRV9DT1JSRUNUQUJMRTsKKwkJZWxzZQorCQkJcmV0dXJuIC1FSU5WQUw7CisK
IAkJZGF0YS0+b3AgPSBvcDsKIAogCQlpZiAob3AgPT0gMikgewotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
