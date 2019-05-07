Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F515F1B
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 10:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D4B89F6E;
	Tue,  7 May 2019 08:15:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16989F5F
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 08:15:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so10641453wrq.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 01:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Q+iJ6rJZ2HsKCGJQjBe3G9bfJhGCGmYeQPjdB6XZUQ=;
 b=fnpQi566ldWbLYb20XQ7e5MmK6pMVZ8fTQEwBBC47cFVb8FnCTqb933PPfe7sxUGe0
 eec6uZpwTRYC0WTsrFPy6IEzoung86FfIG4Mem3Uv1yh3MfGUT7u/8hxfpGUzNAKkMlr
 8paSN85x0ZQ+h3ErK1uMVjPoxINXRzBDa0dchN/dZ5IWX0yeDoEwio6T01CUVw/mncQx
 QG5IPHn9UiDHxM5d3qsEUuGKSxYdQNAxSA7q8BvZrNLt2bGizQY0Vjnh2T4V+1LL0Lnr
 or3wD52N+eIB4VS1oV8k2vqrGuN7qZ5w+1AtbxEQyxgXV6GFE6v6LQaggGvy/usrtjhY
 t15g==
X-Gm-Message-State: APjAAAVD8t8R1i6yoWULx+2i7TtoFVg9eU+6ybqKlCffklJ22Cy7KC8X
 ox1Y/+4vsTOM3XyhDzwdopydqOG8
X-Google-Smtp-Source: APXvYqxyqbruKZrXnncEiOVEQs9IMOzyNnKJF0KlamNCrl6GOeBCgVZWGhnGlY2cc/lPmJ71m5iGTg==
X-Received: by 2002:adf:bac9:: with SMTP id w9mr21526804wrg.256.1557216917741; 
 Tue, 07 May 2019 01:15:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id v16sm15065476wru.76.2019.05.07.01.15.16
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:15:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/9] drm/ttm: use the parent resv for ghost objects
Date: Tue,  7 May 2019 10:15:08 +0200
Message-Id: <20190507081512.2619-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081512.2619-1-christian.koenig@amd.com>
References: <20190507081512.2619-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Q+iJ6rJZ2HsKCGJQjBe3G9bfJhGCGmYeQPjdB6XZUQ=;
 b=p3qSUnVIWYeKCC/8b7VUvpZns90qEL7TvNCApB2yyDvhedgCzH7zUgNl1QIoJIvCc0
 NkC2bQYaZgsj4IQ1dWjXfDn5WGR/LyXdB1y6bMeku1VR2HU+annXoZU2Z3wNUUQnb4oQ
 3wGb/nKrFPSfqExDZUm9ckReX8EgUnHksU+B9FvLYt89ibXf12Mgw0v9Nzw2XqAFHwP6
 snOsYdHq/TZ3LzjKo3leQ5zbfy1CPcQwVMlJdCeKvG/BLqq7Gi86LWgeynmw+h27iTgQ
 hirfNYUgfqQj7Ne7lt9nouVjCl7T014OpYuMXO/dvTnxHkfEphfPhX9InCx7rEamyDDP
 nSXg==
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

