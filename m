Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782ECA046
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131B86E9F6;
	Thu,  3 Oct 2019 14:26:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F8B6E9F6
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:26:25 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id z67so2501435qkb.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 07:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpfIOfpn6FQQA4hgAOB5PRvPoGjIe4wZ3JbZi4RC3iM=;
 b=JgHiNxK0bu//lqGuI993i1/5h/RKAOS7CsMv0PyCbqAqGK5AAWYU5v95BxmPk3cAkF
 oz9Xvukg7qLTv20AzAatvm9xl++nUF7NXUuGi1skui+xFLbz3cWYEwGx4ymjapuxYSv6
 jTyrGAiN8tfDlABcBgh8g0o9b+S63yYnhqgJaLvnQCNq5jW4JNUtnr107FOTBkPA/P13
 ERuux0DDQE9SPkPwXPsVBSJD2MIXKPgvNGKMUbx1JVoLRsZpgVYiyUUBmmyhcIr2hcLi
 j8N6iNBVNo3b9W26rqH4wVLgQCjJFwOa/vl3uaG/tA9JA8RGyO6KXenoUe0QXF72r6Q8
 lGUg==
X-Gm-Message-State: APjAAAW9madG6sybLC6OFWmKIzjsVBXGMDfhwXwCoa8ktu0QMpbB9Y9S
 jXbd+ba+/x0udYToAiOGAzH8kj7m
X-Google-Smtp-Source: APXvYqyTuNUZtJfBAElqFqttP9ZPARyLTg634r6//UY/v2qJ/mBTrS3qe8uG78hK5Erh7lt+GaE0Bw==
X-Received: by 2002:ae9:ee10:: with SMTP id i16mr4421622qkg.35.1570112784411; 
 Thu, 03 Oct 2019 07:26:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id f11sm1285023qkk.76.2019.10.03.07.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 07:26:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/powerplay: fix typo in mvdd table setup
Date: Thu,  3 Oct 2019 09:26:17 -0500
Message-Id: <20191003142617.7869-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpfIOfpn6FQQA4hgAOB5PRvPoGjIe4wZ3JbZi4RC3iM=;
 b=BukUmyDbE55+d34a4wHjilzvNl1JIoWeurMOe7guYADHfqAO8XsIsIl/vNREtqr5j6
 G+Xc7cmkJzVnc3+RkSK1JTciO5vccPvGx5IutlezHKn8VgpL2mY+p2egW10DpiAZUY0o
 qDNMtVJIrLivkzag0+AmgqDBkWtrCXxjQOP056cFwXLdOuFlM8iuUH2CNOD+6OlsOdW1
 G+KVcyQNY6gTOhn8iYJBMbFX4JTeXAmwUAkO8JJl4X0orQkMt2zX31ivRzuGD4mpX4dw
 G/q7BC4QBvY4mwWro1J4l1uCwTmYIxSMURGuUK7NjdiWL6LfxSeVPX5rGkal0QX6PERB
 HPZA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Robert Strube <rstrube@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UG9sYXJpcyBhbmQgdmVnYW0gdXNlIGNvdW50IGZvciB0aGUgdmFsdWUgcmF0aGVyIHRoYW4KbGV2
