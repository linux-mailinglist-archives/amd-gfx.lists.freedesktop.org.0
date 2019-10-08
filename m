Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2CD0131
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 21:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4196E897;
	Tue,  8 Oct 2019 19:29:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5666E895
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 19:29:44 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id u22so26917647qtq.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 12:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sw48rV4dg7zfzebO1udl7zdkIrzFKDKbsIG3KIv5u/4=;
 b=oE0nPIm7fU+T0dfpMOHvtnl4Z8XN6szRFl4sH0sfZ4ZKAmh+DunNBMHo/XJM1nIk83
 lqa/+hDuK5HyST+XJGwXMr/0BBQsOAo3V1o7mD801J3CJmpEuOj/fDyu+YXiKRhBZa40
 PWczhe0WsqLoi+1vQu2p61grLV+si+J8SyyGvIt1LSWgI0cUkWcv6erwPuoaciCPNPic
 qgDWvDRT0hqqXMfnP3/QZ09MnreZR+iAuvsWXAvMMfMguMmZn+Z0OOSCf2a92ou10E/q
 bXUUXzpfkpqFsV0OWu0Q8dFVWSmPN8bff370deTflkmsDiP9N98w3LFfmkFxhTsLuWe+
 x40A==
X-Gm-Message-State: APjAAAUl5QFz1aKbDH8ok+3CAa9kEQbvW6ZrppAGEbCF7OZYlkY5D8QX
 sroYC9jOpjkWnU+71vRZco/jfw9h
X-Google-Smtp-Source: APXvYqxuKpjD4VlSvhvJAnWfTSMZnNnqElkxPEFvwCFnwsr5NKeI3O6AGNoldxgXu0XfYMvrdocFLw==
X-Received: by 2002:ac8:2d09:: with SMTP id n9mr37243677qta.10.1570562983066; 
 Tue, 08 Oct 2019 12:29:43 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id z141sm9453272qka.126.2019.10.08.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:29:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle revision
Date: Tue,  8 Oct 2019 14:29:27 -0500
Message-Id: <20191008192934.5481-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008192934.5481-1-alexander.deucher@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sw48rV4dg7zfzebO1udl7zdkIrzFKDKbsIG3KIv5u/4=;
 b=cHiiRgEm10nizgLWvzDmdT3bigOQtSkQE+UTOn2ZNogtfccCxlr6eJgcNU+UaDsI4G
 xW8Jn3kEW449Qz19u8AiWg9PrZwipWOjebUAY0LHRMElM4QjMOQkgNkeJG69vIpu9IuE
 +24ibeWPbZbj+mBZumSjLKqnAFpDSFm38Nk4dLHkVhU8mFW4ioBnxnln5en3tijL4oWC
 ynqbWH64N848JLc0XqUruyAGkLHHCIYUdzRFpYtx/w7LyL3yPCEvs61+Xo11u19zQfGC
 vZMcDp/c55umnEWO16NDsnuheGMdnZ7G2mMWijDo3MV0ggsQpKWKqiB/QMtbmLAqstub
 NbzQ==
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

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+Cgp1cGRhdGUgYW1kZ3B1X2Rp
c2NvdmVyeSB0byBnZXQgSVAgcmV2aXNpb24uCgpDaGFuZ2UtSWQ6IElmODE1MjEwM2QwM2I1OGUx
ZGMwZjMyZGI2MzYyNWUyOTBmNWYwOGEwClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRpYW5jaS5ZaW4gPHRpYW5jaS55
aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292
ZXJ5LmMgfCA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3Zl
cnkuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNj
b3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpp
bmRleCAxNDgxODk5Zjg2YzEuLmRiMmRhYjNhNmRmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpAQCAtMzMzLDcgKzMzMyw3IEBAIGludCBhbWRn
cHVfZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB9
CiAKIGludCBhbWRncHVfZGlzY292ZXJ5X2dldF9pcF92ZXJzaW9uKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBpbnQgaHdfaWQsCi0JCQkJICAgIGludCAqbWFqb3IsIGludCAqbWlub3IpCisJ
CQkJICAgIGludCAqbWFqb3IsIGludCAqbWlub3IsIGludCAqcmV2aXNpb24pCiB7CiAJc3RydWN0
IGJpbmFyeV9oZWFkZXIgKmJoZHI7CiAJc3RydWN0IGlwX2Rpc2NvdmVyeV9oZWFkZXIgKmloZHI7
CkBAIC0zNjksNiArMzY5LDggQEAgaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2lwX3ZlcnNpb24o
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBod19pZCwKIAkJCQkJKm1ham9yID0gaXAt
Pm1ham9yOwogCQkJCWlmIChtaW5vcikKIAkJCQkJKm1pbm9yID0gaXAtPm1pbm9yOworCQkJCWlm
IChyZXZpc2lvbikKKwkJCQkJKnJldmlzaW9uID0gaXAtPnJldmlzaW9uOwogCQkJCXJldHVybiAw
OwogCQkJfQogCQkJaXBfb2Zmc2V0ICs9IHNpemVvZigqaXApICsgNCAqIChpcC0+bnVtX2Jhc2Vf
YWRkcmVzcyAtIDEpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rpc2NvdmVyeS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2Nv
dmVyeS5oCmluZGV4IDg1YjhjNGQ0ZDU3Ni4uYWRhMzBjZmQ5ZDM1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oCkBAIC0yOCw3ICsyOCw3IEBAIGlu
dCBhbWRncHVfZGlzY292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9p
ZCBhbWRncHVfZGlzY292ZXJ5X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50
IGFtZGdwdV9kaXNjb3ZlcnlfcmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dik7CiBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9nZXRfaXBfdmVyc2lvbihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgaW50IGh3X2lkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ICptYWpvciwgaW50ICptaW5vcik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQgKm1ham9yLCBpbnQgKm1pbm9yLCBpbnQgKnJldmlzaW9uKTsKIGludCBhbWRn
cHVfZGlzY292ZXJ5X2dldF9nZnhfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAK
ICNlbmRpZiAvKiBfX0FNREdQVV9ESVNDT1ZFUllfXyAqLwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
