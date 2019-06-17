Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBF48F42
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29F489BB3;
	Mon, 17 Jun 2019 19:31:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5F989B9F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:25 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so12183787qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpj7gVXEaCy5koBRHucYtBGsxjasQ001aVXD9bGQ8YA=;
 b=Vy7fO/WSEdgDaNkuYyef0uXkUoHefV3mKQEfdQjKpinvw8PohI2P4WHKBmfcqHlu1U
 BPqQ6dMjK3hrGIr4vKWD5yDgnHknhC8l0C6107SMmY/BwPfw6j5E0D4B9arnVb/dak/7
 5o5eGrgdMe0jC9fQCAg5akpaniURte+0yr9iUkGzoQtHxmMPYDCc1DzOBMD5E+mMACei
 ZZUTrELxiS7xbxtTNaro4cC6pgs0ZAnTfM1JFbsBUFxXos1bBRPdL2JovEhGjG8UaYas
 tKO/v7dDfjkKfjQafynO9KN55AAeCrnfk1WSLHPA3q59CXcOJDwkZoozE2ssInnMuX8y
 kGag==
X-Gm-Message-State: APjAAAU3s28VE3WEPOye9PIjXi8WT4p/KqHio9mT/8y+OaWIlF1ECOdi
 5RCkjDBVd6xJCUulUzh5RQD6wCuvicY=
X-Google-Smtp-Source: APXvYqz/vvnDUdYZtdjjPgGGfprXuL8bh2yZWsejpM1g+gePp20V/LWyF6g8KHk9h5f8M5wI7Kq+ew==
X-Received: by 2002:ac8:3811:: with SMTP id q17mr66233907qtb.315.1560799884878; 
 Mon, 17 Jun 2019 12:31:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 212/459] drm/amdgpu/mes10.1: upload mes data ucode to gpu
 buffer
Date: Mon, 17 Jun 2019 14:29:39 -0500
Message-Id: <20190617193106.18231-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpj7gVXEaCy5koBRHucYtBGsxjasQ001aVXD9bGQ8YA=;
 b=C7USImxSSDaxMKlr9R70khDr1KtumEU5asVpWxl9jwS9nOIujRTnhBUoUDu+gbJvSE
 GSMBmg5O9LBVp/VDFJ71R11vzLlg6SlTyEjHNbkfl81qs9pYjmZaST/s8S7k1gL2C9J6
 kprDBcl7f/6wgF4YJXzgn7Ij/1u1Ip9IbkDeXNXzVFKTM1i3Gd+NJewrr+75nuk+nzHX
 RWi88uNzjOBFemCuBWmb0UGYzKqupTDJZfJzYywYzztCc598cD6s+2r/ZzWrrcGg644d
 uk1pN+29wd5UF5GMArCa/7cLER+YvaxxqXMzbtvD+V0w5Jy4h7h8QDofxC0R+DRsas1w
 A74g==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFsbG9jYXRlIEdQVSBidWZmZXIg
YW5kIHVwbG9hZCBtZXMgZGF0YSB1Y29kZSB0byB0aGUgYnVmZmVyLgoKU2lnbmVkLW9mZi1ieTog
SmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcg
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21l
c192MTBfMS5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbWVzX3YxMF8xLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuYwpp
bmRleCBhMTliMjYxNmQ0NDYuLjc2NDk2N2IyMGM0MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbWVzX3YxMF8xLmMKQEAgLTEzNyw2ICsxMzcsMzggQEAgc3RhdGljIGludCBtZXNfdjEwXzFf
YWxsb2NhdGVfdWNvZGVfYnVmZmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVy
biAwOwogfQogCitzdGF0aWMgaW50IG1lc192MTBfMV9hbGxvY2F0ZV91Y29kZV9kYXRhX2J1ZmZl
cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlpbnQgcjsKKwljb25zdCBzdHJ1Y3Qg
bWVzX2Zpcm13YXJlX2hlYWRlcl92MV8wICptZXNfaGRyOworCWNvbnN0IF9fbGUzMiAqZndfZGF0
YTsKKwl1bnNpZ25lZCBmd19zaXplOworCisJbWVzX2hkciA9IChjb25zdCBzdHJ1Y3QgbWVzX2Zp
cm13YXJlX2hlYWRlcl92MV8wICopCisJCWFkZXYtPm1lcy5mdy0+ZGF0YTsKKworCWZ3X2RhdGEg
PSAoY29uc3QgX19sZTMyICopKGFkZXYtPm1lcy5mdy0+ZGF0YSArCisJCSAgIGxlMzJfdG9fY3B1
KG1lc19oZHItPm1lc191Y29kZV9kYXRhX29mZnNldF9ieXRlcykpOworCWZ3X3NpemUgPSBsZTMy
X3RvX2NwdShtZXNfaGRyLT5tZXNfdWNvZGVfZGF0YV9zaXplX2J5dGVzKTsKKworCXIgPSBhbWRn
cHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIGZ3X3NpemUsCisJCQkJICAgICAgNjQgKiAxMDI0
LCBBTURHUFVfR0VNX0RPTUFJTl9HVFQsCisJCQkJICAgICAgJmFkZXYtPm1lcy5kYXRhX2Z3X29i
aiwKKwkJCQkgICAgICAmYWRldi0+bWVzLmRhdGFfZndfZ3B1X2FkZHIsCisJCQkJICAgICAgKHZv
aWQgKiopJmFkZXYtPm1lcy5kYXRhX2Z3X3B0cik7CisJaWYgKHIpIHsKKwkJZGV2X2VycihhZGV2
LT5kZXYsICIoJWQpIGZhaWxlZCB0byBjcmVhdGUgbWVzIGRhdGEgZncgYm9cbiIsIHIpOworCQly
ZXR1cm4gcjsKKwl9CisKKwltZW1jcHkoYWRldi0+bWVzLmRhdGFfZndfcHRyLCBmd19kYXRhLCBm
d19zaXplKTsKKworCWFtZGdwdV9ib19rdW5tYXAoYWRldi0+bWVzLmRhdGFfZndfb2JqKTsKKwlh
bWRncHVfYm9fdW5yZXNlcnZlKGFkZXYtPm1lcy5kYXRhX2Z3X29iaik7CisKKwlyZXR1cm4gMDsK
K30KKwogc3RhdGljIGludCBtZXNfdjEwXzFfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiB7CiAJcmV0
dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
