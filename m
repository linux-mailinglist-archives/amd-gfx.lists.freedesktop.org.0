Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A748E32
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B48389762;
	Mon, 17 Jun 2019 19:18:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9359C89762
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:49 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id m29so12211497qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWDiNHgYRpoUo1E7Cf8BedG2BLg2ty/5FV0R9tFruTg=;
 b=nFrW6kf2tnXRXX8QY+ClRZoNtPOsf1UZbqiOmDW5VuB27IrfhQeseuvSNDaVe6dr5m
 ndAdEvCUEbhs8TpoFWJImLPjz/MhKxbFVyDMgLp8l5bp31kICuSRzzJcajtuG14CiCzO
 HyfDoej4IWYS7gyh94kbejL7K3iLnUycstiGH/dKkiEdSO1g2dFTKIF5mZQe14yYM88T
 rJhDfiegfVx6fjs2Zd2YPNl/gf2+d9Vfep+Y/jXnRTpSoKm/TCl6DVuv3n6ezSL0eScw
 9lbJwvgitdaN7Fcx9Q/tq6NpK/dBlY1HfHXd6/KGRDXHtSELFyj+OocZAZ6RTIMkKKh8
 KiWQ==
X-Gm-Message-State: APjAAAUVqpZTPRjAl1CLspYUqAsXp2qNqXRjSlGadnAafYhkNyHBLdD/
 e0SU0c4lyC9CR8VOt5OjiySMoW0p/ZY=
X-Google-Smtp-Source: APXvYqz3sEmdtZT3z/EfXSXNE5BVV2aO32CV5Lml9Ue4sO56+ulwcKzVweI3eZDKlEXhD8SFSzQTIA==
X-Received: by 2002:ac8:28bc:: with SMTP id i57mr64173225qti.288.1560799128561; 
 Mon, 17 Jun 2019 12:18:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 113/459] drm/amdgpu: add VCN2.0 decode ring test
Date: Mon, 17 Jun 2019 14:11:14 -0500
Message-Id: <20190617191700.17899-102-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWDiNHgYRpoUo1E7Cf8BedG2BLg2ty/5FV0R9tFruTg=;
 b=JQR07hb2P3mcNMryRcq+7PZdwTBDL6i97Y/+fL4H7onqvawEi9cML1hpxeisPhc54o
 yd3r2HHbo4f9uxMffP4lPZApyE8mqO8/DGQ6U9jvBn2ndYjrRTuWzVzuB+J4Lbhh0i2J
 MRLpwCi3cBXS+czyhWdNmE+3RhUMjmIGwT77qUXXrPUPGLXAasx4T+dllbQqCjCW7hfA
 7ZdKfOlYIRIMNy5YHovWJNFEVQ6SjZNQVjmGh3iuGor+RRWqYRlSV5tECTNQX4erZAYr
 b4GKVOodihO7XVUPXEFyxGY7STucd+5JJE+XzWSqcgT0h3lo9VKNffD+WI+YSia1XNUq
 8SAg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWRkIGludGVybmFsIHJlZ2lzdGVyIG9m
ZnNldCBmb3IgcmVnaXN0ZXJzIGludm9sdmluZyBpbiByaW5nIHRlc3RzCgpTaWduZWQtb2ZmLWJ5
OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNuLmMgfCA4ICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmNuLmggfCA1ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5j
ICAgfCAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCA4ZWNlNDI3
YjYwMTkuLjVkYmQ5NzViYWMwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y24uYwpAQCAtMzEyLDE3ICszMTIsMTUgQEAgaW50IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9y
aW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAl1bnNpZ25lZCBpOwogCWludCByOwogCi0J
V1JFRzMyKFNPQzE1X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9TQ1JBVENIOSksIDB4Q0FGRURF
QUQpOworCVdSRUczMihhZGV2LT52Y24uZXh0ZXJuYWwuc2NyYXRjaDksIDB4Q0FGRURFQUQpOwog
CXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAzKTsKIAlpZiAocikKIAkJcmV0dXJuIHI7Ci0K
LQlhbWRncHVfcmluZ193cml0ZShyaW5nLAotCQlQQUNLRVQwKFNPQzE1X1JFR19PRkZTRVQoVVZE
LCAwLCBtbVVWRF9TQ1JBVENIOSksIDApKTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNL
RVQwKGFkZXYtPnZjbi5pbnRlcm5hbC5zY3JhdGNoOSwgMCkpOwogCWFtZGdwdV9yaW5nX3dyaXRl
KHJpbmcsIDB4REVBREJFRUYpOwogCWFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsKIAlmb3IgKGkg
PSAwOyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsKLQkJdG1wID0gUlJFRzMyKFNPQzE1
X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9TQ1JBVENIOSkpOworCQl0bXAgPSBSUkVHMzIoYWRl
di0+dmNuLmV4dGVybmFsLnNjcmF0Y2g5KTsKIAkJaWYgKHRtcCA9PSAweERFQURCRUVGKQogCQkJ
YnJlYWs7CiAJCURSTV9VREVMQVkoMSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmNuLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmgKaW5kZXggYTFlZTE5MjUxYWFlLi5iODBmYzEzOWViN2IgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKQEAgLTg3LDYgKzg3LDEwIEBAIHN0cnVjdCBkcGdfcGF1
c2Vfc3RhdGUgewogCWVudW0gaW50ZXJuYWxfZHBnX3N0YXRlIGpwZWc7CiB9OwogCitzdHJ1Y3Qg
YW1kZ3B1X3Zjbl9yZWd7CisJdW5zaWduZWQJc2NyYXRjaDk7Cit9OworCiBzdHJ1Y3QgYW1kZ3B1
X3ZjbiB7CiAJc3RydWN0IGFtZGdwdV9ibwkqdmNwdV9ibzsKIAl2b2lkCQkJKmNwdV9hZGRyOwpA
QCAtMTAyLDYgKzEwNiw3IEBAIHN0cnVjdCBhbWRncHVfdmNuIHsKIAl1bnNpZ25lZAkJbnVtX2Vu
Y19yaW5nczsKIAllbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0ZSBjdXJfc3RhdGU7CiAJc3RydWN0
IGRwZ19wYXVzZV9zdGF0ZSBwYXVzZV9zdGF0ZTsKKwlzdHJ1Y3QgYW1kZ3B1X3Zjbl9yZWcJaW50
ZXJuYWwsIGV4dGVybmFsOwogCWludCAoKnBhdXNlX2RwZ19tb2RlKShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJc3RydWN0IGRwZ19wYXVzZV9zdGF0ZSAqbmV3X3N0YXRlKTsKIH07CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwppbmRleCBiYjQ3ZjViMjRiZTUuLmJhYjkw
MDY1M2EwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCkBAIC0xMjgsNiAr
MTI4LDkgQEAgc3RhdGljIGludCB2Y25fdjFfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlpZiAo
cikKIAkJcmV0dXJuIHI7CiAKKwlhZGV2LT52Y24uaW50ZXJuYWwuc2NyYXRjaDkgPSBhZGV2LT52
Y24uZXh0ZXJuYWwuc2NyYXRjaDkgPQorCQlTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgMCwgbW1VVkRf
U0NSQVRDSDkpOworCiAJZm9yIChpID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyAr
K2kpIHsKIAkJcmluZyA9ICZhZGV2LT52Y24ucmluZ19lbmNbaV07CiAJCXNwcmludGYocmluZy0+
bmFtZSwgInZjbl9lbmMlZCIsIGkpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
