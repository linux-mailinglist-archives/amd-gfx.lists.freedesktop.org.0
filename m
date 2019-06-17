Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193F48FDD
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028D289DB0;
	Mon, 17 Jun 2019 19:46:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC5989DA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:06 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id a15so12282968qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksS+StS2R7zDJyNle/nqvHFLTmbyrWtdafQIpbkNZ04=;
 b=NS7XJAl6JpzxMdaTECV8jgt2WimAaLmscKaJCaWRAN8D+7OBXkfCXRDvwK0snCj8VT
 g/5Mwoo7AAs5udTz/e3yYqCJfYZekPkhHKHJv7v/YwkNFyb6fOZpshcBkgpoaKGTY7hW
 rO3eVg6/wWRx4s1UnxXVkD018gRJGa2+ReGlSTzOQ46pFrtL0SIJjE4zlromwWXDhMzy
 l7NVaQDJMIrgUsy5WmqI57HkwjzFtAOu8ExXW1X/YITS/H3MihrbYR9Nk0QmZ1LUXvzf
 LP4DvAhUTvF6SHz5mZzVt2WMpmhW3xKvItjusIIiDetoM6UURWX/+xEic+7H9gxFBANJ
 rHfQ==
X-Gm-Message-State: APjAAAX4QOeJUEZaZlZE0lFqi6DlH99lAw6lgJdYqMSPPn9EWo5/uF85
 gr5iaIbhxzhWWaPQ7uoihXD0PfSKx0o=
X-Google-Smtp-Source: APXvYqwyyyCTOTADqdzBxvgDdoAAnDl2WwAEsNnoUq9tqxLOLQ8zjy4SzgGx3/4RxbQBCKy/wwn2iQ==
X-Received: by 2002:ac8:234a:: with SMTP id b10mr41107459qtb.261.1560800765864; 
 Mon, 17 Jun 2019 12:46:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 316/459] drm/amd/display: Add DCN2 and NV ASIC ID
Date: Mon, 17 Jun 2019 14:44:17 -0500
Message-Id: <20190617194540.18497-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksS+StS2R7zDJyNle/nqvHFLTmbyrWtdafQIpbkNZ04=;
 b=cZVtr3XnIEvGC6CBPzyOVUgL7HSTdhwslGEJcduG22gdU9nFkJuJdRHYrXSTesdKK8
 hcu4uoMS8cNxYSJZvLs6pEIapxEc6MIZIX3zcS6UW1FyJyFZAVt1wgxv/INLqdu4i441
 VxIgeYbYG9klUCDVq/ksqANNp5AkNp+sjXdhsp5cchcYJl63Ug45mLfiKftgPal/t9eG
 LTi1YbF4F46OnrZT6E4sj/nBALd1vfAsI0ElBrZKjja9yQ8/zhwwkRSvvDy3DzfM5Wwt
 kq7iOfdBTqx7B22TABTWr8zfJ8o88SqcG1MyzFmlVsbETr9NthDjWYqjAD8O7FJYYxW5
 zWdg==
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
 Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CgpEQ04yLjAgKERp
