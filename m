Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F4754C2
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4F56E7A1;
	Thu, 25 Jul 2019 16:58:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BC06E7A0
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:06 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s145so36962225qke.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VqzPPNJYdgKUFFU4B+sYjKfV/8tm5OizOjHI5Z+m7jA=;
 b=VTT7AifnDsfsIRB/TNXxlLf9s/IMDVKGkrXynrboD/kuXX4mxDfKL2AuGWkr0C0eVK
 w9aZa/hA4oMRwrRdO1yrYuff5ujCbAnh7vmh7oChhM6Sit5xZQ0rPs4IBhZdo/mjN9GY
 XumhqzVVF1utSv5Y6MPLsT4Amedm+jZ4xR+YTc5SwjjddA1Uo+DlZup1yejcgtBbxrfH
 vok0/PWtSe6p7PzziqIdtQ2WZp6sH53Tjg/myYXw6vXo8HCXGM96/uEq0UBijLuawKNr
 BBeLCXLaP0pWGG860nB9j+DnftFVuSxmE9NchPnefW2y7fEtcMRL+jUnaZJIVrgpI6cD
 IGmA==
X-Gm-Message-State: APjAAAUAkzfIlydC7wgNPDEcVHLsZ6r5qruIcBnKEkcZo2caT/ZWk6An
 BlO9GPTIhy8HkGEvLC5LhWr8LxQv
X-Google-Smtp-Source: APXvYqyJVL6xdwx/XTV5ltSwNLBVWAbD4+qghiGz1lAKnV7UH7MztUUUecupUpMsY+2vAdVInzgzFA==
X-Received: by 2002:a05:620a:10bc:: with SMTP id
 h28mr59218071qkk.289.1564073885418; 
 Thu, 25 Jul 2019 09:58:05 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/12] drm/amdgpu: add an asic callback to determine the reset
 method
Date: Thu, 25 Jul 2019 11:57:47 -0500
Message-Id: <20190725165758.16928-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VqzPPNJYdgKUFFU4B+sYjKfV/8tm5OizOjHI5Z+m7jA=;
 b=u7aB6PR9yMMAnND5hRH1o68zvMe2h0Y+0ll3C5xQW8FMcgGHOizfYL9dudWTnuUC52
 akX7JTIVm+fxLZSYhkPr+/6fpOw3Y8QdSeg7JRkOY4xeJhjq/INlRyL5rYJFwLCqiCr5
 LV2eEfHFy9o5Nnim5nP0HGIfu6VTBobxD3tJMf0gnBX20mOcQKBKVTRszgmHC11LhdrN
 0BcM6Z7vJOMZLa4DlUYTvjaWtkli2gCe110eN3urKx+K8gCtBLXoa+mf1/+gXG69aZWI
 FIhXb2PqMN7OQOPcRh3vesYJDKQ+N8safQMoQLHLc4etbkcUHsN0CYsQQBXDUjZS0Nhu
 lSMw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U29tZXRpbWVzIHRoZSBkcml2ZXIgbWF5IGhhdmUgdG8gYmVoYXZlIGRpZmZlcmVudGx5IGRlcGVu
ZGluZwpvbiB0aGUgbWV0aG9kIHdlIGFyZSB1c2luZyB0byByZXNldCB0aGUgR1BVLgoKUmV2aWV3
ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUuaCB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCBiMzA2MDI1
Y2RiYzcuLmU2NjE0MTdiYTlkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAg
LTUzMiw2ICs1MzIsMTQgQEAgc3RydWN0IGFtZGdwdV9hbGxvd2VkX3JlZ2lzdGVyX2VudHJ5IHsK
IAlib29sIGdyYm1faW5kZXhlZDsKIH07CiAKK2VudW0gYW1kX3Jlc2V0X21ldGhvZCB7CisJQU1E
X1JFU0VUX01FVEhPRF9MRUdBQ1kgPSAwLAorCUFNRF9SRVNFVF9NRVRIT0RfTU9ERTAsCisJQU1E
X1JFU0VUX01FVEhPRF9NT0RFMSwKKwlBTURfUkVTRVRfTUVUSE9EX01PREUyLAorCUFNRF9SRVNF
VF9NRVRIT0RfQkFDTworfTsKKwogLyoKICAqIEFTSUMgc3BlY2lmaWMgZnVuY3Rpb25zLgogICov
CkBAIC01NDMsNiArNTUxLDcgQEAgc3RydWN0IGFtZGdwdV9hc2ljX2Z1bmNzIHsKIAkJCSAgICAg
dTMyIHNoX251bSwgdTMyIHJlZ19vZmZzZXQsIHUzMiAqdmFsdWUpOwogCXZvaWQgKCpzZXRfdmdh
X3N0YXRlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCBzdGF0ZSk7CiAJaW50ICgq
cmVzZXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwllbnVtIGFtZF9yZXNldF9tZXRo
b2QgKCpyZXNldF9tZXRob2QpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAkvKiBnZXQg
dGhlIHJlZmVyZW5jZSBjbG9jayAqLwogCXUzMiAoKmdldF94Y2xrKShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldik7CiAJLyogTU0gYmxvY2sgY2xvY2tzICovCkBAIC0xMTEyLDYgKzExMjEsNyBA
QCBpbnQgZW11X3NvY19hc2ljX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogICov
CiAjZGVmaW5lIGFtZGdwdV9hc2ljX3NldF92Z2Ffc3RhdGUoYWRldiwgc3RhdGUpIChhZGV2KS0+
YXNpY19mdW5jcy0+c2V0X3ZnYV9zdGF0ZSgoYWRldiksIChzdGF0ZSkpCiAjZGVmaW5lIGFtZGdw
dV9hc2ljX3Jlc2V0KGFkZXYpIChhZGV2KS0+YXNpY19mdW5jcy0+cmVzZXQoKGFkZXYpKQorI2Rl
ZmluZSBhbWRncHVfYXNpY19yZXNldF9tZXRob2QoYWRldikgKGFkZXYpLT5hc2ljX2Z1bmNzLT5y
ZXNldF9tZXRob2QoKGFkZXYpKQogI2RlZmluZSBhbWRncHVfYXNpY19nZXRfeGNsayhhZGV2KSAo
YWRldiktPmFzaWNfZnVuY3MtPmdldF94Y2xrKChhZGV2KSkKICNkZWZpbmUgYW1kZ3B1X2FzaWNf
c2V0X3V2ZF9jbG9ja3MoYWRldiwgdiwgZCkgKGFkZXYpLT5hc2ljX2Z1bmNzLT5zZXRfdXZkX2Ns
b2NrcygoYWRldiksICh2KSwgKGQpKQogI2RlZmluZSBhbWRncHVfYXNpY19zZXRfdmNlX2Nsb2Nr
cyhhZGV2LCBldiwgZWMpIChhZGV2KS0+YXNpY19mdW5jcy0+c2V0X3ZjZV9jbG9ja3MoKGFkZXYp
LCAoZXYpLCAoZWMpKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