ZWwuICBUaGlzIGxvb2tzIGxpa2UgYSBjb3B5IHBhc3RlIHR5cG8gZnJvbSB3aGVuCnRoZSBjb2Rl
IHdhcyBhZGFwdGVkIGZyb20gcHJldmlvdXMgYXNpY3MuCgpJJ20gbm90IHN1cmUgdGhhdCB0aGUg
U01VIGFjdHVhbGx5IHVzZXMgdGhpcyB2YWx1ZSwgc28KSSBkb24ndCBrbm93IHRoYXQgaXQgYWN0
dWFsbHkgaXMgYSBidWcgcGVyIHNlLgoKQnVnOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xMDg2MDkKUmVwb3J0ZWQtYnk6IFJvYmVydCBTdHJ1YmUgPHJzdHJ1
YmVAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3Bv
bGFyaXMxMF9zbXVtZ3IuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dW1nci92ZWdhbV9zbXVtZ3IuYyAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMxMF9zbXVtZ3IuYwppbmRleCBkYzc1NDQ0N2YwZGQu
LjIzYzEyMDE4ZGJjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211bWdyL3BvbGFyaXMxMF9zbXVtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jCkBAIC02NTUsNyArNjU1LDcgQEAgc3RhdGlj
IGludCBwb2xhcmlzMTBfcG9wdWxhdGVfc21jX212ZGRfdGFibGUoc3RydWN0IHBwX2h3bWdyICpo
d21nciwKIAkJCWNvdW50ID0gU01VX01BWF9TTUlPX0xFVkVMUzsKIAkJZm9yIChsZXZlbCA9IDA7
IGxldmVsIDwgY291bnQ7IGxldmVsKyspIHsKIAkJCXRhYmxlLT5TbWlvVGFibGUyLlBhdHRlcm5b
bGV2ZWxdLlZvbHRhZ2UgPQotCQkJCVBQX0hPU1RfVE9fU01DX1VTKGRhdGEtPm12ZGRfdm9sdGFn
ZV90YWJsZS5lbnRyaWVzW2NvdW50XS52YWx1ZSAqIFZPTFRBR0VfU0NBTEUpOworCQkJCVBQX0hP
U1RfVE9fU01DX1VTKGRhdGEtPm12ZGRfdm9sdGFnZV90YWJsZS5lbnRyaWVzW2xldmVsXS52YWx1
ZSAqIFZPTFRBR0VfU0NBTEUpOwogCQkJLyogSW5kZXggaW50byBEcG1UYWJsZS5TbWlvLiBEcml2
ZSBiaXRzIGZyb20gU21pbyBlbnRyeSB0byBnZXQgdGhpcyB2b2x0YWdlIGxldmVsLiovCiAJCQl0
YWJsZS0+U21pb1RhYmxlMi5QYXR0ZXJuW2xldmVsXS5TbWlvID0KIAkJCQkodWludDhfdCkgbGV2
ZWw7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVn
YW1fc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1f
c211bWdyLmMKaW5kZXggN2M5NjBiMDc3NDZmLi5hZTE4ZmJjYjI2ZmIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMKQEAgLTQ1
Niw3ICs0NTYsNyBAQCBzdGF0aWMgaW50IHZlZ2FtX3BvcHVsYXRlX3NtY19tdmRkX3RhYmxlKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCQljb3VudCA9IFNNVV9NQVhfU01JT19MRVZFTFM7CiAJ
CWZvciAobGV2ZWwgPSAwOyBsZXZlbCA8IGNvdW50OyBsZXZlbCsrKSB7CiAJCQl0YWJsZS0+U21p
b1RhYmxlMi5QYXR0ZXJuW2xldmVsXS5Wb2x0YWdlID0gUFBfSE9TVF9UT19TTUNfVVMoCi0JCQkJ
CWRhdGEtPm12ZGRfdm9sdGFnZV90YWJsZS5lbnRyaWVzW2NvdW50XS52YWx1ZSAqIFZPTFRBR0Vf
U0NBTEUpOworCQkJCQlkYXRhLT5tdmRkX3ZvbHRhZ2VfdGFibGUuZW50cmllc1tsZXZlbF0udmFs
dWUgKiBWT0xUQUdFX1NDQUxFKTsKIAkJCS8qIEluZGV4IGludG8gRHBtVGFibGUuU21pby4gRHJp
dmUgYml0cyBmcm9tIFNtaW8gZW50cnkgdG8gZ2V0IHRoaXMgdm9sdGFnZSBsZXZlbC4qLwogCQkJ
dGFibGUtPlNtaW9UYWJsZTIuUGF0dGVybltsZXZlbF0uU21pbyA9CiAJCQkJKHVpbnQ4X3QpIGxl
dmVsOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
