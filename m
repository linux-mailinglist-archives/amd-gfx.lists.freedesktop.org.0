Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9348E33
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D76C897C5;
	Mon, 17 Jun 2019 19:18:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CA6897C5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so12159045qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lr51uVczjGh/lkhrLy9LlsterywR6rXAQ+H+qFz3DYQ=;
 b=tv2zxHbuUgjuhkrQkBnCVYFFWAw2qGdZtnH6SKtrYKPlXjexmeonrpfzuAd10WlxYZ
 bgmhz/gafdOy8phW3Y5UAUSgoIb55CZXWazZvlo/wPJzxV+Se/iPT7MaIfnZ67Z6eVbp
 h6RnrPg6BMe8jO9n+qQg/jZiK5FJrYR/MSXCPgvk7v37QMfhNAsQTCuY3baRwzsALLD4
 //17ZjvTYSAO4Rdo4wBljBvC1Q/LWg9gPJF7SfM6NCfOcfBmjpi9k975R0jeV1EQRDCw
 JRfNHCc7RycAfmhdp7xtL31orlqP/6fL2E2Lztfo1rXgXihxZeq6cmc2wWawqv84/2kM
 kMlg==
X-Gm-Message-State: APjAAAVlVaoPAZpqq23PKX4seyNiI+VpwGMk0istXV4O0kUzmXxKdb1V
 BwVS+FbnHfytD1bjdL1mjtwFecL4HWg=
X-Google-Smtp-Source: APXvYqweNAM2EwmoNYOOb1FurJL+Fe0VXmeTJ5GjOwhynICK9u1X9DqWvq7Vu3kL2qPGQRxBKrA+0w==
X-Received: by 2002:a0c:add8:: with SMTP id x24mr23398210qvc.167.1560799130274; 
 Mon, 17 Jun 2019 12:18:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 115/459] drm/amdgpu: add JPEG2.0 decode ring test
Date: Mon, 17 Jun 2019 14:11:16 -0500
Message-Id: <20190617191700.17899-104-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lr51uVczjGh/lkhrLy9LlsterywR6rXAQ+H+qFz3DYQ=;
 b=aUn4cCRjZkRkBK9dm6BOgEKEaTxc2/Go6o8PIKQ+ZFNW1uHfhuv4940ouhC86E135i
 bqoxi8CvxXCnGiyzYAnUE7z6aZ7TG5jSemgYyXt60lP3s1lKo7SK8wkKJxiX9UoYFnwT
 aweyvkRRjOhazDP7AhuihZUYZE9ZIwyWv6+1bELPF3Kprz3W1acEzrzcpmo7n5lO+0WE
 //JPQ8lmIXpWgk2ZlWFGis4Wvzx3qyxYHxagDjkqklrvz2ng7/cGipKuR5ruUz8IeaoH
 ZpzpU09OJeRYTNBG/0x/GB6tN/mouaNpQiFSj3yHG+/I4SQDBpFpogd+b4ITDzpkiel9
 YvvQ==
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

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKVXNlIHJlZ2lzdGVyIGZyb20gSlBFRyB0
aWxlLCB0aGUgVVZEIHRpbGUgcmVnIHdvbid0IHdvcmsgZm9yIEpQRUcKClNpZ25lZC1vZmYtYnk6
IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92Y24uYyB8IDggKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y24uaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYyAgIHwg
MiArKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCmluZGV4IDFkNTc1ZTJlNzAxYi4u
ZWYyYjdhOTM1NmVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmNuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCkBA
IC02MzEsMTkgKzYzMSwxNyBAQCBpbnQgYW1kZ3B1X3Zjbl9qcGVnX3JpbmdfdGVzdF9yaW5nKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAl1bnNpZ25lZCBpOwogCWludCByOwogCi0JV1JFRzMy
KFNPQzE1X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9TQ1JBVENIOSksIDB4Q0FGRURFQUQpOwor
CVdSRUczMihhZGV2LT52Y24uZXh0ZXJuYWwuanBlZ19waXRjaCwgMHhDQUZFREVBRCk7CiAJciA9
IGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIDMpOwotCiAJaWYgKHIpCiAJCXJldHVybiByOwogCi0J
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywKLQkJUEFDS0VUSihTT0MxNV9SRUdfT0ZGU0VUKFVWRCwg
MCwgbW1VVkRfU0NSQVRDSDkpLCAwLCAwLCAwKSk7CisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywg
UEFDS0VUMChhZGV2LT52Y24uaW50ZXJuYWwuanBlZ19waXRjaCwgMCkpOwogCWFtZGdwdV9yaW5n
X3dyaXRlKHJpbmcsIDB4REVBREJFRUYpOwogCWFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsKIAog
CWZvciAoaSA9IDA7IGkgPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGkrKykgewotCQl0bXAgPSBSUkVH
MzIoU09DMTVfUkVHX09GRlNFVChVVkQsIDAsIG1tVVZEX1NDUkFUQ0g5KSk7CisJCXRtcCA9IFJS
RUczMihhZGV2LT52Y24uZXh0ZXJuYWwuanBlZ19waXRjaCk7CiAJCWlmICh0bXAgPT0gMHhERUFE
QkVFRikKIAkJCWJyZWFrOwogCQlEUk1fVURFTEFZKDEpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5oCmluZGV4IGIxNDY1NWEwZTFkYi4uY2M5NDg0MWYyZjA2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCkBAIC05Myw2ICs5Myw3IEBAIHN0cnVj
dCBhbWRncHVfdmNuX3JlZ3sKIAl1bnNpZ25lZAljbWQ7CiAJdW5zaWduZWQJbm9wOwogCXVuc2ln
bmVkCXNjcmF0Y2g5OworCXVuc2lnbmVkCWpwZWdfcGl0Y2g7CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1
X3ZjbiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwppbmRleCAyYTJjNDBjZjMy
YzguLjg1NWIxZjk2MDllNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YxXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCkBA
IC0xNTQsNiArMTU0LDggQEAgc3RhdGljIGludCB2Y25fdjFfMF9zd19pbml0KHZvaWQgKmhhbmRs
ZSkKIAkJcmV0dXJuIHI7CiAKIAlhZGV2LT52Y24ucGF1c2VfZHBnX21vZGUgPSB2Y25fdjFfMF9w
YXVzZV9kcGdfbW9kZTsKKwlhZGV2LT52Y24uaW50ZXJuYWwuanBlZ19waXRjaCA9IGFkZXYtPnZj
bi5leHRlcm5hbC5qcGVnX3BpdGNoID0KKwkJU09DMTVfUkVHX09GRlNFVChVVkQsIDAsIG1tVVZE
X0pQRUdfUElUQ0gpOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
