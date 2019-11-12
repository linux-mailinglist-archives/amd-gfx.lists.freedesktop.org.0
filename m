Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9C3F9363
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Nov 2019 15:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98B06E34C;
	Tue, 12 Nov 2019 14:55:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F300F6E34C
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 14:55:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id h15so14612791qka.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 06:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GkMLV5+xWvVtg9az+vTZY6dUtNqx0A6rNI/oJr4aG5A=;
 b=OZP7QFaN/a/Rvy3JhuLVoR7PVOUBVMloxpwBgKceiqU7Kop/cAPJtQKkzRcaB6mnHw
 vlgzbGTLYAvua6CAiniTt6Z2GOCOvRf1PMAr6OpxtAGZ7dxtw8VlrFie+/icLfUKYzXj
 2xIt/6ngPHj7opi/S4DvATc4BlK/iOSNHwrXTO7x/uXktkA7OWh6Aq4KogSePaYzsjxD
 cnmm9Mwewc4pKlTRUbJtzNzVLeAJLDQsadBvtAaqQiQataJOIHgNvcTVQBi3/HV0k7iS
 UZGWBVVFYt3l9eSYGcXZKVnstOTSv3LkvUnYYHOd2L7DcZpjSd27GgQx0FkDlIL+Kfng
 ZuPw==
X-Gm-Message-State: APjAAAUvuaen9e2gbUIdife4MuWCqFE3fDdlsJoYHVqsOr2zbs9hwvZc
 bAWFLnbiGtzqHa6DEZUw/OMqeVbN
X-Google-Smtp-Source: APXvYqymeTZqvicZeziI/wx3gkgsPYHEG8IRB6SZrrPimzWob0D8uapP/Do+tJMXt7+ABwAa4QpOdg==
X-Received: by 2002:a37:b3c4:: with SMTP id c187mr16080720qkf.36.1573570509734; 
 Tue, 12 Nov 2019 06:55:09 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id n5sm9395399qke.74.2019.11.12.06.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 06:55:09 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: don't read registers if gfxoff is enabled
Date: Tue, 12 Nov 2019 09:55:02 -0500
Message-Id: <20191112145502.65217-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GkMLV5+xWvVtg9az+vTZY6dUtNqx0A6rNI/oJr4aG5A=;
 b=d1ZT7e3shf3mcRumyuUuDnJsXaF0geKwONuHLIxAczqQX08hANf6t7vZ+6F3IsH9w5
 rcHsYN9fi030mHrq6Zagtbc6HNwsnfdXutr+5BtViNnwKhACLO9B40tbVn6gTVhd2qvF
 tZeWbIhgu+CezJigEuAlFbKsKfaBZE9kdgTb7Mj8ajw1saO+eMrP+aOw8wrCmu4U2c0a
 /ryE+1OR1qwQEsJFlZPOKZIGnANdS75dta5Se/FbCvS5EDWFU7QGL/Qsm5TWo4Fd+ITq
 AO7jiCMQYDUbBosb+jwQIHfAJeAUDogMQXc5DosIl7Wx0KHKyCLSQXeWmfWA0Od3iKDg
 2FMQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBnZnhvZmYgaXMgZW5hYmxlZCwgYWNjZXNzaW5nIGdmeCByZWdpc3RlcnMgdmlhIE1NSU8K
Y2FuIGxlYWQgdG8gYSBoYW5nLgoKQnVnOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hv
d19idWcuY2dpP2lkPTIwNTQ5NwpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2ttcy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKaW5kZXggYzk3NWNhOTJlOGZhLi4wOGM0Y2Rh
M2E1NjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKQEAgLTY2NSw2
ICs2NjUsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9pbmZvX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZQogCQlpZiAoaW5mby0+cmVhZF9tbXJf
cmVnLmNvdW50ID4gMTI4KQogCQkJcmV0dXJuIC1FSU5WQUw7CiAKKwkJaWYgKGFkZXYtPnBtLnBw
X2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykKKwkJCXJldHVybiAtRUlOVkFMOworCiAJCXJlZ3Mg
PSBrbWFsbG9jX2FycmF5KGluZm8tPnJlYWRfbW1yX3JlZy5jb3VudCwgc2l6ZW9mKCpyZWdzKSwg
R0ZQX0tFUk5FTCk7CiAJCWlmICghcmVncykKIAkJCXJldHVybiAtRU5PTUVNOwotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
