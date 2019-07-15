Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6953B69E04
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19C89DFF;
	Mon, 15 Jul 2019 21:25:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C3E89DDF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:01 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x22so12360014qtp.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IG8E4nl4iIiWLSqy4evjRWaZSvgBMD25GWD8PIbMXRE=;
 b=RvZejbat6zrK3eVMGJJ1SLGSrBmoUxsFnGk+RXPUlm3ycchOSvw+fmGRoaAPbebnLe
 +hc7ELquaLa90PjtBGeSMwjgwL4PPe3TpOhDQG0L+Io4+utDe/Gty1AktXD2uPoo6grG
 8HCJN9gkpat8iTUf3HIGDrf5ngkasiapBjw59TfB9wyB2OoX6UOD7JWybOtaMWRjRKUs
 7VmQixvyj0NmMcjaL0w+6jQ43hmrULzqeBxrg0jz+lCsvBBN/7gp3pDwk3bRo6wrw8VY
 RNzck+/n3VIwJ/nFQYs8vhKkmTSJE5+TVRG8UAfHcg5axh+w4xB8fRBaD+d9OUMLN9/I
 HZnQ==
X-Gm-Message-State: APjAAAUlnUc9tFViyArVyiXWy7G+ZqBkoJshAUxIphHtrWH2bNQ21jO8
 cc9uH9jZFky8pkIVmOYlCcMUPowj
X-Google-Smtp-Source: APXvYqzSZrPZAqd5TsLxEJi2ogWEyemqu5TZ1J7tzW/ncsbw0y86TldGjrrTYwFuvb6SSSlqeTJ7Yg==
X-Received: by 2002:a0c:d981:: with SMTP id y1mr21261764qvj.104.1563225900268; 
 Mon, 15 Jul 2019 14:25:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 017/102] drm/amdgpu: update vmc interrupt routine to support 3
 vmhubs
Date: Mon, 15 Jul 2019 16:23:12 -0500
Message-Id: <20190715212437.31793-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IG8E4nl4iIiWLSqy4evjRWaZSvgBMD25GWD8PIbMXRE=;
 b=c2r05f05CYmRGhf0O3KXpWNIWiKiIVyUArXnLAhSSdd6CmI4oQcJgtwe6LOlqlgRyU
 dWtbZ3oJg8knWSBzkptTqvR9NMrU4FNUiru+Qc3HYQrrVaMLeD6BCL4QRvtluHLY2Tcu
 3stz6/vqmmgfFmKCsNnPElKqSNagab/NS7HNSZuZJc9CDJ8zBICUfD1F/qo7+pDZWRcu
 GH18j2RsYxeDyWoiXqvVvOPgtU1qzKB9YQ0l8EINKr9V7EQ4MCNoHZlD5g1Bb1ph7EJn
 VHdfyUG5zEoqGCil6zN6/lpMQj41IO1cpgHgdNNDI16e6djOkskWKe9egm80ec1f2mmd
 EdGQ==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpUaGVyZSBpcyBvbmUgbW9yZSB2bWMgaW50ZXJy
