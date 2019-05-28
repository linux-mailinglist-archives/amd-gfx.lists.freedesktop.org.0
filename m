Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A882CBCE
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 18:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2196E225;
	Tue, 28 May 2019 16:26:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1E489F99;
 Tue, 28 May 2019 16:26:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so20905197wrr.13;
 Tue, 28 May 2019 09:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKvz55CnJ1NXcC7bw4pIoC/oaSnSalMZgCENiwdDxCk=;
 b=VdzP/9HW2zik3MSmn/Oyqhs5/dVtwW6eauYXhziBAAXPqAvPBEvdvqxbJGwbh0Fg8R
 CNYWqBCbEHwoLRFgEoZYZg5k6TkhkvC5lP6O66AWADeB6xD6W5f8Zp/m+TI3V265Uc6d
 MqfYBHFY81T8o4AhyHUuT2f22zIrZ4bF9PztxsZIeYX3YVLkuJBCi4MrfVmz/awmWtoz
 czMN7lxUHj6GCUJT22q7U3pQj1cN6TBv4PIJfb+KpJA1AviO+vuXJevwigQq0UTfy50T
 zS03aomSwW80Yq+9JUsHZRp43yDAxHs5aXgWY2W5e9q6nQcW16oyYXCzEvBlEhx4sxH+
 OjwA==
X-Gm-Message-State: APjAAAWUGoLMabZpbr8lxCNEPQqly16N6PAavqZd1DHXRz6OAtEGzd4Y
 f1IPl0ZiDXBudNUxnfjoHS6kp+n8
X-Google-Smtp-Source: APXvYqwBnuoa9WSYhLrC0svGLXf2pRNihpdsDe+rKaEk95Li1hrVPD2RIHFgFBwO7ImO1gE9og7UNw==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr34055379wrq.168.1559060762232; 
 Tue, 28 May 2019 09:26:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3163:ab92:73d9:6693])
 by smtp.gmail.com with ESMTPSA id f10sm28835470wrg.24.2019.05.28.09.26.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 09:26:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, Marek.Olsak@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/10] drm/ttm: cleanup ttm_bo_mem_space
Date: Tue, 28 May 2019 18:25:51 +0200
Message-Id: <20190528162557.1280-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528162557.1280-1-christian.koenig@amd.com>
References: <20190528162557.1280-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nKvz55CnJ1NXcC7bw4pIoC/oaSnSalMZgCENiwdDxCk=;
 b=u52y2JMJaCcrp6iPP817SX3mE0ifJyWKMBSgSUh5v90MJpYKPggK9Ttbwb/vJBAwcF
 b2YnjrHYQKfUq43Vo4fKL7GdrJOYzqifqNsBJbiw7WBM30bKdFSX+G9/gmPAa/bocWCM
 /56B1axLIdyzdTEBcFdpv9+RcPp/ZgCHRSl4KVdYLXJkQWfFkvqoHQkU9oZguS+5L7VW
 U9EftMnLKBJOguYke6yYOo7bGzZ8rMD5re6NUTypIKZ8njm6TCDmZr7RyoS6zMxIQu1s
 cUUbP7tOTE3pzfB1Mvp6Hhlo+9GLEIsXor22bjOwM6PefpkAKqBaIqFAXmmDjLTLKuFW
 tzQQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgdHJpZWQgdGhpcyBvbmNlIGJlZm9yZSwgYnV0IHRoYXQgdHVybmVkIG91dCB0byBiZSBtb3Jl
