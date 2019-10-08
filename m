Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B7D0133
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 21:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A896E899;
	Tue,  8 Oct 2019 19:29:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461796E899
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 19:29:47 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w14so26945892qto.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 12:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbNiAbMBv6m0Oa2TQImvcDwmgvzf97gmBhiiibd8Ljw=;
 b=ORJaxJf4E9Iftv7DL77cKowugxrU3CsrgJG/IV42wEsFWrCdnN0cHO8FuGHFS/CviZ
 PJk9z53M7+njYJ9krUdXtpwpIlLjM/C8wFTx+jMU+XyJWaHv+dyVP8Zu+LQLHJwLHd0/
 EC6K3iizHQYnFRqhplkg4etG5agdmIMF+2cqZ9Y98nfZNTYXeBqTsnOPxfMMo1WHBx7l
 z8ZsfJ2fvnOSnEOD544ZLohn4iYFp9aC6/9DpkR4xsNrRW+urPsOQ3fjafSgCF50+jbd
 8iexrLtMHGNn523tBDng9nv0PNCbNob7//I0KPqxNf+SeU1G+I7jDVExeJPjq0QZe1Hd
 kDsA==
X-Gm-Message-State: APjAAAXLsoD7cTeM+cAUTVuNu89/aiIsAT1qq+hZaqBeo4sGgTiYjo2j
 haLP4APDd86u6OJ6/Q51taUvdYBE
X-Google-Smtp-Source: APXvYqwj0aXvkSEyckvn8F/0RBxrPiiDoHHRlRI8TG0DBXJRrfNB1riadW0GeNwxokE+VA8YJV0sVA==
X-Received: by 2002:aed:37c9:: with SMTP id j67mr18735359qtb.29.1570562985878; 
 Tue, 08 Oct 2019 12:29:45 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id z141sm9453272qka.126.2019.10.08.12.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:29:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/amdgpu: introduce psp_v11_0_is_sos_alive interface
Date: Tue,  8 Oct 2019 14:29:29 -0500
Message-Id: <20191008192934.5481-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008192934.5481-1-alexander.deucher@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbNiAbMBv6m0Oa2TQImvcDwmgvzf97gmBhiiibd8Ljw=;
 b=ZHP1XKOleqxdjUIr9S9YX6MP/KC5/Cpmnxs/bGUQUux8qvSqV++mKtOZz+AcrNFT37
 jlMckx1pw7PBgUta46F0VW9W+fLEZzEzvoLDgJrtt0RbkTC0yzhfi5iaKlr8N19SzQbG
 tu0W/lFH1NoyTPdXs2Vn/dFF0ghUE/LCL+V7ghEpKCIySkkKV2w3iz8Un952amya87Al
 4AIcEXu/aYi258sQLk0tfM6dwbZ4b6YRJ/h/iiRoMX9wJgZWbw79t2zJDD07WJLunU3C
 v+BWKCS3ve6ltJxSlseGEa1idKllJ12XFnNanqxzuH7h2UXHg6vav52Evzg4WgZHSKmo
 RPbw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Tianci.Yin" <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgppbnRyb2R1Y2UgcHNwX3Yx
