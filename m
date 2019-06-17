Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FE748EC2
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7FC8995F;
	Mon, 17 Jun 2019 19:27:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2489389930
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:48 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so6981240qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mqWwXjm8CTU8+WcfV/QwWN88l93OZeB4EeD5CImNPBE=;
 b=tFiWMt9rbcYar5UqcViohS/wCGaLhBYHufuCnDDkIl01LIW3UaZrmcY51/RJ1Zgy1b
 tqyUEEiwzXIaW4mkc+Fi3wOQH5sXzv35wFf2xW7Pw/bwydbZpWj4p26+f9e8TedABxaq
 ukOBfFqcg0vNw4THWLm96qD9tTBAd0VS/N7ZXBpsmv64ZEj52M9KGI9OgJeVm/533wQl
 Dc7YwfmeYhuB3tcmmQuom+7oAKSkRqgjmyrS3FNt82Jr3KoWL/v2vs0pph0iVXqGpXqz
 OqKSDJUDBMNqvY9m919Y+ZqtIZF4JyYr724OeWtCHXXOh0EHlGeu9fb3RovwOXyxaSwT
 onLA==
X-Gm-Message-State: APjAAAW/dxrYUIwDXi9LjuMMhjRt+JuK+jAuTGgbK1sFuWKuoRq+LxVH
 4wnMFam0sR39bVQ3yhmnDgucz8u1ynE=
X-Google-Smtp-Source: APXvYqyeMqBHeiGAIWyU7IW9tM/X2ris+rnFwG6e8D4MQznj0jbadZMMKflMfu6fIClT1GpyoCmqOA==
X-Received: by 2002:a37:dc45:: with SMTP id v66mr32467414qki.24.1560799667035; 
 Mon, 17 Jun 2019 12:27:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 135/459] drm/amdkfd: Introduce XGMI SDMA queue type for gfx10
Date: Mon, 17 Jun 2019 14:26:00 -0500
Message-Id: <20190617192704.18038-36-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mqWwXjm8CTU8+WcfV/QwWN88l93OZeB4EeD5CImNPBE=;
 b=T933hy/QZueZJnFk7UvV4uC73iCIzUG1Z5AHReljaEZR3hVEQDElwqTmYeGxDL9z3K
 xi0SSyELCaXmqP7ZzmkPBcsqeZ4D0GkO48bzZQV/HBjHVsxFILoeHmHsKgDdb/M1IRcc
 AnDov16UxeRBXr1QkmB1mnSjPEUPgfqYwxQF2tyiOM02bNaniOfEIdNuVHsI3kmwOFsW
 V7DG4dJllCjouj5MCngOSA/ibQxZgT8K3Py9iZNHVAf1EY/ToyVEVxY5vwM4pKGn548o
 u8EBUzRnSqYF62gwA5Hgk66PNQSJNL5GhB4jOjWFtTkIAmhYxBCL4xAdDA9vjKPGvd3I
 rrfQ==
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

RXhpc3RpbmcgUVVFVUVfVFlQRV9TRE1BIG1lYW5zIFBDSWUgb3B0aW1pemVkIFNETUEgcXVldWVz
LgpJbnRyb2R1Y2UgYSBuZXcgUVVFVUVfVFlQRV9TRE1BX1hHTUksIHdoaWNoIGlzIG9wdGltaXpl
ZApmb3Igbm9uLVBDSWUgdHJhbnNmZXIgc3VjaCBhcyBYR01JLgoKU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjEwLmMgfCAyICsrCiAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
YwppbmRleCA3NWE5NTI3OWMxNzguLmM3ZmMwMTEyNjRmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtMzMwLDYgKzMzMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMF9kZXZpY2VfaW5mbyA9IHsKIAkuc3VwcG9ydHNfY3dz
ciA9IHRydWUsCiAJLm5lZWRzX3BjaV9hdG9taWNzID0gZmFsc2UsCiAJLm51bV9zZG1hX2VuZ2lu
ZXMgPSAyLAorCS5udW1feGdtaV9zZG1hX2VuZ2luZXMgPSAwLAogCS5udW1fc2RtYV9xdWV1ZXNf
cGVyX2VuZ2luZSA9IDgsCiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3YxMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2tlcm5lbF9xdWV1ZV92MTAuYwppbmRleCAyMDlhZDUxOGZiYTEuLjI2MTUzYzUxNDkzYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92
MTAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3Yx
MC5jCkBAIC0xODEsNiArMTgxLDcgQEAgc3RhdGljIGludCBwbV9tYXBfcXVldWVzX3YxMChzdHJ1
Y3QgcGFja2V0X21hbmFnZXIgKnBtLCB1aW50MzJfdCAqYnVmZmVyLAogCQkJcXVldWVfdHlwZV9f
bWVzX21hcF9xdWV1ZXNfX2RlYnVnX2ludGVyZmFjZV9xdWV1ZV92aTsKIAkJYnJlYWs7CiAJY2Fz
ZSBLRkRfUVVFVUVfVFlQRV9TRE1BOgorCWNhc2UgS0ZEX1FVRVVFX1RZUEVfU0RNQV9YR01JOgog
CQlwYWNrZXQtPmJpdGZpZWxkczIuZW5naW5lX3NlbCA9IHEtPnByb3BlcnRpZXMuc2RtYV9lbmdp
bmVfaWQgKwogCQkJCWVuZ2luZV9zZWxfX21lc19tYXBfcXVldWVzX19zZG1hMF92aTsKIAkJdXNl
X3N0YXRpYyA9IGZhbHNlOyAvKiBubyBzdGF0aWMgcXVldWVzIHVuZGVyIFNETUEgKi8KQEAgLTIy
Nyw2ICsyMjgsNyBAQCBzdGF0aWMgaW50IHBtX3VubWFwX3F1ZXVlc192MTAoc3RydWN0IHBhY2tl
dF9tYW5hZ2VyICpwbSwgdWludDMyX3QgKmJ1ZmZlciwKIAkJCWVuZ2luZV9zZWxfX21lc191bm1h
cF9xdWV1ZXNfX2NvbXB1dGU7CiAJCWJyZWFrOwogCWNhc2UgS0ZEX1FVRVVFX1RZUEVfU0RNQToK
KwljYXNlIEtGRF9RVUVVRV9UWVBFX1NETUFfWEdNSToKIAkJcGFja2V0LT5iaXRmaWVsZHMyLmVu
Z2luZV9zZWwgPQogCQkJZW5naW5lX3NlbF9fbWVzX3VubWFwX3F1ZXVlc19fc2RtYTAgKyBzZG1h
X2VuZ2luZTsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
