Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F475D51
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80A46E866;
	Fri, 26 Jul 2019 03:22:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF126E865
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:21:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r21so38137151qke.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VqzPPNJYdgKUFFU4B+sYjKfV/8tm5OizOjHI5Z+m7jA=;
 b=j/BnzezfW/F9KhKzEDbiSox8sXQyNAVpqhaYmvq8aypAX4clVI5YR8PtgqqKa+od1R
 8U1I+oW+iR18ea/1GRxIq5H7wfO27DEKjFt7EnYUr5+hc68zUjxhNpsxEYfCuJGCoDr7
 9Xwhq5Y8pbYE21kZoZ4nOAUZFxDmsHmooRp1ZoObdAl5VUKdGQxGuVSbNQ/wh5kLPd3z
 zBJY9Cf7O+Gi9hmyOwn2IzYZXwJsbOzF68IX3HI6SQPDAy46iQtylLQPm7nNh86m5/zZ
 JiiKdbPuW+pYXvjB6JQ1EWZ1zW9M/7f7xkfgYXdLkYFoAttSy7PaEddcBFUbjWnYFbfS
 4Hlw==
X-Gm-Message-State: APjAAAUgc4FCwlMsuh6Sm7kiy6tXcYm0qGklmxjSXH48j8ojdKILXCuQ
 pyxREmA30a884NnZZm55rLmrJvyf
X-Google-Smtp-Source: APXvYqx3BKhffFlO+8oi2ruTeV7ZbZCPApJAjxEk6231Gx55I93AA+OJV+xNsHQiCEiezY4pYF/OvQ==
X-Received: by 2002:ae9:ed4b:: with SMTP id c72mr61176530qkg.400.1564111318760; 
 Thu, 25 Jul 2019 20:21:58 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.21.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:21:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/amdgpu: add an asic callback to determine the reset
 method
Date: Thu, 25 Jul 2019 22:21:36 -0500
Message-Id: <20190726032146.3187-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VqzPPNJYdgKUFFU4B+sYjKfV/8tm5OizOjHI5Z+m7jA=;
 b=J7+OReJaFql0c6GXM2+3v8BgDzU2QrSs6abyYwnBfNsR6uOwvRWtS9bQfBlS/Xgu+i
 nr4qBrbZo7dLtgNG+t2mwRfTD1i3NMB2H6kEklxB61AscmcfEASRvrA0M1vs4OrJLHoP
 p+f30O0DjhAVapl3Hj16TeXdE+5wz17biPBAKzFjXu7jORWYw3sOpqbihEHNkoG0eBeT
 8Y9Z1uuRHTkhf8P0nDj7RW+vfurCLxw1AZZa8U7QMshL30Qi/A9RdpGU6y2GOiXEJRk7
 kgpOc3eL2vjEzjrn4hhfK9dBMgfmbr2M4Z+i6t9QCZXCZ3fImqDklqHoxUjv49YKro4U
 TFGQ==
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
