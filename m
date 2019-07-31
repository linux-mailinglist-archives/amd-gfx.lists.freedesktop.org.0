Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1B7CB33
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC55F6E1B4;
	Wed, 31 Jul 2019 17:58:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD906E1B6
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:46 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id 9so13841397vkw.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZWM/CJ1AHn7JGV123HdsZKJ+6kHEoxCxiItJizF0EYM=;
 b=OkzxtGFUcUi7XIMCk5Oc7AWHMAjbChUps7/WbZHSGWJAL+yM4GVlyEDFOv602wp1p/
 6NwRerODXo5R2eSJkgDDV+2ttU7MxRGUDfXGqBcbac1DYo/nDGVvTRbwIwFy+F6wZNCj
 3az0ue8yd7DPjgruJurR3jEiUqYckHqYHsrESg73DUEGQn3HiZiWaRe1Tpg0O1FmeLPF
 XDQHGDYRnFLdMO40DOoYALIfVhyWLt3RRI25WnjzUbS7okych9G69AI+6/e9cCmePx7X
 7CnIPxhH5pgGepRkf/Bfpt/UJmfBFpGw2siJtj5OFKs0s6MNcmDHIdQcmmPcefrbAkwS
 Vkjg==
X-Gm-Message-State: APjAAAU7jVU80oBgkAJJ+3wpioeXmQDo/1kNdfxC2VvtSPabgf22hzpG
 70TSGwqIGAZEnMzOklhxKbmw7/Xh
X-Google-Smtp-Source: APXvYqw2ahM+9ooTyGFc7EL55bKmQ/CWZvk8NZG5mM1iXz4Oj8mLk5Gk57s34voyGQASI9JHpadwLQ==
X-Received: by 2002:a1f:2b07:: with SMTP id r7mr49456648vkr.65.1564595925019; 
 Wed, 31 Jul 2019 10:58:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 17/26] drm/amdgpu: allow ras interrupt callback to return
 error data