CmNvbXBsaWNhdGVkIHRoYW4gdGhvdWdodC4gV2l0aCBhbGwgdGhlIHJpZ2h0IHByZXJlcXVpc2l0
ZXMKaXQgbG9va3MgbGlrZSB3ZSBjYW4gZG8gdGhpcyBub3cuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyB8IDEyNyArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCmluZGV4IDcwMmNkODlhZGJmOS4uMGRiYjIzYjBkZWRkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKQEAgLTg5MywxMyArODkzLDEyIEBAIHN0YXRpYyBpbnQgdHRtX2JvX2FkZF9tb3Zl
X2ZlbmNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAgKiBzcGFjZSwgb3Igd2UndmUg
ZXZpY3RlZCBldmVyeXRoaW5nIGFuZCB0aGVyZSBpc24ndCBlbm91Z2ggc3BhY2UuCiAgKi8KIHN0
YXRpYyBpbnQgdHRtX2JvX21lbV9mb3JjZV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAotCQkJCQl1aW50MzJfdCBtZW1fdHlwZSwKLQkJCQkJY29uc3Qgc3RydWN0IHR0bV9wbGFj
ZSAqcGxhY2UsCi0JCQkJCXN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtLAotCQkJCQlzdHJ1Y3QgdHRt
X29wZXJhdGlvbl9jdHggKmN0eCkKKwkJCQkgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNl
LAorCQkJCSAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0sCisJCQkJICBzdHJ1Y3QgdHRtX29wZXJh
dGlvbl9jdHggKmN0eCkKIHsKIAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2
OwotCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1hblttZW1fdHlw
ZV07CisJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+
bWVtX3R5cGVdOwogCWludCByZXQ7CiAKIAlkbyB7CkBAIC05MDgsMTEgKzkwNywxMSBAQCBzdGF0
aWMgaW50IHR0bV9ib19tZW1fZm9yY2Vfc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKIAkJCXJldHVybiByZXQ7CiAJCWlmIChtZW0tPm1tX25vZGUpCiAJCQlicmVhazsKLQkJcmV0
ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW1fdHlwZSwgcGxhY2UsIGN0eCk7CisJCXJl
dCA9IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRldiwgbWVtLT5tZW1fdHlwZSwgcGxhY2UsIGN0eCk7
CiAJCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCiAJCQlyZXR1cm4gcmV0OwogCX0gd2hpbGUgKDEp
OwotCW1lbS0+bWVtX3R5cGUgPSBtZW1fdHlwZTsKKwogCXJldHVybiB0dG1fYm9fYWRkX21vdmVf
ZmVuY2UoYm8sIG1hbiwgbWVtKTsKIH0KIApAQCAtOTYwLDYgKzk1OSw1MSBAQCBzdGF0aWMgYm9v
bCB0dG1fYm9fbXRfY29tcGF0aWJsZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwK
IAlyZXR1cm4gdHJ1ZTsKIH0KIAorLyoqCisgKiB0dG1fYm9fbWVtX3BsYWNlbWVudCAtIGNoZWNr
IGlmIHBsYWNlbWVudCBpcyBjb21wYXRpYmxlCisgKiBAYm86IEJPIHRvIGZpbmQgbWVtb3J5IGZv
cgorICogQHBsYWNlOiB3aGVyZSB0byBzZWFyY2gKKyAqIEBtZW06IHRoZSBtZW1vcnkgb2JqZWN0
IHRvIGZpbGwgaW4KKyAqIEBjdHg6IG9wZXJhdGlvbiBjb250ZXh0CisgKgorICogQ2hlY2sgaWYg
cGxhY2VtZW50IGlzIGNvbXBhdGlibGUgYW5kIGZpbGwgaW4gbWVtIHN0cnVjdHVyZS4KKyAqIFJl
dHVybnMgLUVCVVNZIGlmIHBsYWNlbWVudCB3b24ndCB3b3JrIG9yIG5lZ2F0aXZlIGVycm9yIGNv
ZGUuCisgKiAwIHdoZW4gcGxhY2VtZW50IGNhbiBiZSB1c2VkLgorICovCitzdGF0aWMgaW50IHR0
bV9ib19tZW1fcGxhY2VtZW50KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCisJCQkJY29u
c3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UsCisJCQkJc3RydWN0IHR0bV9tZW1fcmVnICptZW0s
CisJCQkJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCit7CisJc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKKwl1aW50MzJfdCBtZW1fdHlwZSA9IFRUTV9QTF9TWVNU
RU07CisJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW47CisJdWludDMyX3QgY3VyX2Zs
YWdzID0gMDsKKwlpbnQgcmV0OworCisJcmV0ID0gdHRtX21lbV90eXBlX2Zyb21fcGxhY2UocGxh
Y2UsICZtZW1fdHlwZSk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCW1hbiA9ICZiZGV2
LT5tYW5bbWVtX3R5cGVdOworCWlmICghbWFuLT5oYXNfdHlwZSB8fCAhbWFuLT51c2VfdHlwZSkK
KwkJcmV0dXJuIC1FQlVTWTsKKworCWlmICghdHRtX2JvX210X2NvbXBhdGlibGUobWFuLCBtZW1f
dHlwZSwgcGxhY2UsICZjdXJfZmxhZ3MpKQorCQlyZXR1cm4gLUVCVVNZOworCisJY3VyX2ZsYWdz
ID0gdHRtX2JvX3NlbGVjdF9jYWNoaW5nKG1hbiwgYm8tPm1lbS5wbGFjZW1lbnQsIGN1cl9mbGFn
cyk7CisJLyoKKwkgKiBVc2UgdGhlIGFjY2VzcyBhbmQgb3RoZXIgbm9uLW1hcHBpbmctcmVsYXRl
ZCBmbGFnIGJpdHMgZnJvbQorCSAqIHRoZSBtZW1vcnkgcGxhY2VtZW50IGZsYWdzIHRvIHRoZSBj
dXJyZW50IGZsYWdzCisJICovCisJdHRtX2ZsYWdfbWFza2VkKCZjdXJfZmxhZ3MsIHBsYWNlLT5m
bGFncywgflRUTV9QTF9NQVNLX01FTVRZUEUpOworCisJbWVtLT5tZW1fdHlwZSA9IG1lbV90eXBl
OworCW1lbS0+cGxhY2VtZW50ID0gY3VyX2ZsYWdzOworCXJldHVybiAwOworfQorCiAvKioKICAq
IENyZWF0ZXMgc3BhY2UgZm9yIG1lbW9yeSByZWdpb24gQG1lbSBhY2NvcmRpbmcgdG8gaXRzIHR5
cGUuCiAgKgpAQCAtOTc0LDExICsxMDE4LDcgQEAgaW50IHR0bV9ib19tZW1fc3BhY2Uoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4
KQogewogCXN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7Ci0Jc3RydWN0IHR0
bV9tZW1fdHlwZV9tYW5hZ2VyICptYW47Ci0JdWludDMyX3QgbWVtX3R5cGUgPSBUVE1fUExfU1lT
VEVNOwotCXVpbnQzMl90IGN1cl9mbGFncyA9IDA7CiAJYm9vbCB0eXBlX2ZvdW5kID0gZmFsc2U7
Ci0JYm9vbCB0eXBlX29rID0gZmFsc2U7CiAJaW50IGksIHJldDsKIAogCXJldCA9IHJlc2VydmF0
aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+cmVzdiwgMSk7CkBAIC05ODgsMzcgKzEwMjgs
MjAgQEAgaW50IHR0bV9ib19tZW1fc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAltZW0tPm1tX25vZGUgPSBOVUxMOwogCWZvciAoaSA9IDA7IGkgPCBwbGFjZW1lbnQtPm51bV9w
bGFjZW1lbnQ7ICsraSkgewogCQljb25zdCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSA9ICZwbGFj
ZW1lbnQtPnBsYWNlbWVudFtpXTsKKwkJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW47
CiAKLQkJcmV0ID0gdHRtX21lbV90eXBlX2Zyb21fcGxhY2UocGxhY2UsICZtZW1fdHlwZSk7CisJ
CXJldCA9IHR0bV9ib19tZW1fcGxhY2VtZW50KGJvLCBwbGFjZSwgbWVtLCBjdHgpOworCQlpZiAo
cmV0ID09IC1FQlVTWSkKKwkJCWNvbnRpbnVlOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsK
LQkJbWFuID0gJmJkZXYtPm1hblttZW1fdHlwZV07Ci0JCWlmICghbWFuLT5oYXNfdHlwZSB8fCAh
bWFuLT51c2VfdHlwZSkKLQkJCWNvbnRpbnVlOwotCi0JCXR5cGVfb2sgPSB0dG1fYm9fbXRfY29t
cGF0aWJsZShtYW4sIG1lbV90eXBlLCBwbGFjZSwKLQkJCQkJCSZjdXJfZmxhZ3MpOwotCi0JCWlm
ICghdHlwZV9vaykKLQkJCWNvbnRpbnVlOwogCiAJCXR5cGVfZm91bmQgPSB0cnVlOwotCQljdXJf
ZmxhZ3MgPSB0dG1fYm9fc2VsZWN0X2NhY2hpbmcobWFuLCBiby0+bWVtLnBsYWNlbWVudCwKLQkJ
CQkJCSAgY3VyX2ZsYWdzKTsKLQkJLyoKLQkJICogVXNlIHRoZSBhY2Nlc3MgYW5kIG90aGVyIG5v
bi1tYXBwaW5nLXJlbGF0ZWQgZmxhZyBiaXRzIGZyb20KLQkJICogdGhlIG1lbW9yeSBwbGFjZW1l
bnQgZmxhZ3MgdG8gdGhlIGN1cnJlbnQgZmxhZ3MKLQkJICovCi0JCXR0bV9mbGFnX21hc2tlZCgm
Y3VyX2ZsYWdzLCBwbGFjZS0+ZmxhZ3MsCi0JCQkJflRUTV9QTF9NQVNLX01FTVRZUEUpOwotCi0J
CWlmIChtZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7Ci0JCQltZW0tPm1lbV90eXBlID0gbWVt
X3R5cGU7Ci0JCQltZW0tPnBsYWNlbWVudCA9IGN1cl9mbGFnczsKLQkJCW1lbS0+bW1fbm9kZSA9
IE5VTEw7CisJCW1lbS0+bW1fbm9kZSA9IE5VTEw7CisJCWlmIChtZW0tPm1lbV90eXBlID09IFRU
TV9QTF9TWVNURU0pCiAJCQlyZXR1cm4gMDsKLQkJfQogCisJCW1hbiA9ICZiZGV2LT5tYW5bbWVt
LT5tZW1fdHlwZV07CiAJCXJldCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywgcGxh
Y2UsIG1lbSk7CiAJCWlmICh1bmxpa2VseShyZXQpKQogCQkJcmV0dXJuIHJldDsKQEAgLTEwMjks
OCArMTA1Miw2IEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8sCiAJCQkJKCptYW4tPmZ1bmMtPnB1dF9ub2RlKShtYW4sIG1lbSk7CiAJCQkJcmV0dXJu
IHJldDsKIAkJCX0KLQkJCW1lbS0+bWVtX3R5cGUgPSBtZW1fdHlwZTsKLQkJCW1lbS0+cGxhY2Vt
ZW50ID0gY3VyX2ZsYWdzOwogCQkJcmV0dXJuIDA7CiAJCX0KIAl9CkBAIC0xMDM4LDM3ICsxMDU5
LDIxIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
CiAJZm9yIChpID0gMDsgaSA8IHBsYWNlbWVudC0+bnVtX2J1c3lfcGxhY2VtZW50OyArK2kpIHsK
IAkJY29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UgPSAmcGxhY2VtZW50LT5idXN5X3BsYWNl
bWVudFtpXTsKIAotCQlyZXQgPSB0dG1fbWVtX3R5cGVfZnJvbV9wbGFjZShwbGFjZSwgJm1lbV90
eXBlKTsKKwkJcmV0ID0gdHRtX2JvX21lbV9wbGFjZW1lbnQoYm8sIHBsYWNlLCBtZW0sIGN0eCk7
CisJCWlmIChyZXQgPT0gLUVCVVNZKQorCQkJY29udGludWU7CiAJCWlmIChyZXQpCiAJCQlyZXR1
cm4gcmV0OwotCQltYW4gPSAmYmRldi0+bWFuW21lbV90eXBlXTsKLQkJaWYgKCFtYW4tPmhhc190
eXBlIHx8ICFtYW4tPnVzZV90eXBlKQotCQkJY29udGludWU7Ci0JCWlmICghdHRtX2JvX210X2Nv
bXBhdGlibGUobWFuLCBtZW1fdHlwZSwgcGxhY2UsICZjdXJfZmxhZ3MpKQotCQkJY29udGludWU7
CiAKIAkJdHlwZV9mb3VuZCA9IHRydWU7Ci0JCWN1cl9mbGFncyA9IHR0bV9ib19zZWxlY3RfY2Fj
aGluZyhtYW4sIGJvLT5tZW0ucGxhY2VtZW50LAotCQkJCQkJICBjdXJfZmxhZ3MpOwotCQkvKgot
CQkgKiBVc2UgdGhlIGFjY2VzcyBhbmQgb3RoZXIgbm9uLW1hcHBpbmctcmVsYXRlZCBmbGFnIGJp
dHMgZnJvbQotCQkgKiB0aGUgbWVtb3J5IHBsYWNlbWVudCBmbGFncyB0byB0aGUgY3VycmVudCBm
bGFncwotCQkgKi8KLQkJdHRtX2ZsYWdfbWFza2VkKCZjdXJfZmxhZ3MsIHBsYWNlLT5mbGFncywK
LQkJCQl+VFRNX1BMX01BU0tfTUVNVFlQRSk7Ci0KLQkJaWYgKG1lbV90eXBlID09IFRUTV9QTF9T
WVNURU0pIHsKLQkJCW1lbS0+bWVtX3R5cGUgPSBtZW1fdHlwZTsKLQkJCW1lbS0+cGxhY2VtZW50
ID0gY3VyX2ZsYWdzOwotCQkJbWVtLT5tbV9ub2RlID0gTlVMTDsKKwkJbWVtLT5tbV9ub2RlID0g
TlVMTDsKKwkJaWYgKG1lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkKIAkJCXJldHVybiAw
OwotCQl9CiAKLQkJcmV0ID0gdHRtX2JvX21lbV9mb3JjZV9zcGFjZShibywgbWVtX3R5cGUsIHBs
YWNlLCBtZW0sIGN0eCk7Ci0JCWlmIChyZXQgPT0gMCAmJiBtZW0tPm1tX25vZGUpIHsKLQkJCW1l
bS0+cGxhY2VtZW50ID0gY3VyX2ZsYWdzOworCQlyZXQgPSB0dG1fYm9fbWVtX2ZvcmNlX3NwYWNl
KGJvLCBwbGFjZSwgbWVtLCBjdHgpOworCQlpZiAocmV0ID09IDAgJiYgbWVtLT5tbV9ub2RlKQog
CQkJcmV0dXJuIDA7Ci0JCX0KKwogCQlpZiAocmV0ICYmIHJldCAhPSAtRUJVU1kpCiAJCQlyZXR1
cm4gcmV0OwogCX0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