dXB0IGFuZCBtbWh1YiBvbiBBcmN0dXJ1cy4KClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBh
bWQuY29tPgpBY2tlZC1ieTogU25vdyBaaGFuZyA8IFNub3cuWmhhbmdAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAxNyArKysrKysrKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggNjk3MzE5Yjc3ZDc0Li5kNmFhMjkw
ZDU2N2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtMzEyLDEwICsz
MTIsMTEgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAkJCQlzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgKnNvdXJjZSwKIAkJ
CQlzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkKIHsKLQlzdHJ1Y3QgYW1kZ3B1X3ZtaHVi
ICpodWIgPSAmYWRldi0+dm1odWJbZW50cnktPnZtaWRfc3JjXTsKKwlzdHJ1Y3QgYW1kZ3B1X3Zt
aHViICpodWI7CiAJYm9vbCByZXRyeV9mYXVsdCA9ICEhKGVudHJ5LT5zcmNfZGF0YVsxXSAmIDB4
ODApOwogCXVpbnQzMl90IHN0YXR1cyA9IDA7CiAJdTY0IGFkZHI7CisJY2hhciBodWJfbmFtZVsx
MF07CiAKIAlhZGRyID0gKHU2NCllbnRyeS0+c3JjX2RhdGFbMF0gPDwgMTI7CiAJYWRkciB8PSAo
KHU2NCllbnRyeS0+c3JjX2RhdGFbMV0gJiAweGYpIDw8IDQ0OwpAQCAtMzI0LDYgKzMyNSwxNyBA
QCBzdGF0aWMgaW50IGdtY192OV8wX3Byb2Nlc3NfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAogCQkJCQkJICAgIGVudHJ5LT50aW1lc3RhbXApKQogCQlyZXR1cm4gMTsgLyog
VGhpcyBhbHNvIHByZXZlbnRzIHNlbmRpbmcgaXQgdG8gS0ZEICovCiAKKwlpZiAoZW50cnktPmNs
aWVudF9pZCA9PSBTT0MxNV9JSF9DTElFTlRJRF9WTUMpIHsKKwkJc25wcmludGYoaHViX25hbWUs
IHNpemVvZihodWJfbmFtZSksICJtbWh1YjAiKTsKKwkJaHViID0gJmFkZXYtPnZtaHViW0FNREdQ
VV9NTUhVQl8wXTsKKwl9IGVsc2UgaWYgKGVudHJ5LT5jbGllbnRfaWQgPT0gU09DMTVfSUhfQ0xJ
RU5USURfVk1DMSkgeworCQlzbnByaW50ZihodWJfbmFtZSwgc2l6ZW9mKGh1Yl9uYW1lKSwgIm1t
aHViMSIpOworCQlodWIgPSAmYWRldi0+dm1odWJbQU1ER1BVX01NSFVCXzFdOworCX0gZWxzZSB7
CisJCXNucHJpbnRmKGh1Yl9uYW1lLCBzaXplb2YoaHViX25hbWUpLCAiZ2Z4aHViMCIpOworCQlo
dWIgPSAmYWRldi0+dm1odWJbQU1ER1BVX0dGWEhVQl8wXTsKKwl9CisKIAkvKiBJZiBpdCdzIHRo
ZSBmaXJzdCBmYXVsdCBmb3IgdGhpcyBhZGRyZXNzLCBwcm9jZXNzIGl0IG5vcm1hbGx5ICovCiAJ
aWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKIAkJc3RhdHVzID0gUlJFRzMyKGh1Yi0+dm1f
bDJfcHJvX2ZhdWx0X3N0YXR1cyk7CkBAIC0zMzksOCArMzUxLDcgQEAgc3RhdGljIGludCBnbWNf
djlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJZGV2
X2VycihhZGV2LT5kZXYsCiAJCQkiWyVzXSAlcyBwYWdlIGZhdWx0IChzcmNfaWQ6JXUgcmluZzol
dSB2bWlkOiV1ICIKIAkJCSJwYXNpZDoldSwgZm9yIHByb2Nlc3MgJXMgcGlkICVkIHRocmVhZCAl
cyBwaWQgJWQpXG4iLAotCQkJZW50cnktPnZtaWRfc3JjID8gIm1taHViIiA6ICJnZnhodWIiLAot
CQkJcmV0cnlfZmF1bHQgPyAicmV0cnkiIDogIm5vLXJldHJ5IiwKKwkJCWh1Yl9uYW1lLCByZXRy
eV9mYXVsdCA/ICJyZXRyeSIgOiAibm8tcmV0cnkiLAogCQkJZW50cnktPnNyY19pZCwgZW50cnkt
PnJpbmdfaWQsIGVudHJ5LT52bWlkLAogCQkJZW50cnktPnBhc2lkLCB0YXNrX2luZm8ucHJvY2Vz
c19uYW1lLCB0YXNrX2luZm8udGdpZCwKIAkJCXRhc2tfaW5mby50YXNrX25hbWUsIHRhc2tfaW5m
by5waWQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
