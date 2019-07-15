Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D869E57
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AB36E037;
	Mon, 15 Jul 2019 21:26:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94246E02F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:09 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id r6so12904473qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3BgwUCB/KmNESi69hmI3mNhWbET2MZHO2A7hyAJEnnI=;
 b=Fw6IW35RmdBqxrAAUxGyZWEpKnBJE/ZkSmh+51Ypy1KGhXDmgosUQLzwRfE2KlDV2d
 y3YdLE9V9fFlZ7fiquLCco+CYlO1lD1OzFZwofM6qC9zICApn9OnUh0yez6DDRKT5t/3
 9bFY8aO5sS6WtPCoHYoL4JPqWYa2/NENthOMK5m3xtSwzzNGz5cZZjlYgZoRpfyVHEbZ
 7yQKfXSLAqEQBiP1RRTy15yxyzMWfqFhUg8h3XoPaqnlIir4hnsa8yOOOTt3c8BjXP47
 zLygwfO4iIFM5sWhIDYQ1yaI5X2qo1wINKFseF2q3pmtD9uILa3XJ6WT11tTf4GstiCd
 DjlA==
X-Gm-Message-State: APjAAAWu/2Yk8gs1mw9ikCbSAwleKaAJIwl4WMahWWyxF0iYQSiEdWK7
 t0sJGJAQ+fHAun5lBNTPRXb1zs+X
X-Google-Smtp-Source: APXvYqwbG/mavjcT8O7iEtyH6qNVMsJw23+ci85z5i8DS2nIeLGS1j3+3cs3Pyx5k7QZcThsQF4LVg==
X-Received: by 2002:a05:620a:15f0:: with SMTP id
 p16mr18422311qkm.141.1563225968526; 
 Mon, 15 Jul 2019 14:26:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 091/102] amd/powerplay: No SW XGMI dpm for Arcturus rev 2
Date: Mon, 15 Jul 2019 16:24:26 -0500
Message-Id: <20190715212437.31793-89-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3BgwUCB/KmNESi69hmI3mNhWbET2MZHO2A7hyAJEnnI=;
 b=WL7/Ek7jqFpAOqWiKoJi9/2NwRWsKpRuMG9QpnHDfcbC5mhpjx7uGK/KQK2iySnjLm
 BczGTzpZ++JJfS1LCg1UDhAhCKpm//MOoCLvN4bIruQWlX7WMG5/lQlt8Sqg2zPAQtZH
 zPLOtCz7QkajxNnt4S42awsVsIJcaGrrbM1G0krXnzF7yu+cbnsenBU7MJkr1gyOLJHW
 IwqGoZifuMPKPTdzSlR0tn6PrQ2qWpW6VtWQZmwmnrwl+qjejNGRwYJ6z56u1He2mIn/
 E/hXNHBaUYuwLEir6wb0BHS8m5sN290EK2LIoMPIGTJrMAickAVC/uO5UkVwmqF46jLx
 CVoA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IFlvbmcg
WmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfeGdtaS5jICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYyAgICAgfCAxMSArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfeGdtaS5jCmluZGV4IDQxZTY0OGQ1NmVjYS4uNGU4ZDYwZWVjMGZlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKQEAgLTI0OCw3ICsyNDgsNyBAQCBpbnQgYW1k
Z3B1X3hnbWlfc2V0X3BzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHBzdGF0
ZSkKIAogCWRldl9kYmcoYWRldi0+ZGV2LCAiU2V0IHhnbWkgcHN0YXRlICVkLlxuIiwgcHN0YXRl
KTsKIAotCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkKKwlpZiAoaXNfc3VwcG9ydF9zd19z
bXVfeGdtaShhZGV2KSkKIAkJcmV0ID0gc211X3NldF94Z21pX3BzdGF0ZSgmYWRldi0+c211LCBw
c3RhdGUpOwogCWlmIChyZXQpCiAJCWRldl9lcnIoYWRldi0+ZGV2LApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDdkMWJkMDk5N2I1OS4uMzQyZDU3ZjJm
YzVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0z
NzAsNiArMzcwLDE3IEBAIGJvb2wgaXNfc3VwcG9ydF9zd19zbXUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAJCXJldHVybiBmYWxzZTsKIH0KIAorYm9vbCBpc19zdXBwb3J0X3N3X3NtdV94
Z21pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWlmIChhbWRncHVfZHBtICE9IDEp
CisJCXJldHVybiBmYWxzZTsKKworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjAp
CisJCXJldHVybiB0cnVlOworCisJcmV0dXJuIGZhbHNlOworfQorCiBpbnQgc211X3N5c19nZXRf
cHBfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHZvaWQgKip0YWJsZSkKIHsKIAlzdHJ1
Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDc5ZTM0
MDk3ZWIwZi4uYzgwMDc3ZGI2Y2Y1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9hbWRncHVfc211LmgKQEAgLTk1MSw2ICs5NTEsNyBAQCBpbnQgc211X3VwZGF0ZV90
YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgdGFibGVfaW5kZXgsCiAJCSAg
ICAgdm9pZCAqdGFibGVfZGF0YSwgYm9vbCBkcnYyc211KTsKIAogYm9vbCBpc19zdXBwb3J0X3N3
X3NtdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Citib29sIGlzX3N1cHBvcnRfc3dfc211
X3hnbWkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IHNtdV9yZXNldChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSk7CiBpbnQgc211X2NvbW1vbl9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCiAJCQkgICB2b2lkICpk
YXRhLCB1aW50MzJfdCAqc2l6ZSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