VGhpcyB3YXkgd2UgY2FuIGV2ZW4gcGlwZWxpbmUgaW1wb3J0ZWQgQk8gZXZpY3Rpb25zLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDE4ICstLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib191dGlsLmMKaW5kZXggODk1ZDc3ZDc5OWU0Li45N2YzNWM0YmRhMzUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKQEAgLTQ4Niw3ICs0ODYsNiBAQCBzdGF0aWMg
aW50IHR0bV9idWZmZXJfb2JqZWN0X3RyYW5zZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCiAJCQkJICAgICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICoqbmV3X29iaikKIHsKIAlz
dHJ1Y3QgdHRtX3RyYW5zZmVyX29iaiAqZmJvOwotCWludCByZXQ7CiAKIAlmYm8gPSBrbWFsbG9j
KHNpemVvZigqZmJvKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFmYm8pCkBAIC01MTcsMTAgKzUxNiw3
IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKIAlrcmVmX2luaXQoJmZiby0+YmFzZS5rcmVmKTsKIAlmYm8tPmJhc2Uu
ZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95OwogCWZiby0+YmFzZS5hY2Nfc2l6ZSA9
IDA7Ci0JZmJvLT5iYXNlLnJlc3YgPSAmZmJvLT5iYXNlLnR0bV9yZXN2OwotCXJlc2VydmF0aW9u
X29iamVjdF9pbml0KGZiby0+YmFzZS5yZXN2KTsKLQlyZXQgPSByZXNlcnZhdGlvbl9vYmplY3Rf
dHJ5bG9jayhmYm8tPmJhc2UucmVzdik7Ci0JV0FSTl9PTighcmV0KTsKKwlyZXNlcnZhdGlvbl9v
YmplY3RfaW5pdCgmZmJvLT5iYXNlLnR0bV9yZXN2KTsKIAogCSpuZXdfb2JqID0gJmZiby0+YmFz
ZTsKIAlyZXR1cm4gMDsKQEAgLTcxNiw4ICs3MTIsNiBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxf
Y2xlYW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlpZiAocmV0KQogCQkJcmV0
dXJuIHJldDsKIAotCQlyZXNlcnZhdGlvbl9vYmplY3RfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rfb2Jq
LT5yZXN2LCBmZW5jZSk7Ci0KIAkJLyoqCiAJCSAqIElmIHdlJ3JlIG5vdCBtb3ZpbmcgdG8gZml4
ZWQgbWVtb3J5LCB0aGUgVFRNIG9iamVjdAogCQkgKiBuZWVkcyB0byBzdGF5IGFsaXZlLiBPdGhl
cndoaXNlIGhhbmcgaXQgb24gdGhlIGdob3N0CkBAIC03MjksNyArNzIzLDYgQEAgaW50IHR0bV9i
b19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxz
ZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOwog
CQl0dG1fYm9fcHV0KGdob3N0X29iaik7CiAJfQogCkBAIC03NzIsOCArNzY1LDYgQEAgaW50IHR0
bV9ib19waXBlbGluZV9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCWlmIChy
ZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0JCXJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5j
ZShnaG9zdF9vYmotPnJlc3YsIGZlbmNlKTsKLQogCQkvKioKIAkJICogSWYgd2UncmUgbm90IG1v
dmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0CiAJCSAqIG5lZWRzIHRvIHN0YXkg
YWxpdmUuIE90aGVyd2hpc2UgaGFuZyBpdCBvbiB0aGUgZ2hvc3QKQEAgLTc4NSw3ICs3NzYsNiBA
QCBpbnQgdHRtX2JvX3BpcGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9v
YmopOwogCQl0dG1fYm9fcHV0KGdob3N0X29iaik7CiAKIAl9IGVsc2UgaWYgKGZyb20tPmZsYWdz
ICYgVFRNX01FTVRZUEVfRkxBR19GSVhFRCkgewpAQCAtODQxLDE2ICs4MzEsMTAgQEAgaW50IHR0
bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJaWYg
KHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9jb3B5X2Zl
bmNlcyhnaG9zdC0+cmVzdiwgYm8tPnJlc3YpOwotCS8qIExhc3QgcmVzb3J0LCB3YWl0IGZvciB0
aGUgQk8gdG8gYmUgaWRsZSB3aGVuIHdlIGFyZSBPT00gKi8KLQlpZiAocmV0KQotCQl0dG1fYm9f
d2FpdChibywgZmFsc2UsIGZhbHNlKTsKLQogCW1lbXNldCgmYm8tPm1lbSwgMCwgc2l6ZW9mKGJv
LT5tZW0pKTsKIAliby0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsKIAliby0+dHRtID0g
TlVMTDsKIAotCXR0bV9ib191bnJlc2VydmUoZ2hvc3QpOwogCXR0bV9ib19wdXQoZ2hvc3QpOwog
CiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
