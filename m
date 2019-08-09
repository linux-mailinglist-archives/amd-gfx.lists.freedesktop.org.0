Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D026187E9D
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AB56EE48;
	Fri,  9 Aug 2019 15:53:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11716EE43
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:26 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so725634qkl.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5JSL+wlM6R13ft8sMdF4XMOHudsq/4YNs6bUKU281dg=;
 b=ZwP4mq7IU/4FQjkt6z9/Dyz7yGDjEN3wN+aXDgVb83+jSKZJ91NdojwTQ1OdmelKWA
 ZcNUnJCo9nMBv8aNvbhT4GbqEgsWv3aM1tYHGdNjFQLhvH5X3uV/eEx85ZiDs3Wu28/O
 UScQOenHYJqLFSwTI7yi30cj0x/fWMeaYCJMoaAZswIQNWHq3kNt1ebciEST3Q68XmWO
 lOxP+U1ftvefVWb06VmOt5rxkjumXQ1z2jcqzF6iXOmxuO0TkwD3edByXn2TFOrRwXmp
 96XWscpzHEJdQU8zIp0p7j6EbUnplsE5P6/6IPHFBx0VTkmrSU2FPf2znTcZ80rtDKth
 hY7A==
X-Gm-Message-State: APjAAAUYOAtKx8gf+F4560ikXi8d6b+g6G05Musu3VoTFeUAR38Syz66
 mQHOMhXeYswWMr0OQ9z0DW5ZTlgW
X-Google-Smtp-Source: APXvYqz6U6pyUwszK/FN9OvvmtWYTO4G91swv9FwPBWIOKPMzJlfIg0ObS3bSw0lf+Da6u9INe07Kg==
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr18865465qkc.394.1565366005831; 
 Fri, 09 Aug 2019 08:53:25 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/27] drm/amdgpu: enable Renoir VCN firmware loading
Date: Fri,  9 Aug 2019 10:52:53 -0500
Message-Id: <20190809155302.4733-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5JSL+wlM6R13ft8sMdF4XMOHudsq/4YNs6bUKU281dg=;
 b=Npr6vLTgF0ZKkcmOz0ULMNVlTEKVzVNZXUQtx+RB/9q8v+8goCHpNJJfDBXElfRDck
 dpQdyFGArSP/7VftgozTMGFnQ3SBQ8jlgl2Nn9mHB8tL0CbvFt52q1C2JMk2TLyfFJix
 hVgos01I0O2AJIbQ8CUtnQ+bvfWZzUSwGgEnz5mfr4+rH6cBtCNOChaHdlOziyVB8AuI
 4R44TAJJb9bS8KxeFrSTzndH+7xZehh+/597MlP4/tKV25toez4gFvjDrhYdFTCpeLWn
 vUfRKSmgOq+n5vxF2CJtIlDly7FYA1FSltzA35VwGvXr8sebVNBifu8UgOpyztDSYqVI
 rIlg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQnkgYWRkaW5nIG5ldyBSZW5vaXIgVkNO
IGZpcm13YXJlCgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+ClJldmll
d2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA4ICsrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Zjbi5jCmluZGV4IGI3NGYwZjY3OWFjYS4uODU2NmEyNjQ5NjFmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCkBAIC00Niw2ICs0Niw3IEBACiAjZGVmaW5lIEZJUk1X
QVJFX1BJQ0FTU08JImFtZGdwdS9waWNhc3NvX3Zjbi5iaW4iCiAjZGVmaW5lIEZJUk1XQVJFX1JB
VkVOMgkJImFtZGdwdS9yYXZlbjJfdmNuLmJpbiIKICNkZWZpbmUgRklSTVdBUkVfQVJDVFVSVVMg
CSJhbWRncHUvYXJjdHVydXNfdmNuLmJpbiIKKyNkZWZpbmUgRklSTVdBUkVfUkVOT0lSIAkiYW1k
Z3B1L3Jlbm9pcl92Y24uYmluIgogI2RlZmluZSBGSVJNV0FSRV9OQVZJMTAgCSJhbWRncHUvbmF2
aTEwX3Zjbi5iaW4iCiAjZGVmaW5lIEZJUk1XQVJFX05BVkkxNCAJImFtZGdwdS9uYXZpMTRfdmNu
LmJpbiIKICNkZWZpbmUgRklSTVdBUkVfTkFWSTEyIAkiYW1kZ3B1L25hdmkxMl92Y24uYmluIgpA
QCAtNTQsNiArNTUsNyBAQCBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfUkFWRU4pOwogTU9EVUxF
X0ZJUk1XQVJFKEZJUk1XQVJFX1BJQ0FTU08pOwogTU9EVUxFX0ZJUk1XQVJFKEZJUk1XQVJFX1JB
VkVOMik7CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfQVJDVFVSVVMpOworTU9EVUxFX0ZJUk1X
QVJFKEZJUk1XQVJFX1JFTk9JUik7CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfTkFWSTEwKTsK
IE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9OQVZJMTQpOwogTU9EVUxFX0ZJUk1XQVJFKEZJUk1X
QVJFX05BVkkxMik7CkBAIC04Miw2ICs4NCwxMiBAQCBpbnQgYW1kZ3B1X3Zjbl9zd19pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9BUkNUVVJVUzoKIAkJZndfbmFt
ZSA9IEZJUk1XQVJFX0FSQ1RVUlVTOwogCQlicmVhazsKKwljYXNlIENISVBfUkVOT0lSOgorCQlm
d19uYW1lID0gRklSTVdBUkVfUkVOT0lSOworCQlpZiAoKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlw
ZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApICYmCisJCSAgICAoYWRldi0+cGdfZmxhZ3MgJiBBTURf
UEdfU1VQUE9SVF9WQ05fRFBHKSkKKwkJCWFkZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsK
KwkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkxMDoKIAkJZndfbmFtZSA9IEZJUk1XQVJFX05BVkkx
MDsKIAkJaWYgKChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQ
KSAmJgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