Date: Wed, 31 Jul 2019 12:58:09 -0500
Message-Id: <20190731175818.20159-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZWM/CJ1AHn7JGV123HdsZKJ+6kHEoxCxiItJizF0EYM=;
 b=pUvNafaw+0ni9o4FzDro5KX4C92GZgRu4auCzIuFg+ETcGOmGmc6iFKRvnHNMqJ2/h
 tOyT/sN5p8PTcP6ISr22PdH2/E3z6T9Cbnh120HOFZ5ypl1nj+8uTF7XwJdPUGqZMl/g
 kmhaOCI54+gBMzO65mUCEKHuWhfnUkuLlo2H8BoiJ3h3OQMhQnXxsqv8q+atNXTIl7jq
 wCpRiyLYArgRnneqKs9Kd/GIjmBcg6Jl4qEf4ggL9IrqyPFRkzr2TH1hE5htSqKimGjb
 lqqwDuhUSGmq9efKsm3KfBGzYstU8m/EZlRDz9h5UR3ovzoLdIZJ2HSNha/mLeu+SPqj
 MRUQ==
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

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKYWRkIGVycm9yIGRhdGEgYXMgcGFy
YW1ldGVyIGZvciByYXMgaW50ZXJydXB0IGNiIGFuZCBwcm9jZXNzIGl0CgpTaWduZWQtb2ZmLWJ5
OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEZW5uaXMgTGkgPGRl
bm5pcy5saUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8
ICA2ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDM3ICsr
KysrKysrKysrKystLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
CmluZGV4IDE5MTRmMzdiZWU1OS4uMGVlYjg1ZDgzOTlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0xMDAzLDcgKzEwMDMsNyBAQCBzdGF0aWMgdm9pZCBhbWRn
cHVfcmFzX2ludGVycnVwdF9oYW5kbGVyKHN0cnVjdCByYXNfbWFuYWdlciAqb2JqKQogCXN0cnVj
dCByYXNfaWhfZGF0YSAqZGF0YSA9ICZvYmotPmloX2RhdGE7CiAJc3RydWN0IGFtZGdwdV9pdl9l
bnRyeSBlbnRyeTsKIAlpbnQgcmV0OwotCXN0cnVjdCByYXNfZXJyX2RhdGEgZXJyX2RhdGEgPSB7
MCwgMH07CisJc3RydWN0IHJhc19lcnJfZGF0YSBlcnJfZGF0YSA9IHswLCAwLCAwLCBOVUxMfTsK
IAogCXdoaWxlIChkYXRhLT5ycHRyICE9IGRhdGEtPndwdHIpIHsKIAkJcm1iKCk7CkBAIC0xMDE4
LDE0ICsxMDE4LDE0IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfaW50ZXJydXB0X2hhbmRsZXIo
c3RydWN0IHJhc19tYW5hZ2VyICpvYmopCiAJCSAqIGZyb20gdGhlIGNhbGxiYWNrIHRvIHVkcGF0
ZSB0aGUgZXJyb3IgdHlwZS9jb3VudCwgZXRjCiAJCSAqLwogCQlpZiAoZGF0YS0+Y2IpIHsKLQkJ
CXJldCA9IGRhdGEtPmNiKG9iai0+YWRldiwgJmVudHJ5KTsKKwkJCXJldCA9IGRhdGEtPmNiKG9i
ai0+YWRldiwgJmVycl9kYXRhLCAmZW50cnkpOwogCQkJLyogdWUgd2lsbCB0cmlnZ2VyIGFuIGlu
dGVycnVwdCwgYW5kIGluIHRoYXQgY2FzZQogCQkJICogd2UgbmVlZCBkbyBhIHJlc2V0IHRvIHJl
Y292ZXJ5IHRoZSB3aG9sZSBzeXN0ZW0uCiAJCQkgKiBCdXQgbGVhdmUgSVAgZG8gdGhhdCByZWNv
dmVyeSwgaGVyZSB3ZSBqdXN0IGRpc3BhdGNoCiAJCQkgKiB0aGUgZXJyb3IuCiAJCQkgKi8KIAkJ
CWlmIChyZXQgPT0gQU1ER1BVX1JBU19VRSkgewotCQkJCW9iai0+ZXJyX2RhdGEudWVfY291bnQr
KzsKKwkJCQlvYmotPmVycl9kYXRhLnVlX2NvdW50ICs9IGVycl9kYXRhLnVlX2NvdW50OwogCQkJ
fQogCQkJLyogTWlnaHQgbmVlZCBnZXQgY2UgY291bnQgYnkgcmVnaXN0ZXIsIGJ1dCBub3QgYWxs
IElQCiAJCQkgKiBzYXZlcyBjZSBjb3VudCwgc29tZSBJUCBqdXN0IHVzZSBvbmUgYml0IG9yIHR3
byBiaXRzCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKaW5kZXggMDkyMGRi
N2FmZjM0Li4yYzg2YTUxMzVlYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmgKQEAgLTc2LDkgKzc2LDYgQEAgc3RydWN0IHJhc19jb21tb25faWYgewogCWNoYXIgbmFt
ZVszMl07CiB9OwogCi10eXBlZGVmIGludCAoKnJhc19paF9jYikoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCi0JCXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KTsKLQogc3RydWN0IGFt
ZGdwdV9yYXMgewogCS8qIHJhcyBpbmZyYXN0cnVjdHVyZSAqLwogCS8qIGZvciByYXMgaXRzZWxm
LiAqLwpAQCAtMTA4LDIxICsxMDUsNiBAQCBzdHJ1Y3QgYW1kZ3B1X3JhcyB7CiAJdWludDMyX3Qg
ZmxhZ3M7CiB9OwogCi1zdHJ1Y3QgcmFzX2loX2RhdGEgewotCS8qIGludGVycnVwdCBib3R0b20g
aGFsZiAqLwotCXN0cnVjdCB3b3JrX3N0cnVjdCBpaF93b3JrOwotCWludCBpbnVzZTsKLQkvKiBJ
UCBjYWxsYmFjayAqLwotCXJhc19paF9jYiBjYjsKLQkvKiBmdWxsIG9mIGVudHJpZXMgKi8KLQl1
bnNpZ25lZCBjaGFyICpyaW5nOwotCXVuc2lnbmVkIGludCByaW5nX3NpemU7Ci0JdW5zaWduZWQg
aW50IGVsZW1lbnRfc2l6ZTsKLQl1bnNpZ25lZCBpbnQgYWxpZ25lZF9lbGVtZW50X3NpemU7Ci0J
dW5zaWduZWQgaW50IHJwdHI7Ci0JdW5zaWduZWQgaW50IHdwdHI7Ci19OwotCiBzdHJ1Y3QgcmFz
X2ZzX2RhdGEgewogCWNoYXIgc3lzZnNfbmFtZVszMl07CiAJY2hhciBkZWJ1Z2ZzX25hbWVbMzJd
OwpAQCAtMTQ5LDYgKzEzMSwyNSBAQCBzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgewogCWlu
dCBsYXN0X3Jlc2VydmVkOwogfTsKIAordHlwZWRlZiBpbnQgKCpyYXNfaWhfY2IpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAorCQlzdHJ1Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0YSwKKwkJ
c3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpOworCitzdHJ1Y3QgcmFzX2loX2RhdGEgewor
CS8qIGludGVycnVwdCBib3R0b20gaGFsZiAqLworCXN0cnVjdCB3b3JrX3N0cnVjdCBpaF93b3Jr
OworCWludCBpbnVzZTsKKwkvKiBJUCBjYWxsYmFjayAqLworCXJhc19paF9jYiBjYjsKKwkvKiBm
dWxsIG9mIGVudHJpZXMgKi8KKwl1bnNpZ25lZCBjaGFyICpyaW5nOworCXVuc2lnbmVkIGludCBy
aW5nX3NpemU7CisJdW5zaWduZWQgaW50IGVsZW1lbnRfc2l6ZTsKKwl1bnNpZ25lZCBpbnQgYWxp
Z25lZF9lbGVtZW50X3NpemU7CisJdW5zaWduZWQgaW50IHJwdHI7CisJdW5zaWduZWQgaW50IHdw
dHI7Cit9OworCiBzdHJ1Y3QgcmFzX21hbmFnZXIgewogCXN0cnVjdCByYXNfY29tbW9uX2lmIGhl
YWQ7CiAJLyogcmVmZXJlbmNlIGNvdW50ICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