c3BsYXkgQ29yZSBOZXh0KSBpcyB0aGUgZGlzcGxheSBibG9jayBpbiBOYXZpMTAuCgpTaWduZWQt
b2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCB8IDI1ICsrKysrKysrKysr
KysrKysrKysKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX3R5cGVzLmggICB8
ICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgKaW5kZXggYjMwMmZm
MzE4MGE0Li41Y2UxODMyYWI0MWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaApAQCAtMTQ3LDYgKzE0NywzMSBAQAogCiAjZGVmaW5l
IEZBTUlMWV9SViAxNDIgLyogRENOIDEqLwogCisjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9E
Q19EQ04yXzApCisKKyNkZWZpbmUgRkFNSUxZX05WIDE0MyAvKiBEQ04gMiovCisKK2VudW0gewor
CU5WX05BVkkxMF9QX0EwICAgICAgPSAxLAorCU5WX05BVkkxMl9QX0EwICAgICAgPSAxMCwKKwlO
Vl9OQVZJMTRfTV9BMCAgICAgID0gMjAsCisJTlZfTkFWSTIxX1BfQTAgICAgICA9IDQwLAorCU5W
X05BVkkxMF9MSVRFX1BfQTAgPSAweDgwLAorCU5WX05BVkkxMF9MSVRFX1BfQjAgPSAweDgxLAor
CU5WX05BVkkxMl9MSVRFX1BfQTAgPSAweDgyLAorCU5WX05BVkkyMV9MSVRFX1BfQTAgPSAweDkw
LAorCU5WX1VOS05PV04gICAgICAgICAgPSAweEZGCit9OworCisjZGVmaW5lIEFTSUNSRVZfSVNf
TkFWSTEwX1AoZUNoaXBSZXYpICAgICAgICAoZUNoaXBSZXYgPCBOVl9OQVZJMTJfUF9BMCkKKyNk
ZWZpbmUgQVNJQ1JFVl9JU19OQVZJMTJfUChlQ2hpcFJldikgICAgICAgICgoZUNoaXBSZXYgPj0g
TlZfTkFWSTEyX1BfQTApICYmIChlQ2hpcFJldiA8IE5WX05BVkkxNF9NX0EwKSkKKyNkZWZpbmUg
QVNJQ1JFVl9JU19OQVZJMTRfTShlQ2hpcFJldikgICAgICAgICgoZUNoaXBSZXYgPj0gTlZfTkFW
STE0X01fQTApICYmIChlQ2hpcFJldiA8IE5WX05BVkkyMV9QX0EwKSkKKyNkZWZpbmUgQVNJQ1JF
Vl9JU19OQVZJMjFfTShlQ2hpcFJldikgICAgICAgICgoZUNoaXBSZXYgPj0gTlZfTkFWSTIxX1Bf
QTApICYmIChlQ2hpcFJldiA8IE5WX05BVkkxMF9MSVRFX1BfQTApKQorI2RlZmluZSBBU0lDUkVW
X0lTX05BVkkxMF9MSVRFX1AoZUNoaXBSZXYpICAgKChlQ2hpcFJldiA+PSBOVl9OQVZJMTBfTElU
RV9QX0EwKSAmJiAoZUNoaXBSZXYgPCBOVl9OQVZJMTJfTElURV9QX0EwKSkKKyNkZWZpbmUgQVNJ
Q1JFVl9JU19OQVZJMTJfTElURV9QKGVDaGlwUmV2KSAgICgoZUNoaXBSZXYgPj0gTlZfTkFWSTEy
X0xJVEVfUF9BMCkgJiYgKGVDaGlwUmV2IDwgTlZfTkFWSTIxX0xJVEVfUF9BMCkpCisjZGVmaW5l
IEFTSUNSRVZfSVNfTkFWSTIxX0xJVEVfUChlQ2hpcFJldikgICAoKGVDaGlwUmV2ID49IE5WX05B
VkkyMV9MSVRFX1BfQTApICYmIChlQ2hpcFJldiA8IE5WX1VOS05PV04pKQorI2VuZGlmCisKIC8q
CiAgKiBBU0lDIGNoaXAgSUQKICAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2luY2x1ZGUvZGFsX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
aW5jbHVkZS9kYWxfdHlwZXMuaAppbmRleCBkYWJkYmMwOTk5ZDQuLjFlM2NlNGQ4NDdhZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX3R5cGVzLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX3R5cGVzLmgKQEAg
LTQ2LDYgKzQ2LDkgQEAgZW51bSBkY2VfdmVyc2lvbiB7CiAJRENFX1ZFUlNJT05fTUFYLAogCURD
Tl9WRVJTSU9OXzFfMCwKIAlEQ05fVkVSU0lPTl8xXzAxLAorI2lmIGRlZmluZWQoQ09ORklHX0RS
TV9BTURfRENfRENOMl8wKQorCURDTl9WRVJTSU9OXzJfMCwKKyNlbmRpZgogCURDTl9WRVJTSU9O
X01BWAogfTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