MV8wX2lzX3Nvc19hbGl2ZSBmdW5jIGZvciBjb21tb24gdXNlLgoKQ2hhbmdlLUlkOiBJZWUwYTZk
ZDkyNGQ2YTRiMTY0ZWI3NTFjMGJlYzQ5ZmNiN2Q3OTQ4MwpSZXZpZXdlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWlu
IDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNw
X3YxMV8wLmMgfCAyMiArKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Bz
cF92MTFfMC5jCmluZGV4IDA0MzE4Y2ZkNTBhOC4uZTc0YTk1MmEzZjdjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtMjA2LDE4ICsyMDYsMjYgQEAgc3RhdGljIGlu
dCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJcmV0
dXJuIGVycjsKIH0KIAorc3RhdGljIGJvb2wgcHNwX3YxMV8wX2lzX3Nvc19hbGl2ZShzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+
YWRldjsKKwl1aW50MzJfdCBzb2xfcmVnOworCisJc29sX3JlZyA9IFJSRUczMl9TT0MxNShNUDAs
IDAsIG1tTVAwX1NNTl9DMlBNU0dfODEpOworCisJcmV0dXJuIChzb2xfcmVnICE9IDB4MCk7Cit9
CisKIHN0YXRpYyBpbnQgcHNwX3YxMV8wX2Jvb3Rsb2FkZXJfbG9hZF9rZGIoc3RydWN0IHBzcF9j
b250ZXh0ICpwc3ApCiB7CiAJaW50IHJldDsKIAl1aW50MzJfdCBwc3BfZ2Z4ZHJ2X2NvbW1hbmRf
cmVnID0gMDsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+YWRldjsKLQl1aW50
MzJfdCBzb2xfcmVnOwogCiAJLyogQ2hlY2sgdE9TIHNpZ24gb2YgbGlmZSByZWdpc3RlciB0byBj
b25maXJtIHN5cyBkcml2ZXIgYW5kIHNPUwogCSAqIGFyZSBhbHJlYWR5IGJlZW4gbG9hZGVkLgog
CSAqLwotCXNvbF9yZWcgPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzgx
KTsKLQlpZiAoc29sX3JlZykgeworCWlmIChwc3BfdjExXzBfaXNfc29zX2FsaXZlKHBzcCkpIHsK
IAkJcHNwLT5zb3NfZndfdmVyc2lvbiA9IFJSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9D
MlBNU0dfNTgpOwogCQlkZXZfaW5mbyhhZGV2LT5kZXYsICJzb3MgZncgdmVyc2lvbiA9IDB4JXgu
XG4iLCBwc3AtPnNvc19md192ZXJzaW9uKTsKIAkJcmV0dXJuIDA7CkBAIC0yNTMsMTMgKzI2MSwx
MSBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9ib290bG9hZGVyX2xvYWRfc3lzZHJ2KHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwKQogCWludCByZXQ7CiAJdWludDMyX3QgcHNwX2dmeGRydl9jb21tYW5k
X3JlZyA9IDA7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3AtPmFkZXY7Ci0JdWlu
dDMyX3Qgc29sX3JlZzsKIAogCS8qIENoZWNrIHNPUyBzaWduIG9mIGxpZmUgcmVnaXN0ZXIgdG8g
Y29uZmlybSBzeXMgZHJpdmVyIGFuZCBzT1MKIAkgKiBhcmUgYWxyZWFkeSBiZWVuIGxvYWRlZC4K
IAkgKi8KLQlzb2xfcmVnID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR184
MSk7Ci0JaWYgKHNvbF9yZWcpIHsKKwlpZiAocHNwX3YxMV8wX2lzX3Nvc19hbGl2ZShwc3ApKSB7
CiAJCXBzcC0+c29zX2Z3X3ZlcnNpb24gPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5f
QzJQTVNHXzU4KTsKIAkJZGV2X2luZm8oYWRldi0+ZGV2LCAic29zIGZ3IHZlcnNpb24gPSAweCV4
LlxuIiwgcHNwLT5zb3NfZndfdmVyc2lvbik7CiAJCXJldHVybiAwOwpAQCAtMjk3LDEzICszMDMs
MTEgQEAgc3RhdGljIGludCBwc3BfdjExXzBfYm9vdGxvYWRlcl9sb2FkX3NvcyhzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCkKIAlpbnQgcmV0OwogCXVuc2lnbmVkIGludCBwc3BfZ2Z4ZHJ2X2NvbW1h
bmRfcmVnID0gMDsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+YWRldjsKLQl1
aW50MzJfdCBzb2xfcmVnOwogCiAJLyogQ2hlY2sgc09TIHNpZ24gb2YgbGlmZSByZWdpc3RlciB0
byBjb25maXJtIHN5cyBkcml2ZXIgYW5kIHNPUwogCSAqIGFyZSBhbHJlYWR5IGJlZW4gbG9hZGVk
LgogCSAqLwotCXNvbF9yZWcgPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNH
XzgxKTsKLQlpZiAoc29sX3JlZykKKwlpZiAocHNwX3YxMV8wX2lzX3Nvc19hbGl2ZShwc3ApKQog
CQlyZXR1cm4gMDsKIAogCS8qIFdhaXQgZm9yIGJvb3Rsb2FkZXIgdG8gc2lnbmlmeSB0aGF0IGlz
IHJlYWR5IGhhdmluZyBiaXQgMzEgb2YgQzJQTVNHXzM1IHNldCB0byAxICovCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
