Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD976A042
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217866E059;
	Tue, 16 Jul 2019 01:28:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091926E053
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:59 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id 44so17720021qtg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VdYW8ZZkDemoY3/4LyqybSuPOmoWQTAKZi9XWBIkM8=;
 b=ERnM8y1tT1bgAjzNhFySJCktrw4bh0d5nuMkBuEw3hPB31V6yMFUCqE4vRkzA2UrC2
 av2a5PB9nR+uMhOUViZzLLKNTeeAGkAihb9H416zIEGytkukMQ2u9B+ua8q+1LWKcO6p
 cD2w03h2pQLr6uj6GB5rrX1542B0OEPZUeuFE9QjmdLgKfCyyVip7uOuIEPZZCfa0WtK
 HBlxFynz99G+gCPzqROas1ehmpcUdIX5RR98Wn92rXaDt/YmyPDv8mXl9451Po62EL55
 kswL3ljWr854yHAMd0/yI14v6xVg8b2+hjyvnVdfRX1cyEHT9OKO1eWwm2MHpbAQRA2t
 0aTw==
X-Gm-Message-State: APjAAAVEmJagh/PhMiYrElwc5PSFSQ2To0NCeyH72EKSR6goLl1fGWlu
 lq8FgIDgLbr8P9Mvk649yB+I8ijB
X-Google-Smtp-Source: APXvYqwNoT4MhPZZ9PVP8XTV30EMevaMVYWn+sprWSZZko4vUzhpOgyiffkBnxN37UhlgXx8fzdsrg==
X-Received: by 2002:aed:3b9c:: with SMTP id r28mr20028807qte.74.1563240478028; 
 Mon, 15 Jul 2019 18:27:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 100/102] drm/amdgpu:add all VCN rings into schedule request
 queue
Date: Mon, 15 Jul 2019 20:27:39 -0500
Message-Id: <20190716012741.32036-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VdYW8ZZkDemoY3/4LyqybSuPOmoWQTAKZi9XWBIkM8=;
 b=Q0yIt8KjAmc6ENAHvrPKTCFlKrDKmSFJWkefzQZORQxvYRR4HYro0T3jsiXM/23TRa
 5J/hJgvC+WVBKt1YT5g7vzuoNihdvdh1bDniBUIVLJDi7QM2CDsMTgxknqe9/gGo4OFi
 Kkq95Z8D9fu2Q3V+gx7oakPAITjW8XymlKDMLLyScRXPE/R82r+UNoWXqGABg5YV+IFf
 uG6gSnRUncJkwejOZiDKYTAxaXunXTpkx7vyGqRvWR7TRHv6rY2dwPEF0RwI5CrQlzxw
 TEkwk5i6VoJyyIMVQ+y34ZKR68qhf4Lclt5s9Kwems0Dqjoa6iv69vjM8Dbb9i1x7oe3
 fIlA==
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
 Boyuan Zhang <boyuan.zhang@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCkFkZCBhbGwgVkNOIGluc3RhbmNl
cycgZGVjb2RlL2VuY29kZS9qcGVnIGRlY29kZSByaW5ncyBpbnRvCmRybV9zY2hlZF9ycSBsaXN0
LgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEJveXVhbiBaaGFuZyA8
Ym95dWFuLnpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3R4LmMgfCAyNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3R4LmMKaW5kZXggODZjYzMwOTJhNWUxLi5iN2I0Y2ZhMjU2ZjEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKQEAgLTc1LDcgKzc1LDcgQEAgc3RhdGlj
IGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkgICBz
dHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4KQogewogCXVuc2lnbmVkIG51bV9lbnRpdGllcyA9IGFtZGdw
dXRfY3R4X3RvdGFsX251bV9lbnRpdGllcygpOwotCXVuc2lnbmVkIGksIGo7CisJdW5zaWduZWQg
aSwgaiwgazsKIAlpbnQgcjsKIAogCWlmIChwcmlvcml0eSA8IDAgfHwgcHJpb3JpdHkgPj0gRFJN
X1NDSEVEX1BSSU9SSVRZX01BWCkKQEAgLTEyNCw3ICsxMjQsNyBAQCBzdGF0aWMgaW50IGFtZGdw
dV9jdHhfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlmb3IgKGkgPSAwOyBpIDwg
QU1ER1BVX0hXX0lQX05VTTsgKytpKSB7CiAJCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZ3NbQU1E
R1BVX01BWF9SSU5HU107CiAJCXN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxc1tBTURHUFVfTUFYX1JJ
TkdTXTsKLQkJdW5zaWduZWQgbnVtX3JpbmdzOworCQl1bnNpZ25lZCBudW1fcmluZ3MgPSAwOwog
CQl1bnNpZ25lZCBudW1fcnFzID0gMDsKIAogCQlzd2l0Y2ggKGkpIHsKQEAgLTE1NSwxNiArMTU1
LDI2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQkJbnVtX3JpbmdzID0gMTsKIAkJCWJyZWFrOwogCQljYXNlIEFNREdQVV9IV19JUF9W
Q05fREVDOgotCQkJcmluZ3NbMF0gPSAmYWRldi0+dmNuLmluc3RbMF0ucmluZ19kZWM7Ci0JCQlu
dW1fcmluZ3MgPSAxOworCQkJZm9yIChqID0gMDsgaiA8IGFkZXYtPnZjbi5udW1fdmNuX2luc3Q7
ICsraikgeworCQkJCWlmIChhZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBqKSkKKwkJ
CQkJY29udGludWU7CisJCQkJcmluZ3NbbnVtX3JpbmdzKytdID0gJmFkZXYtPnZjbi5pbnN0W2pd
LnJpbmdfZGVjOworCQkJfQogCQkJYnJlYWs7CiAJCWNhc2UgQU1ER1BVX0hXX0lQX1ZDTl9FTkM6
Ci0JCQlyaW5nc1swXSA9ICZhZGV2LT52Y24uaW5zdFswXS5yaW5nX2VuY1swXTsKLQkJCW51bV9y
aW5ncyA9IDE7CisJCQlmb3IgKGogPSAwOyBqIDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytq
KSB7CisJCQkJaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8IGopKQorCQkJCQlj
b250aW51ZTsKKwkJCQlmb3IgKGsgPSAwOyBrIDwgYWRldi0+dmNuLm51bV9lbmNfcmluZ3M7ICsr
aykKKwkJCQkJcmluZ3NbbnVtX3JpbmdzKytdID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5j
W2tdOworCQkJfQogCQkJYnJlYWs7CiAJCWNhc2UgQU1ER1BVX0hXX0lQX1ZDTl9KUEVHOgotCQkJ
cmluZ3NbMF0gPSAmYWRldi0+dmNuLmluc3RbMF0ucmluZ19qcGVnOwotCQkJbnVtX3JpbmdzID0g
MTsKKwkJCWZvciAoaiA9IDA7IGogPCBhZGV2LT52Y24ubnVtX3Zjbl9pbnN0OyArK2opIHsKKwkJ
CQlpZiAoYWRldi0+dmNuLmhhcnZlc3RfY29uZmlnICYgKDEgPDwgaikpCisJCQkJCWNvbnRpbnVl
OworCQkJCXJpbmdzW251bV9yaW5ncysrXSA9ICZhZGV2LT52Y24uaW5zdFtqXS5yaW5nX2pwZWc7
CisJCQl9CiAJCQlicmVhazsKIAkJfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
